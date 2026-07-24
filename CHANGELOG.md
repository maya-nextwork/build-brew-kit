# What's changed

Every release, in plain language: what moved, and why it moved. Newest first.

---

## v0.6 (2026-07-23)

Everything here comes from a real run: Maya built an actual Build & Brew Austin post with the kit and wrote down every place it slowed her down, plus design notes from Maximus. Tracked in LEA-271.

### The three things that stopped a first run

**You're now told to open the Paper desktop app.**
The kit used to say "nothing to install" and "everything happens in Paper", which reads as *no app action needed*. It isn't. The agent talks to Paper through the desktop app, and the app has to be open and running. People were opening a browser, or nothing at all, and wondering why the agent couldn't do anything. Now it's step one of the setup block, said out loud.

**You're now told to grant Paper Full Disk Access.**
This was the big one. Importing your photos into Paper would just *hang*: no error, no warning, nothing on the canvas. It looked like a broken kit or a Paper bug. It's neither. macOS was quietly blocking Paper from reading files, and the fix is one permission toggle plus a relaunch. Now it's step two, before you touch a photo, because finding this out after a ten-minute hang is a miserable way to start.

**The agent now tells you which file it's building on.**
If you had a few Paper files open, the agent would grab whichever one you'd touched most recently. That could be completely unrelated work, and it would have built your event post on top of it. Now the agent announces the file and page first, and makes a fresh page called `Build & Brew · <your city>` by default. Your other work is safe.

### What changed about the posts themselves

**The title has to say what you built, in ten words or fewer.**
The old kit would happily produce "an amazing night of building", or a title so long it was really a caption. Neither works: someone scrolling past should know what your group made without reading anything else. So the title is now capped at ten words, has to name the actual thing built or the result, and the agent drafts it first and rewrites it until it passes. There's a check for it in the quality read-back: cover the caption with your hand, look at the image alone, and see if it still tells you anything.

**No em dashes.** Not in your post, not in your caption, and not anywhere in this kit either (they've all been removed). An em dash is one of the fastest ways to make a human sentence read as machine-written, and the whole point of the kit is that your post doesn't look auto-generated.

**No more ad-copy phrases.** Lines like "the next one could be yours" read as AI even when a person wrote them. There's now a named list of them in `brand/voice.md` that the agent avoids.

**The carousel dots are gone.** The slides used to draw a little row of dots at the bottom to show your position. Instagram already draws its own, so every post had two sets. Removed from both boards that had them.

**Single posts come first now.** The kit used to treat single posts and carousels as equal options. In practice the single post is what people actually make and share, and it's far less work. The agent now recommends it by default and only builds a carousel if you ask or if the night genuinely has several beats worth swiping through.

**New board: the full-bleed cover.** A photo running edge to edge with one outcome title across the bottom. Use it when a photo can carry the whole frame. It does crop the sides, so it's not for wide group shots. For those the existing contain board still shows everyone, and the kit still refuses to silently cut a learner out of frame.

### New: you don't need Paper anymore

The kit went Paper-only in v0.5, which left out anyone without a Paper account, and anyone on the free plan who ran into its weekly cap partway through a build. Both are now covered.

The boards are plain HTML, so they can be built on your own machine instead. One setup command, then you hand the agent the same file as everyone else and mention you don't have Paper. Same boards, same brand, same approval gates. See `no-paper-path/README.md`.

One difference worth knowing: NextWork's own two typefaces can't be included in a public kit, so posts built this way use close stand-ins. Layout, photo grade, colours, crop and export sizes are all identical. If you do have Paper, the type looks a touch sharper there.

### Not done on purpose

Maximus suggested scattering the logos of the tools people built with across the cover. It isn't built, and it needs a design decision first. The kit's own quality rules reject stock icons and icon rows on sight as one of the clearest "this was auto-generated" tells, so adding a spray of product logos works against the thing the rest of the kit is protecting. There are also trademark questions around other companies' logos that aren't ours to answer. The rest of that note (full bleed, simpler title, outcome first, ten words) is built. Logged in `MANIFEST.md`.

---

## v0.5 (2026-07-22)

Moved the kit to Paper only and removed the local render and export scripts. Added `brand/grade.md` with a concrete photo grade recipe, including a branch for heavy coloured party lighting. Replaced the old single-post board with a contain-by-default version that never crops a wide group. Added the brand quality read-back and the anti-AI-slop guardrails.

## v0.4

Real theming: ground (light paper or dark leather) and accent colour became adjustable per post, asked at intake rather than defaulted.

## v0.3

The story-first workflow and the two approval gates, plus the growth loop wiring (captions, tags, credit, and the on-ramp for the next host).
