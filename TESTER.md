# Try the Build & Brew Kit (thanks, Maya!)

You're one of the first to test this. The kit turns your event photos into clean, on-brand posts, and
your AI agent does the design for you on the Paper canvas. You don't design anything yourself: you talk,
you approve, it builds. No photos of your own yet? Use the samples in `EXAMPLES/_test-photos/` to run the
whole thing.

## What you need
- The kit: `git clone https://github.com/nextworkengineering/build-brew-kit.git` (or unzip, if Jon sent a zip).
- An AI agent (Claude Code or Cursor).
- **Paper**, ideally: the agent builds on the Paper canvas and that's the best-looking output. No Paper?
  The kit renders locally instead, see `no-paper-path/README.md`. One setup command, same brand.

## Before you start (Paper users, this matters)
Two minutes here saves a confusing dead end:
1. **Open the Paper desktop app** and leave it running. The agent talks to Paper through it. "Nothing to
   install" means there's no render pipeline, not that there's no app to open.
2. **Grant Paper Full Disk Access** (System Settings > Privacy & Security > Full Disk Access), then
   relaunch it. Without this, importing your photos **hangs silently** with no error message. It looks
   like a Paper bug and it isn't.
3. **Open a blank Paper file** for this event. The agent will confirm which file and page it's building
   on before it starts, so it never writes over your other work.

## Run it
1. Open the kit in Claude Code or Cursor.
2. Paste this:

   > Read AGENT.md and follow it. My Build & Brew photos are in `EXAMPLES/_test-photos` (or point it
   > at your own folder). Make me a single post about the night.

3. It will ask you a few things about the night, show you a plan (Gate 1), build the post for you to
   react to (Gate 2), then export it.

Start with a single post. It's the format that actually gets used, and one share is a win. Ask for a
carousel after, if the night has several beats worth swiping through.

If you do tweak the canvas yourself, ask it to run the QA read-back on the board before exporting, so it
stays on-brand.

## What we'd love your feedback on
- Was it clear what to do, from start to finish?
- Did it make something you'd actually post?
- Did it feel like **your** brand and your voice, or generic?
- Where did you get stuck, confused, or annoyed?

This is early and we're iterating fast, so be blunt. Tell us what's clunky. That's the most useful thing
you can give us.
