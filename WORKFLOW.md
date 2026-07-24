# The Build Master run — how the kit actually works

> The canonical workflow. `AGENT.md` is what the agent follows; this is the human-readable
> version of the same journey, so you can teach it, test it, and see where it should improve.

**One principle: story-first, never output-first.** The agent's first move is to *ask*, not to
render. A Build Master should be walked through making their post — hearing the night back in
their own words, seeing it before it publishes, and iterating — not handed finished files.

**Why a Build Master posts.** The point is their empowerment, not our marketing. Running a room
where people build real things is leadership, and posting it builds their personal brand as
someone who ships and brings people together. Making the post also *is* the skill: driving an
agent to produce something clean and on-brand is exactly what NextWork teaches. NextWork's win is
downstream and honest: a viewer sees a peer building in public, thinks "I could do that too," and
starts their own first project or runs their own night. The kit is built to make that hero the
Build Master and to leave the door open, never to turn their post into an ad.

---

## The journey

### Phase 0 · Setup (once)
Handed over as **one block up front**, not drip-fed. The agent first says which route it's on.

**Paper route (default).** Four things, in order:
1. **Open the Paper desktop app** and leave it running. The MCP bridge only works while it's open.
   "Nothing to install" means no render pipeline, not no app to open. This trips people up.
2. **Grant Paper Full Disk Access** (System Settings > Privacy & Security > Full Disk Access), then
   relaunch it. Without this a local photo import hangs *silently*: no error, no node, no clue. It
   reads as a Paper bug and it isn't. Do this before the first import, not after it hangs.
3. **Open a blank Paper file** for this event.
4. **The agent confirms the target before building.** With several files open the MCP binds to the
   most-recently-used one, which may be unrelated work. The agent announces the file and page, and
   defaults to creating a new page named `Build & Brew · <city>` rather than trusting the active canvas.

**No-Paper route.** No Paper account or MCP, or the free tier's weekly cap is hit. Same archetypes
rendered locally. See `no-paper-path/README.md`.

Then, either route, the Build Master makes a folder on their Desktop with the night's photos:
```
~/Desktop/build-brew-<city>/        e.g. ~/Desktop/build-brew-austin/
```
They point the agent at it. The agent looks at the photos before choosing anything — archetype
picks are a lighting decision (warm/dim → cinematic A/G; bright/celebratory → D invite).

### Phase 1 · Intake → draft  · **Gate 1**
A short conversation *before any image is made*. The agent asks:
1. Single post or carousel? **Single post is the default**, and the agent says so. It's what Build
   Masters actually use and one share is a win. Carousel only on request, or when the night has
   several distinct beats worth swiping through.
2. **What happened?** The arc — doors, pairing up, building, demos, the one human moment.
   *These words become the copy.*
3. **What did you build?** The actual projects — the app, site, agent, or thing the group or a
   standout person shipped, not just how many. *This is what the headline names.*
4. Who are you (Build Master name), event name, city.
5. The numbers — headcount, projects shipped, any "first ever."
6. Where are you posting — Instagram, LinkedIn, or both.
7. The look — ground **light (paper)** or **dark (leather)**? Accent — pumpkin, cornflower,
   plum, canary, sand, or **none**? *Asked every run; no default.*

The agent drafts the archetype pick(s) + the line(s) in the Build Master's voice and **shows
them**.

**The title carries the post.** Ten words maximum, naming what got built or the result. Someone
scrolling past should know what happened *without reading the caption*. "Seven of us built an AI
assistant for our inbox" does the job; "an amazing night of building" does not, and neither does a
sentence so long it's really a caption. The agent drafts the title first and rewrites it until it
passes that test. No em dashes, and no ad-copy phrases (see `brand/voice.md`).

→ **Gate 1: yes on the copy + plan before anything renders.**

### Phase 2 · Preview → iterate  · **Gate 2**
The agent builds the chosen archetypes as boards on the Paper canvas ("Build & Brew Kit" file),
fills photo + copy, applies the chosen ground + accent, and puts the **caption + tags as a text
board beside the slides** so the whole post is in one place. The Build Master reacts and steers
(swap a photo, change a line, try another accent) and the agent makes the change. The agent designs;
the Build Master does not hand-build. If the Build Master edits the canvas themselves, the agent runs
the **brand-QA read-back** on the board before moving on.

**The magic trick (before Gate 2).** Correct-and-clean is the floor. The agent asks for the one
human thing it can't invent: the candid laughing photo over the posed one, the line only the
Build Master would write, the real people to tag. That is what makes the post theirs and what
fills the next room. See `magic_trick.md`.

→ **Gate 2: yes on the visuals before export.**

### Phase 3 · Export (only after Gate 2, and after the brand-QA read-back passes)
- Instagram single → one image, 1080×1350.
- Instagram carousel → the boards as images, in swipe order (01, 02, …).
- LinkedIn carousel → one PDF, a board per page (a swipeable document).

Paper route exports from Paper; no-Paper route uses `export.sh`. No carousel dot row on any slide:
Instagram draws its own indicator, so ours only doubled it up.

### Phase 4 · Post (and close the loop)
The agent surfaces the caption + tags and the tag-the-faces checklist. Tagging the people in the
photos is the single biggest reach lever. Then it closes the loop, in the Build Master's voice:
- **Credit** NextWork the way you credit anything that helped you get here. Honest, not an ad.
- **On-ramp** a viewer two ways: start their own first project, or run their own Build & Brew
  (see `start-your-own-build-and-brew.md`). A viewer becoming the next builder, then the next
  host, is the whole loop.
- **Trackable link** so the loop is measurable (see the link convention in
  `templates/caption-and-tags.md`).

---

## Surface — two routes
**Paper (default).** The agent builds and exports every post on the Paper canvas. The archetype HTML
in `templates/archetypes/` is the design source the boards are built from, not something anyone runs.

**No Paper.** The same archetype HTML is rendered directly with `templates/archetypes/render.sh` and
packaged with `export.sh`. One setup command (`npx playwright install chromium`). The gates, copy
rules, and brand QA are identical; only the renderer changes. The one compromise is typography: the
house fonts are licensed and not bundled, so type falls back to system faces. See
`no-paper-path/README.md`.

> **Ground + accent** are token controls on the board: ground = light (paper + ink) or dark
> (leather + cream) on the block/text archetypes (D, numbers, build-master, F); accent = one of
> pumpkin, cornflower, plum, canary, sand, emerald, or none (`none` = fully tonal). Photo slides
> (A, G) stay photo-with-scrim, so ground mainly moves the block/text archetypes.

---

## How to test this workflow (dry-run)
1. Put a few event photos in `~/Desktop/build-brew-<city>/` (or reuse `EXAMPLES/_test-photos/`).
2. Start a fresh session in the repo, hand the agent `AGENT.md`.
3. Watch that it **asks Phase 1 before rendering** (Gate 1), **previews before exporting**
   (Gate 2), asks ground + accent (no default), and surfaces the caption on the canvas.
4. Anything it skips or trips on is the next fix.
