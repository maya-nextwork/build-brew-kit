# NextWork Community Kit

A ready-made kit for **Build Masters & Brew Masters**: point your AI agent at it and turn your event photos into clean, on-brand social posts in minutes. No design-tool wrangling, no blank page.

Running a Build & Brew is leadership. This helps you show it.

## Why post your events

You ran a room where people built real things. That's leadership, and this is your personal brand: proof, on the record, that you ship and bring people together.

- **It reads as leadership.** Running events and posting about them signals initiative, community, and active self-improvement beyond your day job. That is what people skim CVs and LinkedIn for.
- **It's a build session.** You upskill on the AI-agent workflow while you make the asset. The post is the byproduct of learning a real skill, the same skill NextWork teaches.
- **It compounds.** Tag the people in your photos. Their feeds see it, their friends see it, and your next event fills itself.
- **It passes the torch.** Someone who sees your post thinks "I could do that too," starts their own first project, and runs their own night. You're the start of that in your city.

## What's in the kit

- `AGENT.md` — **the one file you hand to your AI agent.** It carries the brand rules, the kit of parts, the copy rules, and how to render and export, so your posts look right by default.
- `templates/archetypes/` — the **kit of parts**: six post archetypes (the design source for the Paper boards). See its `README.md` for the archetype list and slots.
- `brand/` — the colours, fonts, and voice that make a post feel like NextWork.
- `templates/caption-and-tags.md` — the post's text field, who to tag, and how to credit NextWork and open the door for the next person (the growth loop, in your voice).
- `start-your-own-build-and-brew.md` — never run one? The whole format on one page. The on-ramp for the next host.
- `free-paper-path/` — running the kit on a free Paper account, and where the free-tier limits are.
- `no-paper-path/` — **no Paper at all?** The same archetypes rendered locally with one script.
- `EXAMPLES/` — sample event photos and rendered demos.

## Quickstart

Your AI agent does the design. You talk, you approve, it builds.

1. **Clone this repo** (or download the ZIP).
2. **If you're using Paper:** open the Paper **desktop app** and leave it running, and grant it **Full Disk Access** (System Settings > Privacy & Security), then relaunch. Skipping this makes photo imports hang silently, and it's the most common thing that stops a first run. No Paper? Skip to `no-paper-path/`.
3. **Hand `AGENT.md` to your AI agent** — Claude Code or Cursor — and point it at your event photos:
   > "Read AGENT.md and follow it. My Build & Brew photos are in `./photos`. Make me a single post about the event."
4. It asks about the night, shows a plan (Gate 1), builds the post for you to react to (Gate 2), runs a brand-QA check, then exports it.

**Start with a single post.** It's what gets used, it's the lowest barrier, and one share is a win. Carousels are there when a night has several beats worth swiping through.

**No Paper?** `no-paper-path/` renders the same archetypes locally. One setup command, same brand, same gates. The only compromise is that the licensed house fonts fall back to system ones.

**No photos (virtual event)?** Use the text-only archetype (F), or a screenshot of what a member built as the photo in D. See `AGENT.md`.

## The ask (optional, but it's the flywheel)

- Tag attendees and @NextWork so the post travels.
- Credit what got you here and leave a door open for the next person (see `templates/caption-and-tags.md`). That's how a viewer becomes the next builder.
- Haven't run one yet? `start-your-own-build-and-brew.md` is the whole format on one page. Your first event fills the next room.
- Found a layout you like, or built a new archetype? PR it back (see `CONTRIBUTING.md`) so the whole community gets it.

---

*Brand values here are a snapshot of the internal NextWork kernel. See `scripts/sync-from-kernel.md`.*
