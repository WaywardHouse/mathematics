# VIZ Build Priorities

This document turns the embedded `<!-- VIZ: ... -->` comments into a buildable backlog.

The aim is not to implement every visualization immediately. The aim is to build the few that unlock the most understanding first, then fill out the rest in a sensible order.

## Full-Repo Audit Note

This list was expanded after a full sweep across all volumes and design briefs.

Summary:

- Volume 1: no explicit missing-visual placeholders found in chapter files or design briefs scanned here
- Volume 2: substantial missing visual work lives in [vol-02/DESIGN-BRIEF-VOL02.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-02/DESIGN-BRIEF-VOL02.md)
- Volume 3: substantial missing visual work lives in [vol-03/DESIGN-BRIEF-vol03.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-03/DESIGN-BRIEF-vol03.md)
- Volume 4: no explicit missing-visual placeholders found in the scanned material
- Volume 5: no explicit missing-visual placeholders found in the scanned material
- Volume 6: substantial missing visual work lives in [vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md)
- Volume 7: many placeholders live directly in chapter `.qmd` files
- Volume 8: many placeholders live directly in chapter `.qmd` files, plus a large design-brief backlog in [vol-08/DESIGN-BRIEF-vol08-full.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/DESIGN-BRIEF-vol08-full.md)

## Build Standard

Every visualization should:

- live directly in the relevant `.qmd` chapter as an `ojs` block unless there is a strong reason to factor shared helpers out
- render without external build tooling beyond what the book already uses
- degrade gracefully if JavaScript is disabled by leaving the surrounding prose fully understandable
- match the chapter mathematics exactly
- include a short caption or intro sentence that tells the learner what to look for
- expose the controlling parameter clearly with labels, not only sliders
- show the mathematical quantity being updated live
- use the existing visual language where a series already has one

## Implementation Rules To Give Claude Or Copilot

Use these instructions verbatim if you want.

### General Prompt

> Implement the visualization described by the `<!-- VIZ: ... -->` comment in the target `.qmd` file.
>
> Requirements:
> - Keep the implementation self-contained in the chapter unless shared helpers are truly necessary.
> - Use Observable JS / `ojs` blocks consistent with the rest of the repo.
> - Do not change the mathematical content of the chapter.
> - Add a one-sentence learner-facing intro immediately above the interactive if needed.
> - Surface the key variables and computed quantities live in the UI.
> - Use accessible labels and restrained styling that fits the existing book.
> - Prefer SVG/D3 or plain DOM/canvas over heavy dependencies.
> - Keep the interaction simple enough that a first-time learner can understand it in under 30 seconds.
> - If the placeholder is underspecified, implement the smallest version that teaches the core idea first.
> - Do not remove the original pedagogy around the interactive.
> - After implementing, briefly verify by checking that the chapter still parses and that the visualization reflects the formulas in the surrounding text.

### UI Rules

> Use these UI rules:
> - One main idea per interactive.
> - At most 2-3 controls unless the placeholder explicitly needs more.
> - Default state should already demonstrate the concept.
> - Always show the important computed value numerically.
> - Use color semantically and consistently.
> - Avoid decorative animation; motion should teach.
> - Keep mobile layout in mind.

### Code Rules

> Use these code rules:
> - Prefer deterministic pseudo-random data when randomness is used, so re-renders are stable.
> - Keep helper functions local unless reused in the same file.
> - Comment only the non-obvious parts.
> - Match existing OJS style in nearby chapters.
> - If a chapter already contains a related interactive, reuse its palette and structural conventions.

## Priority 1: Highest Learning Value

These are the visuals most worth building first because they unlock core concepts that are otherwise harder to see from prose alone.

### 0. Volume 2 Chapter 4: Number line becoming the coordinate plane

Source brief:
[vol-02/DESIGN-BRIEF-VOL02.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-02/DESIGN-BRIEF-VOL02.md)

Why first-tier:
- the design brief explicitly calls this the visual climax of Volume 2
- it is the conceptual bridge from arithmetic geometry to algebraic graphing
- it supports everything that follows in coordinate geometry and graphing

Build target:
- animate one number line becoming two perpendicular axes
- show a point as ordered pair rather than single position
- preserve the visual continuity with Volume 1 number-line thinking

Instruction to pass:

> Read the relevant section in `vol-02/DESIGN-BRIEF-VOL02.md` and implement the visual `The number line becoming the coordinate plane`.
> The teaching goal is not just to show x- and y-axes. It is to make the coordinate plane feel like an earned extension of the number line.
> Build a simple, clear transition:
> - start from one horizontal number line
> - introduce the second axis
> - show how one number becomes an ordered pair
> - let the learner move a point and read `(x,y)` live
> Keep the interaction minimal and explanatory rather than decorative.

### 1. Volume 8 Chapter 2: Sampling and aliasing explorer

File:
[vol-08/02-discrete-systems-signals.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/02-discrete-systems-signals.qmd)

Why first:
- aliasing is fundamentally visual
- it is one of the deepest conceptual pivots in the chapter
- the placeholder is already specific and compact

Build target:
- continuous sine wave
- sampled points
- apparent aliased wave
- controls for true frequency `f` and sampling frequency `f_s`
- live readout of true frequency, Nyquist limit, and aliased frequency
- obvious visual change when `f > f_s/2`

Instruction to pass:

> Implement the `Sampling and aliasing explorer` in `vol-08/02-discrete-systems-signals.qmd`.
> Build a two-panel or single coordinated SVG view showing:
> - the true continuous sine wave
> - sampled points
> - the reconstructed apparent lower-frequency signal
> Add sliders for `f` and `f_s`.
> Add a live text readout:
> - `f`
> - `f_s`
> - Nyquist frequency `f_s/2`
> - aliased frequency
> When aliasing occurs, switch the apparent wave to a contrasting color and display a short warning label.
> Keep the math faithful to the chapter’s formula for sampled sine waves.

### 2. Volume 8 Chapter 5: Hidden-state estimation board

File:
[vol-08/05-estimation-inverse.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/05-estimation-inverse.qmd)

Why first:
- estimation is much easier when learners can see truth, measurement, and estimate together
- this chapter’s main conceptual burden is invisible without a picture

Build target:
- latent state trace
- noisy measurement trace
- updated estimate trace
- controls for measurement noise and update weight `K`
- live explanation of what higher/lower `K` does

Instruction to pass:

> Implement the `Hidden-state estimation board` in `vol-08/05-estimation-inverse.qmd`.
> Use a small time-series visualization with three lines:
> - true state
> - noisy measurement
> - estimate
> Add controls for noise level and scalar update weight `K`.
> Compute the estimate using the chapter’s scalar update rule.
> Show the innovation `y - xhat_minus` numerically for the current step or as a small side panel.
> The key teaching goal is to make the compromise between model-trust and measurement-trust immediately visible.

### 3. Volume 7 Probability: CLT demonstration

File:
[vol-07/probability/01-probability-theory.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/probability/01-probability-theory.qmd)

Why first:
- CLT is one of the biggest conceptual payoffs in the probability sequence
- the placeholder is already well specified
- it directly supports later statistics chapters

Build target:
- histogram of sample means from a non-normal source, preferably exponential
- slider for sample size `n`
- normal overlay with matching mean and variance
- inset or side panel showing the original source distribution

Instruction to pass:

> Implement the `CLT demonstration` in `vol-07/probability/01-probability-theory.qmd`.
> Use a deterministic RNG and simulate many sample means from `Exp(0.5)` as described by the comment.
> Add a slider for `n`.
> Show:
> - histogram of sample means
> - normal approximation overlay `N(mu, sigma^2/n)`
> - small inset of the source exponential distribution
> Make the transition from skewed source to bell-shaped average visually obvious.

### 4. Volume 8 Chapter 1: Control feedback visual expansion

File:
[vol-08/01-control-feedback.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/01-control-feedback.qmd)

Why first:
- this chapter is the visual anchor for the whole volume
- the design brief says there are missing core visuals beyond the existing interactive

Needed additions from design brief:
- feedback vocabulary relabeller
- state-feedback phase portrait
- proportional-gain tradeoff chart

Instruction to pass:

> Read `vol-08/DESIGN-BRIEF-vol08-full.md` and implement the highest-value missing Chapter 1 visualization that is not already present in `vol-08/01-control-feedback.qmd`.
> Start with the `Proportional-gain tradeoff chart` if only one is built.
> Show how gain `K` moves the pole and changes steady-state error together.
> Keep the graphic simple, math-accurate, and visually consistent with the existing chapter interactive.

### 5. Volume 8 Chapter 3: Control-volume balance explorer

File:
[vol-08/03-continuum-transport.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/03-continuum-transport.qmd)

Why first:
- conservation law structure is central and abstract
- a good control-volume interactive will support many later topics

Build target:
- one square control volume
- inflow/outflow arrows
- source term
- storage meter
- live balance equation
- mode switch for heat / solute / fluid mass

Instruction to pass:

> Implement the `Control-volume balance explorer` in `vol-08/03-continuum-transport.qmd`.
> Build a compact diagram with adjustable inflow, outflow, and source.
> Show the storage variable increasing or decreasing visually.
> Display the current balance equation numerically so learners can see accumulation as `in - out + source`.
> Add a mode selector that relabels the same geometry for heat, solute, and fluid mass without changing the structure.

### 6. Volume 6 Chapter 1: Conditional probability geometry sequence

Source brief:
[vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md)

Why first-tier:
- the brief is explicit that the chapter currently computes probability without showing its geometry
- this is the substrate for later probability and statistics visuals
- several later chapters depend on this visual vocabulary

Most important missing pieces from the brief:
- sample-space rectangle
- Venn diagram for union/intersection/complement
- conditional-probability zoom into `B`
- probability axis `[0,1]`

Instruction to pass:

> Read `vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md` and implement the probability-geometry visuals in the order recommended there.
> Start with the smallest foundational one: `Sample space rectangle — P(A) as fraction of Ω`.
> Then implement `Conditional probability — zoom into B`.
> The key goal is to establish a reusable visual language for events, overlap, and conditioning that later volumes can inherit.
> Do not start with the medical-test table or other arithmetic-heavy widgets. Start with the geometry.

## Priority 2: Strongly Recommended

### 7. Volume 8 Chapter 4: Discretisation translator

File:
[vol-08/04-computational-methods.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/04-computational-methods.qmd)

Why:
- this chapter is about translation between mathematical worlds
- learners benefit from seeing PDE, grid, and algebra at once

Instruction:

> Implement the `Discretisation translator`.
> Use three coordinated panels:
> - PDE statement
> - geometric discretisation view
> - resulting algebraic equation
> Toggle among finite difference, finite volume, and finite element for one simple 1D diffusion example.
> Do not try to build a full solver. The teaching goal is structural correspondence.

### 8. Volume 7 Statistics: CI simulation

File:
[vol-07/probability/02-mathematical-statistics.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/probability/02-mathematical-statistics.qmd)

Why:
- confidence intervals are persistently misunderstood
- this one visual clarifies the “95% of intervals” interpretation immediately

Instruction:

> Implement the `CI simulation`.
> Generate repeated samples from a normal population with known true mean.
> Draw many 95% intervals as horizontal segments.
> Color intervals that miss the true mean differently.
> Show running coverage count.
> The point is to teach procedure coverage, not posterior probability.

### 9. Volume 7 Optimisation: 2D LP explorer

File:
[vol-07/optimisation/01-linear-programming.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/optimisation/01-linear-programming.qmd)

Why:
- simplex is easier once the geometry is visible
- this supports the graphical method and duality sections

Instruction:

> Implement the `2D LP explorer`.
> Use the chapter’s two-variable LP geometry.
> Add sliders for two constraint RHS values.
> Draw the feasible region, objective contour, and current optimal vertex.
> Label the active constraints and current objective value.

### 10. Volume 8 Chapter 6: Reliability curve explorer

File:
[vol-08/06-reliability-stochastic.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/06-reliability-stochastic.qmd)

Why:
- Weibull shape effects are visually important
- directly supports maintenance interpretation

Instruction:

> Implement the `Reliability curve explorer`.
> Show linked plots of `R(t)`, `F(t)`, and hazard.
> Add controls for Weibull `beta` and `eta`.
> Include a maintenance marker whose interpretation changes as `beta` changes.
> Make the `beta = 1` exponential case obvious.

### 11. Volume 7 Linear Algebra: Matrix transformation explorer

File:
[vol-07/linear-algebra/01-matrices-systems.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/linear-algebra/01-matrices-systems.qmd)

Why:
- visually foundational for later eigenvalue material
- high conceptual yield

Instruction:

> Implement the `Matrix transformation explorer`.
> Use a left input plane and right transformed plane.
> Show the unit square, basis vectors, sample rays, and transformed image.
> Add sliders for the 2x2 entries and presets.
> Live-display determinant and singular/non-singular status.

### 12. Volume 3 Chapter 4: Function machine plus graph

Source brief:
[vol-03/DESIGN-BRIEF-vol03.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-03/DESIGN-BRIEF-vol03.md)

Why:
- the brief identifies this as one of the most important missing visuals in Volume 3
- it makes domain, output, and function action visible at once
- it supports inverse functions and composition later in the same chapter

Instruction:

> Read `vol-03/DESIGN-BRIEF-vol03.md` and implement `Function machine + graph, dual panel`.
> Show the same function in two views at once:
> - machine/input-output view
> - graph view
> Let the learner vary the input and watch both panels update together.
> The main teaching goal is to make domain, output, and rule feel like one object, not separate topics.

### 13. Volume 6 Chapter 3: Confidence-interval coverage simulation

Source brief:
[vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md)

Why:
- the brief explicitly names this as a load-bearing missing visual
- it closes a core interpretation gap in inference
- it complements the stronger existing hypothesis-test interactives

Instruction:

> Read `vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md` and implement `Confidence interval simulation — coverage demonstration`.
> The essential output is many intervals, some missing the true parameter, with coverage counted visibly.
> Emphasise repeated sampling and long-run coverage rather than one fixed interval.

## Priority 3: Good Next Wave

These are valuable, but they can follow once the highest-leverage pieces exist.

- [vol-07/optimisation/01-linear-programming.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/optimisation/01-linear-programming.qmd): simplex tableau stepper
- [vol-07/optimisation/02-graphs-networks.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/optimisation/02-graphs-networks.qmd): Dijkstra step-through
- [vol-07/optimisation/02-graphs-networks.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/optimisation/02-graphs-networks.qmd): network flow explorer
- [vol-07/probability/01-probability-theory.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/probability/01-probability-theory.qmd): conditional probability area model
- [vol-07/probability/01-probability-theory.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/probability/01-probability-theory.qmd): normal distribution sigma bands
- [vol-07/probability/01-probability-theory.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/probability/01-probability-theory.qmd): correlation scatter cloud
- [vol-07/probability/02-mathematical-statistics.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/probability/02-mathematical-statistics.qmd): regression explorer
- [vol-07/fourier-pdes/03-partial-differential-equations.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/fourier-pdes/03-partial-differential-equations.qmd): heat equation evolution
- [vol-07/fourier-pdes/03-partial-differential-equations.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/fourier-pdes/03-partial-differential-equations.qmd): standing wave modes
- [vol-07/numerics/01-numerical-methods.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/numerics/01-numerical-methods.qmd): animated bisection
- [vol-07/numerics/01-numerical-methods.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/numerics/01-numerical-methods.qmd): Newton-Raphson convergence
- [vol-07/numerics/01-numerical-methods.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/numerics/01-numerical-methods.qmd): quadrature comparison
- [vol-07/numerics/02-numerical-linear-algebra.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/numerics/02-numerical-linear-algebra.qmd): augmented matrix animation
- [vol-07/numerics/02-numerical-linear-algebra.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/numerics/02-numerical-linear-algebra.qmd): condition number explorer
- [vol-07/numerics/03-numerical-odes-pdes.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/numerics/03-numerical-odes-pdes.qmd): ODE stepper comparison
- [vol-07/numerics/03-numerical-odes-pdes.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/numerics/03-numerical-odes-pdes.qmd): heat equation FD stability viz
- [vol-07/complex-analysis/03-series-residues.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/complex-analysis/03-series-residues.qmd): singularity classifier
- [vol-07/complex-analysis/03-series-residues.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/complex-analysis/03-series-residues.qmd): residue theorem contour sweep
- [vol-08/02-discrete-systems-signals.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/02-discrete-systems-signals.qmd): discrete-time filter sandbox
- [vol-08/03-continuum-transport.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/03-continuum-transport.qmd): constitutive-law comparison board
- [vol-08/04-computational-methods.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/04-computational-methods.qmd): mesh and timestep sensitivity explorer
- [vol-08/05-estimation-inverse.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/05-estimation-inverse.qmd): observation-versus-state explorer
- [vol-08/06-reliability-stochastic.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/06-reliability-stochastic.qmd): reliability/queue/quality comparison board
- [vol-08/07-nonlinear-optimisation.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/07-nonlinear-optimisation.qmd): nonlinear tradeoff surface explorer
- [vol-08/07-nonlinear-optimisation.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/07-nonlinear-optimisation.qmd): feasible-region and tradeoff explorer
- [vol-02/DESIGN-BRIEF-VOL02.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-02/DESIGN-BRIEF-VOL02.md): equation balance animated solving sequence
- [vol-02/DESIGN-BRIEF-VOL02.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-02/DESIGN-BRIEF-VOL02.md): sign-flip as reflection on the number line
- [vol-02/DESIGN-BRIEF-VOL02.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-02/DESIGN-BRIEF-VOL02.md): sequence as a function machine
- [vol-02/DESIGN-BRIEF-VOL02.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-02/DESIGN-BRIEF-VOL02.md): two lines and their intersection
- [vol-03/DESIGN-BRIEF-vol03.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-03/DESIGN-BRIEF-vol03.md): composition arrow diagram
- [vol-03/DESIGN-BRIEF-vol03.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-03/DESIGN-BRIEF-vol03.md): inverse as reflection
- [vol-03/DESIGN-BRIEF-vol03.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-03/DESIGN-BRIEF-vol03.md): vertical line test
- [vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md): distribution as landscape
- [vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md): PDF and CDF linked accumulation view
- [vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md): Type I / Type II / power visual
- [vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md): three views of one dataset
- [vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md): distribution shape gallery
- [vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md): correlation cloud gallery

## Priority 4: Design-Brief-Only Extras

These are not all embedded as chapter comments yet, but they are explicitly called for in the design brief and should be tracked.

Primary source:
[vol-08/DESIGN-BRIEF-vol08-full.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/DESIGN-BRIEF-vol08-full.md)

Most important extras:

- Chapter 1: proportional-gain tradeoff chart
- Chapter 1: state-feedback phase portrait
- Chapter 2: s-plane to z-plane stability translation
- Chapter 2: FIR convolution window
- Chapter 3: Fourier/Fick sign diagram
- Chapter 3: heat-equation smoothing demo
- Chapter 3: heat-diffusion isomorphism panel
- Chapter 4: stability region diagram in `Δt-Δx` space
- Chapter 4: discretisation stencil gallery
- Chapter 4: finite-volume conservation pair
- Chapter 5: estimation number line
- Chapter 5: predict-update cycle
- Chapter 6: queue length vs traffic intensity
- Chapter 6: process quality explorer
- Chapter 7: two-objective tradeoff explorer
- Chapter 7: Lagrange tangency diagram
- Chapter 7: gradient descent path

Other important design-brief-only extras outside Volume 8:

- Volume 2: solution point on a number line
- Volume 2: compound inequality as a segment
- Volume 2: zoom-out sequence explorer
- Volume 2: from sequence to line
- Volume 3: unit circle interactive
- Volume 6: independence as Yule rectangle
- Volume 6: sample-space rectangle sequence
- Volume 6: Venn union/intersection/complement
- Volume 6: probability axis `[0,1]`
- Volume 6: CLT population-shape selector
- Volume 6: confidence-interval coverage simulation
- Volume 6: Type I / Type II / power overlay
- Volume 6: box-plot / histogram / dot-plot views

## Suggested Build Order For An External Assistant

If you want Claude or Copilot to work through the backlog in sequence, use this:

1. `vol-08/02-discrete-systems-signals.qmd` — aliasing explorer
2. `vol-08/05-estimation-inverse.qmd` — hidden-state estimation board
3. `vol-02/DESIGN-BRIEF-VOL02.md` — number line becoming the coordinate plane
4. `vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md` — sample-space rectangle / conditional zoom
5. `vol-07/probability/01-probability-theory.qmd` — CLT demonstration
6. `vol-08/03-continuum-transport.qmd` — control-volume balance explorer
7. `vol-08/04-computational-methods.qmd` — discretisation translator
8. `vol-07/probability/02-mathematical-statistics.qmd` — CI simulation
9. `vol-07/optimisation/01-linear-programming.qmd` — 2D LP explorer
10. `vol-08/06-reliability-stochastic.qmd` — reliability curve explorer
11. `vol-07/linear-algebra/01-matrices-systems.qmd` — matrix transformation explorer
12. `vol-03/DESIGN-BRIEF-vol03.md` — function machine plus graph
13. `vol-08/01-control-feedback.qmd` — fill missing design-brief visuals

## Handoff Prompt For Batch Work

> Work through `VIZ-BUILD-PRIORITIES.md` in order.
> For each target:
> - open the target `.qmd`
> - locate the `<!-- VIZ: ... -->` placeholder
> - implement the smallest complete interactive that teaches the named concept
> - keep the implementation inside the chapter unless reuse is clearly needed
> - preserve all existing prose and math
> - after each implementation, add a short note describing what was built and any deliberate simplifications
> Do not attempt the whole backlog at once. Complete one visualization cleanly, then stop for review unless explicitly told to continue.
