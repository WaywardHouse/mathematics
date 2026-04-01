# Senior Designer Audit — Volume 8: Upper-Year Engineering Mathematics
## Full Design Brief, All Seven Chapters

*Series palette:* blue `#2563eb` (primary), green `#059669` (secondary), red `#ef4444` (solutions/products), purple `#7c3aed` (natural exponential and special values), amber `#f59e0b` (annotations).

---

## Senior Designer Brief — Chapter 1: Control, Feedback, and Stability

### Visual register: Adequate

The chapter has two `<!-- VIZ: -->` placeholders and good exercise steppers. The core conceptual geometry — a closed loop with poles moving in the complex plane — is gestured at but only partly visualised. The state-space section, with its eigenvalue placement in 2D, has no visual at all. The chapter could meaningfully carry a third interactive without padding.

---

### Existing VIZ placeholders

| # | Location | Current description | Assessment | Action |
|---|----------|---------------------|:----------:|--------|
| 1 | After §The control problem | Closed-loop feedback explorer — unity-feedback block diagram, draggable K, simultaneous step response + pole location + settling time readouts | **Strong** | Keep as-is with one clarification (see note) |
| 2 | Exercise 4 | Feedback vocabulary sandbox — system context picker, relabelling template across five domains | **Weak** | Rewrite brief below |

**VIZ 1 clarification note:** The brief is strong, but should explicitly state that the pole position is plotted on the real axis (not a full s-plane), that its x-coordinate updates as K changes, and that the step response trace is the signal y(t) in blue `#2563eb` against reference r(t) in a lighter grey dashed line. The readouts for settling time and steady-state error should be in amber `#f59e0b`. This avoids ambiguity in implementation.

**VIZ 2 — Rewrite:**

```
<!-- VIZ: Feedback vocabulary relabeller. Show a single canonical unity-feedback block diagram
with five named signal positions: reference, error, control input, disturbance, and output.
Provide a context selector (motor speed, drone altitude, room heater, lab instrument,
server autoscaling). When the context changes, animate the label at each signal position
to the domain-specific vocabulary — e.g. "reference" becomes "target RPM" for motor,
"setpoint temperature" for heater, "target QPS" for server. The diagram structure stays
identical; only the labels change. Highlight changed labels in amber #f59e0b for one
second after the transition. The goal is to make transfer across domains explicit at the
signal level, not just in prose. Do not add domain-specific detail to the block structure
itself — the power is in seeing the same four-signal loop reappear unchanged. -->
```

---

### Missed opportunities

**[OPPORTUNITY 1]** — After §What stability means / Worked example 2 (state feedback)

*Concept geometry:* The eigenvalues of A−BK are complex conjugate with negative real part. This is a 2D phase portrait — spiral convergence. The chapter describes it only in symbols. The native geometry of a stable linear second-order system is a spiral trajectory in the (x₁, x₂) phase plane.

*Interaction:* Let the reader drag the gain vector K = (k₁, k₂) through a small 2D space. Display the resulting eigenvalues on the s-plane and the corresponding phase portrait simultaneously.

*Response:* As k₁ and k₂ change, the eigenvalues move left or right (or cross into the right half-plane for unstable gains), and the phase portrait changes between stable spiral, unstable spiral, centre, and saddle depending on location.

*Builds on:* Vol 7 ODE phase portraits. This is the same visual — but now explicitly labelled as the consequence of a feedback design choice.

```
<!-- VIZ: State-feedback phase portrait. Show two coordinated panels: left panel is the
s-plane with the eigenvalues of A-BK plotted as points, right panel is the (x1,x2) phase
plane showing the vector field and a representative trajectory starting near (1,1).
Let the reader drag k1 and k2 over the range [0,6] each. As they drag, the eigenvalues
update on the s-plane (blue #2563eb) and the trajectory updates in the phase portrait
(green #059669 for stable spiral, red #ef4444 for unstable or growing orbit).
Mark the imaginary axis on the s-plane and annotate it "stability boundary".
Annotate the phase portrait with "decays to origin" or "grows away from origin"
in amber #f59e0b based on the current sign of Re(λ).
The fixed plant matrix is A = [[0,1],[-2,-1]], B = [[0],[1]] from the worked example. -->
```

**[OPPORTUNITY 2]** — After §Worked example 1 (cruise control), before Worked example 2

*Concept geometry:* The closed-loop pole $s = -(1+K)/5$ is a linear function of K. As K increases from 0 to ∞, the pole moves left along the real axis. The steady-state error $1/(1+K)$ is simultaneously decreasing. This is a two-variable tradeoff that has a natural visual: a dual-axis chart with K on the horizontal axis, pole location on one vertical axis, and steady-state error on the other.

*Interaction:* Slider for K (0 to 20). Two traces update simultaneously.

*Response:* The pole moves left (faster response) and the error trace decays toward zero as K increases. Diminishing returns in error reduction are visible.

*Builds on:* Establishes the gain-speed-error tradeoff visual that Chapter 5 (estimation update weight) will echo directly.

```
<!-- VIZ: Proportional-gain tradeoff chart. For the cruise-control plant G(s)=1/(5s+1),
show two vertically stacked panels sharing the same horizontal K-axis (range 0 to 20).
Top panel: closed-loop pole location s = -(1+K)/5 as a function of K, plotted in
blue #2563eb. Bottom panel: steady-state error 1/(1+K) as a function of K, plotted in
red #ef4444. A vertical amber #f59e0b cursor follows a draggable K value and displays
current pole and error as readouts. Annotate the top panel: "farther left = faster
response". Annotate the bottom panel: "never reaches zero with proportional control only".
This is a static-or-low-interaction visual; no animation required, but a draggable cursor
on a shared axis is preferred. -->
```

---

### Visual threads

**[THREAD: Feedback loop as shared architecture]** — Chapters 1, 2, 5
The unity-feedback block diagram in Chapter 1 is the visual template that Chapter 2 (sampled-data control) and Chapter 5 (estimation predict-update) both reuse. Chapter 1 should establish the canonical diagram — four signal nodes, two function blocks — with consistent visual proportions and label positions so that Chapter 2 and Chapter 5 can reference and extend the same shape. The viz-artist should keep the block diagram geometry constant across all three chapters and vary only the function block labels. This is a deliberate visual argument: feedback is not specific to control engineering.

**[THREAD: Complex s-plane → phase portrait pairing]** — Chapters 1, 7
Chapter 1 first places poles in the complex plane and connects their position to time-domain behaviour. Chapter 7 will place level sets and gradient vectors on a 2D objective surface. The visual language of "position in 2D space implies dynamic behaviour" begins here and recurs. The s-plane and the design-variable plane should feel visually related — both are 2D planes with special regions, annotated boundaries, and moving points.

---

### Series-level design notes

Chapter 1 is the visual anchor for all of Vol 8. The block diagram, the s-plane, and the step response trace are the three core visual primitives the volume will reuse. The viz-artist should establish a consistent house style for each:

- Block diagrams: signals as labelled arrows with hollow arrowheads; function blocks as rounded rectangles in grey with coloured labels; summing junctions as small circles with explicit +/− signs.
- The s-plane: imaginary axis as a vertical dashed line; left half-plane shaded lightly in green `#059669` at low opacity; poles as blue filled circles `#2563eb`; annotations in amber.
- Step responses: reference in light grey dashed; output y(t) in blue `#2563eb`; error shading in red `#ef4444` at low opacity between the two.

These conventions, once established here, should be carried through every subsequent chapter that touches dynamics or feedback.

---

## Senior Designer Brief — Chapter 2: Discrete-Time Systems and Signal Processing

### Visual register: Adequate

Two `<!-- VIZ: -->` placeholders, both workable. The chapter's most powerful conceptual moment — the structural parallel between s-plane left-half-plane stability and z-plane unit-circle stability — has no visual at all. This is a serious omission: it is one of the volume's genuine "same mathematics, different geometry" moments and it needs a picture.

---

### Existing VIZ placeholders

| # | Location | Current description | Assessment | Action |
|---|----------|---------------------|:----------:|--------|
| 1 | After §The discrete-time view | Sampling and aliasing explorer — continuous sine + sampling comb + aliased reconstruction + Nyquist readout | **Strong** | Keep as-is with palette note |
| 2 | Exercise 4 | Discrete-time filter sandbox — raw vs filtered, 3-point or 5-point average, three coordinated views | **Weak** | Rewrite brief below |

**VIZ 1 palette note:** The continuous signal should be blue `#2563eb`, the sampling comb/ticks in amber `#f59e0b`, the aliased apparent waveform in red `#ef4444`. When the true frequency is below Nyquist, show continuous and reconstructed waveform in the same blue. When aliased, switch the reconstructed waveform to red to make the aliasing condition visually unmissable.

**VIZ 2 — Rewrite:**

```
<!-- VIZ: Moving-average filter comparison. Show two stacked panels sharing the same
discrete time axis (n = 0 to 60). Top panel: a synthetic noisy signal as grey points
and lines (raw x[n]) with the filtered output y[n] overlaid in blue #2563eb.
Bottom panel: sample-by-sample absolute error |x[n] - y[n]| as a red #ef4444 filled
area, plus a lag readout showing the approximate number of samples of delay.
Provide a selector for filter width: 1 (no filter), 3-point, 5-point, 7-point moving
average. As width increases, the top panel shows more smoothing and the bottom panel
shows increasing error. Add a prominent label "lag ≈ (M-1)/2 samples" that updates with
the width selector. The synthetic signal should be a sine wave plus additive impulse
noise at a few locations, so the smoothing-versus-spike-dilution effect is vivid.
The goal is to make the smoothing-versus-delay tradeoff visually unavoidable. -->
```

---

### Missed opportunities

**[OPPORTUNITY 3]** — After §Difference equations and recurrence (callout box)

*Concept geometry:* The chapter explains that continuous-time stability is about left-half-plane pole location, discrete-time stability is about poles inside the unit circle. This is a genuine geometric transformation — the stability region changes shape from a half-plane to a disk. The s-to-z mapping (z = e^{sT}) is what causes this, but the chapter does not need to derive it; it needs to show it.

*Interaction:* Static or near-static dual panel. Show the s-plane on the left with the stable region (left half-plane in green) and a few representative poles. Show the z-plane on the right with the unit circle and the corresponding mapped points. A toggle or slider for a single pole location demonstrates the correspondence.

*Response:* A pole in the left half-plane appears inside the unit circle. A pole on the imaginary axis appears on the unit circle. A pole in the right half-plane appears outside the unit circle. The structural translation becomes visual.

*Builds on:* Chapter 1's s-plane (the left half-plane stability visual). This is the most important visual thread moment in the whole chapter.

```
<!-- VIZ: s-plane to z-plane stability translation. Show two square panels side by side,
same dimensions. Left panel: the s-plane with the imaginary axis as a vertical dashed
grey line. Shade the left half-plane in light green #059669 at 15% opacity (stable region).
Right panel: the z-plane with the unit circle in grey. Shade the interior of the unit
circle in the same light green (stable region). Place a draggable blue point #2563eb
in the s-plane. Show its image under z = e^{sT_s} (with T_s = 0.1 as a fixed example)
as a corresponding blue point in the z-plane. Annotate both panels: "left half-plane =
stable" and "inside unit circle = stable". When the s-plane point is in the left
half-plane, confirm with an amber annotation "stable" in both panels. When it crosses
the imaginary axis, switch to a red annotation "marginal / unstable". This is the
single most important visual in this chapter. -->
```

**[OPPORTUNITY 4]** — After §Worked example 1 (moving-average filter)

*Concept geometry:* The moving average as a convolution. The output at each step is the inner product of a coefficient window and a sliding window of past inputs. This is the native geometry of a FIR filter and the chapter should make it visible once.

*Interaction:* Minimal — a diagram showing the sliding window over the input sequence, with the coefficient weights shown as bar heights.

*Response:* At each step n, a highlighted window slides one step to the right over the input samples, and the output is the weighted sum of the highlighted values.

*Builds on:* Establishes new thread — the sliding-window-as-inner-product motif that Kalman filtering in Chapter 5 echoes.

```
<!-- VIZ: FIR convolution window. Show an input sequence x[n] as a row of labelled bars
(height proportional to value, blue #2563eb). Show a moving window of width 3, outlined
in amber #f59e0b, that highlights the current and two previous samples. Show the
coefficient weights b_k = 1/3 as a small bar chart above the window. Show the output
y[n] computed as the weighted sum. Provide a step control (previous/next) that moves
the window one sample at a time and updates the output bar. A simple diagram, not an
animation — but it makes visible the physical meaning of "finite memory" that the text
can only describe in words. -->
```

---

### Visual threads

**[THREAD: s-plane → z-plane geometric translation]** — Chapters 1, 2
The s-plane stability picture established in Chapter 1 must be visually extended to the z-plane unit circle in Chapter 2. The two panels should use the same shading convention for the stable region (light green), the same pole marker style (filled blue circle), and the same annotation style (amber text, grey dashed boundary). A reader who remembers Chapter 1's s-plane should immediately recognise the z-plane as its structural relative.

**[THREAD: Smoothing/lag tradeoff → estimation gain tradeoff]** — Chapters 2, 5
The filter width / lag tradeoff in Chapter 2 (more smoothing = more delay) is the same qualitative tradeoff as the Kalman gain K in Chapter 5 (higher K = more trust in measurement = faster response but more noise sensitivity). The viz-artist should make the Chapter 2 filter sandbox and the Chapter 5 estimation explorer feel visually parallel — two panels, a control that adjusts a "trust" weight, and two competing consequences visible simultaneously.

---

### Series-level design notes

The aliasing explorer (VIZ 1) is genuinely strong and should be prioritised in implementation. The z-plane translation (Opportunity 3) is the most important missing visual in this chapter and in the volume as a whole — it is the moment where the volume's deepest cross-chapter visual thread (stability geometry) makes its structural move visible.

---

## Senior Designer Brief — Chapter 3: Continuum Mechanics and Transport

### Visual register: Barren

This chapter is one of the most visually demanding in the volume — the entire subject is geometric (flux vectors, gradients, control volumes, field contours) — and it has only one `<!-- VIZ: -->` placeholder plus one at the end of the exercises. The conservation-law architecture, the direction of flux, the meaning of divergence, and the structural identity of heat/diffusion/elasticity all demand visual treatment. This chapter needs at least three additional interactives.

---

### Existing VIZ placeholders

| # | Location | Current description | Assessment | Action |
|---|----------|---------------------|:----------:|--------|
| 1 | After §The local balance law | Control-volume balance explorer — small square CV with arrows, inflow/outflow, source, storage meter, domain modes | **Strong** | Expand brief (see note) |
| 2 | Exercise 4 | Constitutive-law comparison board — three panels: heat, diffusion, elasticity | **Weak** | Rewrite brief below |

**VIZ 1 expansion note:** The existing brief is directionally good but needs more visual precision. The arrows should be sized proportionally to their values. The storage meter should be a vertical bar that visibly fills or drains as the balance evolves. The domain mode selector (heat / solute / fluid mass) should change the field labels and units but keep the diagram proportions identical — this is the entire point of the visual. Add: when inflow > outflow + source, the bar fills (amber); when outflow > inflow + source, the bar drains (red). Include a small equation readout that updates: ∂u/∂t = [value], ∇·q = [value], s = [value].

**VIZ 2 — Rewrite:**

```
<!-- VIZ: Constitutive-law comparison board. Show three vertically aligned panels, one
each for heat conduction, solute diffusion, and 1D elasticity. Each panel has identical
structure: (1) a field diagram showing the field quantity varying across a horizontal bar
(temperature, concentration, displacement), coloured as a gradient from blue #2563eb at
one end to red #ef4444 at the other; (2) a gradient arrow pointing in the downhill
direction of the field; (3) a flux/stress arrow pointing in the response direction
(opposite to gradient for transport, same as gradient for displacement); (4) the
governing PDE in KaTeX. A global "field steepness" slider simultaneously changes the
gradient magnitude in all three panels, showing all three constitutive laws respond to
the same geometric driver. Keep the panel layout strictly parallel. Label the material
constant (k, D, E) in amber #f59e0b in each panel. The visual argument is that the
mathematical structure is identical across three seemingly unrelated subjects. -->
```

---

### Missed opportunities

**[OPPORTUNITY 5]** — After §Why signs and directions matter

*Concept geometry:* Fourier's law says flux points opposite to the gradient. This is not intuitive — students routinely get the sign wrong, and the chapter acknowledges that explicitly. The concept has a clear visual: a temperature field tilted to the right, a gradient arrow pointing right, a heat flux arrow pointing left, and a minus sign labelled between them.

*Interaction:* Very minimal. A slider for the gradient direction or a toggle for "temperature increases right" vs "temperature increases left" shows that the flux always opposes the gradient.

*Response:* The gradient and flux arrows change direction together (always opposite), with the minus sign in Fourier's law highlighted in red `#ef4444` to emphasise it is load-bearing.

*Builds on:* Establishes the "gradient drives transport downhill" motif that becomes the gradient descent direction in Chapter 7.

```
<!-- VIZ: Fourier/Fick sign diagram. Show a horizontal bar representing a 1D field
(temperature T or concentration c). The field value is shown as a colour gradient
(red = hot/high, blue = cold/low). Display two overlaid arrows at the midpoint: a
gradient arrow ∇T (pointing toward higher values) in amber #f59e0b, and a flux arrow q
(pointing opposite) in blue #2563eb. Label the gradient arrow "+∇T" and the flux arrow
"q = −k∇T". A toggle switches the gradient direction (field increases left vs right).
In both orientations the flux always points opposite to the gradient. Highlight the
minus sign in red #ef4444 as a persistent annotation: "the minus sign is the physics."
Keep the visual compact and static-dominant; the toggle is the only interaction needed. -->
```

**[OPPORTUNITY 6]** — After §Worked example 1 (heat conduction) / before Worked example 2

*Concept geometry:* The heat equation says $\partial T/\partial t = \alpha \nabla^2 T$. The Laplacian measures "how much the field at a point differs from its neighbourhood average." Where the field is strongly curved (concave down, hotter than surroundings), the time derivative is negative — it cools. Where the field is concave up (cooler than surroundings), the time derivative is positive — it warms. This is the smoothing action of the heat equation, and it is deeply geometric.

*Interaction:* A 1D temperature profile with a hump (initial condition). A "time step" button that evolves the profile forward and shows it flattening. Annotations show ∂²T/∂x² above the hump (negative), below the hump flanks (positive).

*Response:* The hump flattens toward a uniform temperature. The reader sees the curvature-driven smoothing as a process, not a formula.

*Builds on:* Vol 7 PDEs (heat equation was introduced there). This is a visual deepening of that prior concept in a new context.

```
<!-- VIZ: Heat-equation smoothing demo. Show a 1D temperature profile T(x,0) as a
smooth hump over x ∈ [0,1], plotted in blue #2563eb. Show ∂²T/∂x² as a second curve
in amber #f59e0b below the profile — it is negative at the hump peak and positive at
the flanks. Provide a "Step forward" button (Euler time step with Δt = 0.005 and
α = 0.1). Each click advances the profile one step, which progressively flattens the
hump. A small counter shows the time elapsed. Annotate the peak with "∂²T/∂x² < 0:
cools" and annotate a flank with "∂²T/∂x² > 0: warms". After about 10 steps the
profile should be visibly flatter. This is one of the fundamental insights about
parabolic PDEs and needs to be visible, not just stated. Fixed domain and boundary
conditions (T=0 at both ends). -->
```

**[OPPORTUNITY 7]** — After §Worked example 2 (groundwater diffusion), highlighting the isomorphism

*Concept geometry:* The heat equation for T and the diffusion equation for c are the same PDE with different symbols. The chapter says this in prose, but a dual-panel visual — same initial hump, same smoothing evolution, different field label and colour — makes the mathematical identity visceral. This is the core pedagogical point of the chapter.

*Interaction:* Play/pause button controls time evolution. Both panels evolve in exact sync.

*Response:* T and c profiles flatten identically. The reader cannot tell the physics apart from the mathematics.

*Builds on:* The heat equation visual (Opportunity 6). This opportunity only makes sense if Opportunity 6 is implemented first.

```
<!-- VIZ: Heat-diffusion isomorphism panel. Show two horizontally adjacent panels
evolving in sync. Left panel: T(x,t) in blue #2563eb with label "Temperature (heat conduction)".
Right panel: c(x,t) in green #059669 with label "Concentration (diffusion)". Same initial
hump, same diffusivity α=D=0.1, same boundary conditions. A play/pause button evolves
both simultaneously. Include the governing PDE for each panel in small type below each
plot. The panels should be pixel-identical in shape except for colour and field label.
Annotate between the two panels: "same equation — different physics". This visual
makes the chapter's central claim — that separate engineering subjects share mathematical
structure — into something the reader can see rather than be told. -->
```

---

### Visual threads

**[THREAD: Gradient direction → flux direction → gradient descent]** — Chapters 3, 7
Chapter 3 establishes that flux points opposite to the gradient (Fourier/Fick with minus sign). Chapter 7's gradient descent moves opposite to ∇f. These are the same geometric move — downhill along the gradient — applied in two different contexts. The minus sign in Fourier's law and the minus sign in ∇f descent should be visually echoed: amber annotation in Chapter 3, same amber annotation in Chapter 7.

**[THREAD: Control volume → finite-volume cell]** — Chapters 3, 4
Chapter 3's control-volume balance explorer sets up the exact visual that Chapter 4's finite-volume discretisation uses. The VIZ in Chapter 4 (discretisation translator) should visually quote the Chapter 3 control-volume diagram, with face flux labels now using the half-integer subscript notation F_{i±1/2}. A reader who saw Chapter 3's diagram should recognise it immediately in Chapter 4.

---

### Series-level design notes

This is the most visually underserved chapter in the volume. The constitutive-law comparison board (VIZ 2) and the heat-diffusion isomorphism panel (Opportunity 7) together make the volume's deepest cross-disciplinary argument visible. If only a few new visuals are implemented in the volume, two of the highest-priority choices are here. The smoothing demo (Opportunity 6) is a classic that this chapter earns the right to show — it was introduced in Vol 7 but gets its physical grounding here.

---

## Senior Designer Brief — Chapter 4: Computational Methods for Engineering Models

### Visual register: Adequate

Two `<!-- VIZ: -->` placeholders, one strong and one acceptable. The chapter's deepest visual opportunity — showing that all three discretisation families (FD, FV, FEM) produce stencils that are geometric operations, not just algebraic substitutions — is only partially addressed. The stability bound as a visual phase diagram (stable/unstable region in Δt−Δx space) is missing.

---

### Existing VIZ placeholders

| # | Location | Current description | Assessment | Action |
|---|----------|---------------------|:----------:|--------|
| 1 | After §From equation to algebraic system | Discretisation translator — PDE / grid / algebra triptych, toggle between FD, FV, FEM | **Strong** | Refine brief (see note) |
| 2 | Exercise 4 | Mesh and timestep sensitivity explorer — coarse vs fine grid, toggle resolution, error estimate, runtime cost | **Weak** | Rewrite brief below |

**VIZ 1 refinement note:** The existing brief is conceptually right but needs visual specificity. The three panels should be:
- Left: the PDE written in KaTeX, with the specific term being approximated highlighted in amber.
- Centre: a diagram of the spatial grid or mesh — for FD, a regular grid with the stencil points highlighted (a 3-point stencil: i−1, i, i+1); for FV, a cell with arrows at the half-integer faces F_{i±1/2}; for FEM, two triangular elements with shared nodes and basis function $\phi_i$ shown as a tent function.
- Right: the resulting algebraic equation, with each term colour-coded to match the element it came from in the centre panel.
Transitions between the three modes should be animated (0.3 s fade) so the reader sees the same PDE term being approximated in three structurally different ways.

**VIZ 2 — Rewrite:**

```
<!-- VIZ: Stability region diagram with numerical profile comparison. Show two panels.
Left panel: a 2D plot with Δx on the horizontal axis and Δt on the vertical axis. Draw
the curve r = DΔt/(Δx)² = 0.5 as the stability boundary, shading the region below it in
green #059669 (stable) and above it in red #ef4444 (unstable). A draggable point shows
the current (Δx, Δt) choice and whether it falls in the stable or unstable region.
Right panel: the resulting numerical T(x) profile after 10 time steps for the current
parameter choice. In the stable region, the profile shows smooth diffusion. In the
unstable region, the profile shows oscillation or blowup (clipped to a reasonable
y-axis range with a "diverging" annotation in red). A simple cost readout shows the
number of grid points and time steps required. This makes the stability constraint
concrete — it is not an abstract inequality but a constraint on what you can actually
compute. Palette: stable region in green #059669, unstable in red #ef4444, stability
curve in amber #f59e0b, profile in blue #2563eb. -->
```

---

### Missed opportunities

**[OPPORTUNITY 8]** — After §Three dominant viewpoints

*Concept geometry:* The three discretisation families differ in what geometric object they use to sample the field. FD uses points and differences. FV uses cells and face fluxes. FEM uses elements and basis function integrals. A side-by-side stencil diagram — same grid, three different "windows" drawn on it — makes this immediately visual without requiring the algebra to be present.

*Interaction:* A domain selector (1D, 2D structured, 2D unstructured) and a method toggle.

*Response:* For 1D, show the three stencil types as overlaid diagrams on the same 1D grid. For 2D structured, show the FD cross-stencil (five points), FV control cell (four faces), and FEM triangular element with shared nodes. For 2D unstructured, FD becomes awkward and this should be visible.

*Builds on:* Chapter 3's control-volume diagram. The FV cell in Chapter 4 should be visually quoting Chapter 3's CV.

```
<!-- VIZ: Discretisation stencil gallery. Show three panels labelled "Finite Difference",
"Finite Volume", "Finite Element". All three operate on the same underlying 1D or 2D
grid (toggled by a domain selector: 1D / 2D structured / 2D triangulated). For 1D:
FD panel shows three equally spaced grid points with the i-1, i, i+1 stencil highlighted
in blue #2563eb; FV panel shows a cell of width Δx with left face F_{i-1/2} and right
face F_{i+1/2} marked in amber #f59e0b; FEM panel shows two elements with a tent basis
function φ_i peaked at node i in green #059669. For each panel, show the resulting
approximation of d²u/dx² in small KaTeX below the diagram. Keep the diagrams visually
parallel — same grid lines, same spatial extent, different highlighted geometry. This
is primarily a reference visual; interaction is secondary to clarity. -->
```

**[OPPORTUNITY 9]** — After §Worked example 2 (finite-volume mass balance)

*Concept geometry:* The finite-volume update — "what leaves cell i enters cell i+1" — is a discrete conservation statement. A visual showing adjacent cells with the shared face and the flux arrow crossing it in one direction makes conservation concrete. This is distinct from the general CV diagram in Chapter 3; it should show the algebraic antisymmetry explicitly: the term that appears as outflow for cell i appears as inflow for cell i+1 with equal magnitude.

*Interaction:* Minimal — two adjacent cells, one shared face, a flux value readout.

*Response:* Drag a flux slider and see both cells update their balance simultaneously, with the mass exiting one cell entering the other exactly.

*Builds on:* Chapter 3's control-volume diagram.

```
<!-- VIZ: Finite-volume conservation pair. Show two horizontally adjacent cells i and i+1,
separated by a shared face. Label the left face of cell i as F_{i-1/2} and the right face
(shared with cell i+1) as F_{i+1/2}. Show flux arrows at each face; the shared face arrow
is labelled "outflow from i = inflow to i+1". Provide sliders for F_{i-1/2}, F_{i+1/2},
and a common source term. Show the balance equation update for both cells simultaneously,
with the shared flux contribution highlighted in amber #f59e0b in both equations. When
the slider for F_{i+1/2} changes, both cells' balances update. The goal is to make
conservation — what exits one cell enters the next — visually undeniable. -->
```

---

### Visual threads

**[THREAD: Stability as a region in parameter space]** — Chapters 4, 7
Chapter 4's stability region (the r ≤ 1/2 constraint in Δt–Δx space) is a constraint boundary in a 2D parameter space. Chapter 7's feasible region in optimisation is structurally the same thing — a region in design-variable space bounded by a constraint curve. The visual style should echo: stable/feasible in green, unstable/infeasible in red, the boundary in amber.

**[THREAD: Mesh sensitivity → sensitivity analysis]** — Chapter 4, Chapter 7
The mesh-sensitivity check ("halve Δx and see if the answer changes substantially") is a special case of sensitivity analysis. Chapter 7's tradeoff explorer shows how an optimum shifts with parameters. The visual habit of "vary one control and watch the output change" is shared. The viz-artist should use similar panel layouts for both.

---

### Series-level design notes

Chapter 4 contains Vol 8's most technically demanding visualisations. The discretisation translator (VIZ 1) is the centrepiece and should be implemented carefully. The stability diagram (revised VIZ 2) makes the CFL-type constraint tangible rather than formulaic — it is worth the implementation effort. This chapter directly feeds Chapter 7 (the computed model that optimisation acts on); keeping the visual language of parameter spaces and feasible/infeasible regions consistent across the two chapters will pay dividends.

---

## Senior Designer Brief — Chapter 5: Estimation, Inverse Problems, and Filtering

### Visual register: Adequate

Two `<!-- VIZ: -->` placeholders. The scalar update rule is introduced early but its visual geometry — the estimate moving along a number line between prior and measurement in proportion to K — has no visual. The predict-update cycle of the Kalman filter is described at the end but not shown. The observation-operator geometry (state in a high-dimensional space, measurement in a lower-dimensional space, the projection that connects them) is entirely absent.

---

### Existing VIZ placeholders

| # | Location | Current description | Assessment | Action |
|---|----------|---------------------|:----------:|--------|
| 1 | After §Forward and inverse viewpoints | Hidden-state estimation board — latent state, noisy measurement stream, updated estimate, K slider | **Strong** | Extend brief (see note) |
| 2 | Exercise 4 | Observation-versus-state explorer — three contexts, abstract pipeline diagram, same structure different labels | **Weak** | Rewrite brief below |

**VIZ 1 extension note:** The existing brief is strong but misses one key visual: the estimate should be shown not just as a time trace but as a running number-line snapshot at each step. The innovation (y − x̂⁻) should be explicitly marked as an arrow pointing from prior estimate to measurement; K controls what fraction of that arrow is taken. Add: colour-code the estimate trace by confidence — lighter blue when K is low (following the model), more saturated blue when K is high (following the measurements). This makes K's role as a trust weight immediately intuitive.

**VIZ 2 — Rewrite:**

```
<!-- VIZ: Abstract estimation pipeline. Show a single diagram with three columns:
"Hidden state x", "Observation operator H", "Measured output y". The hidden state column
shows a simple system icon (process, vehicle, satellite) depending on context. The
observation operator column shows H as a labelled box with arrows: "x →[H]→ Hx". The
measured output column shows a noisy measurement y = Hx + ε with a small noise
annotation. Below the pipeline, show the update equation: x̂⁺ = x̂⁻ + K(y − Hx̂⁻),
with each term colour-coded: prior estimate in blue #2563eb, innovation in amber #f59e0b,
gain K in green #059669. A context selector changes the icons and labels (motor current →
bearing wear; GPS/IMU signals → vehicle position; reflectance → soil moisture) without
changing the pipeline geometry. The goal is to make the abstract structure explicit
across contexts so the mathematical unity is visible. Keep the diagram at a fixed layout
so the reader sees the same pipeline in every context. -->
```

---

### Missed opportunities

**[OPPORTUNITY 10]** — After §The simplest update logic (scalar update equation)

*Concept geometry:* The scalar update $\hat{x}^+ = \hat{x}^- + K(y - \hat{x}^-)$ is a weighted interpolation. Geometrically, the estimate sits on a number line between the prior $\hat{x}^-$ and the measurement $y$, at fractional distance K from the prior. This is the single most important geometric fact in this chapter. A static diagram shows it in one glance.

*Interaction:* Two sliders — one for K (0 to 1), one for the measurement y (over a range). The estimate marker moves along the number line.

*Response:* K = 0 means the estimate does not move from the prior. K = 1 means the estimate jumps all the way to the measurement. Intermediate K means the estimate lands at a fraction between them.

*Builds on:* The Chapter 2 filter-lag tradeoff. High K is like a narrow filter (responsive but noisy); low K is like a wide filter (smooth but slow).

```
<!-- VIZ: Estimation number line. Show a horizontal number line (range: 10 to 30).
Mark three points: prior estimate x̂⁻ (blue filled circle #2563eb, fixed at 18),
measurement y (green filled circle #059669, draggable on the line), and updated
estimate x̂⁺ (amber filled circle #f59e0b, computed dynamically). A slider K ∈ [0,1]
controls the update weight. Label x̂⁺ with its current numeric value and show the
innovation as a labelled double-headed arrow from x̂⁻ to y in grey. Show x̂⁺ = x̂⁻ + K(y−x̂⁻)
in KaTeX below the line with current numeric substitution. As K approaches 0, x̂⁺
approaches x̂⁻ (prior trust). As K approaches 1, x̂⁺ approaches y (sensor trust).
The reader should be able to see K as a "how much to trust the sensor" lever. -->
```

**[OPPORTUNITY 11]** — After §The Kalman filter as the canonical example

*Concept geometry:* The predict-update cycle. The state estimate and its uncertainty band grow during the predict step (the model is uncertain about the future) and shrink during the update step (the measurement corrects the prediction). This breath — expand in time, contract at measurement — is the deepest visual in the Kalman filter and it has no image in this chapter.

*Interaction:* A "Run one cycle" button. Each click shows: (1) predict step — the uncertainty band expands in time; (2) update step — a measurement marker appears and the band contracts toward it.

*Response:* The reader sees the alternating expand-contract rhythm of filtering. After several cycles, they should be able to predict which step contracts and which expands.

*Builds on:* VIZ 1 (the time-trace estimation board). This visual zooms in on one cycle of the predict-update mechanics.

```
<!-- VIZ: Predict-update cycle. Show a time axis with the current time marked. Display
the state estimate as a point with a vertical uncertainty bar (±2σ). Two labelled buttons:
"Predict" and "Update". Clicking "Predict" advances one time step: the uncertainty bar
grows (model propagation increases uncertainty), and the estimate drifts slightly.
Clicking "Update" applies a measurement: a green circle #059669 appears at the
measurement value, the uncertainty bar contracts toward it, and the estimate moves
toward the measurement weighted by the (implicit) Kalman gain. Annotate the predict step:
"uncertainty grows — model evolves". Annotate the update step: "measurement corrects —
uncertainty shrinks". Palette: uncertainty band in blue #2563eb at 30% opacity, estimate
in blue #2563eb filled, measurement in green #059669, innovation arrow in amber #f59e0b.
This makes the filter's rhythm tangible before any covariance algebra is introduced. -->
```

---

### Visual threads

**[THREAD: Estimation gain K ↔ filter width ↔ feedback gain K]** — Chapters 1, 2, 5
All three chapters have a "how much to trust the new input" weight: feedback gain K in Chapter 1, filter width in Chapter 2, Kalman gain K in Chapter 5. The visual convention — a slider that controls a trust weight, with two competing consequences visible simultaneously — should be the same in all three. This is one of the volume's deepest conceptual threads and it deserves visual reinforcement.

**[THREAD: Posterior update visual → reliability posterior]** — Chapters 5, 6
Chapter 5's predict-update cycle (uncertainty band grows then shrinks) is conceptually related to Chapter 6's uncertainty over lifetime. The visual motif of an uncertainty band with a "measurement contracts it" moment should be echoed in Chapter 6's reliability curve, where new failure data updates the estimate of the hazard function. The band-updating idiom should feel familiar by Chapter 6 because it was introduced here.

---

### Series-level design notes

Chapter 5 is the pivot chapter of Vol 8 — it sits between control/signals (Chapters 1–2) and reliability/optimisation (Chapters 6–7), and its estimation logic underlies both sides. The number-line interpolation visual (Opportunity 10) is the most time-efficient visual investment in this chapter: it is compact, self-contained, and makes the entire chapter's central mechanism legible without requiring the reader to track time series.

---

## Senior Designer Brief — Chapter 6: Reliability, Stochastic Systems, and Quality

### Visual register: Adequate

One strong `<!-- VIZ: -->` placeholder at the reliability section, and one good exercise-level visual. The queueing section and the quality section both lack dedicated visuals. The chapter's deepest conceptual connection — that reliability, queueing, and quality are all asking the same question about operational consequence of variability — is asserted in prose but needs a joint visual to become convincing.

---

### Existing VIZ placeholders

| # | Location | Current description | Assessment | Action |
|---|----------|---------------------|:----------:|--------|
| 1 | After §Reliability as survival over time | Reliability curve explorer — R(t), F(t), hazard, with maintenance-interval marker, three hazard regimes | **Strong** | Minor palette note |
| 2 | Exercise 4 | Reliability/queue/quality comparison board — three panels, one variability control, all three update | **Strong** | Minor extension note |

**VIZ 1 palette note:** The survival function R(t) should be plotted in blue `#2563eb`, the failure distribution F(t) in red `#ef4444`, and the hazard function in amber `#f59e0b`. The maintenance interval marker should be a vertical green dashed line `#059669` with a draggable handle. When the reader moves the maintenance marker, a probability readout shows R(t_maintenance) and F(t_maintenance) at the current interval.

**VIZ 2 extension note:** The existing brief is strong. Extend it: the shared variability control should be framed explicitly as a coefficient of variation (CV = σ/μ) from 0.1 (low variability) to 1.0 (high variability). For the survival panel, higher CV means the tail of the failure distribution is heavier (some components fail much earlier). For the queue panel, higher CV means the queue trace has more bursting. For the quality panel, higher CV means the normal distribution is wider and more area falls outside the specification limits. Annotate the transition from low to high variability in each panel with a brief consequence label.

---

### Missed opportunities

**[OPPORTUNITY 12]** — After §Queueing as accumulation under uncertainty

*Concept geometry:* The queue buildup phenomenon near saturation (ρ → 1). Little's Law says L_q = λ_a W_q, but the vivid geometric fact is that queue length grows steeply and nonlinearly as ρ increases. A plot of L_q against ρ for the M/M/1 queue (which has the formula L_q = ρ²/(1−ρ) explicitly) makes this visible. The asymptote at ρ = 1 is the visual — it is a genuine singularity, and it should look singular.

*Interaction:* A slider for ρ (0.1 to 0.99). Plot of L_q vs ρ with the current value marked.

*Response:* At low ρ the queue is nearly empty. Above ρ ≈ 0.8, the queue grows visibly. As ρ approaches 0.99, the queue length explodes toward the right edge of the chart. The x-axis asymptote at ρ = 1 should be a vertical red dashed line.

*Builds on:* Chapter 7's tradeoff surface — the queue singularity at ρ = 1 is a prototype of a feasibility constraint in optimisation.

```
<!-- VIZ: Queue length vs traffic intensity. Show a single plot of expected queue length
L_q = ρ²/(1−ρ) against traffic intensity ρ ∈ [0, 0.99], plotted in blue #2563eb.
A vertical dashed red line #ef4444 at ρ = 1 marks the instability boundary with label
"saturation — queue diverges". A vertical amber #f59e0b draggable cursor marks the
current ρ value and displays L_q as a readout. At ρ = 0.5, annotate: "low load —
short queue". At ρ = 0.9, annotate: "near saturation — long queue even if mean
looks safe". Include a small shaded region ρ > 0.95 in light red as "dangerous loading".
Keep the x-axis at ρ ∈ [0, 1] with ρ=1 visible but unreachable. The steep ascent into
the asymptote is the visual argument — do not clip it prematurely. -->
```

**[OPPORTUNITY 13]** — After §Quality as probability of staying in tolerance

*Concept geometry:* The quality problem is about tail probability in a normal distribution. The visual is a normal curve with specification limits as vertical bars, and the tails outside the limits shaded in red. Moving the mean (process centering) or widening/narrowing the standard deviation shows how defect probability changes. This is an extremely important practical visual — the six sigma concept is literally about seeing how narrow a distribution must be to put six standard deviations inside the tolerance.

*Interaction:* Sliders for μ (process mean) and σ (process standard deviation), fixed specification limits.

*Response:* The normal curve shifts or changes width. The shaded tail area updates with a numeric defect probability readout.

*Builds on:* Vol 6 probability distributions (the series has established the normal distribution shape before). Chapter 5's uncertainty band.

```
<!-- VIZ: Process quality explorer. Show a normal distribution curve with mean μ
(slider: 9.5 to 10.5) and standard deviation σ (slider: 0.05 to 0.3) overlaid on a
fixed specification window (LSL = 9.6, USL = 10.4) marked by vertical green dashed
lines #059669. Shade the tails outside the specification limits in red #ef4444.
Display a defect probability readout as a percentage (area outside the specification
limits), computed from the standard normal CDF. Annotate the area inside the limits
in blue #2563eb. As σ decreases, the tails shrink visibly. As μ shifts off-centre,
one tail grows and the other shrinks. Include an annotation: "defect probability is
the tail area — it responds sharply to σ". The visual should make it clear why small
improvements in σ produce large improvements in quality near the specification limits. -->
```

---

### Visual threads

**[THREAD: Reliability curve → posterior update]** — Chapters 5, 6
The reliability function R(t) is a model of lifetime uncertainty. As failure data accumulates, the estimated R(t) should shift. This connection — reliability as a prior that data updates — is made explicitly in the text but has no visual. A brief "before/after failure-data" comparison in the reliability explorer would make Chapter 5's estimation ideas directly applicable here.

**[THREAD: Queue near saturation → constraint boundary in optimisation]** — Chapters 6, 7
The ρ → 1 singularity in the queue (Opportunity 12) is geometrically the same as an active constraint boundary in Chapter 7. The visual convention — red shading for infeasible/overloaded region, green for safe, amber cursor at the current operating point — should be carried directly from Chapter 6 into Chapter 7's feasibility region diagram.

---

### Series-level design notes

Chapter 6 is the most accessible chapter in Vol 8 for non-engineering readers, and its visuals should reflect that. The reliability curve (VIZ 1) and the quality explorer (Opportunity 13) are both strong standalone illustrations. The three-panel comparison board (VIZ 2) is the chapter's conceptual climax — make sure it is implemented in a way that lets the reader vary variability and see all three operational consequences change simultaneously. The single-control three-outcome visual is one of the most powerful design patterns in the volume.

---

## Senior Designer Brief — Chapter 7: Nonlinear Optimisation for Design and Operations

### Visual register: Adequate

Two `<!-- VIZ: -->` placeholders. The chapter is geometry-heavy (contour maps, level sets, gradient vectors, constraint curves, Lagrange multiplier alignment) and both existing placeholders address this. What is missing is the visual treatment of the Lagrange multiplier alignment condition — the geometric reason the method works — and the multi-objective tradeoff surface (Pareto frontier), which is the chapter's most engineering-relevant concept.

---

### Existing VIZ placeholders

| # | Location | Current description | Assessment | Action |
|---|----------|---------------------|:----------:|--------|
| 1 | After §From linear to nonlinear thinking | Nonlinear tradeoff surface explorer — 2D contour map, feasible region overlay, draggable point, gradient vector, constrained vs unconstrained toggle | **Strong** | Refine brief (see note) |
| 2 | Exercise 4 | Feasible-region and tradeoff explorer — nonlinear objective, curved constraints, weight sliders, optimum moves along feasible set | **Weak** | Rewrite brief below |

**VIZ 1 refinement note:** The existing brief is strong. Add: when the "constrained" mode is active, show the gradient of the constraint function as a separate arrow (in red `#ef4444`) alongside the gradient of the objective (in blue `#2563eb`). When the current point is at the constrained optimum, the two arrows should be visually parallel (or anti-parallel), making the Lagrange condition $\nabla f = \lambda \nabla g$ visible without stating it. Annotate this condition: "at the optimum: these vectors align". This turns the Lagrange condition from an algebraic trick into geometric fact.

**VIZ 2 — Rewrite:**

```
<!-- VIZ: Two-objective tradeoff explorer. Show a 2D design space (x, y) with two
objectives plotted simultaneously: f₁(x,y) as blue #2563eb level sets (performance)
and f₂(x,y) as red #ef4444 level sets (cost or risk). A weight slider w ∈ [0,1]
controls a combined objective J = w·f₁ + (1-w)·f₂ shown as black dashed level sets.
A constraint boundary g(x,y) = 0 separates feasible (light green #059669 shading) from
infeasible (light red) regions. A yellow #f59e0b point marks the constrained minimum of
the current J. As the weight slider changes, the minimum moves along the feasible
boundary — tracing a Pareto frontier. Annotate the trajectory as "tradeoff path". At
w=0 the solution minimises cost only; at w=1 it minimises performance only; at
intermediate w it balances. This makes the Pareto frontier concrete: it is the curve
of optima traced as priorities shift. -->
```

---

### Missed opportunities

**[OPPORTUNITY 14]** — After §Constrained optimisation and the Lagrangian idea (Worked example 2)

*Concept geometry:* The Lagrange condition says that at the constrained optimum, the level set of the objective is tangent to the constraint surface. Equivalently, ∇f and ∇h point in the same direction. This is a visual fact of 2D geometry — two curves touching tangentially at a point — and it deserves its own dedicated illustration separate from the full contour map.

*Interaction:* Minimal. A draggable point along the constraint line x+y=1 showing the objective level set passing through that point, and arrows showing ∇f and ∇h at each position.

*Response:* Away from the optimum, the objective level set crosses the constraint — you can do better by moving along the constraint. At the optimum, the level set is tangent to the constraint and ∇f aligns with ∇h.

*Builds on:* VIZ 1 (the full tradeoff surface). This is a pedagogical zoom-in on the most important geometric fact in the chapter.

```
<!-- VIZ: Lagrange tangency diagram. Show a 2D plot with the constraint line x+y=1 in
grey and a set of concentric ellipses representing level sets of f(x,y) = x²+y²
(centred at origin). A draggable point P sits on the constraint line. At each position
of P, display two arrows: ∇f(P) in blue #2563eb, ∇h(P) in red #ef4444 (for h = x+y−1,
∇h = (1,1) and is constant). Also show the objective level set passing through P as a
blue dashed ellipse. When P is away from (0.5, 0.5), the level-set ellipse crosses
the constraint line at a visible angle — labelled "can still improve". When P is at
(0.5, 0.5), the ellipse is tangent to the constraint line and ∇f aligns with ∇h —
labelled "constrained optimum: gradients align". Annotate: "Lagrange condition: ∇f = λ∇h
means no feasible direction improves the objective". -->
```

**[OPPORTUNITY 15]** — After §Tradeoffs are the real subject

*Concept geometry:* Gradient descent trajectories on a contoured surface. The chapter introduces the gradient descent update rule but never shows what the path looks like. On a bowl-shaped surface it spirals in. On an elongated bowl (high condition number) it zigzags. This is the visual that makes "the step size can be too large or too small" and "the descent direction is only locally good" tangible.

*Interaction:* A contour map with adjustable initial point. A "step" button that advances one gradient descent iteration. Display the path as a growing sequence of connected dots.

*Response:* On a well-conditioned surface, the path descends smoothly. On an ill-conditioned (elongated) surface, it zigzags along the valley. The reader can see why slow convergence is a geometric fact, not just an algorithm deficiency.

*Builds on:* Chapter 3's gradient direction visual (Opportunity 5). Chapter 4's stability concept (bad parameter choices lead to divergence rather than convergence).

```
<!-- VIZ: Gradient descent path. Show a 2D contour plot of f(x,y) = x² + c·y² where c
is a "condition number" slider (c ∈ [1, 20]). The contours range from circular (c=1) to
narrow elongated ellipses (c=20). A step-size slider α ∈ [0.01, 0.5]. An initial point
(draggable) and a "Step" button that applies x_{k+1} = x_k - α∇f(x_k). The path is
drawn as connected blue #2563eb dots. For well-conditioned surfaces (c=1, moderate α),
the path spirals smoothly to the origin. For ill-conditioned surfaces (c=20), the path
zigzags across the elongated valley. For too-large α, the path diverges. Annotate
modes: "smooth descent", "zigzag convergence", "diverges". Include a step counter
and current f value readout. This visual explains slow convergence and why second-order
methods (that account for curvature) outperform pure gradient descent. -->
```

---

### Visual threads

**[THREAD: Gradient direction ← Chapter 3 to Chapter 7]** — Full circle
Chapter 3 (Fourier/Fick): flux points opposite to the gradient. Chapter 7 (gradient descent): the update moves opposite to ∇f. Both use the minus sign in front of the gradient as a directional statement. The viz-artist should explicitly echo Chapter 3's gradient arrow diagram in Chapter 7's descent direction annotation — the same arrow convention, the same "downhill" language.

**[THREAD: Feasible region ← Chapter 4 stability region]** — Chapters 4, 7
Chapter 4's stability diagram (green stable region, red unstable region, amber boundary curve) should be directly echoed in Chapter 7's feasible region (green feasible, red infeasible, boundary in grey). The colour convention for "this is where you can safely operate" is established in Chapter 4 and should persist to Chapter 7.

**[THREAD: Optimum shifting under parameter change ← Chapter 1 pole placement]** — Chapters 1, 7
In Chapter 1, changing the gain K moves the closed-loop pole. In Chapter 7, changing the weight w moves the constrained optimum along the Pareto frontier. Both are visualisations of "a single parameter changes where the solution lives in a 2D space." The visual idiom — a cursor or marker tracing a path as a slider moves — should be consistent across both chapters.

---

### Series-level design notes

Chapter 7 is the volume's terminal chapter and its visuals should feel like a synthesis. The tradeoff surface (VIZ 1), the tangency diagram (Opportunity 14), and the gradient descent path (Opportunity 15) together give the reader three handles on nonlinear optimisation: the landscape they are navigating, the geometric reason the Lagrange method works, and the algorithmic path through the landscape. All three should be implemented if possible.

The Pareto frontier tracing (revised VIZ 2) is the chapter's most practically meaningful visual — it is the design-tradeoff idea in concrete form. The viz-artist should ensure the path traced by the optimum as the weight slider moves is clearly visible as a connected curve, not just a jumping dot.

---

## Cross-Chapter Visual Threads: Summary

The following threads should be tracked at the volume level and coordinated across implementations.

### Thread A: Feedback loop as shared architecture (Chapters 1, 2, 5)
The unity-feedback block diagram from Chapter 1 recurs — with different labels — in Chapter 2 (sampled-data controller) and Chapter 5 (predict-update filter). Establish the canonical layout in Chapter 1 and reference it explicitly in the other two. Visual consistency makes the structural argument that feedback is a general mathematical architecture, not an electrical engineering artefact.

### Thread B: Stability region geometry (Chapters 1, 2, 4, 7)
- Chapter 1: left half-plane (s-plane)
- Chapter 2: inside unit circle (z-plane)
- Chapter 4: r ≤ 1/2 constraint in Δt–Δx space
- Chapter 7: feasible region in design-variable space
All four use the same visual language: green for safe, red for dangerous, amber dashed for the boundary. The reader should be able to identify "this is a region of valid operation" on sight by Chapter 7.

### Thread C: Trust-weight slider (Chapters 1, 2, 5)
- Chapter 1: proportional gain K shifts the pole (faster but noisier)
- Chapter 2: filter width controls smoothing vs lag
- Chapter 5: Kalman gain K controls trust in measurement vs model
All three should use a single horizontal slider controlling a "responsiveness" parameter, with two coordinated output panels showing the competing consequences. The structural similarity of the three sliders is one of the volume's deepest pedagogical points.

### Thread D: Gradient direction = flux direction (Chapters 3, 7)
Fourier's law (flux = −k∇T) and gradient descent (x ← x − α∇f) share the same directional geometry: move against the gradient. Chapter 3's sign-diagram visual (Opportunity 5) should use the same arrow conventions as Chapter 7's gradient vectors. The minus sign is the shared insight.

### Thread E: Uncertainty bands and posterior contraction (Chapters 5, 6)
Chapter 5's predict-update cycle shows uncertainty expanding (predict step) and contracting (update step). Chapter 6's reliability function shows how a lifetime distribution narrows as failure data accumulates. Both are visual representations of Bayesian updating — prior uncertainty, new information, contracted posterior. The band-narrowing visual idiom should be consistent.

### Thread F: Singularity / constraint boundary (Chapters 4, 6, 7)
- Chapter 4: stability bound r = 1/2 (cross it and the simulation blows up)
- Chapter 6: queue singularity at ρ = 1 (cross it and the queue diverges)
- Chapter 7: constraint boundary g(x) = 0 (cross it and the solution is infeasible)
All three are instances of the same mathematical theme: there is a boundary beyond which the system breaks. The visual treatment — a red shaded region beyond the boundary, an asymptote or sharp uptick approaching it — should be consistent across all three chapters.

---

## Series-Level Design Notes: Vol 8 ↔ Vol 7

### Visual inheritance from Vol 7

Vol 7 established the following visuals that Vol 8 inherits and should visually quote:

1. **Phase portraits** (Vol 7 ODEs → Vol 8 Ch 1 state feedback). The spiral, saddle, centre, and node phase portrait types from Vol 7 ODE numerical methods should be visually quoted in Chapter 1's state-feedback phase portrait (Opportunity 1). A reader who remembers the Vol 7 phase portrait should feel the Ch 1 interactive as an extension, not a new concept.

2. **The s-plane** (Vol 7 Laplace → Vol 8 Ch 1 poles, Ch 2 z-plane). Vol 7 introduced the complex s-plane in the context of Laplace transforms. Vol 8 Ch 1 places poles there and associates their location with stability. Vol 8 Ch 2 maps the s-plane to the z-plane. The s-plane should look the same in all three contexts — same axis labels, same imaginary-axis dashed line, same half-plane shading convention.

3. **The heat equation smoothing visual** (Vol 7 PDEs → Vol 8 Ch 3). Vol 7 introduced the heat equation as a PDE example. Ch 3 rederives it from conservation and constitutive laws. The smoothing demo (Opportunity 6) in Ch 3 should feel like a deeper return to the same visual — same hump initial condition, same smoothing action — but now with the derivation behind it.

4. **Numerical convergence** (Vol 7 numerics → Vol 8 Ch 4). Vol 7's numerical methods chapter showed how numerical solutions improve as step sizes shrink. Ch 4's mesh-sensitivity explorer is the field-equation version of the same concept. The two-panel "coarse vs fine" visual comparison convention should feel continuous across volumes.

5. **Probability landscapes** (Vol 6–7 → Vol 8 Ch 6). The normal distribution with shaded tails, established in Vol 6, appears in Ch 6's quality explorer. The visual should feel like a direct re-use of the Vol 6 convention: same axis style, same tail shading in red. A reader who worked through Vol 6 should recognise the picture.

### Visual mandate for Vol 8 specifically

Vol 8's design brief calls for the volume to feel "visibly more systems-oriented than Vol 7." The seven interactives that most directly serve this mandate, in priority order, are:

1. **Ch 1 VIZ 1** — Closed-loop feedback explorer. The block diagram + step response + pole position triple is the volume's visual signature.
2. **Ch 2 Opportunity 3** — s-plane to z-plane translation. The most important geometric insight in the chapter.
3. **Ch 3 Opportunity 7** — Heat-diffusion isomorphism panel. The volume's central cross-domain argument made visual.
4. **Ch 5 Opportunity 11** — Predict-update cycle. The Kalman rhythm in one interactive.
5. **Ch 6 VIZ 2** — Reliability/queue/quality comparison board. The volume's stochastic synthesis.
6. **Ch 7 VIZ 1** — Nonlinear tradeoff surface. The volume's geometric conclusion.
7. **Ch 4 VIZ 2 (revised)** — Stability region diagram. The CFL constraint made tangible.

The visual point that Vol 8 should make repeatedly — stated in the design brief as "upper-year mathematics is not more abstract because it is farther from reality; it is more abstract because reality has become more coupled" — is most visible in the cross-domain comparison panels (Ch 3 Opportunity 7, Ch 6 VIZ 2). These two visuals show the same mathematics describing genuinely different physical systems. They are the volume's visual thesis.
