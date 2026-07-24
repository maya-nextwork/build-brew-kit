# Archetypes — the kit of parts

These HTML files are the **design source** for every board. Each is a 1080×1350 (4:5) slide, defining its own layout, grade, and `{{SLOTS}}` so the boards stay consistent across posts.

They're used two ways, depending on the route (see `AGENT.md`):
- **Paper route (default):** reference. The agent builds the matching board on the **Build & Brew Kit** Paper canvas.
- **No-Paper route:** you render these files directly with `render.sh`. See [`../../no-paper-path/README.md`](../../no-paper-path/README.md).

## Slots
Pick a board by the moment and fill its photo + copy from the slot list below.

> **No dot row.** The carousel indicator was removed from G and numbers: Instagram draws its own, so ours only doubled it up. `DOTS` is retired and ignored if passed.

**Theming (ground + accent).** Each board carries a default look; ground and accent are adjustable on the board via tokens (`--ground`, `--accent`).
- Ground: light (paper + ink) or dark (leather + cream), on the block / text archetypes (D, numbers, build-master, F).
- Accent: pumpkin, cornflower, plum, canary, sand, emerald, or none. In A it colours the big serif word; in F the claim; `none` = fully tonal. A sits on a paper ground (contain, text below the photo); G stays photo-with-scrim, so ground mostly moves the block / text archetypes.

## The templates

| File | Use it for | Slots |
|---|---|---|
| `A-photo-contain.html` | **Single post, the default.** One photo shown whole on paper (never cropped), serif line + big word below. Group- and landscape-safe. | `PHOTO META LINE1 ACCENT DESC` |
| `A-photo-bleed.html` | **Single post / carousel cover.** Photo edge to edge, one outcome-first title (10 words max) on a bottom scrim. **Cover-crops**, so use it for a portrait shot, a tight subject, or a build screenshot, never a wide group. | `PHOTO META TITLE` |
| `D-block-photo.html` | **Poster.** Clean photo up top, bold grotesk claim on a paper block below. | `PHOTO KICKER H1 H2 BODY CTA` |
| `F-narrative-text.html` | **Story beat / hot take.** No photo. Two-tone statement. | `CLAIM CONTEXT HANDLE SERIES` |
| `G-timestamp.html` | **Carousel moment.** Photo + centered time + one line. Order them to tell the night. | `PHOTO META TIME LINE` |
| `numbers.html` | **Proof slide.** Big stats on leather. | `META N1 L1 N2 L2 N3 L3` |
| `individual-build-master.html` | **Build Master story.** Names you + your event, first person, two-tone. | `PHOTO ROLE CLAIM CONTEXT NAME EVENT CTA` |

## Group shots (keep the whole crew)
A wide group photo loses its edge people if you cover-crop it into 4:5. A (contain) and D already show the whole photo. Keep everyone:
- **Square 1:1** (1080×1080) — more width than 4:5, good for small-to-medium groups.
- **D (block + photo)** or a **contain/letterbox on the ground** — shows the whole photo, best for wide groups.
- **Focal + tag** — if a crop is unavoidable, keep the clear subject and tag everyone in the caption.
Never drop a learner silently. See the GROUP SHOTS rule in `AGENT.md`.

## Start with a single post
A single post is the primary deliverable. It's what Build Masters actually use, it's the lowest barrier, and one share is a win. Reach for `A-photo-contain`, `A-photo-bleed`, `D`, `F`, or the Build Master story, and only build a carousel if the night genuinely has several distinct beats worth swiping through.

## A carousel, in order
The exception, not the default. Build the boards in swipe order and keep the same look on every slide:
1. **Cover** — A-bleed (full bleed), A (contain), or D (block).
2. **A few moments** — G (timestamp), one beat each (6:00 doors → 9:00 demos).
3. **Proof** — numbers (the stats slide).
4. **Invite** — A or D (come build the next one).

Then export (see the EXPORT rules in `AGENT.md`): Instagram = the 1080×1350 boards in order; LinkedIn = one PDF, a board per page. On the Paper route export from Paper; on the no-Paper route use `export.sh`.
