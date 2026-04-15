# Volume 8 Pipeline Review

This file records the first pipeline-style pass over Volume 8 after the
initial scaffold was created.

## Scope

- repo agent instructions updated to support the `discipline` layer
- Volume 8 framing reviewed from author, math, engineering, student, data/CS,
  QA, editor, and senior-designer perspectives
- front matter hooks and destination viewpoints strengthened across all
  Volume 8 chapter seeds

## Pipeline outcomes

### Author

The volume should read as upper-year engineering mathematics embedded in
practice, not as "more advanced engineering maths" in the abstract. This led
to stronger real-world hooks in every chapter seed.

### Math-prof

The chapter order is mathematically defensible as a downstream build from
Volume 7:

1. control inherits ODE, Laplace, and eigenvalue thinking
2. discrete systems inherits transforms and numerics
3. continuum/transport inherits vector calculus and PDE structure
4. computational methods inherits numerics and continuum models
5. estimation/inverse problems inherits probability plus system models
6. reliability inherits probability and estimation
7. nonlinear optimisation closes the loop on design decisions

### Engineer-prof

The strongest engineering move was to anchor each chapter in how upper-year
students actually meet the mathematics: controls, sampled systems, simulation,
inverse sensing, reliability, and design tradeoffs. Career examples were added
to keep the framing concrete.

### Data/CS-prof

Volume 8 now treats computing as structurally parallel to engineering rather
than as an afterthought: embedded control, streaming signals, sparse solvers,
latent-state estimation, service reliability, and optimisation pipelines.

### Student

The original chapter seeds named the right topics but were too abstract as
entry points. Each chapter now opens from a recognisable system behaviour or
decision problem before naming the mathematics.

### Editor

The hooks were tightened to keep the voice direct and concrete. The target is
serious, upper-year, and human rather than motivational or textbook-flat.

### Tester-QA

Agent instructions now recognise the `discipline` layer and the repo's current
mixed `opens_to` convention well enough to audit Volume 8 without false
failures.

### Senior-designer

Volume 8 should be treated as a systems-heavy visual volume. Mandatory visual
threads:

- feedback loops and block diagrams
- sampled signals and aliasing views
- control volumes, fields, and fluxes
- meshes, discretisation error, and solver behaviour
- hidden-state/posterior update visuals
- reliability curves, queue growth, and tradeoff surfaces

## Remaining work

This pipeline pass is now superseded by two concrete next steps:

- **Prose polish pass (student accessibility):** keep the serious house voice,
  but add a few more “in words / how to read this” bridges at intimidation
  spikes (symbol bursts, boundary cases, stability conditions, constraint
  geometry). The aim is a clear path for non-core readers to keep moving.
- **Visual implementation pass:** implement and/or unify the systems-heavy
  visuals using the dedicated senior-designer build queue in
  `vol-08/SENIOR-DESIGNER-AUDIT.md` (linked-panel behaviour, consistent cards,
  regime cues, mobile-friendly control stacking).

Ongoing QA work:

- rerender Volume 8 after each major change and keep the interactive UI style
  consistent across chapters
- periodically re-render the wayfinding map and verify `opens_to` targets stay
  valid against `_data/topology.yml`
