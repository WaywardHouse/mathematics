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

- normalise `opens_to` conventions across older Volume 7 chapters
- write full draft prose for Volume 8 chapters
- produce a dedicated Volume 8 senior-designer audit once chapter drafts exist
