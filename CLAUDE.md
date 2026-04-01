# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

---

## What this project is

*Wayward House Mathematics* is an eight-volume Quarto book — arithmetic foundations through upper-year engineering mathematics — built for people who want to understand mathematics, not just pass it. Every chapter is driven by a formal front matter schema that encodes its place in the mathematical topology before any prose is written.

### Reader mandate

The series is written for a breadth of learners — neurotypical and neurodiverse. This shapes every content decision:

- **Prose** explains the *why* behind each step, not just the *what*. Language is calibrated to the layer (plain and everyday for pre-university; more precise for university and engineering).
- **Examples** are drawn from the reader's actual world at the relevant age/stage — not abstract professional scenarios.
- **Interactivity** is not optional decoration. Every chapter should have at least one interactive element that lets the reader *manipulate* the concept and see the consequence. Some learners cannot build understanding from symbolic prose alone; they need to see a concept move. The viz-artist agent runs on every chapter, not just chapters with obvious graphs.
- **Multiple representations** of the same idea — symbolic, visual, numerical, verbal — support learners with dyscalculia, dyslexia, ADHD, and other profiles, as well as anyone who simply learns differently from the assumed default.

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
| 7 | Engineering mathematics | U of A first- and second-year engineering mathematics |
| 8 | Upper-year engineering mathematics | U of A years 3–4 mathematical methods across disciplines |

Vol 7 is subdivided into sections: `odes/`, `linear-algebra/`, `fourier-pdes/`, `complex-analysis/`, `numerics/`, `optimisation/`, `probability/`.
Vol 8 extends that core into control, discrete systems, continuum models, computational methods, estimation, reliability, and nonlinear optimisation, with optional domain viewpoints for science, computing, finance, and geography/environment.

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

Nine agents live in `.claude/agents/`. Invoke them by name in Claude Code. They are designed to work in sequence when moving a chapter from `seed` → `final`.

### Typical chapter workflow

```
author       →  math-prof  →  engineer-prof / data-cs-prof
                                     ↓
                              tester-qa (schema + refs)
                                     ↓
                              student (readability)
                                     ↓
                              editor (voice + language)
                                     ↓
                              senior-designer (visual design audit + viz briefs)
                                     ↓
                              viz-artist (implements interactives from senior-designer briefs)
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
| `senior-designer` | Visual design audit — concept geometry, missed opportunities, cross-chapter visual threads, VIZ brief quality; outputs directed briefs for viz-artist |
| `viz-artist` | Implements interactives from senior-designer briefs — number lines, sliders, animated concept demos, topology bloom (OJS/D3); exercise steppers |

`tester-qa` must run before `review` status is set. `math-prof` must run before `final`. `senior-designer` runs on every chapter — visual richness is not optional. `viz-artist` runs after `senior-designer` and implements the resulting briefs.

### Exercise steppers

Every exercise gets a stepwise OJS reveal. The author writes a `<!-- STEPPER -->` comment after each exercise; the viz-artist converts it to working OJS.

The stepper shows the problem, then a "Next step →" button that reveals one step at a time — operation label, KaTeX-rendered equation, optional one-sentence note explaining why the step works.

`<!-- VIZ: ... -->` placeholders flag concept interactives (sliders, animations). `<!-- STEPPER -->` blocks flag exercise steppers. Both are converted by the viz-artist agent.

### Voice (enforced by editor)

Clear, direct, and human. Chapters open with concrete situations from the reader's actual world at that age. No padding, no fake enthusiasm, no preamble — but also not cold or dismissive. Terse means no wasted words, not an impatient tone. Language is calibrated to the chapter's layer: everyday vocabulary for pre-university, more precise for university and engineering.

---

## Key files

| Path | Purpose |
|------|---------|
| `_quarto.yml` | Project config; full chapter list |
| `_data/topology.yml` | Node/edge/field definitions (source of truth) |
| `_templates/chapter-schema.yml` | Full documented front matter schema |
| `scripts/scaffold-stubs.sh` | Creates missing seed stub files |
| `vol-02/01-linear-equations.qmd` | Proof-of-concept chapter (reference implementation) |
