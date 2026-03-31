# Wayward House Mathematics

A series for people who want to understand mathematics, not just pass it.

Seven volumes running from arithmetic foundations through to university
engineering mathematics. Built with [Quarto](https://quarto.org).

## Structure

```
wayward-maths/
├── _quarto.yml              # Project configuration
├── _data/
│   └── topology.yml         # Single source of truth: nodes, edges, fields
├── _templates/
│   └── chapter-schema.yml   # Front matter schema and documentation
├── assets/
│   ├── css/                 # Styles
│   └── js/                  # Wayfinding visualisation components
├── scripts/                 # Build utilities
├── map/                     # Series-level wayfinding pages
├── vol-01/                  # Numbers and operations
├── vol-02/                  # Patterns and algebra
├── vol-03/                  # Shape and measure
├── vol-04/                  # Functions and change
├── vol-05/                  # Analysis and proof
├── vol-06/                  # Probability and data
└── vol-07/                  # Engineering mathematics
    ├── odes/
    ├── linear-algebra/
    ├── fourier-pdes/
    ├── complex-analysis/
    ├── numerics/
    ├── optimisation/
    └── probability/
```

## Design principles

**The chapter schema drives everything.** Every `.qmd` chapter file
contains a YAML front matter block that specifies its position in the
mathematical topology, its prerequisite connections, its rewriting rule
(the L-system grammar), and its destination fields. The visualisation,
navigation, and generated prose all derive from this data.

**The topology is the source of truth.** `_data/topology.yml` defines
all nodes, edges, and destination fields. The chapter front matter
references nodes by id. Nothing is hardcoded in the templates.

**The L-system is structural, not pedagogical.** The `axiom` and
`rewrite` fields in chapter front matter are authorial discipline
tools — they ensure every chapter has a legible place in the topology
before content is written. They never appear verbatim in the rendered
output.

**Voice.** Terse. Real-world first. Unshowy. The mathematics does the
work. The prose gets out of the way.

## Chapter front matter

See `_templates/chapter-schema.yml` for the full documented schema.
Every chapter must conform to this schema. The `status` field
gates the build:

- `seed` — front matter only, no content
- `draft` — content in progress
- `review` — content complete, under review
- `final` — published

## Source texts

The topology is triangulated from three sources:

- **Alberta Curriculum Gr 7–12** — scope and sequence for Volumes 1–6
- **Stroud & Booth, Advanced Engineering Mathematics (6th ed.)**
  — procedural coverage for Volume 7
- **Kreyszig, Advanced Engineering Mathematics (10th ed.)**
  — conceptual architecture for Volume 7
- **University of Alberta MATH sequence** — MATH 100, 101, 102, 209,
  201 — the institutional prerequisite structure

## Building

```bash
# Install Quarto: https://quarto.org/docs/get-started/
quarto preview    # Local development server
quarto render     # Full build to _site/
```

## Status

Early development. Volume 2, Chapter 1 (Linear equations) is the
proof-of-concept chapter. Everything else is scaffolding.
