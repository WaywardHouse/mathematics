# Editorial Plan: Make the Series Accessible to Non-Core Learners

## Purpose

This plan adds an editorial layer across the full mathematics series so each
chapter becomes easier to enter, easier to follow, and easier to trust.
The aim is not to flatten the mathematics or make the prose chatty. The aim is
to make the series genuinely teachable for readers who are capable, curious,
and not already mathematically fluent.

This includes readers such as:

- math-curious geographers
- environmental scientists
- designers and planners
- policy or social-science students with quantitative ambition
- engineering students outside the theory-heavy stream

The series should not read as if it is written only for people who already
understand the subject. It should read as a path into understanding.

The editorial goals are:

- reduce intimidation at the chapter opening
- make explanations feel guided rather than declarative
- separate "new idea" load from "new notation" load
- make the reader feel accompanied through difficult turns
- improve transfer from worked idea to independent exercise

## Audience

### Primary reader

The primary reader is mathematically capable but not yet mathematically
fluent. They may be outside the core mathematics track. They are willing to
think carefully, but they need orientation, motivation, and symbolic support.

### Editorial implication

This project should assume curiosity, not fluency. It should never assume the
reader is already comfortable with compressed symbolic language, textbook
definitions, or abrupt abstraction jumps.

## Editorial stance

The current house voice is serious, concrete, and unshowy. Those are strengths.
But the current voice is often too terse and too compression-friendly to be
fully accessible to non-core learners.

So the goal is not to preserve the house voice unchanged. The goal is to
evolve it.

### Accessibility test for the house voice

If the prose passes these checks, it is likely accessible to a mathematically
capable but not-yet-fluent reader:

- The chapter explains *why* a definition exists before presenting it.
- New notation is read aloud immediately, not left as a silent token.
- The prose periodically tells the reader what has changed ("so now we can...",
  "this means...") rather than only what to do next.
- Common confusions are named in advance (sign errors, domain restrictions,
  mixing up "near" with "at", confusing variable with parameter).
- The writing assumes curiosity, not fluency: it never relies on symbolic
  compression as a test of belonging.

### New voice standard

The series voice should be:

- serious, but welcoming
- intelligent, but patient
- concrete, but interpretive
- ambitious, but not performative
- mathematically honest, but never exclusionary

Preferred posture:

- name what the learner likely notices before naming the formal idea
- explain why a definition exists before asking the reader to use it
- acknowledge common confusions without sounding remedial
- move from intuitive case to formal statement to worked structure
- close sections by telling the reader what has changed in their understanding

Avoid:

- abrupt jumps from hook to formalism
- unexplained symbolic compression
- examples that prove procedure without clarifying meaning
- textbook-flat transitions such as "consider the following"
- overuse of authority language ("it is obvious", "clearly", "trivially")
- writing that rewards only readers who were already comfortable before they began

## Core principle

Every chapter should help a non-specialist reader answer three questions early:

1. What problem is this mathematics helping me think about?
2. What is the new idea in ordinary language?
3. How do the symbols say that idea without hiding it?

## Series-wide rewrite rules

Apply these rules to every chapter revision.

1. Open from a human-scale situation, then state the mathematical promise.
2. Add a short "What this chapter helps you do" paragraph near the top.
3. Introduce notation one symbol at a time, in the order it becomes useful.
4. Translate each new symbol immediately into spoken language and conceptual role.
5. Break long explanations into shorter conceptual beats with explicit turns.
6. After each major method, add one sentence on why the method works.
7. Use worked examples that include one brief sentence of interpretation after the arithmetic.
8. Add "watch for this" language before common mistakes and sign errors.
9. End sections with a compact recap of what is now true, not just what was done.
10. Keep ambition high, but lower emotional friction by making the next step legible.

## Definition and symbol method

Mathematical language becomes intimidating when the reader meets a new idea,
its formal definition, and its notation all at once. To prevent that, every
definition and every important symbol should be introduced with the same
editorial method.

### The five-step method

1. Need:
   State the problem or distinction that makes the definition necessary.
2. Plain language:
   Say the idea in ordinary words first.
3. Formal statement:
   Give the mathematical definition or notation.
4. Read aloud:
   Tell the reader exactly how to read the notation in words.
5. Interpretation:
   Explain what the definition or symbol is doing, measuring, comparing, or naming.

### Definition template

Use this pattern whenever a chapter introduces a new formal definition.

- Before the definition:
  "We need a way to describe..."
- Plain-language lead-in:
  "In ordinary language, this means..."
- Formal definition:
  Present the definition cleanly.
- After the definition:
  "So this definition is saying..."
- Quick example:
  Give one immediate, low-friction example before moving on.

### Symbol template

Use this pattern whenever a chapter introduces a symbol or notation.

- Symbol:
  Show the symbol by itself.
- Reads as:
  Give a spoken version.
- Means:
  State the idea in plain English.
- Use when:
  Say what kind of problem this symbol appears in.
- Common confusion:
  Name the thing students are likely to misread.

### Theorem template (the "in words" bridge)

For non-core learners, the intimidation spike is often not the algebra; it is
the moment a theorem appears as a formal block before the reader knows what it
is for. To lower that spike, major results should be introduced with a short
bridge that says what the theorem is *really trading*.

Use this pattern for key results (Green/Stokes/Divergence, substitution rules,
comparison tests, transforms, stability conditions, etc.).

- Need:
  Name the practical problem ("direct evaluation is brutal", "we need a swap").
- In words:
  Give a one-sentence translation of what the theorem says.
- Formal statement:
  Present the theorem cleanly.
- Read aloud:
  If the theorem is symbol-dense, provide one spoken sentence for the core line.
- How to use:
  State the "recipe" step in plain language ("convert boundary to interior").
- Common pitfall:
  State the sign/orientation/conditions mistake students routinely make.

Series convention: when a theorem is a boundary/interior trade, include a short
recurring callout titled **“[Name] theorem, in words”** right before the formal
statement.

### Example

Instead of introducing

`$\lim_{x \to a} f(x) = L$`

as a compact block only, introduce it like this:

- Need:
  We need a way to talk about what a function is heading toward near a point.
- Plain language:
  Sometimes the important fact is not the value at the point, but the value the outputs approach nearby.
- Formal statement:
  `$\lim_{x \to a} f(x) = L$`
- Read aloud:
  "The limit of f of x as x approaches a is L."
- Interpretation:
  As x gets close to a, the outputs of the function get close to L.

### Definition and symbol boxes

Where helpful, add short recurring support boxes with labels such as:

- `Definition in plain language`
- `How to read this symbol`
- `What this notation is tracking`
- `Common misread`
- `Symbols to keep handy`

These should be brief and repeated consistently enough that readers learn the
series habit.

#### Series convention: a symbols box in every chapter

Every chapter that declares `notation_introduced` in its front matter should
surface a short **Symbols to keep handy** box near the top of the chapter. It
exists to reduce intimidation, not to dump notation: it lists only the symbols
that do the most work and reads them aloud in plain language.

Implementation note for this repository: this box is generated automatically
from `notation_introduced` (weights ≥ 2, capped for length). A chapter can opt
out by setting `notation_box: false` in its front matter.

#### Series convention: a definitions box when terms matter

When a chapter introduces new formal vocabulary, add a short
`definitions_introduced` list in the front matter. The build will surface a
**Definitions to keep handy** callout near the top. Each definition should be
one plain sentence: the goal is to lower intimidation and stabilize meaning
before the formal statement appears in-body.

## Standard chapter edits

Every chapter should be revised through the same editorial checklist.

- Opening:
  Replace abstract framing with a concrete situation, learner question, or visible pattern.
- Orientation:
  Add a 3 to 5 sentence roadmap naming the big idea, the main move, and where students usually get stuck.
- Definitions:
  Use the five-step definition method: need, plain language, formal statement, read aloud, interpretation.
- Symbols:
  Introduce notation with the symbol template, not as a dense list in isolation.
- Examples:
  Ensure each worked example answers three questions: what are we doing, why this move, what does the answer mean.
- Transitions:
  Add bridge sentences between sections so the argument feels continuous.
- Exercises:
  Sequence from recognition to procedure to interpretation to transfer.
- Closing:
  Add a short "What you can do now" section before exercises or chapter end.

## Priority outcomes

If this plan is executed well, students should be more able to:

- enter a chapter without feeling immediately behind
- distinguish concept from procedure
- retain the meaning of new notation
- read symbols without feeling excluded by them
- explain a method in words, not only reproduce it
- recover after confusion because the prose contains orientation cues

## Volume-by-volume editorial agenda

## Volume 1: Numbers and operations

### Editorial goal

Make early chapters feel welcoming, concrete, and confidence-building without
becoming childish. Emphasise that mathematics names relationships students
already meet in money, measurement, temperature, chance, and comparison.

### Chapter plan

- `01-number-line.qmd` "Numbers and the number line"
  Humanize by foregrounding position, direction, and distance as familiar ideas before introducing symbolic comparison. Add more "where is it on the line?" language after each example.
- `02-ratio-proportion.qmd` "Ratio and proportion"
  Reduce abstraction by anchoring ratio in recipes, scale, mixtures, and speed. Distinguish clearly between "part-to-part" and "part-to-whole" in plain language before setting up formal ratios.
- `03-percent-rates.qmd` "Percent and rates"
  Clarify that percent is a comparison language, not just a calculation recipe. Add interpretive sentences after percent change examples so students connect the number to increase, decrease, and pace.
- `04-integers.qmd` "Integers and signed arithmetic"
  Slow down sign language and direction changes. Use more verbal framing around "what changed" when moving from subtraction to adding negatives.
- `05-fractions-decimals.qmd` "Fractions and decimals"
  Treat fractions as quantities first, symbols second. Emphasise equivalence, size, and representation before procedure-heavy operations.
- `06-statistics-probability.qmd` "Statistics and probability"
  Make the chapter less list-like by centring the question "what does this data or chance statement tell us?" Differentiate describing data from predicting outcomes.

## Volume 2: Patterns and algebra

### Editorial goal

Help students feel that algebra is a way of expressing structure they already
notice, not a sudden language switch into symbols.

### Chapter plan

- `01-linear-equations.qmd` "Linear equations"
  Make solving feel like restoring balance and locating an unknown value, not just performing legal moves. Add more narration around preserving equality.
- `02-inequalities.qmd` "Inequalities"
  Humanize by stressing that the answer is a set of possible values. Revisit why the sign flip happens with reflective, visual language before formal rule statements.
- `03-patterns-sequences.qmd` "Patterns and sequences"
  Keep the focus on noticing regularity, making predictions, and stating the rule in words before symbol form. Separate recursive thinking from explicit formulas more clearly.
- `04-graphing-relations.qmd` "Graphing relations"
  Frame graphs as pictures of relationships rather than coordinate chores. Use repeated "what does this point mean?" and "what does this shape tell us?" prompts.

## Volume 3: Shape and measure

### Editorial goal

Turn geometric and algebraic chapters into explanation-rich spaces where
students can see why formulas make sense, not just where to substitute values.

### Chapter plan

- `01-geometry-measurement.qmd` "Geometry and measurement"
  Humanize by tying formulas to visible shape stories. Add more spatial explanation before symbolic formulas, especially for area, circumference, and volume.
- `02-trigonometry.qmd` "Trigonometry"
  Reduce fear by presenting trig as a way to connect angle, side, and rotation. Build from "what stays the same in similar triangles" before ratio naming.
- `03-polynomials-factoring.qmd` "Polynomials and factoring"
  Make expressions feel like objects with structure. Explain factoring as uncovering hidden multiplication rather than reversing a school procedure.
- `04-functions-relations.qmd` "Functions and relations"
  Treat function as input-output dependence before formal vocabulary. Reuse consistent language for machine, rule, and relationship so students do not feel definitions are shifting underneath them.

## Volume 4: Functions and change

### Editorial goal

Bridge from school algebra into more abstract mathematical objects while making
each chapter feel like a natural next question rather than a leap.

### Chapter plan

- `01-exponents-logarithms.qmd` "Exponents and logarithms"
  Explain logs as questions about powers before formal rules. Keep the inverse relationship visible in plain language throughout.
- `02-complex-numbers.qmd` "Complex numbers"
  Lower resistance by naming the problem complex numbers solve before introducing `i`. Stress representation and interpretation, not mystery.
- `03-systems-matrices.qmd` "Systems of equations"
  Keep the storyline centred on multiple constraints that must hold at once. Introduce matrices as organisational tools before abstract objects.
- `04-sequences-series.qmd` "Sequences and series"
  Emphasise accumulation, pattern, and total growth. Help students distinguish a list from its sum and a trend from its exact rule.

## Volume 5: Analysis and proof

### Editorial goal

Make the first genuinely abstract volume feel rigorous but humane. Readers
should understand why these chapters matter and where intuition still helps.

### Chapter plan

- `01-limits-continuity.qmd` "Limits and continuity"
  Replace any sense of ritual with the core idea of approach. Spend more time on what is being tracked, what is approaching what, and why direct substitution can fail.
- `02-differential-calculus.qmd` "Differential calculus"
  Present derivatives as structured ways to talk about change and sensitivity before rule lists. After each rule, restate the meaning in words.
- `03-integral-calculus.qmd` "Integral calculus"
  Keep the central story on accumulation and area built from pieces. Distinguish clearly between antiderivative technique and the meaning of the integral.
- `04-proof-reasoning.qmd` "Proof and mathematical reasoning"
  Humanize by making proof feel like a response to doubt and pattern-failure, not a ceremonial genre. Use more signposting around proof strategy and what each line is trying to establish.

## Volume 6: Probability and data

### Editorial goal

Help students read uncertainty and evidence with confidence rather than
memorising disconnected formulas.

### Chapter plan

- `01-probability-theory.qmd` "Probability theory"
  Keep the chapter anchored in uncertainty, events, and expectation in real decisions. Clarify when multiplication and addition rules apply by phrasing conditions verbally before symbolic shorthand.
- `02-distributions.qmd` "Probability distributions"
  Make distributions feel like shape summaries of repeated outcomes. Slow down the shift from single event probability to full distribution thinking.
- `03-statistical-inference.qmd` "Statistical Inference"
  Reduce jargon shock by repeatedly distinguishing sample, population, estimate, and uncertainty. Translate formal statements back into ordinary claims after each example.
- `04-data-analysis.qmd` "Data Analysis"
  Emphasise question quality, representation, and interpretation over button-pushing. Add more editorial cues around what a graph or summary can and cannot justify.

## Volume 7: Engineering mathematics

### Editorial goal

Keep advanced content demanding, but make the prose do more orientation work so
students can see the role of each method inside modelling, systems, and fields.

### Chapter plan

- `odes/01-first-order.qmd` "First-order ODEs"
  Start from evolving quantities and rate rules before formal solution classes. Explain what a differential equation is claiming about a system.
- `odes/02-second-order.qmd` "Second-order ODEs"
  Use motion, damping, and oscillation language to keep the mathematics physically legible. Clarify how solution form reflects system behaviour.
- `odes/03-systems-phase-plane.qmd` "Systems and phase plane"
  Humanize by naming the benefit of thinking in state space. Translate geometric behaviour back into ordinary system stories.
- `odes/04-laplace-transforms.qmd` "Laplace transforms"
  Treat the transform as a change of viewpoint that simplifies work, not as magic. Repeatedly answer "why move into transform space?"
- `linear-algebra/01-matrices-systems.qmd` "Matrices and linear systems"
  Keep matrices grounded in coupled equations and organised structure. Delay abstraction until the storage and transformation value is clear.
- `linear-algebra/02-eigenvalues.qmd` "Eigenvalues and eigenvectors"
  Explain eigen-behaviour as the rare directions a transformation does not turn. Use intuitive geometric narration before theorem-heavy exposition.
- `linear-algebra/03-vector-differential.qmd` "Vector differential calculus"
  Slow down the physical meaning of gradient, divergence, and curl. Add repeated "what kind of field behaviour does this measure?" prompts.
- `linear-algebra/04-vector-integral.qmd` "Vector integral calculus"
  Keep the chapter anchored in flow, circulation, and accumulation across curves and surfaces. Make theorem statements feel like unifications of familiar ideas.
- `fourier-pdes/01-fourier-series.qmd` "Fourier series"
  Humanize by framing decomposition as discovering the hidden frequencies inside a signal. Reassure readers that the goal is interpretation as much as coefficient computation.
- `fourier-pdes/02-fourier-transforms.qmd` "Fourier transforms"
  Clarify the passage from periodic decomposition to continuous frequency description. Use repeated bridge sentences to prevent the chapter feeling like a notation jump.
- `fourier-pdes/03-partial-differential-equations.qmd` "Partial differential equations"
  Explain PDEs as local balance laws spread across space and time. Prioritise model meaning before classification and solution machinery.
- `complex-analysis/01-complex-functions.qmd` "Complex functions"
  Lower abstraction by staying close to geometry in the complex plane. Help readers feel what changes when inputs and outputs are complex.
- `complex-analysis/02-complex-integration.qmd` "Complex integration"
  Emphasise paths, orientation, and why complex integration behaves differently from real integration. Add more narrative around what contour choice buys you.
- `complex-analysis/03-series-residues.qmd` "Series and residues"
  Make residues feel like concentrated local information with global payoff. Use clearer staging from local expansion to integral evaluation.
- `complex-analysis/04-conformal-mapping.qmd` "Conformal mapping"
  Humanize by stressing angle preservation and useful deformation of difficult regions. Keep applications visible so the chapter does not float free of purpose.
- `numerics/01-numerical-methods.qmd` "Numerical methods"
  Centre the chapter on approximation under limits of exact solvability. Add stronger error language: what is gained, what is lost, what is acceptable.
- `numerics/02-numerical-linear-algebra.qmd` "Numerical linear algebra"
  Explain why large systems demand algorithmic thinking, not only symbolic methods. Make stability and conditioning feel like practical trust questions.
- `numerics/03-numerical-odes-pdes.qmd` "Numerical ODEs and PDEs"
  Tie every method back to evolving approximations of real systems. Distinguish discretisation idea, update rule, and error behaviour very explicitly.
- `optimisation/01-linear-programming.qmd` "Linear programming"
  Humanize by foregrounding constrained decision-making. Keep geometry, feasibility, and tradeoff language ahead of algorithm names.
- `optimisation/02-graphs-networks.qmd` "Graphs and networks"
  Make the chapter read as mathematics of connection, flow, and route choice. Use more sentence-level interpretation of paths, weights, and bottlenecks.
- `probability/01-probability-theory.qmd` "Probability theory"
  Align tone with Volume 6 but at a more formal level. Make measure-like ideas feel like extensions of event structure, not replacements for intuition.
- `probability/02-mathematical-statistics.qmd` "Mathematical statistics"
  Clarify that the chapter studies the behaviour of estimators and tests, not just how to run them. Add interpretive summaries after derivations.

## Volume 8: Upper-year engineering mathematics

### Editorial goal

Preserve the systems-and-practice identity while making the most advanced
chapters feel navigable to students seeing these structures under real workload.

### Chapter plan

- `01-control-feedback.qmd` "Control, feedback, and stability"
  Begin from systems that overcorrect, drift, or settle. Explain stability as a behaviour question before formal criteria.
- `02-discrete-systems-signals.qmd` "Discrete-time systems and signal processing"
  Humanize by framing sampling as a practical choice with consequences. Use more "what information survives?" language when moving into transforms and filtering.
- `03-continuum-transport.qmd` "Continuum mechanics and transport"
  Keep conservation, flux, and material movement central. Make each equation answer a physical bookkeeping question.
- `04-computational-methods.qmd` "Computational methods for engineering models"
  Emphasise model-building decisions, approximations, and computational tradeoffs. Reduce tool opacity by stating what each computational step is buying.
- `05-estimation-inverse.qmd` "Estimation, inverse problems, and filtering"
  Start from noisy measurements and hidden states students can imagine. Make the chapter feel like disciplined guessing under uncertainty.
- `06-reliability-stochastic.qmd` "Reliability, stochastic systems, and quality"
  Keep the human stakes of failure, variability, and queueing visible. Translate reliability measures back into operational decisions after formulas.
- `07-nonlinear-optimisation.qmd` "Nonlinear optimisation for design and operations"
  Humanize by foregrounding design tradeoffs and non-convex difficulty. Explain local versus global reasoning in careful, non-mystifying language.

## Revision workflow

Run revisions in five passes for each chapter.

1. Access pass:
   Rewrite hook, roadmap, transitions, and recap sentences.
2. Definition and symbol pass:
   Apply the five-step method to every new definition and the symbol template to every major notation item.
3. Explanation pass:
   Add plain-language setup before definitions, theorems, and methods, and add interpretation after them.
4. Example pass:
   Revise worked examples so each includes interpretation and common-error warnings.
5. Exercise pass:
   Re-sequence questions for confidence, transfer, and cumulative understanding.

## Suggested order of work

Prioritise chapters where abstraction rises sharply or symbolic density is high.

1. Volume 5
2. Volume 7
3. Volume 8
4. Volume 2
5. Volume 4
6. Volume 6
7. Volume 3
8. Volume 1

This order targets the chapters most likely to produce avoidable cognitive and
emotional friction, while allowing early wins in the middle-school volumes
later as series conventions become clearer.

## Deliverables

For each revised chapter, produce:

- an updated opening hook and roadmap
- revised definitions and notation introductions using the shared onboarding method
- edited explanatory prose with lower symbolic jumpiness
- at least two revised worked examples with interpretation sentences
- one "common confusion" callout where appropriate
- a short closing recap tied to future chapters

## Success check

The plan is working if a student can answer yes to these questions after each
chapter:

- Do I understand what problem this chapter is trying to solve?
- Do I know what the main new idea means in words?
- Can I read the main new symbols without feeling lost?
- Do I know why the method works, not only what steps to follow?
- Do I know the mistake I am most likely to make?
- Do I feel more able to continue than when I started?

## Repository implementation notes (this codebase)

This repository now supports two series-wide accessibility conventions at
render time:

- A generated **What this chapter helps you do** section is inserted near the
  top of any chapter that has `axiom` + `rewrite` in front matter but does not
  already include that section in the body (`chapter_onramp: false` opts out).
- A generated **Symbols to keep handy** callout is inserted for chapters with
  `notation_introduced` (`notation_box: false` opts out).
