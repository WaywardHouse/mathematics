# VIZ Build Queue

This is the execution version of the visualization backlog.

Use it when handing work to Claude, Copilot, or any other implementation assistant. Each item is intentionally scoped as a single task card.

## How To Use This Queue

- Work top to bottom unless there is a strong dependency reason not to.
- Implement one card at a time.
- After each card, render the target chapter and stop for review.
- Keep each implementation inside the target `.qmd` unless the card explicitly justifies shared helpers.
- Do not batch multiple unrelated visuals into one pass.

## Definition Of Done

A card is done when:

- the target visualization exists in the chapter
- the surrounding prose still reads cleanly
- the interactive reflects the chapter mathematics correctly
- the chapter renders without introducing visible breakage
- the original placeholder comment is either removed or replaced with a short implementation note

## Card 1

Title:
`Vol 8 Ch 2 — Sampling And Aliasing Explorer`

Target:
[vol-08/02-discrete-systems-signals.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/02-discrete-systems-signals.qmd)

Why now:
- highest concept-to-effort ratio
- directly clarifies one of the chapter’s central ideas

Implementation brief:

> Implement the `Sampling and aliasing explorer`.
> Show:
> - true continuous sine wave
> - sampled points
> - apparent aliased wave
> Add controls for true frequency `f` and sampling frequency `f_s`.
> Add a readout for:
> - `f`
> - `f_s`
> - Nyquist frequency
> - aliased frequency
> When aliasing occurs, make it visually unmissable.

Render after:
- render only [vol-08/02-discrete-systems-signals.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/02-discrete-systems-signals.qmd)

## Card 2

Title:
`Vol 8 Ch 5 — Hidden-State Estimation Board`

Target:
[vol-08/05-estimation-inverse.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/05-estimation-inverse.qmd)

Implementation brief:

> Implement the `Hidden-state estimation board`.
> Build a time-series view with:
> - true state
> - noisy measurement
> - updated estimate
> Add controls for noise level and update weight `K`.
> Use the chapter’s scalar update rule.
> Surface the innovation and make the trust tradeoff visually obvious.

Render after:
- render only [vol-08/05-estimation-inverse.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/05-estimation-inverse.qmd)

## Card 3

Title:
`Vol 2 Ch 4 — Number Line Becoming The Coordinate Plane`

Source brief:
[vol-02/DESIGN-BRIEF-VOL02.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-02/DESIGN-BRIEF-VOL02.md)

Implementation brief:

> Implement the visual `The number line becoming the coordinate plane`.
> Show the transition from one axis to two axes and from one number to an ordered pair.
> Keep the interaction minimal and pedagogically clear.
> Preserve continuity with the earlier number-line visual language.

Render after:
- render the target graphing chapter once the implementation is inserted there

## Card 4

Title:
`Vol 6 Ch 1 — Sample Space Rectangle`

Source brief:
[vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md)

Implementation brief:

> Implement `Sample space rectangle — P(A) as fraction of Ω`.
> This should establish the base geometry for later event and conditioning visuals.
> Keep it simple, explicit, and reusable in style.

Render after:
- render the probability chapter that receives the implementation

## Card 5

Title:
`Vol 6 Ch 1 — Conditional Probability Zoom`

Source brief:
[vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-06/SENIOR-DESIGNER-BRIEF-VOL06.md)

Implementation brief:

> Implement `Conditional probability — zoom into B`.
> The key teaching move is that the universe shrinks to `B`, and `A ∩ B` becomes the new relevant region.
> Prioritise geometric clarity over extra controls.

Render after:
- render the same target chapter again

## Card 6

Title:
`Vol 7 Probability — CLT Demonstration`

Target:
[vol-07/probability/01-probability-theory.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/probability/01-probability-theory.qmd)

Implementation brief:

> Implement the `CLT demonstration`.
> Use a stable pseudo-random generator.
> Show histogram of sample means from a non-normal source and a normal overlay.
> Add a slider for sample size `n`.
> Include a small source-distribution inset.

Render after:
- render only [vol-07/probability/01-probability-theory.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/probability/01-probability-theory.qmd)

## Card 7

Title:
`Vol 8 Ch 3 — Control-Volume Balance Explorer`

Target:
[vol-08/03-continuum-transport.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/03-continuum-transport.qmd)

Implementation brief:

> Implement the `Control-volume balance explorer`.
> Show inflow, outflow, source, and accumulation with a live balance readout.
> Include mode relabelling for heat, solute, and fluid mass.

Render after:
- render only [vol-08/03-continuum-transport.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/03-continuum-transport.qmd)

## Card 8

Title:
`Vol 8 Ch 4 — Discretisation Translator`

Target:
[vol-08/04-computational-methods.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/04-computational-methods.qmd)

Implementation brief:

> Implement the `Discretisation translator`.
> Use three coordinated panels:
> - PDE
> - geometric discretisation
> - algebraic equation
> Toggle among finite difference, finite volume, and finite element for one 1D diffusion example.

Render after:
- render only [vol-08/04-computational-methods.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/04-computational-methods.qmd)

## Card 9

Title:
`Vol 7 Statistics — Confidence Interval Coverage Simulation`

Target:
[vol-07/probability/02-mathematical-statistics.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/probability/02-mathematical-statistics.qmd)

Implementation brief:

> Implement the `CI simulation`.
> Draw repeated intervals from repeated samples.
> Mark misses clearly.
> Show running coverage.
> Emphasise long-run procedure, not belief about one interval.

Render after:
- render only [vol-07/probability/02-mathematical-statistics.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/probability/02-mathematical-statistics.qmd)

## Card 10

Title:
`Vol 7 Optimisation — 2D LP Explorer`

Target:
[vol-07/optimisation/01-linear-programming.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/optimisation/01-linear-programming.qmd)

Implementation brief:

> Implement the `2D LP explorer`.
> Draw the feasible region, objective contour, and optimal vertex.
> Let the RHS values move with sliders.
> Keep the geometry legible first, dynamic second.

Render after:
- render only [vol-07/optimisation/01-linear-programming.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/optimisation/01-linear-programming.qmd)

## Card 11

Title:
`Vol 8 Ch 6 — Reliability Curve Explorer`

Target:
[vol-08/06-reliability-stochastic.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/06-reliability-stochastic.qmd)

Implementation brief:

> Implement the `Reliability curve explorer`.
> Show linked `R(t)`, `F(t)`, and hazard plots.
> Add controls for Weibull `beta` and `eta`.
> Make wear-out versus infant-mortality behaviour visually unmistakable.

Render after:
- render only [vol-08/06-reliability-stochastic.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/06-reliability-stochastic.qmd)

## Card 12

Title:
`Vol 7 Linear Algebra — Matrix Transformation Explorer`

Target:
[vol-07/linear-algebra/01-matrices-systems.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/linear-algebra/01-matrices-systems.qmd)

Implementation brief:

> Implement the `Matrix transformation explorer`.
> Show input plane and transformed plane side by side.
> Include unit square, basis vectors, sample rays, and determinant readout.
> Add presets and singular warning.

Render after:
- render only [vol-07/linear-algebra/01-matrices-systems.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-07/linear-algebra/01-matrices-systems.qmd)

## Card 13

Title:
`Vol 3 Functions — Function Machine Plus Graph`

Source brief:
[vol-03/DESIGN-BRIEF-vol03.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-03/DESIGN-BRIEF-vol03.md)

Implementation brief:

> Implement `Function machine + graph, dual panel`.
> Show a live input value, machine rule, output value, and corresponding point on the graph.
> Make the domain/range relationship visible without overcomplicating the UI.

Render after:
- render the target functions chapter once inserted

## Card 14

Title:
`Vol 8 Ch 1 — Missing Control Visuals From Design Brief`

Source brief:
[vol-08/DESIGN-BRIEF-vol08-full.md](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/DESIGN-BRIEF-vol08-full.md)

Implementation brief:

> Implement one missing high-value Chapter 1 control visualization from the design brief.
> Preferred order:
> 1. proportional-gain tradeoff chart
> 2. state-feedback phase portrait
> 3. feedback vocabulary relabeller
> Keep it visually consistent with the existing chapter interactive.

Render after:
- render only [vol-08/01-control-feedback.qmd](/Users/pauldhobson/src/websites/waywardhouse-math/vol-08/01-control-feedback.qmd)

## Batch Prompt

> Work from `VIZ-BUILD-QUEUE.md` one card at a time.
> For the current card:
> - open the target chapter or design brief
> - implement the smallest complete visualization that satisfies the brief
> - keep the code local to the chapter unless reuse is clearly justified
> - preserve the surrounding pedagogy
> - render the target chapter after implementation
> - stop and report what was built, what was simplified, and any remaining gaps
