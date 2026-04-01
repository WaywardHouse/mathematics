# Senior Designer Brief — Volume 3, All Chapters

**Layer:** pre-university (Alberta Gr 9–10). Readers are 14–16, transitioning from arithmetic to algebraic and geometric reasoning.

**Audit scope:** Four chapters — geometry/measurement, trigonometry, polynomials/factoring, functions/relations.

---

## Preliminary note on VIZ placeholder status

None of the four chapters contain `<!-- VIZ: -->` placeholder comments. All interactives are already implemented as inline OJS code blocks. This audit therefore:

1. Assesses the quality and completeness of the existing interactives against the concept geometry they are meant to carry.
2. Identifies missed opportunities — moments where a visual treatment would change the quality of understanding, not just add decoration.
3. Documents cross-chapter and cross-volume visual threads, with particular attention to the unit circle / phasor thread that must be established here for Volumes 5 and 7.

---

## Senior Designer Brief — Chapter 1: Geometry and Measurement

### Visual register: Adequate (trending Barren in the circle and spatial-proof sections)

### Existing interactives

| # | Location | What it does | Assessment | Action |
|---|----------|-------------|------------|--------|
| 1 | After circle formulas | Radius slider; draws circle, shows area and circumference numerically | Adequate | Extend |
| 2 | After Pythagorean theorem statement | Sliders for legs a and b; draws three squares on the sides with area labels | Strong | Keep as-is |

**Notes on existing interactives:**

The Pythagorean theorem interactive (2) is the chapter's strongest visual and the strongest in the volume. Three colour-coded squares (yellow for b², green for a², blue for c²), updating live as the reader moves the sliders, the equation updating numerically — this is concept-geometry-first. The visual makes the theorem legible without proof. No changes needed.

The circle interactive (1) draws the circle and shows two numbers. It does not show *why* A = πr² — the formula arrives from nowhere. Doubling r produces four times the area, which surprises almost every 14-year-old, but the interactive does not demonstrate this. The visual should show the quadratic growth of area against radius. A minimum fix: add a readout showing "if r doubled to [2r], area would be ×4 = [4A]." A stronger fix: the sector-unrolling proof below.

---

### Missed opportunities

**OPPORTUNITY 1: Triangle area as half-rectangle** — After the triangle area formula (§ "Triangles")

The prose states "a triangle is half a rectangle" but provides no visual. The ½ factor is presented symbolically and then numerically verified. A reader who does not yet have spatial intuition for why this is true has no evidence.

*Concept geometry:* A triangle and its mirror-image reflection, fitted together to form a parallelogram. The ½ is visible. A second non-obvious result becomes visible when the apex slides: the area stays constant as the apex moves horizontally along the top edge (same base, same height, different shape).

*Interaction:* A slider for the apex position along the top edge of the bounding rectangle. Separate sliders for base b and height h. The "ghost" mirrored triangle always completes the rectangle.

*Response:* The filled triangle changes shape; the ghost completes the rectangle; the area label stays constant as the apex slides (demonstrating that area depends on base and height, not on the slant of the sides).

*Builds on:* Establishes the visual idea of "complementary shapes tiling a bounding region" — this recurs in integration as area under a curve (Vol 5).

```
<!-- VIZ: Triangle-half-rectangle interactive. Bounding rectangle shown in light grey.
Triangle fills the lower-left half (base along bottom, apex at top). Three sliders:
(1) base b from 2 to 10 (default 6), (2) height h from 2 to 8 (default 4),
(3) apex position from 0% to 100% across the top edge (default 50%).
A "ghost" reflection of the triangle (muted blue fill, no outline) always completes
the rectangle regardless of apex position.
Area label: "A = ½bh = [value] units²" — updates only when b or h change,
not when apex slides (demonstrating apex independence).
Dashed perpendicular line from apex to base, labelled "h".
Base labelled "b".
Caption: "The ½ comes from the fact that any triangle is exactly half of the rectangle
with the same base and height — regardless of where the apex sits." -->
```

---

**OPPORTUNITY 2: Visual proof of the Pythagorean theorem (four-triangle dissection)** — After the callout "Why the Pythagorean theorem works"

The callout says: "You can show this is true by cutting up the two smaller squares and rearranging the pieces to exactly fill the big one." This calls for an animation. The prose asks the reader to imagine a dissection that most 14-year-olds cannot picture. The classic four-triangle proof is completely accessible without algebra.

*Concept geometry:* Large square of side (a+b). Four identical right triangles arranged inside it. State 1: the uncovered area is the tilted square on the hypotenuse (area c²). State 2: the same four triangles rearranged to leave two axis-aligned squares of area a² and b². The uncovered area doesn't change — therefore c² = a² + b².

*Interaction:* A Play/Replay button animates the four triangles between state 1 and state 2 in ~1.5 seconds. The reader controls the animation; the triangles move, the uncovered area patches stay highlighted throughout.

*Response:* Smooth triangle translation/rotation. The two blue patches in state 2 are separately labelled a² and b². The equation a² + b² = c² appears beneath only when state 2 is reached.

*Builds on:* Extends the existing Pythagorean interactive (which shows the numerical equality) by showing *why* it is true. These two visuals sit close together — one shows what, this one shows why. This pairing (result interactive + derivation animation) is the series habit from THREAD 2.

```
<!-- VIZ: Pythagorean theorem dissection proof animation. Large outer square of
side (a+b) drawn in grey, with a = 3 and b = 4 fixed (a 3-4-5 triangle, chosen
for recognisability — not interactive, to reduce cognitive load).
Four identical right triangles (legs 3 and 4) coloured in warm amber fill.
STATE 1: triangles arranged in the four corners so the central uncovered region is
the tilted square on the hypotenuse c, area = 25, coloured in series blue.
Label this region "c² = 25".
STATE 2 (after animation): same four triangles rearranged so the two uncovered regions
are axis-aligned squares of areas a² = 9 and b² = 16, both coloured in series blue.
Label them "a² = 9" and "b² = 16".
A Play/Replay button triggers smooth ~1.5s animation between states.
Triangle fills stay amber throughout; uncovered regions stay blue.
After state 2 settles, show below the diagram: "a² + b² = 9 + 16 = 25 = c² ✓"
Caption: "The total uncovered area doesn't change — only the arrangement.
That is why a² + b² = c²." -->
```

---

**OPPORTUNITY 3: Circle area derivation — sector unrolling** — After the circle area formula A = πr²

This is the chapter's single largest missed opportunity. A = πr² is stated but never derived. The sector-unrolling argument requires no calculus, produces a rectangle, and is accessible to a 14-year-old. More importantly, it is the reader's first encounter with the idea of a limit — a discrete process converging to a continuous value — without being named as such. This foreshadows Vol 5 integration.

*Concept geometry:* Divide the circle into n sectors and rearrange them alternately pointing up and down. They form a shape approximating a rectangle. As n increases, the shape converges to a rectangle with width = πr (half the circumference) and height = r. Area = πr × r = πr².

*Interaction:* Slider for n (sectors): 4, 8, 16, 32, 64.

*Response:* Two panels update synchronously — left shows the circle with n sector cuts; right shows the rearranged approximate rectangle. Dimension labels on the right show "width ≈ πr = [value]" and "height = r = [value]", with the area approximation updating toward πr².

*Builds on:* Establishes the visual habit of "a limit is a discrete process converging to a continuous value." When Vol 5 introduces Riemann sums, the reader will already have seen this idea. Flag this as THREAD 2 (visual proof → integration habit).

```
<!-- VIZ: Circle area derivation — sector unrolling. Two side-by-side panels,
each ~240px wide.
Left panel: circle of fixed radius r = 80px, divided into n equal sectors
by radial lines. Alternate sectors shaded in series blue and light-blue.
Slider for n with values [4, 8, 16, 32, 64], default 8.
Right panel: the n sectors rearranged alternately pointing up-down to form
an approximate rectangle. Blue sectors point up; light-blue sectors point down.
A grey dashed bounding rectangle drawn over the arrangement.
Dimension labels: "≈ πr = [value]" (width) and "r = [value]" (height)
with dashed measurement lines on the right panel.
Below right panel: "A ≈ πr × r = πr² = [value]" updating with each n step.
At n = 64, the arrangement should look effectively rectangular to the eye.
Caption: "Slice a circle into sectors, flip alternating pieces — and you get a
rectangle. The more slices, the closer it gets. Width = half the circumference = πr,
height = r, so area = πr × r = πr²." -->
```

---

**OPPORTUNITY 4: Unit conversions — area and volume scaling** — After the unit conversion section

The prose explains 1 m² = 10,000 cm² with a verbal argument. This is counterintuitive for almost every reader. A visual that subdivides 1 m² into a grid of 1 cm² cells — and shows 100 × 100 = 10,000 cells — makes the fact legible without requiring the reader to accept the algebra on faith.

*Concept geometry:* Side-by-side panels for 1D (length), 2D (area), and 3D (volume) unit conversion. Panel 2 shows a square of 1 m² with a 10×10 grid (simplified from 100×100, but clearly labelled to show the logic). Panel 3 shows a cube in isometric projection.

*Interaction:* No slider needed — the juxtaposition is the message. A toggle or tabs for 1D/2D/3D on mobile.

*Builds on:* Establishes the geometric intuition for why polynomial degree matters in measurement — a thread connecting to the polynomial chapter's discussion of degree and to integration (Vol 5) where integrating a 2D area to get volume is the same scaling logic.

```
<!-- VIZ: Unit scaling — 1D, 2D, 3D comparison. Three panels side by side (tabs on mobile).
Panel 1: a line segment labelled "1 m" with 10 tick marks; label "= 100 cm".
Panel 2: a square labelled "1 m²" shown as a 10×10 grid of cells, each representing
one tenth of a metre per side; label "= 10,000 cm²" (bold). Each row labelled "10 cm"
to show how 10×10 = 100 groups × 100 cm² each = 10,000 cm² total.
Panel 3: a cube in isometric projection labelled "1 m³", front face shown as 10×10 grid,
depth labelled ×10; label "= 1,000,000 cm³" (bold).
Each panel has a conversion banner below in large text:
"1 m = 100 cm", "1 m² = 100² = 10,000 cm²", "1 m³ = 100³ = 1,000,000 cm³".
All three panels use the series blue/grey palette.
Caption: "Length scales by 100. Area scales by 100² = 10,000. Volume scales by
100³ = 1,000,000. The exponent on the unit tells you exactly how many dimensions
are involved." -->
```

---

### Visual threads

**THREAD 1: Right triangle colour vocabulary**

The Pythagorean theorem interactive establishes the right triangle as a visual object with colour-coded sides. This vocabulary must carry forward to Ch 2's trig interactive. Currently the trig interactive assigns different colours (opposite = red, adjacent = green, hypotenuse = blue) independently of the geometry chapter's colour-coding. The viz-artist should standardise: when implementing new Ch 1 visuals, lock in a colour assignment for the right triangle (suggested: hypotenuse in blue, legs a and b in green and amber respectively) and apply it in all four chapters and future volumes.

**THREAD 2: Visual proofs as series habit**

The sector-unrolling proof (OPPORTUNITY 3) and the dissection proof (OPPORTUNITY 2) both show why a formula is true, not just that it is true. This should become a series habit. Vol 5's Riemann sum should visually echo the sector-unrolling — the reader who has seen a circle's area emerge from rearranged sectors will immediately recognise integration as the same idea. The viz-artist should flag this when implementing OPPORTUNITY 3.

---

### Series-level design notes

The Pythagorean theorem interactive is a genuine series asset and the visual anchor of the chapter. The problem is that equally rich geometric content (circles, triangle area) has no visual derivation. The two priority additions are OPPORTUNITY 3 (sector unrolling — the reader's first encounter with a limit) and OPPORTUNITY 1 (triangle half-rectangle). Together with the existing Pythagorean theorem interactive, they give the chapter a coherent theme: every area formula has a visual derivation from simpler shapes.

The dissection animation (OPPORTUNITY 2) should be treated as a premium visual — high implementation cost, high payoff for spatial thinkers. If bandwidth is limited, prioritise OPPORTUNITY 3 first.

---

---

## Senior Designer Brief — Chapter 2: Trigonometry

### Visual register: Adequate (with one critical gap — the unit circle is entirely absent)

### Existing interactives

| # | Location | What it does | Assessment | Action |
|---|----------|-------------|------------|--------|
| 1 | After SOH-CAH-TOA notation | Sliders for θ and hypotenuse; draws right triangle with labelled sides and ratio panel | Strong | Minor enhancement only |
| 2 | After Example 4 (2D rotation) | Slider for observer distance; draws surveyor-and-building scene | Adequate | Optional improvement |

**Notes on existing interactives:**

The SOH-CAH-TOA interactive (1) is the chapter's best visual. The right triangle updates correctly, the ratio panel shows all three ratios simultaneously (with decimal values), and the labelling is clear. One enhancement worth considering: show the fraction form alongside the decimal — "opp/hyp = 3.21/6.0 = 0.535" rather than "0.5354." The ratio as a fraction makes the SOH-CAH-TOA identity self-evident instead of requiring the reader to trust the number. Minor; not a replacement.

The building/elevation interactive (2) is a competent worked-example illustration. It is good for what it is. One optional improvement: make the building height adjustable as well as the observer distance, giving the reader two independent parameters. Not a priority; adequate as-is.

---

### Missed opportunities

**OPPORTUNITY 5: THE UNIT CIRCLE — the chapter's critical missing piece**

This is the most important missed opportunity in the entire volume. The chapter teaches trig from the right-triangle perspective (SOH-CAH-TOA, 0° to 90°) but never makes the transition to the unit circle. The "Where this goes" section forwards to functions and differential calculus but does not give the reader the one visual that makes those connections legible.

The unit circle is not advanced material. A point P = (cos θ, sin θ) on a circle of radius 1. As θ sweeps from 0° to 360°, cos θ is the x-coordinate of P and sin θ is its y-coordinate. This is not supplementary — it is the definition that makes sin and cos coherent for all angles. The right-triangle definition (opposite/hypotenuse) is a special case valid only for 0° to 90°.

A reader who leaves this chapter without having seen the unit circle has received a tool without being shown what it actually is.

*Concept geometry:* Unit circle centred at the origin. Point P = (cos θ, sin θ). Two projection lines: one from P vertically to the x-axis (length = cos θ), one from P horizontally to the y-axis (length = sin θ). As P moves, the projections sweep the axes.

*Interaction:* Slider for θ from 0° to 360°. All elements update continuously.

*Response:* P moves on the circle. The cosine projection sweeps the x-axis from −1 to 1 and back; the sine projection sweeps the y-axis. Numeric panel: θ, cos θ, sin θ. When 0° < θ < 90°, show the right triangle formed by origin, foot of cosine projection, and P — connecting the unit circle definition back to SOH-CAH-TOA with labels "adj = cos θ", "opp = sin θ", "hyp = 1." Outside 0°–90°, show only the projections.

*Builds on:* This interactive must establish the visual vocabulary for the series' most important thread (THREAD 3): unit circle → complex numbers (Vol 5) → Fourier phasors (Vol 7) → Euler's formula (Vol 7 complex analysis). Colour conventions must be documented as series constants.

Special annotations at θ = 0°, 30°, 45°, 60°, 90°: when θ snaps within 2° of these values, show a labelled tick with the exact values (e.g., "cos 30° = √3/2, sin 30° = ½"). This is how these values become memorable rather than arbitrary.

```
<!-- VIZ: Unit circle — sine and cosine as projections. Coordinate axes centred in
the panel. Unit circle (radius ~130px) drawn in grey. Point P = (cos θ, sin θ)
shown as a filled circle in series blue. Radial line from origin to P in blue.

Two projection lines:
(1) Vertical dashed line from P to the x-axis; endpoint labelled "cos θ".
    A green bar on the x-axis from origin to the foot of the projection,
    length = cos θ.
(2) Horizontal dashed line from P to the y-axis; endpoint labelled "sin θ".
    A red bar on the y-axis from origin to the foot of the projection,
    length = sin θ.

Slider for θ from 0° to 360°, default 35°.

Numeric panel (top-right of SVG): θ = [value]°, cos θ = [value], sin θ = [value].

Special-angle annotations at θ ∈ {0°, 30°, 45°, 60°, 90°, 180°, 270°}:
when θ is within 2° of a special angle, show a pop-up label with exact values
(e.g., at 30°: "cos 30° = √3/2 ≈ 0.866, sin 30° = ½ = 0.5").

When 0° < θ < 90°: draw the right triangle — origin, (cos θ, 0), P — with sides
labelled "adj = cos θ" (green), "opp = sin θ" (red), "hyp = 1" (blue).
Outside 0°–90°: hide the triangle, show only the projections.

Series colour constants: blue = rotating point and radial line;
green = cosine / x-projection; red = sine / y-projection.
These must be used consistently in all subsequent chapters and volumes.

Caption: "On the unit circle, cos θ is how far right you are, sin θ is how far up
you are. That is what these functions fundamentally mean — not ratios in a triangle,
but coordinates of a point on a circle." -->
```

Placement: immediately after the worked examples section, before "Where this goes." The reader should encounter this after mastering the right-triangle ratios — as a revelation that expands the concept rather than replacing it.

---

**OPPORTUNITY 6: Sine wave from rotating point (the phasor trace)** — In "Where this goes," or as the chapter's final visual

The "Where this goes" section mentions that sine and cosine are repeating functions with graphs that matter in physics and engineering. No graph is shown. The chapter ends on a promise.

This is the moment to draw the sine curve — not by telling the reader it is a wave, but by generating it from the unit circle in real time. As P sweeps around the circle, its y-coordinate traces out the sine curve on a panel to the right. The reader watches the wave *emerge* from the rotation.

*Concept geometry:* Unit circle (left panel) and a coordinate graph of θ vs. sin θ (right panel). As θ increases, the y-coordinate of P traces the sine curve. A horizontal dashed line connects the height of P on the circle to the current point on the curve.

*Interaction:* Play/Pause button; Reset button; toggle to show sin θ (y-projection) or cos θ (x-projection).

*Response:* The sine/cosine curve accumulates progressively as P sweeps. When θ reaches 360° and the curve is complete, the reader can see one full period and immediately see that it will repeat.

*Builds on:* This is the phasor concept in its simplest form. Vol 7 Fourier analysis describes every periodic signal as a sum of rotating phasors. The reader who has watched the sine curve emerge from a rotating point will recognise the Vol 7 phasor immediately. This is the single most pedagogically loaded visual in the series.

```
<!-- VIZ: Sine wave from rotating point. Two panels side by side.

Left panel (~200px wide): unit circle as in OPPORTUNITY 5, but simplified —
only the sin θ (red) projection shown. Point P at angle θ. The radial line
from origin to P in blue.

Right panel (~280px wide): coordinate graph. Horizontal axis: θ, range 0° to 720°
(two full cycles), labelled in degrees. Vertical axis: −1 to 1.
As the animation runs, the curve y = sin(θ) is drawn progressively —
each animation frame adds a new (θ, sin θ) point.
A horizontal dashed red line from P in the left panel extends rightward to
the current point on the curve, visually linking "height of P on the circle"
to "value of the sine curve at this θ."
When θ reaches 360°, the trace continues for a second cycle (0° to 720°)
to make the period visible.

Controls below both panels:
- Play/Pause button (starts animation at ~3 seconds per full revolution)
- Reset button
- Toggle: "Show sin θ" / "Show cos θ" (switches to green, traces x-projection)

Caption: "The sine curve is just the height of a point going around a circle,
drawn out as time passes. That is all it is." -->
```

---

**OPPORTUNITY 7: Force vector decomposition** — After Example 2 (rope and fence post) or after the "Where this shows up" callout

Both Example 2 (rope tension) and Example 4 (2D game rotation) involve decomposing a quantity into horizontal and vertical components. This is one of the most practically important uses of trig in engineering and physics — every structural force is resolved into components before analysis. No interactive covers this decomposition.

*Concept geometry:* A force vector F at angle θ above the horizontal. Horizontal component F cos θ and vertical component F sin θ drawn as component arrows, completing a right triangle.

*Interaction:* Sliders for θ (0° to 90°) and magnitude F (1 to 10 N).

*Response:* The component arrows lengthen/shorten and rotate as θ and F change. Labels show the formulas and current values. A check panel shows (F cos θ)² + (F sin θ)² = F² to demonstrate Pythagoras is always satisfied.

*Builds on:* Directly foreshadows Vol 7 vector decomposition. The visual vocabulary — vector as magnitude + direction, decomposition into perpendicular components — is the foundation for the dot product, cross product, and, eventually, the Fourier coefficient as an inner product.

```
<!-- VIZ: Force vector decomposition. Coordinate axes centred, range ±8 in both axes.
A vector arrow from the origin at angle θ above the horizontal, magnitude F,
drawn in blue with arrowhead.
Two component arrows:
(1) Horizontal component F cos θ, in green, along the x-axis from origin.
(2) Vertical component F sin θ, in red, along the y-axis from origin.
Dashed construction lines from the tip of the force vector down to the horizontal
component arrow, and left to the vertical component arrow, completing the right triangle.

Sliders: θ from 0° to 90° (default 40°), F from 1 to 10 N (default 6).

Labels on component arrows: "F cos θ = [value] N" (green), "F sin θ = [value] N" (red).
Label on the force arrow: "F = [value] N, θ = [value]°".
Right-angle marker at the component corner.

Numeric panel: "F cos θ = [value]", "F sin θ = [value]",
"Check: (F cos θ)² + (F sin θ)² = [value] = F² ✓"

Caption: "Every force at an angle can be split into a horizontal push and a
vertical push. Sine and cosine do the splitting." -->
```

---

### Visual threads

**THREAD 3 — SERIES-CRITICAL: The unit circle / phasor thread**

This is the most important visual thread in the entire series. The chain:

- **Vol 3 Ch 2 (here):** Unit circle established. sin/cos as projections of a rotating point. Sine curve as trace of the y-coordinate. Colour vocabulary: blue = point/radial line, green = cos/x-projection, red = sin/y-projection.
- **Vol 5, complex numbers:** A complex number of modulus 1 is a point on the unit circle. Multiplication of two unit-circle numbers is rotation. The unit circle interactive from here should be explicitly extended with "now label the point as cos θ + i sin θ."
- **Vol 7, Fourier series:** Each Fourier harmonic is a point on the unit circle rotating at frequency n. The partial sum is a sum of rotating phasors. The reader who has watched the sine curve emerge from a rotating point will recognise the phasor immediately.
- **Vol 7, complex analysis:** Euler's formula e^(iθ) = cos θ + i sin θ is a statement about the unit circle. Its illustration should use the exact same visual object established here.

The viz-artist must know this is not a one-off illustration. The unit circle interactive (OPPORTUNITY 5) and the phasor trace (OPPORTUNITY 6) are the seeds of the series' most advanced visual material. Document the colour constants and reference them at every future occurrence.

**THREAD 4: Trig as functions → Ch 4 connection**

The existing SOH-CAH-TOA interactive shows sin and cos as functions of θ, but only for 0°–90°. OPPORTUNITY 5 (unit circle) extends this to all angles. When Ch 4 introduces the function concept, there should be a backward callback: "You already know two non-linear functions — sin(θ) and cos(θ), which you saw in Ch 2." The unit circle interactive and the Ch 4 function-machine interactive should use a consistent visual register.

---

### Series-level design notes

This chapter has one strong interactive and one adequate one. The critical deficit is the complete absence of the unit circle. A trigonometry chapter that does not show the unit circle is teaching trig from its least general starting point and stopping before showing what the subject actually is.

The two new interactives (OPPORTUNITY 5 and OPPORTUNITY 6) are the chapter's most important additions and should be treated as priority one for the viz-artist. They are more important than any prose addition. A reader who has dragged P around the unit circle and watched the sine curve emerge has understood something that cannot be communicated by any formula.

---

---

## Senior Designer Brief — Chapter 3: Polynomials and Factoring

### Visual register: Adequate

### Existing interactives

| # | Location | What it does | Assessment | Action |
|---|----------|-------------|------------|--------|
| 1 | After "Reading the graph" section | Sliders for a, b, c; draws parabola with roots (red), vertex (amber), discriminant display | Strong | Keep as-is |
| 2 | After Example 1 (thrown ball) | Sliders for initial height h₀ and initial speed v; draws height-time curve | Strong | Keep as-is |

**Notes on existing interactives:**

The parabola explorer (1) is the chapter's visual centrepiece and is well-executed. The discriminant display — Δ = value, "2 roots / 1 root / no real roots" — is particularly effective. The reader can slide from Δ > 0 through Δ = 0 to Δ < 0 and watch the parabola lift off the x-axis and the roots disappear. This is exactly the native geometry of the discriminant. The equation string at the top updates in real time. One technical note: the a-slider range includes values near 0, guarded by `Math.abs(qa) < 0.1 ? 0.5 : qa`. The step is 0.5 but passing through a = 0 produces a visible jump. Consider excluding a = 0 from the slider range entirely (e.g., two separate ranges [−2, −0.5] and [0.5, 2]) to avoid reader confusion. Minor fix; do not rebuild the interactive.

The ball-trajectory interactive (2) is well-constructed. Initial height and speed sliders, peak marker (amber), landing marker (red). The axis labels are correct and the vertical scale adjusts appropriately. This is a strong "concept in context" visual — the parabola from interactive (1) seen in a physical application.

---

### Missed opportunities

**OPPORTUNITY 8: Expanding as area — FOIL as geometric tiling** — After the expanding section (§ "Part a: Expanding")

The chapter presents FOIL expansion with the example (x + 3)(x + 2) as "every term in the first bracket multiplies every term in the second." This is algebraically correct but geometrically opaque. FOIL has an exact geometric reading: (x + 3)(x + 2) is the area of a rectangle with those side lengths, divided by two internal cuts into four tiles. The four FOIL terms are four tiles. x² is the large square tile. 2x and 3x are the rectangular strips. 6 is the corner square.

This is not an obscure insight — it is the standard geometric proof of the distributive law. It makes FOIL immediately memorable: the reader sees why there are exactly four terms and where each one comes from.

*Concept geometry:* Rectangle with sides (x+3) and (x+2), divided into a 2×2 grid by a vertical cut at x from the left and a horizontal cut at x from the bottom. Four tiles: x² (top-left), 2x (top-right), 3x (bottom-left), 6 (bottom-right).

*Interaction:* Slider for x from 1 to 8. Tiles resize in real time.

*Response:* As x grows, the x² tile grows quadratically — faster than the linear tiles. This demonstrates why the squared term dominates for large x without stating it explicitly. The total area readout = x² + 5x + 6 updates.

*Builds on:* The geometric interpretation of polynomial multiplication. This is the precursor to completing the square (which is literally completing a square) and previews integration — the area of a rectangle with one varying side is a Riemann rectangle. Flag as THREAD 6.

```
<!-- VIZ: FOIL as rectangle area. A rectangle shown with width = (x + 3) and height = (x + 2).
Divided into a 2×2 grid by one vertical cut (at distance x from left) and one
horizontal cut (at distance x from bottom).
Four tiles, colour-coded:
- Top-left: x × x = x², in series blue. Label: "x² = [value]"
- Top-right: x × 2 = 2x, in green. Label: "2x = [value]"
- Bottom-left: 3 × x = 3x, in green. Label: "3x = [value]"
- Bottom-right: 3 × 2 = 6, in amber. Label: "6"
Outer rectangle: grey outline. Width label "(x + 3) = [value]" on top or right.
Height label "(x + 2) = [value]" on left or bottom.
Slider for x from 1 to 8, default 3.
Below the rectangle: "Total area = x² + 5x + 6 = [value]"
showing each term's current numeric contribution.
Optional: a toggle overlaying the FOIL letter labels (F, O, I, L) on the four tiles.
Caption: "Multiplying (x + 3)(x + 2) is the same as finding the area of a rectangle
with those side lengths. The four FOIL terms are the four tiles." -->
```

---

**OPPORTUNITY 9: Completing the square — geometric interpretation** — After the callout "Where the quadratic formula comes from"

The callout derives the quadratic formula by completing the square, presented entirely symbolically. Completing the square has an exact geometric meaning: you literally complete a square. The operation x² + bx → (x + b/2)² − (b/2)² corresponds to adding a rectangular strip to a square, then correcting for the corner piece.

This is not essential for every reader at this level, but it gives the symbolic manipulation a visual anchor that makes the formula feel inevitable rather than delivered from above.

*Concept geometry:* A square of side x. A rectangular strip of dimensions x × (b/2) added on the right. The same strip added on the bottom. The resulting L-shape is "almost" a large square of side (x + b/2) — it needs a corner piece of area (b/2)² to complete it. The identity x² + bx = (x + b/2)² − (b/2)² is labelled on the diagram.

*Interaction:* Slider for b from 0 to 8. Optional slider for x from 2 to 6.

*Response:* The geometric shapes resize. The corner piece is highlighted in amber. The equation updates with numerical values.

```
<!-- VIZ: Completing the square — geometric proof.
Fixed x = 4 (or optional slider for x from 2 to 6). Slider for b from 0 to 8.
Show the construction in three labelled stages, either as a stepped diagram
or as a 3-step animation:
Stage 1: square of side x, area x², in series blue. Label "x²".
Stage 2: add rectangular strips of size x × (b/2) on the right and below,
each in green. Label each "½bx".
Stage 3: add a small corner square of side (b/2) in amber to complete the big square.
Label "(b/2)²".
The completed big square has side (x + b/2) and area (x + b/2)².
Equation below diagram, updating with current b and x values:
"x² + bx + (b/2)² = (x + b/2)²"
Final annotation: "x² + bx = (x + b/2)² − (b/2)²"
Caption: "Completing the square means literally adding the missing corner piece to
make a perfect square — then subtracting it again to keep the equation balanced." -->
```

---

**OPPORTUNITY 10: Factored-form parabola explorer** — After the "Solving by factoring" section or alongside the existing parabola explorer

The existing parabola explorer shows the parabola through the lens of coefficients (a, b, c). The factored-form view — y = (x − r₁)(x − r₂) — gives the reader a second, complementary handle: the roots control the curve directly. The connection between factoring and root-finding becomes visually immediate: the roots are the values that set each bracket to zero, and they are exactly where the curve crosses the x-axis.

*Concept geometry:* Graph of y = (x − r₁)(x − r₂). Two sliders control r₁ and r₂ directly. The roots are shown as red dots and can be dragged.

*Interaction:* Sliders for r₁ and r₂ from −4 to 4. Both forms shown simultaneously: "Factored: y = (x − r₁)(x − r₂)" and "Expanded: y = x² − (r₁+r₂)x + r₁·r₂."

*Response:* Moving r₁ moves the left root; moving r₂ moves the right root. The curve updates. The expanded form updates. The reader can see directly that the roots are encoded in the factored form.

*Builds on:* Extends the parabola explorer but shifts the conceptual focus from coefficients to roots. Together, the two explorers give the reader the coefficient-view and the root-view — two handles on the same object (Design Principle 4). This also previews the factor theorem (Vol 5), where every root corresponds to a linear factor.

```
<!-- VIZ: Factored-form parabola. Sliders for r₁ from −4 to 4 (default 2) and r₂ from
−4 to 4 (default 3). Graph shows y = (x − r₁)(x − r₂) in series blue, x-range [−5, 5].
Red filled circles at (r₁, 0) and (r₂, 0), labelled "x = r₁" and "x = r₂".
Vertical dashed lines from each root to the x-axis.
Vertex marked in amber (x-coord = (r₁+r₂)/2).
Info panel below the graph:
"Factored form: y = (x − [r₁])(x − [r₂])"
"Expanded: y = x² − [r₁+r₂]x + [r₁·r₂]"
"Roots: x = [r₁], x = [r₂]"
Optional toggle: show/hide the two linear factor lines y = (x − r₁) in light green
and y = (x − r₂) in light orange. When shown, annotate where each crosses zero.
Caption: "The factored form gives you the roots directly. Set each bracket to zero.
The graph confirms it: the curve crosses the x-axis exactly at those points." -->
```

---

### Visual threads

**THREAD 5: Parabola → function and domain/range (connects to Ch 4)**

The parabola explorer should be visually echoed in Ch 4's domain/range section. The parabola is the natural example for which domain and range are easy to read from the graph: domain = all reals; range = [vertex y, ∞) for an upward parabola. The Ch 4 domain/range interactive (OPPORTUNITY 11) should use the same colour conventions — blue for curve, red for roots, amber for vertex — established here.

**THREAD 6: FOIL tiling → Riemann sum / integration (seeds Vol 5)**

The rectangle tiling (OPPORTUNITY 8) is the geometric precursor to integration. When Vol 5 introduces the Riemann sum, the reader will have already seen polynomial multiplication as a tiling of rectangles. The viz-artist implementing Vol 5 Riemann sums should reference this visual explicitly.

---

### Series-level design notes

The two existing interactives are strong. The missed opportunities here are in the *derivation* and *structure* of the algebra rather than the graph-reading, which is already well covered. The FOIL tiling (OPPORTUNITY 8) and completing-the-square geometry (OPPORTUNITY 9) give the chapter a visual account of where the symbols come from. The factored-form explorer (OPPORTUNITY 10) is a priority because it makes the geometric purpose of factoring immediately legible in a way the coefficient-based explorer does not. Together, the two explorers give the reader two genuinely different conceptual handles on the same mathematical object.

---

---

## Senior Designer Brief — Chapter 4: Functions and Relations

### Visual register: Adequate (with significant gaps in domain/range, composition, and inverse)

### Existing interactives

| # | Location | What it does | Assessment | Action |
|---|----------|-------------|------------|--------|
| 1 | After notation section | Select function; x slider; shows function machine box, computes output, shows (x, f(x)) pair | Weak | Replace with OPPORTUNITY 11 |
| 2 | After composition section | Select f and g; x slider; shows four numerical outputs and hardcoded symbolic forms | Weak | Replace with OPPORTUNITY 12 |

**Notes on existing interactives:**

The function machine (1) executes the right metaphor — a box with input and output arrows — but does not use it. The box is static. The input and output are two text lines. The reader does not see motion: a number going into the box and a different number emerging. The concept geometry of a function machine is *motion*. Furthermore, the interactive shows one input-output pair with no graph of the complete function. The domain/range section discusses how graphs reveal domain and range visually, but no graph exists. This is the chapter's most significant visual gap.

The composition interactive (2) is numerically correct. It shows four numbers and nine hardcoded symbolic forms for the 9 function combinations. It does not show the arrow diagram that makes composition geometrically legible — two number lines, an arrow from x to g(x), an arrow from g(x) to f(g(x)). The concept geometry is entirely absent. Replace with OPPORTUNITY 12.

---

### Missed opportunities

**OPPORTUNITY 11: Function machine with graph — domain and range made visible** — After the notation section (replaces existing interactive 1)

The chapter's foundational concept — a function maps every input to exactly one output — has two natural visual representations that should appear together: the machine metaphor (for individual evaluation) and the graph (for the complete function). Showing only the machine without the graph means the reader cannot see domain and range, cannot see where a function is undefined, and cannot see the difference between functions that are one-to-one and those that are not.

*Concept geometry:* The graph of f(x) is the complete set of input-output pairs. Domain is visible as the extent of the curve along the x-axis. Range is visible as the extent of the curve along the y-axis. Domain restrictions appear as gaps or boundaries in the curve.

*Interaction:* Dropdown to select function (2x+1, x², |x|, √(x+5)). Slider for x. A point moves along the curve; dashed lines drop to the x-axis (input) and extend to the y-axis (output). When x is outside the domain (e.g., x < −5 for √(x+5)), the point disappears and a "not defined here" indicator appears.

*Response:* Point tracks along the curve. X-axis and y-axis projections update. The domain is highlighted as a coloured segment on the x-axis; the range as a coloured segment on the y-axis.

*Builds on:* The parabola explorer from Ch 3 already shows a curve with labelled points and a similar colour vocabulary. This interactive should adopt the same visual conventions (blue curve, amber for special points) so the reader recognises the continuity.

```
<!-- VIZ: Function machine + graph, dual panel.
Top panel (~130px high): function machine box (rect in blue, labelled with
current formula), input arrow from left with label "x = [value]",
output arrow to right with label "f(x) = [value]". Add a brief animation:
when x slider moves, a small dot travels along the input arrow into the box
and emerges on the output arrow (simple CSS transition or OJS transition,
~0.3s). This makes the machine metaphor kinetic.

Bottom panel (~220px high): coordinate graph of the selected function over
its natural domain, x-range [−6, 6].
Movable point on the curve at current x. Dashed vertical line from point to
x-axis, labelled "x = [value]" in grey. Dashed horizontal line from point to
y-axis, labelled "f(x) = [value]" in blue.
Domain highlighted as a green segment on the x-axis (or grey where undefined).
Range highlighted as an amber segment on the y-axis.
When x is outside the domain (for √(x+5) when x < −5): point disappears,
output label shows "undefined (x < −5)", domain segment shows in red.

Dropdown: "2x + 1", "x²", "|x|", "√(x + 5)". Slider for x from −6 to 6.

Caption: "The graph is the complete picture of a function — every input mapped
to its output. The extent along the x-axis is the domain; along the y-axis is
the range." -->
```

---

**OPPORTUNITY 12: Function composition as arrow diagram between number lines** — After the composition section (replaces existing interactive 2)

The composition concept needs a visual that encodes the order of operations spatially. Three horizontal number lines stacked vertically — one for x, one for g(x), one for f(g(x)) — with arrows connecting them. The reader cannot confuse f(g(x)) with g(f(x)) because the diagram spatially encodes which arrow comes first.

*Concept geometry:* Three number lines. Arrow 1 from x to g(x), labelled "apply g." Arrow 2 from g(x) to f(g(x)), labelled "apply f." The order of application is visible in the spatial layout.

*Interaction:* Slider for x. Dropdowns for f and g. A toggle reverses the order to show g(f(x)).

*Response:* All three marker positions update as x changes. Symbolic form below updates. When "swap order" is active, the diagram re-labels the lines and arrows to reflect the reversed composition.

*Builds on:* This arrow diagram directly foreshadows the chain rule in Vol 5: d/dx[f(g(x))] = f'(g(x)) · g'(x) is the same diagram with rates of change attached. The reader who has internalised the arrow diagram will recognise the chain rule immediately. Flag as THREAD 7.

```
<!-- VIZ: Composition arrow diagram. Three horizontal number lines, evenly spaced
vertically, within an SVG of ~480×220px.
Line 1 (top): labelled "input x", range −5 to 5, tick marks at integers.
Line 2 (middle): labelled "g(x)", range −8 to 8.
Line 3 (bottom): labelled "f(g(x))", range −15 to 15 (approximate — adjust per
function selections).
A filled circle on each line marks the current value.
Arrow 1: curved arrow from circle on line 1 to circle on line 2, labelled "apply g"
in green.
Arrow 2: curved arrow from circle on line 2 to circle on line 3, labelled "apply f"
in blue.
Slider for x from −4 to 4. Dropdowns for f and g (3 options each: "x + 3", "2x", "x²"
for f; "x − 1", "3x", "x + 2" for g).
Below the diagram:
"g([x]) = [g(x)]"
"f(g([x])) = f([g(x)]) = [f(g(x))]"
"Symbolic: f(g(x)) = [hardcoded form for current selection]"
A "Swap order" toggle relabels line 2 as "f(x)", line 3 as "g(f(x))", and reverses
arrow labels to "apply f" then "apply g." Both orders shown simultaneously when
toggled, to emphasise that f(g(x)) ≠ g(f(x)).
Caption: "Composition is a chain. g acts first, then f acts on g's output. Reverse
the chain and you generally get a different result." -->
```

---

**OPPORTUNITY 13: Inverse functions as graph reflection** — After Part 4: Inverses

The chapter explains inverse functions algebraically and gives the verbal line-test criterion. The geometric definition of the inverse — the graph of f⁻¹ is the reflection of the graph of f across the line y = x — is hinted at in the prose but never shown. This is a visually striking result and immediately illuminates why "swapping x and y" produces the inverse.

*Concept geometry:* The line y = x as a mirror. The graph of f and its reflection f⁻¹ on the same coordinate plane. A movable point P on f(x); its mirror image P' appears on f⁻¹(x) with coordinates swapped.

*Interaction:* Dropdown to select f. Slider for x. Point P moves along f; its mirror P' = (f(x), x) moves along f⁻¹.

*Response:* Both curves update when f changes. P and P' update as x changes. Coordinates shown: P = (x, f(x)) and P' = (f(x), x).

*Builds on:* Establishes the reflection principle — THREAD 8. Vol 4 needs this when introducing logarithms as inverses of exponentials (the graphs of log and exp are reflections across y = x). Vol 7 complex analysis revisits it: conjugation is reflection of the complex plane across the real axis.

```
<!-- VIZ: Inverse as reflection. Coordinate plane, x and y range −5 to 5.
Line y = x drawn as a thin grey diagonal (the "mirror line"), labelled "y = x".
Graph of f(x) in series blue; graph of f⁻¹(x) in orange dashed line.
Filled circle P on f(x) at current x. Filled circle P' on f⁻¹(x) at the
mirror position.
A thin dashed line connecting P and P', perpendicular to y = x.
P labelled "(x, f(x))" in blue; P' labelled "(f(x), x)" in orange.
Dropdown for f:
- "2x + 3" — inverse (x−3)/2
- "x³" — inverse x^(1/3)
- "x² (x ≥ 0)" — inverse √x — note: domain restriction needed; add a callout:
  "For x²  to have an inverse, we restrict to x ≥ 0. The unrestricted parabola
  fails the horizontal line test."
Slider for x within the natural domain of the selected f.
Caption: "The inverse function is the reflection of the original across y = x.
Every point (a, b) on f becomes (b, a) on f⁻¹ — coordinates swapped." -->
```

---

**OPPORTUNITY 14: Vertical line test** — After the callout "Why this works: the vertical line test"

The callout describes the vertical line test correctly but entirely in words. Two contrasting side-by-side panels — one showing a function (a parabola), one showing a non-function (a sideways parabola, x = y²) — with an animated vertical line sweeping across both, is the test in action rather than in description. This is a small addition with immediate payoff.

*Concept geometry:* Left panel: y = x² (a function; every vertical line hits at most once). Right panel: x = y² (not a function; a vertical line at x > 0 hits twice).

*Interaction:* A shared slider moves the vertical line left-to-right across both panels.

*Response:* Intersection points highlighted in red. On the right panel, when x > 0: two red points appear, labelled "2 outputs — not a function." On the left panel: one point, labelled "1 output ✓."

*Builds on:* Makes the function definition visual and immediate. Works in concert with OPPORTUNITY 11 (the domain/range interactive), where domain restrictions are shown as curve gaps — the vertical line test explains why those restrictions matter.

```
<!-- VIZ: Vertical line test. Two side-by-side panels, each ~200px wide, x and y
range −3 to 3.
Left panel: graph of y = x² in series blue. Title: "A function".
Right panel: graph of x = y² (both y = √x and y = −√x) in series blue.
Title: "Not a function".
A shared slider for the x-position of a vertical red dashed line, ranging from
−2.5 to 2.5.
Left panel: 0 or 1 intersection point as a red dot.
  When 1 intersection: small label "1 output ✓" near the point.
Right panel: 0 or 2 intersection points as red dots.
  When 2 intersections (x > 0): small label "2 outputs!" near each point.
  When x ≤ 0: label "0 outputs (undefined here)".
Caption: "A function: every vertical line hits the graph at most once.
Not a function: some vertical line hits twice — one input, two outputs." -->
```

---

### Visual threads

**THREAD 7: Composition arrow diagram → chain rule (Vol 5)**

The arrow diagram (OPPORTUNITY 12) directly foreshadows the chain rule: d/dx[f(g(x))] = f'(g(x)) · g'(x). The reader who has internalised "g acts first, then f acts on g's output" will understand the chain rule as "the derivative of f at g's output, multiplied by how fast g's output is changing." The viz-artist implementing the chain rule in Vol 5 should reproduce or reference this diagram.

**THREAD 8: Inverse as reflection → logarithm/exponential (Vol 4) and complex conjugation (Vol 7)**

The reflection-across-y=x interactive (OPPORTUNITY 13) establishes a visual that is needed in Vol 4 when logarithms are introduced as inverses of exponentials. The same reflection principle — in the guise of conjugation as reflection across the real axis — appears again in Vol 7 complex analysis. The viz-artist should note the reuse and maintain visual consistency across these three occurrences.

---

### Series-level design notes

This chapter has two interactives that execute the right ideas in a visually under-powered way. The function machine is conceptually correct but static where it should be kinetic; the composition interactive is numerically correct but geometrically absent. Both should be replaced with the briefs above (OPPORTUNITIES 11 and 12).

The inverse function section and the domain/range section have no interactives. These are the two most spatially loaded sections in the chapter — domain and range are visual concepts (extents along axes); inverse as reflection is a visual operation. Both need visuals.

Priority order for this chapter: (1) OPPORTUNITY 11 (replace existing interactive 1 with function+graph dual panel), (2) OPPORTUNITY 13 (inverse as reflection), (3) OPPORTUNITY 12 (replace existing interactive 2 with composition arrow diagram), (4) OPPORTUNITY 14 (vertical line test — quick addition, high payoff).

---

---

## Volume-level visual threads summary

| Thread | Established in | Continues through | Series payoff |
|--------|---------------|------------------|---------------|
| THREAD 1 | Ch 1 — Pythagorean right triangle, colour-coded sides | Ch 2 SOH-CAH-TOA interactive | Consistent right-triangle visual vocabulary throughout the series |
| THREAD 2 | Ch 1 — visual proofs (sector unrolling, dissection) | Vol 5 — Riemann sum as limit of rectangles | Reader recognises integration as the same convergence idea seen here |
| **THREAD 3 — CRITICAL** | Ch 2 — unit circle, rotating point P, two projections | Vol 5 complex numbers; Vol 7 Fourier series; Vol 7 complex analysis / Euler's formula | The single most important visual thread in the series |
| THREAD 4 | Ch 2 — sin/cos as functions of θ (unit circle) | Ch 4 functions chapter; Vol 5 calculus of trig functions | Connects trig to the function concept before functions are formally defined |
| THREAD 5 | Ch 3 — parabola with roots, vertex, discriminant | Ch 4 domain/range (parabola as worked example) | Shared visual vocabulary for curve exploration |
| THREAD 6 | Ch 3 — FOIL as rectangle area tiling | Vol 5 — Riemann sum, integration as area | Reader has seen "polynomial multiplication = area" before meeting integrals |
| THREAD 7 | Ch 4 — composition arrow diagram | Vol 5 chain rule | The chain rule is the composition diagram with derivatives attached |
| THREAD 8 | Ch 4 — inverse as reflection across y = x | Vol 4 logarithms (inverse of exponential); Vol 7 complex conjugation | The reflection principle recurs at key moments across four volumes |

---

## Priority ranking across all four chapters

1. **THREAD 3 / OPPORTUNITY 5:** Unit circle interactive in Ch 2. The most important single addition to the volume. Without it, the series lacks the foundational visual its most advanced material depends on.
2. **THREAD 3 / OPPORTUNITY 6:** Phasor trace (sine wave from rotating point) in Ch 2. Completes the unit circle thread; establishes the phasor concept that Vol 7 Fourier analysis depends on.
3. **OPPORTUNITY 11:** Function machine + graph dual panel in Ch 4. Replaces an inadequate interactive; makes domain and range visual for the first time.
4. **OPPORTUNITY 13:** Inverse as reflection in Ch 4. Visually elegant; high payoff across three future volumes.
5. **OPPORTUNITY 3:** Circle area as sector unrolling in Ch 1. The reader's first encounter with a limit; the best visual proof in the chapter.
6. **OPPORTUNITY 2:** Pythagorean dissection animation in Ch 1. Premium visual; high implementation cost but uniquely persuasive for spatial thinkers.
7. **OPPORTUNITY 10:** Factored-form parabola explorer in Ch 3. Gives the second handle on the parabola (roots vs. coefficients).
8. **OPPORTUNITY 12:** Composition arrow diagram in Ch 4. Replaces an inadequate interactive with the correct concept geometry.
9. **OPPORTUNITY 1:** Triangle half-rectangle in Ch 1. Straightforward to implement; high conceptual payoff for the ½ factor.
10. **OPPORTUNITY 8:** FOIL as rectangle area in Ch 3. Seeds the THREAD 6 integration connection.
11. **OPPORTUNITY 7:** Force vector decomposition in Ch 2. Engineering-relevant; foreshadows vector decomposition in Vol 7.
12. **OPPORTUNITY 14:** Vertical line test in Ch 4. Quick addition; makes the function definition immediately visual.
13. **OPPORTUNITY 4:** Unit scaling comparison in Ch 1. Useful; lower priority.
14. **OPPORTUNITY 9:** Completing the square geometry in Ch 3. Strong for high-achieving readers; lower priority at the bridge layer.
