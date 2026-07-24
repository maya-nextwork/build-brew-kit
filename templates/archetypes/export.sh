#!/usr/bin/env bash
# Package rendered slides for a platform. Slides are ordered by filename,
# so name them in swipe order first (01.png, 02.png, ... or a.png, b.png).
#
# Usage:
#   ./export.sh instagram <dir>          Renumber PNGs -> <dir>/instagram/01.png, 02.png, ...
#   ./export.sh linkedin  <dir> [name]   One PDF, a slide per page -> <dir>/linkedin/<name>.pdf
#   ./export.sh jpg       <dir>          Smaller JPG copies       -> <dir>/jpg/
#
# LinkedIn renders a PDF as a swipeable document. Needs ImageMagick (`magick`) OR Python Pillow.
# Everything is sRGB. Nothing here upscales.
set -euo pipefail

MODE="${1:?instagram | linkedin | jpg}"; DIR="${2:?folder of rendered PNGs}"; NAME="${3:-carousel}"
cd "$DIR"
# collect PNGs in sorted (swipe) order
shopt -s nullglob 2>/dev/null || true
PNGS=( $(ls *.png 2>/dev/null | sort) )
[ "${#PNGS[@]}" -gt 0 ] || { echo "no .png files in $DIR"; exit 1; }

case "$MODE" in
  instagram)
    mkdir -p instagram; i=1
    for p in "${PNGS[@]}"; do printf -v n "%02d" "$i"; cp "$p" "instagram/$n.png"; i=$((i+1)); done
    echo "instagram/: ${#PNGS[@]} numbered PNGs (post in order)";;
  jpg)
    mkdir -p jpg
    for p in "${PNGS[@]}"; do
      out="jpg/${p%.png}.jpg"
      if command -v sips >/dev/null 2>&1; then sips -s format jpeg "$p" --out "$out" >/dev/null
      elif command -v magick >/dev/null 2>&1; then magick "$p" -quality 88 "$out"
      else echo "need sips or magick for JPG"; exit 1; fi
    done
    echo "jpg/: ${#PNGS[@]} JPGs";;
  linkedin)
    mkdir -p linkedin; OUT="linkedin/$NAME.pdf"
    if command -v magick >/dev/null 2>&1; then
      magick "${PNGS[@]}" -colorspace sRGB "$OUT"
    elif python3 -c "import PIL" 2>/dev/null; then
      python3 - "$OUT" "${PNGS[@]}" <<'PY'
import sys
from PIL import Image
out, paths = sys.argv[1], sys.argv[2:]
imgs = [Image.open(p).convert("RGB") for p in paths]
imgs[0].save(out, save_all=True, append_images=imgs[1:])
PY
    else
      echo "Need ImageMagick or Python Pillow to build the PDF."
      echo "  install:  brew install imagemagick    (or)  pip3 install pillow"
      exit 1
    fi
    echo "linkedin/$NAME.pdf: ${#PNGS[@]}-page swipeable document";;
  *) echo "unknown mode: $MODE"; exit 1;;
esac
