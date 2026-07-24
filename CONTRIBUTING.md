# Contributing

This kit gets better when the community adds to it. Made a layout or variant you like? PR it back so everyone gets it. Nobody should hold a stale handout.

## What's welcome
- New archetype templates (a fill-in `.html` in `templates/archetypes/`, with its slots listed in that folder's `README.md`)
- Better copy examples, written in a real Build Master's voice
- Fixes and clearer instructions

## The one rule
Stay on-brand. Use the colours and fonts in `brand/`, one accent per post, sentence case, no pure white or black. If a value is missing, don't invent one. Flag it.

## Brand values
`brand/colors.json` matches the hexes hardcoded in the templates. If you change a colour, change both, and keep it aligned with the NextWork kernel (see `scripts/sync-from-kernel.md`).

## How
1. Fork, branch, add your `.html` template to `templates/archetypes/`.
2. Put a slot comment at the top of the file and add a row to `templates/archetypes/README.md` so people can use it.
3. Render it once to prove it works, then open a small, clear PR.
