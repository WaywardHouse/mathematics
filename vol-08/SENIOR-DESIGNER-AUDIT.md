# Volume 8 — Senior-Designer Audit (Systems-Heavy Visual Volume)

This audit turns Volume 8’s intent into a concrete visual build queue.
Volume 8 is not “more advanced algebra”. It is *systems thinking*:
feedback, sampling, fields, discretisation, noisy measurement, failure, and
tradeoffs. The visuals must make those structures *felt*.

## Global Visual Direction

### House style (keep consistent)

- **Honest, engineerable visuals**: simple shapes, clear labels, no chartjunk.
- **Same structure, different domain**: reuse a visual grammar across chapters so
  the reader recognises the *pattern*, not just the topic.
- **One slider = one idea**: each control should move one conceptual knob.
- **Always show consequence**: a change must produce an immediately visible
  behavioural shift (overshoot, aliasing, instability, diffusion, queue blow-up,
  posterior tightening, constraint activation).

### Color + semantics (recommended mapping)

- `blue`: model / predicted / nominal
- `orange`: measured / observed / noisy data
- `green`: stable / feasible / acceptable
- `red`: unstable / aliased / violated constraint / unsafe regime
- `gray`: context / background / axes / scaffolding

### Interaction patterns (reusable components)

- **“Regime cards”**: small readouts that switch label + color (e.g., stable vs
  unstable; safe vs aliasing; comfortable vs near-saturation).
- **Linked panels**: same slider drives 2–3 coordinated views (signal + spectrum,
  survival + hazard, solution + error + cost).
- **Mode toggles**: swap context labels (heat vs solute vs mass) while keeping
  geometry identical.
- **Step button**: one-click “take one step” for iterative methods (gradient,
  Kalman-style update, fixed-point iteration) so the algorithm becomes legible.

## Chapter Queue (What The Visuals Must Teach)

### Ch 1 — Control, feedback, and stability

**Core behaviour to make visible**

- feedback reshapes dynamics (same plant, different loop)
- transient response is the subject (rise time, overshoot, settling)
- stability margins are “distance to trouble”, not a binary label

**Existing interactives**

- multiple OJS panels already present (block diagram / response / stability
  intuition). Keep the UI consistent with the global style above.

**Build/upgrade targets**

- Unify the look of the cards/controls across all Ch 1 interactives.
- Add an explicit red “instability” regime cue when poles cross the boundary.

### Ch 2 — Discrete-time systems and signal processing

**Core behaviour to make visible**

- sampling changes *what information exists* (aliasing is structural loss)
- filtering is smoothing-versus-delay (you always pay something)
- discrete-time stability is unit-circle geometry (not hand-wavy)

**Planned VIZ**

- Sampling + aliasing explorer (continuous wave + sampling comb + apparent wave).
- Discrete-time filter sandbox (raw vs filtered; 3-pt vs 5-pt MA; lag/error card).

**Existing interactives**

- FIR window/convolution explainer
- Sampling/aliasing interactive is already implemented in OJS
- Discrete-time stability panel

**Build/upgrade targets**

- Add a small “safe/aliasing” regime card tied to Nyquist boundary (red/green).
- Ensure the aliasing view always shows the *same samples* producing two valid
  continuous interpretations (avoid implying it’s just “wrong plotting”).

### Ch 3 — Continuum mechanics and transport

**Core behaviour to make visible**

- “control volume” is bookkeeping geometry (in/out/source/storage)
- constitutive law is “gradient → flux” (same shape across heat/diffusion/stress)
- PDEs are local statements with global consequence

**Planned VIZ**

- Control-volume balance explorer (inflow/outflow/source/storage; mode toggle:
  heat/solute/mass).
- Constitutive-law comparison board (three aligned panels with the same layout).

**Existing interactives**

- Control-volume OJS panel exists
- Additional OJS panel(s) exist for constitutive comparison

**Build/upgrade targets**

- Make “storage” a prominent meter so accumulation is visceral.
- Keep symbols secondary to arrows and labels (“in”, “out”, “source”).

### Ch 4 — Computational methods for engineering models

**Core behaviour to make visible**

- discretisation is translation (PDE → grid/control volume/basis → algebra)
- stability/accuracy trade with cost (mesh + timestep sensitivity)
- solver output is not “truth”; it is *trust* under constraints

**Planned VIZ**

- Discretisation translator (FDM/FVM/FEM toggle for the same 1D diffusion setup).
- Mesh/timestep sensitivity explorer (coarse vs fine; error + runtime cost).

**Existing interactives**

- OJS blocks exist for discretisation + sensitivity

**Build/upgrade targets**

- Add a simple “trust meter” that combines error + stability flags.
- Make cost tangible (runtime bar, iterations, or “compute budget” token).

### Ch 5 — Estimation, inverse problems, and filtering

**Core behaviour to make visible**

- filtering is compromise: model vs sensor (gain as “how much you trust”)
- inverse problems are “many worlds fit the data” (ill-posedness)
- the posterior is a narrowing belief, not a magic answer

**Planned VIZ**

- Hidden-state estimation board (true state, noisy measurements, estimate; slider
  for noise + gain).
- Observation-versus-state explorer (same pipeline, different domain labels).

**Existing interactives**

- OJS estimation board exists
- Additional OJS pipeline/diagram block exists

**Build/upgrade targets**

- Always show three lines: truth (gray/blue), measurement (orange), estimate
  (blue/green). The tension is the lesson.
- Add a “too twitchy / too sluggish” regime card based on gain/noise combo.

### Ch 6 — Reliability, stochastic systems, and quality

**Core behaviour to make visible**

- reliability is survival over time (R, F, hazard are three views of one story)
- queues “blow up” near saturation (rho close to 1 is fragile)
- quality is distribution vs tolerance (capability as operational risk)

**Planned VIZ**

- Reliability curve explorer (Weibull beta/eta; linked R/F/hazard; maintenance
  marker).
- Reliability/queue/quality comparison board (one “variability” knob drives all).

**Existing interactives**

- Weibull-linked reliability panels exist
- Queue blow-up interactive exists (rho slider; Lq curve)
- Comparison-board OJS exists (variability slider)

**Build/upgrade targets**

- Keep “near saturation” explicitly marked (red band or dashed line).
- Make the hazard panel the emotional punch: “this is wear-out” vs “infant
  mortality”.

### Ch 7 — Nonlinear optimisation for design and operations

**Core behaviour to make visible**

- gradient is local slope (direction and step size)
- constraints reshape the allowable direction (projection / KKT intuition)
- objective choice is values (tradeoff surface, not a single correct answer)

**Planned VIZ**

- Nonlinear tradeoff surface explorer (contours + feasible region; toggle
  constrained/unconstrained steps).
- Feasible-region tradeoff explorer (weights change optimum; active constraints).

**Existing interactives**

- OJS tradeoff/contour + stepper exists
- Additional OJS feasibility/tradeoff block exists

**Build/upgrade targets**

- Make “active constraint” visually pop (highlight the boundary segment).
- Add a small “local vs global” warning cue when starting point changes outcome.

## Definition of Done (Per Visual)

- The visual can be understood without reading surrounding paragraphs.
- The slider(s) produce a qualitative change that matches the chapter axiom.
- The legend uses the global color semantics consistently.
- The visual has one sentence of caption text that states the concept, not the UI.
- On mobile width, controls stack cleanly and the main signal remains visible.

