#!/usr/bin/env bash
# Fill a Build & Brew archetype template's {{SLOTS}} and render it to a PNG.
# Usage: ./render.sh <template.html> <out.png> KEY=VALUE [KEY=VALUE ...]
#   e.g. ./render.sh A-photo-contain.html out.png \
#          PHOTO=../../EXAMPLES/_test-photos/group-dusk.jpg \
#          META="Build & Brew · Austin" LINE1="One night in Austin," \
#          ACCENT="we built" DESC="and shipped six real things."
#   or the full-bleed cover, where the title carries it:
#     ./render.sh A-photo-bleed.html out.png \
#          PHOTO=../../EXAMPLES/_test-photos/build-table.jpg \
#          META="Build & Brew · Austin" \
#          TITLE="Seven of us built an AI assistant for our inbox"
# PHOTO may be a relative path, absolute path, or file:// / http(s) URL. It is auto-resolved.
#
# Theming (the intake's ground + accent, made real):
#   TINT=<emerald|cornflower|pumpkin|plum|canary|sand|none|#hex>
#        Sets the --accent token. F uses it for the claim. A-photo-contain ships TONAL by
#        design (its big serif word is ink, not accent), so TINT is a no-op there unless you
#        opt in by switching .accent to color:var(--accent) in that template.
#        none = cream (a fully tonal, no-accent post).
#   MODE=<light|dark>
#        the ground on the block / text archetypes (D, numbers, build-master, F):
#        light = paper ground + ink text; dark = leather ground + cream text.
#   Theming is backward compatible: pass neither and every template renders exactly as before.
#
# Override size with W=2160 H=2700 for a 2x export. First-time setup: npx playwright install chromium
set -euo pipefail

TPL="${1:?template html path}"; OUT="${2:?output png path}"; shift 2
W=1080; H=1350
THEME=""   # accumulated CSS custom-property overrides, injected before </head>
tpl_dir="$(cd "$(dirname "$TPL")" && pwd)"
tmp="$tpl_dir/.render_$$.html"
cp "$TPL" "$tmp"
trap 'rm -f "$tmp"' EXIT

for kv in "$@"; do
  key="${kv%%=*}"; val="${kv#*=}"
  case "$key" in
    W) W="$val"; continue;;
    H) H="$val"; continue;;
    PHOTO)
      case "$val" in
        file://*|http://*|https://*|data:*) : ;;
        /*) val="file://$val" ;;
        *) val="file://$(cd "$(dirname "$val")" >/dev/null 2>&1 && pwd)/$(basename "$val")" ;;
      esac
      ;;
    TINT)  # accent colour -> --accent (name, or a raw #hex; none = cream/tonal)
      case "$val" in
        emerald) h="#11cca6";; cornflower) h="#308ded";; pumpkin) h="#fa8a45";;
        plum) h="#875bf7";; canary) h="#ffdd2d";; sand) h="#e5dcc7";;
        none|cream) h="#f8f5f0";; \#*) h="$val";; *) echo "unknown TINT: $val" >&2; h="";;
      esac
      [ -n "$h" ] && THEME="$THEME--accent:$h;"
      continue;;
    MODE|GROUND)  # light/dark ground on the block + text archetypes
      case "$val" in
        light) THEME="$THEME--ground:#f8f5f0;--fg:#26221e;--fg-muted:#6b655c;";;
        dark)  THEME="$THEME--ground:#211d19;--fg:#f8f5f0;--fg-muted:#8e857a;";;
        *) echo "unknown MODE: $val" >&2;;
      esac
      continue;;
    DOTS)  # Retired. Instagram draws its own carousel indicator, so ours only doubled it up.
      echo "note: DOTS is retired (Instagram shows its own dots), ignoring" >&2
      continue;;
  esac
  python3 - "$tmp" "$key" "$val" <<'PY'
import sys
path, key, val = sys.argv[1], sys.argv[2], sys.argv[3]
s = open(path, encoding="utf-8").read().replace("{{"+key+"}}", val)
open(path, "w", encoding="utf-8").write(s)
PY
done

# Inject theme overrides last, so they win by cascade order while templates keep their own defaults.
if [ -n "$THEME" ]; then
  python3 - "$tmp" "$THEME" <<'PY'
import sys
path, theme = sys.argv[1], sys.argv[2]
s = open(path, encoding="utf-8").read().replace("</head>", "<style>:root{"+theme+"}</style></head>", 1)
open(path, "w", encoding="utf-8").write(s)
PY
fi

if err=$(npx playwright screenshot --viewport-size="${W},${H}" --wait-for-timeout=450 "$tmp" "$OUT" 2>&1); then
  echo "rendered $OUT (${W}x${H})"
else
  echo "render FAILED for $OUT" >&2
  echo "$err" | sed 's/^/  /' >&2
  echo "  first run? install the browser once, then retry:  npx playwright install chromium" >&2
  exit 1
fi
