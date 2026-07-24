# Making posts without Paper

No Paper? You can still use the whole kit. The boards are plain HTML, so your agent builds them on your own machine instead. Same boards, same brand, same approval gates.

## Do this

Run this once:

```bash
npx playwright install chromium
```

Then hand `AGENT.md` to your agent the same way everyone else does, and mention you don't have Paper:

> Read AGENT.md and follow it. I don't have Paper. My Build & Brew photos are in `./photos`. Make me a single post about the night.

That's the whole job. Your agent asks about your night, drafts the words, shows you a plan, builds the post, and packages it for Instagram or LinkedIn. **You don't need to run anything else on this page by hand.** The rest is here for when you want to drive it yourself.

## What's different without Paper

One thing: **the fonts.** NextWork's own two typefaces can't be included in a public kit, so your posts render with close stand-ins instead. Everything else is identical: the layout, the photo grade, the colours, the crop, the export sizes. The result is genuinely postable. If you do get Paper later, the type will look a touch sharper there.

Everything else about the kit is unchanged. The story-first workflow, both approval gates, the copy rules, and the brand QA read-back all apply exactly as written in [`../AGENT.md`](../AGENT.md).

**On free Paper instead?** If you have an account but keep hitting the weekly cap, read [`../free-paper-path/README.md`](../free-paper-path/README.md) first. Staying on Paper gives you better-looking type.

## One extra step for LinkedIn

Only if you want the swipeable LinkedIn PDF:

```bash
brew install imagemagick
```

## Prep your photos

iPhone photos are HEIC and won't render. Convert first:

```bash
sips -s format jpeg -Z 1600 IN.HEIC --out OUT.jpg
```

Put the night's photos in one folder so you can point at them easily.

## Render a board

`render.sh` fills a template's `{{SLOTS}}` and screenshots it to a 1080×1350 PNG.

```bash
./render.sh <template.html> <out.png> KEY=VALUE [KEY=VALUE ...]
```

The single post is the primary deliverable, so start there. A contain board, which never crops anyone out of a group shot:

```bash
cd templates/archetypes
./render.sh A-photo-contain.html ~/Desktop/post.png \
  PHOTO=~/Desktop/build-brew-austin/group.jpg \
  META="Build & Brew · Austin" \
  LINE1="One night in Austin," \
  ACCENT="we built" \
  DESC="and shipped six real things."
```

Or the full-bleed cover, where a single outcome-first title carries the whole frame:

```bash
./render.sh A-photo-bleed.html ~/Desktop/post.png \
  PHOTO=~/Desktop/build-brew-austin/table.jpg \
  META="Build & Brew · Austin" \
  TITLE="Seven of us built an AI assistant for our inbox"
```

### Slots by board

| Template | Use it for | Slots |
|---|---|---|
| `A-photo-contain.html` | **Single post, default.** Photo shown whole on paper, never cropped. Group-safe. | `PHOTO META LINE1 ACCENT DESC` |
| `A-photo-bleed.html` | **Single post / cover.** Photo edge to edge, one outcome title. Cover-crops, so not for wide groups. | `PHOTO META TITLE` |
| `D-block-photo.html` | **Poster.** Photo up top, bold claim on a block below. | `PHOTO KICKER H1 H2 BODY CTA` |
| `F-narrative-text.html` | **Story beat.** No photo, two-tone statement. | `CLAIM CONTEXT HANDLE SERIES` |
| `G-timestamp.html` | **Carousel moment.** Photo, centered time, one line. | `PHOTO META TIME LINE` |
| `numbers.html` | **Proof slide.** Big stats. | `META N1 L1 N2 L2 N3 L3` |
| `individual-build-master.html` | **Build Master story.** You and your event, first person. | `PHOTO ROLE CLAIM CONTEXT NAME EVENT CTA` |

### Theming and size

| Key | Values | What it does |
|---|---|---|
| `MODE` | `light`, `dark` | The ground on the block and text boards (D, numbers, build-master, F). Light is paper plus ink; dark is leather plus cream. |
| `TINT` | `pumpkin`, `canary`, `sand`, `cornflower`, `plum`, `emerald`, `none`, or a `#hex` | Sets the accent token. F uses it for the claim. Note that `A-photo-contain` ships deliberately tonal, so `TINT` is a no-op there unless you opt in by changing `.accent` to `color:var(--accent)` in that file. |
| `W` / `H` | e.g. `W=2160 H=2700` | Render at 2x. |

Ask which ground and accent every time. There is no standing default, and "none" is always a good answer. On a warm graded photo prefer a warm accent; cornflower and plum are cold and fight the grade.

## Package for posting

`export.sh` takes a folder of rendered PNGs and packages them. Slides are ordered by filename, so name them in swipe order first (`01.png`, `02.png`, …).

```bash
./export.sh instagram <dir>          # renumbered PNGs, post in order
./export.sh linkedin  <dir> [name]   # one PDF, a slide per page (LinkedIn shows it as swipeable)
./export.sh jpg       <dir>          # smaller JPG copies
```

Everything stays sRGB. Nothing upscales.

For a single post you don't need `export.sh` at all. The PNG that `render.sh` produced is already 1080×1350 sRGB and ready to post.

## What still applies

Rendering locally changes the tool, not the standard. From `AGENT.md`:

- **Both gates.** Get a yes on the copy and plan before you build (Gate 1), and a yes on the visuals before you export (Gate 2).
- **The title is the whole job.** Ten words maximum, naming what got built. Someone scrolling past should know what happened without reading the caption.
- **No em dashes**, in the artwork or the caption.
- **Never cover-crop a wide group.** Use `A-photo-contain` or `D`, not `A-photo-bleed`. Every person in the room is in frame or tagged.
- **No carousel dot row.** Instagram draws its own.
- **Run the brand QA read-back before you export.** Open the PNG and check it against the list in `AGENT.md`. Check 2 (fonts) is the known exception here; everything else should pass.
