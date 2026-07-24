# Manifest

**NextWork Community Kit** - v0.6 (2026-07-23)
Brand snapshot from the NextWork kernel. v0.3: story-first workflow + growth-loop wiring. v0.4: real theming (ground + accent). v0.5 (2026-07-22): Paper-only, agent-driven. Local render/export scripts archived; brand-QA read-back + anti-AI-slop guardrails added (Maya dogfood, LEA-271). v0.6 (2026-07-23): Jul 23 review round (LEA-271). Hardened Phase 0 (Paper desktop app + Full Disk Access + explicit page binding, the fix for the silent photo-import hang); outcome-first ≤10-word title rule; no em dashes / no ad-copy phrases; carousel dot row removed (Instagram draws its own); single post promoted to primary deliverable; new full-bleed cover archetype; local render/export restored as a second route for anyone without Paper.

## Included
- `AGENT.md` - the agent system prompt: story-first workflow, voice, the kit of parts, copy rules, render + export (the crux)
- `WORKFLOW.md` - the canonical Build Master run (Phase 0-4, the two gates, both routes) - the human-readable process
- `start-your-own-build-and-brew.md` - the host on-ramp: the whole event format on one page, the top of the growth loop
- `magic_trick.md` - the human-adds-memorable guardrail, now wired into Phase 2 (Gate 2) of the workflow
- `templates/archetypes/` - seven post archetypes (A-contain / A-bleed / D / F / G / numbers / build-master) + README; the HTML is the design source for both routes, plus `render.sh` + `export.sh` for the no-Paper route
- `templates/caption-and-tags.md` - the caption + tags, plus NextWork credit / viewer on-ramp / trackable-link conventions (the growth loop)
- `brand/` - colors, typography, voice, grade (agent-readable; hexes match the templates exactly)
- `free-paper-path/` - free-tier Paper guidance
- `no-paper-path/` - the second route: same archetypes rendered locally, for anyone without Paper
- `EXAMPLES/` - sample event photos + rendered demos
- `CHANGELOG.md` - what changed in each release and why, in plain language
- `scripts/sync-from-kernel.md`, `CONTRIBUTING.md`, `LICENSE`

## Maps to the house atomic-kit convention (OMS / TMJ / Sona)
- `brand/colors.json` + `typography.md` ≈ `agent/visual`
- `brand/voice.md` ≈ `agent/verbal`
- `README.md` + `templates/` ≈ `human/`
- `magic_trick.md` ≈ the same file in every NextWork kit
- Public repo, so there is no `_internal/` overlay; internal-only content is excluded by design.

## Pending
- **Scattered build-tool logos on the cover** (Maximus, LEA-271 Jul 23). Deliberately *not* built: dropping third-party product logos onto a slide runs straight into the kit's own anti-slop rule ("stock or outline icons, icon+label rows" are reject-on-sight) and raises trademark questions we don't control. The rest of that note (full bleed, simpler title, outcome-first, ≤10 words) is implemented in `A-photo-bleed.html`. Needs a design call from Jon + Maximus before anyone builds it.
- **House fonts on the no-Paper route.** Suisse Neue and FK Grotesk Neue are licensed and not bundled, so local renders fall back to system faces. Either clear redistribution rights, or accept the fallback and say so (currently documented as a known tradeoff).
- Public repo home + which incentives NextWork funds
- Filter-fork sign-off (kernel carousel decks ban photo filters; this kit uses a subtle one)
- Confirm the real NextWork signup / host-program link + UTM scheme (placeholders in caption-and-tags.md and start-your-own-build-and-brew.md)
- Phase C: full Paper "Build & Brew Kit" board parity (all six archetypes as themeable boards) + caption/tags board
- A real worked example (real event: photos + final posts + caption) for EXAMPLES/
