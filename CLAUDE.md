# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## What this project is

*Wayward House Mathematics* is a seven-volume Quarto book — arithmetic foundations through engineering mathematics — built for people who want to understand mathematics, not just pass it. Every chapter is driven by a formal front matter schema that encodes its place in the mathematical topology before any prose is written.

## Commands

```bash
quarto preview        # Local development server at http://localhost:4000
quarto render         # Full build to _site/
bash scripts/scaffold-stubs.sh   # Create seed stubs for any missing chapter files
```

## Architecture

### The topology is the source of truth

`_data/topology.yml` defines all mathematical nodes, edges, and destination fields. Every chapter's front matter references node ids from this file. The schema (`_templates/chapter-schema.yml`) is the contract between the topology and the chapter content.

### Chapter status gates

`status` in front matter controls the publishing pipeline:

| Status | Meaning |
|--------|---------|
| `seed` | Front matter only; no content |
| `draft` | Content written; under review |
| `review` | All agent reviews complete |
| `final` | Published |

### Volume structure

| Volume | Content | Curriculum basis |
|--------|---------|-----------------|
| 1 | Numbers and operations | Alberta Gr 7–8 |
| 2 | Patterns and algebra | Alberta Gr 8–9 |
| 3 | Shape and measure | Alberta Gr 9–10 |
| 4 | Functions and change | Alberta Gr 10–11 |
| 5 | Analysis and proof | Alberta Gr 11–12 |
| 6 | Probability and data | Alberta Gr 11–12 |
| 7 | Engineering mathematics | Kreyszig + Stroud (university) |

Vol 7 is subdivided into sections: `odes/`, `linear-algebra/`, `fourier-pdes/`, `complex-analysis/`, `numerics/`, `optimisation/`, `probability/`.

### Front matter schema

Every chapter `.qmd` file must conform to `_templates/chapter-schema.yml`. Key fields:

- `axiom` / `rewrite` — the L-system rule this chapter embodies; authorial discipline, never rendered verbatim
- `opens_to` — what this chapter makes reachable, with relationship type (`enables` / `enriches` / `motivates`)
- `prerequisite_ids` — topology node ids that must be complete before this chapter
- `destinations` — which fields (`eng`, `sci`, `biz`, `comp`, `geo`) this chapter serves, with a concrete one-sentence hook per field

### Wayfinding visualisation

`map/wayfinding.qmd` renders the full topology as an interactive bloom diagram driven by `_data/topology.yml`. The `assets/js/wayfinding.html` include initialises it.

---

## Publishing agents

Eight agents live in `.claude/agents/`. Invoke them by name in Claude Code. They are designed to work in sequence when moving a chapter from `seed` → `final`.

### Typical chapter workflow

```
author       →  math-prof  →  engineer-prof / data-cs-prof
                                     ↓
                              tester-qa (schema + refs)
                                     ↓
                              student (readability)
                                     ↓
                              editor (voice)
                                     ↓
                              viz-artist (if interactive content needed)
```

### Agent responsibilities

| Agent | Invoked for |
|-------|-------------|
| `author` | Writing first-draft content for seed/draft chapters |
| `math-prof` | Mathematical correctness, notation, topology accuracy |
| `engineer-prof` | Engineering examples and Vol 7 framing |
| `data-cs-prof` | CS/ML/data science connections and numerical methods |
| `tester-qa` | Front matter schema compliance, topology cross-references, build integrity |
| `student` | Readability check at the chapter's target layer |
| `editor` | Voice consistency and prose quality |
| `viz-artist` | Interactive figures, topology bloom, function plots (OJS/D3) |

You do not need to run all agents on every chapter. `tester-qa` should always run before `review` status is set. `math-prof` should always run before `final`.

### Voice (enforced by editor)

Terse. Real-world first. Unshowy. Chapters open with concrete situations, not definitions. No reassurance. No preamble. The mathematics does the work.

---

## Key files

| Path | Purpose |
|------|---------|
| `_quarto.yml` | Project config; full chapter list |
| `_data/topology.yml` | Node/edge/field definitions (source of truth) |
| `_templates/chapter-schema.yml` | Full documented front matter schema |
| `scripts/scaffold-stubs.sh` | Creates missing seed stub files |
| `vol-02/01-linear-equations.qmd` | Proof-of-concept chapter (reference implementation) |
