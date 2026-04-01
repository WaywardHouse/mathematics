# Senior Designer Brief — Volume 2: Patterns and Algebra

*Layer:* pre-university (Alberta Gr 8–9, age 13–15)
*Visual mandate:* The transition from arithmetic (numbers) to algebra (relationships). The number line from Vol 1 becomes a coordinate plane by Chapter 4. Every visualisation in this volume should advance that journey.

---

## Chapter 1 — Linear Equations

### Visual register: Adequate

The balance metaphor is executed and present. The solver stepper is implemented. Both serve the chapter's core concept. The chapter is not visually barren — but it is thinner than it could be. The balance is static in one key respect: it never shows the *moment of solution*, only the *process of manipulation*. That moment — the scales finally resting level — is the visual payoff the chapter has been building toward and it never quite arrives.

---

### Existing implemented interactives

| # | Location | Description | Assessment |
|---|----------|-------------|------------|
| 1 | After "What the notation is saying" | **Equation balance** — D3 scales SVG. Choose operation (+/−/×/÷) and value; both pans update symbolically. | **Adequate** |
| 2 | After "The method" | **Equation solver** — sliders for a, b, c in ax + b = c; stepwise solution renders live. | **Strong** |

**Assessment notes — Balance (interactive 1):**

The balance is structurally correct but visually incomplete. The beam is always horizontal regardless of the state of the equation. This removes the central metaphor: an unbalanced equation should look unbalanced. The balance only becomes meaningful when it *tips*, and when the solution is reached it should settle visibly level.

Second: the balance shows only one operation at a time, applied to the original equation. The reader cannot walk through the full solving sequence on the balance itself — they must mentally cross-reference the prose and the solver interactive separately. The two interactives do not speak to each other.

Third: the left pan shows a symbolic string (`3x + 7 − 5`) while the right pan shows a number (`17`). The asymmetry between symbolic left and numeric right is fine mathematically, but visually it reinforces a wrong intuition that the left side is "complicated" and the right side is "the answer". At solution, both sides should show the same number.

**Rewrite brief — Balance (interactive 1):**

```
<!-- VIZ: Equation balance — animated solving sequence

Show the equation 3x + 7 = 22 on a balance scale with two pans suspended
from a horizontal beam pivoted at the centre.

INITIAL STATE: The beam is horizontal (balanced). Left pan shows the
label "3x + 7". Right pan shows "22". Both pans hang at equal height.

CONTROLS: A single "Next step →" button drives the sequence. Three steps:

Step 1 — "Subtract 7 from both sides"
  - Both pans briefly dip (beam stays level — operation is symmetric)
  - Left pan label changes from "3x + 7" to "3x"
  - Right pan value changes from "22" to "15"
  - A small annotation reads "−7 from both sides"

Step 2 — "Divide both sides by 3"
  - Same brief symmetric dip
  - Left pan label changes from "3x" to "x"
  - Right pan value changes from "15" to "5"
  - Annotation: "÷3 on both sides"

Step 3 — SOLUTION
  - Left pan label becomes "x = 5"
  - Right pan label becomes "5"
  - Both pans now show the same value
  - The beam glows or pulses gently (accent colour, 0d9488) to signal balance
  - A text line appears below: "Both sides are the same — the balance holds."

Visual vocabulary:
  - Beam: dark (#374151), thick stroke, pivoting smoothly using CSS transform
  - Pans: rounded rectangles, light fill (#f3f4f6), same colour both sides
  - Operation annotation: teal (#0d9488), italic, appears between steps
  - Solution glow: accent teal, not red — this is a satisfying moment, not a warning
  - Labels: bold, centered in pan

Builds on: this is the first appearance of the balance metaphor in the series.
Ch 2 will use the number line; this is the only chapter that uses a balance.
Make it count — the reader should feel the scales settle.
-->
```

---

### Missed opportunities

**[OPPORTUNITY 1] — The solution as a number line position** (after "The method")

*Concept geometry:* The solution x = 5 is a *point on the number line*. The reader has met the number line in Vol 1 but this chapter never connects the algebraic answer to a geometric position. This is the first step in the visual thread: a solution is not just a number, it is a location.

*Interaction:* None needed — this can be a clean static figure or a very simple animation. When the solver interactive reaches its answer, a small number line appears below the answer box, and a dot slides to the solution's position and settles with a label "x = 5".

*Response:* As the reader adjusts the sliders (a, b, c) in the existing solver interactive, the solution dot on the number line moves to the new position.

*Builds on:* Vol 1 number line. Establishes the thread that continues into Ch 2 (shaded region) and Ch 4 (coordinate plane).

```
<!-- VIZ: Solution point on a number line

Add to the existing equation solver (ax + b = c interactive).
Below the answer box, show a horizontal number line spanning from
approximately (solution − 8) to (solution + 8), with integer tick marks.
A filled circle in accent teal (#0d9488) marks the solution's position.

When the reader changes any slider, the dot animates smoothly to the
new position (CSS transition, ~300ms). Label the dot with "x = [value]"
above it.

If a = 0 (no solution), the number line is hidden entirely.

Size: full-width SVG, 60px tall. No y-axis, no additional labels.
The point is to show the answer as a *location*, not to teach number
lines — that is Vol 1's job.
-->
```

**[OPPORTUNITY 2] — Multiple representations of the same equation** (after worked Example 2, the streaming services problem)

*Concept geometry:* Example 2 (Service A: £8 + 2f, Service B: £18) is begging to be shown as two lines crossing. The prose mentions "above 5 films, Service B is cheaper" but never shows the picture. This is the first natural moment in the volume to show that an equation is a line — connecting Ch 1 directly to Ch 4.

*Interaction:* Show the two expressions as functions of f plotted on a coordinate plane. The x-axis is films per month (0 to 10), the y-axis is cost (£0 to £25). Line A (solid, teal) and Line B (solid, purple). A vertical dashed line drops from the intersection to the x-axis, labelled "f = 5 — same cost". To the left of the intersection, shade the region under Line A (cheaper to use A); to the right, shade under Line B.

*Response:* If the reader can adjust the fixed costs and per-film costs with sliders, the crossing point moves and the labels update. But even static, this image is essential.

*Builds on:* nothing yet — this is the first seed of the "equation as line" idea that Ch 4 develops fully.

```
<!-- VIZ: Two-cost comparison graph — where equations meet

Show two linear functions on a coordinate plane:
  - Service A cost: y = 2x + 8  (teal, #0d9488, solid)
  - Service B cost: y = 18       (purple, #7c3aed, solid)
  x-axis: "Films rented per month", range 0–10, integer ticks
  y-axis: "Monthly cost (£)", range 0–25, integer ticks

Mark the intersection point (5, 18) with a filled dot (amber, #f59e0b),
labelled "(5, £18) — same cost".

Draw a vertical dashed line from (5, 18) down to (5, 0).

Left of x = 5: light teal background fill (opacity 0.08) with text "A cheaper"
Right of x = 5: light purple background fill (opacity 0.08) with text "B cheaper"

Controls (optional, implement if time allows):
  - Slider for Service A's per-film rate (£0 – £5, step £0.50)
  - The intersection and shading update live

No y = mx + b label yet — the reader has not met slope-intercept form.
Simply show that the picture tells you something the equations don't
make immediately obvious: *where* one becomes better than the other.
This is a seed, not a full introduction to graphing.
-->
```

---

### Visual threads

**[THREAD 1] — Number line → balance → position of solution**

This chapter is the first to place a *specific* point on the number line (the solution). Vol 1 established the number line as an ordering device. Ch 1 should establish it as a *locating* device — "x = 5 is here". Ch 2 extends this to a region ("x < 5 is everywhere left of here"). Ch 4 extends the line into a plane. The balance in Ch 1 is the bridge between the two: the solution is where the scales tip to level, and where the line is pierced.

The viz-artist should ensure the number line fragment in Ch 1 uses exactly the same visual style (axis weight, tick marks, label font size, teal dot) as Ch 2's number line and Ch 4's x-axis. They are the same object at different scales of zoom.

**[THREAD 2] — Equations as geometric objects (seed)**

Opportunity 2 above plants the seed, but does not develop it. The full flower is Ch 4. The visual language introduced here — two lines on axes with an intersection labelled — should be visually recalled in Ch 4's "systems of equations" callout.

---

### Series-level design notes

The reference implementation's D3 balance SVG uses hardcoded geometry constants (BEAM_Y, PAN_Y etc.) with no responsiveness mechanism. This is fine for a prototype but the viz-artist should audit whether the viewBox and `max-width` approach is consistently applied across all Vol 2 interactives when implementing new ones.

The colour palette in use: teal (#0d9488) for primary interactive elements, grey (#374151) for structural elements, amber (#f59e0b) for highlights. Purple (#7c3aed) appears in Ch 3 and Ch 4. Establish now that purple is reserved for *geometric* overlays (the second axis, the vertical component of the step, the second line) and teal for *algebraic* elements (the active equation, the solution). This distinction, if maintained, will reward attentive readers throughout the series.

---
---

## Chapter 2 — Inequalities

### Visual register: Adequate

Two interactives exist and are implemented. The number-line explorer is genuinely strong. The inequality solver with live number line is adequate. The gap is the sign-flip rule — the single most surprising piece of mathematics in this chapter — which has no visual treatment at all. The moment of the flip deserves to be *felt*, not just explained in a callout box.

---

### Existing implemented interactives

| # | Location | Description | Assessment |
|---|----------|-------------|------------|
| 1 | After "Reading the solution on a number line" | **Number line inequality explorer** — slider for boundary value, dropdown for symbol; shaded region and open/closed circle update live. | **Strong** |
| 2 | After worked Example 4 | **Inequality explorer** — sliders for a, b, c plus symbol dropdown; stepwise solution and live number line. | **Strong** |

Both interactives are well-executed and serve their purpose. No rewrites needed.

---

### Missed opportunities

**[OPPORTUNITY 1] — The sign-flip rule made visible** (immediately before or after the "Sign-flip rule" callout box)

*Concept geometry:* Multiplying by −1 is a reflection of the entire number line across zero. Everything to the right of zero goes left; everything to the left goes right. The ordering reverses because left and right have swapped. This is the *native geometry* of the rule — it is not a trick, it is what reflection does.

*Interaction:* The reader drags a slider for a multiplier from −3 to 3 (step 1, skipping 0). A number line shows two initial points: A = 3 and B = 7. A labelled arrow shows the inequality "A < B" (3 is left of 7). When the multiplier is negative, the two points animate to their new positions (−3 × multiplier and −7 × multiplier for multiplier = −1 gives −3 and −7, with −7 now to the left). The arrow label flips to "A > B". The background of the negative-multiplier region turns a warm amber — not red (a warning) but amber (an important note, consistent with the series palette).

*Response:* As the slider moves through negative values, the two points swap sides and the inequality direction flips live. A text label beneath reads "Multiplying by a negative number reflects the line — the order reverses."

*Builds on:* Ch 1's number line fragment (position of solution). Extends the thread: the number line is not just a measuring tool — it has direction, and reflection changes direction.

```
<!-- VIZ: Sign-flip as reflection on the number line

Show a number line, range −20 to 20, with two labelled points:
  A (teal circle, #0d9488): initially at position 3
  B (purple circle, #7c3aed): initially at position 7

Above the number line, show a comparison label: "A [</>] B" with the
correct symbol, updating live.

Below the number line, show the positions as "A = 3 × k = [value]" and
"B = 7 × k = [value]" where k is the current multiplier.

CONTROL: A horizontal slider for multiplier k, range −3 to 3, step 1,
skipping 0 (snap from −1 directly to 1). Label: "Multiply both sides by k".

BEHAVIOUR:
- k > 0: A is left of B (3k < 7k for positive k). Inequality sign shows "<".
  Background of the number line region is neutral (white or very light grey).
- k < 0: A is right of B (3k > 7k for negative k, since 3k is less negative).
  Inequality sign FLIPS to ">". Background of the line region turns amber
  (#fef3c7, very light, so the flip is noticeable but not alarming).
  A label appears: "k is negative — the order reverses".

Points animate smoothly (CSS transform, ~250ms) when k changes.

Label each point with its current value (3k, 7k) updating live.

Beneath the interactive, in grey text (not a callout):
"This is why multiplying by a negative reverses the inequality —
it reflects every value through zero, swapping left and right."

Builds on: Ch 1's number line dot. Extends the thread: the number line
has orientation, and reflection reverses it.
-->
```

**[OPPORTUNITY 2] — The compound inequality as a segment** (after the prose section on compound inequalities, before worked examples)

*Concept geometry:* A simple inequality is a ray — it goes on forever in one direction. A compound inequality is a segment — it has two endpoints, and the solution is a finite stretch of the line. This is visually different in a meaningful way: the first time a solution has a *bounded shape*. The existing number line explorer handles simple inequalities well but the compound case is only mentioned in prose.

*Interaction:* Minimal. Show a number line. Two draggable handles: a left boundary (initially at −2) and a right boundary (initially at 4). Dropdowns for the left symbol (< or ≤) and right symbol (< or ≤). The segment between them shades teal. Open/closed circles at each end update with the symbol choice. Below the number line, the compound inequality is written out as a live LaTeX expression: `−2 < x ≤ 4`.

*Response:* Dragging either handle moves the boundary; the inequality statement updates.

*Builds on:* The number line explorer in this chapter. Extends: two boundaries give a bounded solution, prefiguring the two intercepts of a line in Ch 4.

```
<!-- VIZ: Compound inequality as a segment

Show a number line, range −10 to 10.
Two boundary points: left (initially at −2) and right (initially at 4).
Both are draggable (HTML input[type=range] or drag on SVG).

Controls:
  - Left boundary slider, range −10 to 10, step 0.5. Label: "Left boundary"
  - Left symbol selector: "<" or "≤". Label: "Left symbol"
  - Right boundary slider, range −10 to 10, step 0.5. Label: "Right boundary"
  - Right symbol selector: "<" or "≤". Label: "Right symbol"

The segment between the two boundaries fills with teal (#0d9488) at opacity 0.3.
Left boundary: open circle (white fill, teal stroke) for "<", filled teal circle for "≤".
Right boundary: same logic.

Below the number line, show the compound inequality in full as a text string
(or KaTeX), e.g., "−2 < x ≤ 4", updating live.

If left boundary >= right boundary, show a warning: "Left boundary must be
less than right boundary" and empty the shading.

Ticks at every integer. Axis extends slightly beyond the boundaries with arrows.
-->
```

---

### Visual threads

**[THREAD 1] — Number line as a region (continuation from Ch 1)**

Ch 1 shows the number line as a locating device (one point). Ch 2 should visibly build on this: the solution is now a ray or a segment, not a point. The same visual style (same axis design, same teal for the solution region) should be used. The reader should feel the number line *expand* — from a dot to a filled ray to a bounded segment.

**[THREAD 2] — Constraints and feasible regions (forward thread to Vol 7 Optimisation)**

The compound inequality of Ch 2 is the 1D version of a feasible region. In Vol 7 Optimisation, feasible regions are 2D (intersections of half-planes defined by linear inequalities). The visual vocabulary established here — boundary, included/excluded endpoint, shaded region on one side — will be the foundation of that treatment. Ensure Ch 2's visual style for "shaded region" (teal fill at low opacity, open/closed boundary marker) can be extended naturally to 2D in Vol 7.

---

### Series-level design notes

The existing number line explorer and inequality explorer are correctly styled and well-implemented. The sign-flip opportunity is the single highest-priority addition: it is the most commonly misunderstood rule in this chapter, and a visual treatment makes its logic inescapable. The compound inequality segment is secondary but serves the visual thread clearly.

---
---

## Chapter 3 — Patterns and Sequences

### Visual register: Adequate (borderline Rich)

Two implemented interactives: the arithmetic dot plot and the arithmetic/geometric toggle dot plot. Both are competent. The arithmetic dot plot correctly shows that points fall on a straight line, and the toggle between arithmetic and geometric makes the shape difference immediate. The gap is the *function reading* — the chapter's stated climactic idea that "a sequence is a function" — which has no visual reinforcement beyond the dot plot, and the dot plot does not make the function idea explicit.

---

### Existing implemented interactives

| # | Location | Description | Assessment |
|---|----------|-------------|------------|
| 1 | After "The nth term formula" (arithmetic) | **Arithmetic sequence builder** — sliders for a₁ and d; dot plot of first 10 terms; dashed connecting line. | **Strong** |
| 2 | After the nth term formula (geometric) | **Sequence explorer** — toggle arithmetic/geometric; sliders for a₁ and parameter; dot plot with colour change. | **Strong** |

Both interactives are well-made. The use of colour — teal for arithmetic, purple for geometric — is a good convention. No rewrites needed.

**One minor note on interactive 1:** the dashed connecting line between dots risks suggesting the sequence is continuous. For arithmetic sequences — which are discrete — the dashes partially mitigate this, but a brief label would help: "the dots are the sequence; the line just shows alignment". Interactive 2 (geometric) uses a solid line for geometric and dashes for arithmetic — which is the reverse of what would be intuitive, since geometric terms suggest a curve while arithmetic terms suggest a line. Consider: arithmetic = dashed; geometric = curved dashed (or no connecting line at all for geometric, only dots). Not a required change, but worth the viz-artist noting.

---

### Missed opportunities

**[OPPORTUNITY 1] — The sequence as a function: input → rule → output** (after "Sequences as functions")

*Concept geometry:* The section "Sequences as functions" makes the critical claim: a sequence is a function, position determines value. This is the conceptual payload of the entire chapter. But the existing dot plots show position on x and value on y without making the *machine* explicit — you put in n, you get out aₙ. A function machine diagram would complete this.

*Interaction:* A simple "function machine" illustration. A box labelled with the current formula (e.g., "aₙ = 3n + 2"). On the left, an input field where the reader types a position n (1–20). On the right, the output aₙ appears. Below the machine, the dot on the existing dot plot highlights — the machine and the plot update together, showing that the formula IS the plot.

*Response:* When n changes, the output updates and the corresponding dot on the plot glows (amber, #f59e0b, larger radius for ~1 second then fades back). The formula displayed in the machine updates when a₁ and d (or r) change.

*Builds on:* The arithmetic and geometric dot plots already in this chapter. Forward thread: this "function machine" concept is exactly what Vol 3 formalises as a function. The viz-artist should use a visual motif (the labelled box with arrow in, arrow out) that Vol 3 can echo and extend.

```
<!-- VIZ: Sequence as a function machine

Show two panels side by side (or stacked on narrow screens):

LEFT PANEL — Function machine:
  An arrow entering a box from the left.
  The box is labelled with the current nth-term formula.
    - Arithmetic: "aₙ = [a1] + (n − 1) × [d]"
    - Geometric: "aₙ = [a1] × [r]^(n−1)"
  (Formula text updates when the parameter sliders change.)
  An arrow exiting the box to the right.
  
  Above the entering arrow: a text input labelled "Position n", range 1–20.
  The reader types a number or uses a stepper.
  
  Below the exiting arrow: the computed value displayed in bold teal.
  Label: "aₙ =", then the value.

RIGHT PANEL — Dot plot (reuse the existing sequence explorer):
  The dot corresponding to the current n glows amber (#f59e0b), r = 8,
  with a brief CSS pulse animation (expand to r=11, then return to r=8
  over 600ms). All other dots remain in the standard teal/purple.

ADDITIONAL ELEMENT — A label below both panels:
  "Put in a position — get out a value. That is a function."

Style:
  - The function-machine box: rounded rectangle, stroke #d1d5db, fill #f9fafb.
  - Input arrow: #9ca3af, medium weight.
  - Output arrow: #0d9488 (teal), heavier weight, showing the output is what matters.
  - Formula text inside box: monospace or slightly bolder, #374151.

This interactive is intentionally simple — its purpose is conceptual, not exploratory.
The reader should finish it understanding that "aₙ = 3n + 2" is a machine that takes n
and returns a value, not just a formula to memorise.

Builds on: the arithmetic and geometric dot plots earlier in this chapter.
Forward thread: Vol 3 Ch 4 "Functions and relations" should visually echo
this machine diagram as its opening image.
-->
```

**[OPPORTUNITY 2] — Arithmetic vs geometric: the long run** (after "Telling them apart")

*Concept geometry:* The comparison table says "on a graph it looks like: a straight line / a curve". The existing sequence explorer shows both, but over only 10 terms. The dramatic difference between arithmetic and geometric growth — the one that makes the chain message example in the hook genuinely alarming — only becomes visible over a longer run.

*Interaction:* Extend the existing toggle plot to 20 terms, and add a "Zoom out" button that changes the y-axis scale. When geometric growth with r > 1 is active and the reader zooms out, the early terms of the geometric sequence compress to near-zero against the later ones. This visceral rescaling is pedagogically important: it shows *why* the curve is called exponential and why the early terms are misleading.

*Response:* "Zoom out" doubles the y-axis range. "Zoom in" returns to the comfortable view. With arithmetic, zoom does nothing dramatic (the points just spread further apart). With geometric and r > 1, the first few terms look almost flat; the later ones dominate.

*Builds on:* The existing sequence explorer interactive.

```
<!-- VIZ: Extend the sequence explorer with a "Zoom out" control

Add to the existing geometric/arithmetic toggle dot plot:

1. Increase N from 10 to 20 terms.

2. Add a "View" toggle with two options:
   - "Fitted" (default): y-axis auto-scales to show all points comfortably.
   - "Long view": y-axis is fixed at 0 to max(terms) × 3, so early terms
     compress and later ones dominate the view.

3. Add a text annotation that appears only in "Long view" when geometric is active
   and r > 1:
   "The early terms look almost flat — geometric growth hides until later."

4. In "Long view", the y-axis ticks adjust to appropriate round numbers
   (powers of 10 or multiples of 100).

This change is additive — no existing behaviour needs to be removed.
The purpose is to give the reader the experience of scale that the
"viral growth" hook in the prose promises.
-->
```

**[OPPORTUNITY 3] — Position-to-value: the bridge to Ch 4** (at the transition prose before "Where this goes")

*Concept geometry:* The prose says: "For an arithmetic sequence, $a_n = 3n + 2$. That last form should look familiar. It's a linear expression." This is the explicit moment when a sequence formula becomes a graphable line. A small static illustration showing the sequence dots *and* the continuous line through them — with a note "the line is the formula extended to all real numbers; the dots are the sequence" — makes this transition concrete.

*Interaction:* Minimal. Show the arithmetic sequence dots (from the existing explorer, teal) and overlay a semi-transparent continuous line in the same teal. A toggle button "Show the line" / "Hide the line" allows the reader to add/remove the continuous version. Text below: "Every arithmetic sequence is a slice of a line — only at integer positions."

*Response:* Toggle shows/hides the continuous line.

*Builds on:* The arithmetic dot plot. Forward thread: this image should be recalled explicitly in Ch 4, where the continuous line is the main object and the discrete dots appear as a special case.

```
<!-- VIZ: Sequence dots and the line through them

Use the arithmetic sequence dot plot (a₁ and d sliders, 10 terms).
Add a toggle button: "Show the line through these points".

When toggled ON:
  - Draw the continuous line y = a₁ + (n − 1)d extended across the full
    x-range (n from 0 to 11), in teal (#0d9488) at opacity 0.35, stroke-width 1.5.
  - A label appears near the right end of the line:
    "All real n — the continuous version"
  - The dots remain visible and fully opaque.

When toggled OFF:
  - The line fades out (CSS opacity transition).

The key visual insight: the dots are *on* the line. An arithmetic
sequence is a function that only fires at integer positions.

Below the plot (always visible):
"Every arithmetic sequence is part of a line. Ch 4 will show you the
whole line — not just the integer steps."

This is a forward hook, not a full treatment. Keep it simple.
-->
```

---

### Visual threads

**[THREAD 1] — Dots on a grid becoming a continuous line**

This is the central visual thread of Vol 2. Ch 3's discrete dots prefigure Ch 4's continuous lines. The transition visual (Opportunity 3) is the hinge. The viz-artist should ensure:
- Ch 3's dots use the same teal (#0d9488) as Ch 4's lines.
- Ch 3's x-axis labelling ("Position n") uses the same axis style as Ch 4's x-axis ("x").
- The grid in Ch 3's dot plot uses the same grid style (light grey lines, #f3f4f6) as Ch 4's coordinate plane.

The reader should arrive at Ch 4 and think: "I've seen this grid before."

**[THREAD 2] — Colour coding: teal for linear/arithmetic, purple for geometric/curved**

This chapter establishes teal = arithmetic = linear = straight, purple = geometric = exponential = curved. This convention should be maintained throughout the series: teal for linear functions and straight-line objects, purple for exponential/curved objects. When Vol 4 introduces functions formally, this colour memory will help orient readers.

**[THREAD 3] — Sequences → series → convergence (forward thread to Vol 4 and Vol 5)**

The geometric sequence with r < 1 (e.g., the bouncing ball) contains a hidden idea: the terms get smaller and smaller and approach zero. The running sum of those terms approaches a finite limit. This is the germ of convergence, which Vol 5 (Limits) and Vol 4 (Sequences and Series) develop. Ch 3 should not introduce this concept — but the viz-artist should design the interactive so that r = 0.5 with 20 terms visibly approaches zero. The reader who notices this and wonders "does it ever reach zero?" has already asked Vol 5's first question.

---

### Series-level design notes

The chapter's visual quality is already above the series average for this volume, primarily due to the well-implemented dot plots. The function machine (Opportunity 1) is the highest priority addition — it is the conceptual bridge that the chapter's own prose demands. The "show the line" toggle (Opportunity 3) is the visual thread that pays off in Ch 4. Both should be implemented before this chapter reaches `review` status.

---
---

## Chapter 4 — Graphing Relations

### Visual register: Adequate (close to Rich)

Three interactives are implemented: the coordinate plane explorer (click to place points), the linear graph builder (slope and intercept sliders), and a complete exercise stepper system. The chapter has reasonable visual richness. The critical gap is that the **origin story of this chapter** — the coordinate plane appearing for the first time as the grown-up version of the number line — is handled only in prose. The upgrade from one axis to two is the most visually important moment in all of Vol 2, and it has no dedicated interactive.

---

### Existing implemented interactives

| # | Location | Description | Assessment |
|---|----------|-------------|------------|
| 1 | After "The coordinate plane" | **Coordinate plane explorer** — click to place a point; horizontal and vertical arrows show the path from origin; coordinate label updates. | **Strong** |
| 2 | After "Method 3: Finding the equation from a point and a slope" | **Linear graph builder** — sliders for m and b; line y = mx + b redraws live; slope triangle shows rise/run; y-intercept marked. | **Strong** |

Both are well-implemented. The coordinate plane explorer's use of two coloured arrows (teal for x-movement, purple for y-movement) elegantly recalls the two-colour convention from Ch 3. This is exactly the right kind of visual continuity. The linear graph builder's slope triangle in amber is clear and useful.

**One weak point in the linear graph builder:** the equation label appears as text (e.g., "y = 2x + 3") but is not rendered in KaTeX. This is inconsistent with the exercise steppers throughout the chapter, which do use KaTeX. The viz-artist should render the equation label using KaTeX in the SVG overlay, or position a KaTeX element above/below the SVG. This is a polish item, not a structural problem.

---

### Missed opportunities

**[OPPORTUNITY 1] — The number line growing into the coordinate plane** (as the chapter's opening visual, before "The coordinate plane" prose section)

*Concept geometry:* The visual thread of the volume reaches its conclusion here: the number line from Vol 1, used as a balance in Ch 1 and a region in Ch 2 and a discrete grid in Ch 3, now gains a second dimension. This moment deserves a dedicated visual that shows the *transformation*, not just the result.

*Interaction:* An animation (auto-playing or triggered by a "Show me" button). Phase 1: a familiar number line (identical visual style to Ch 1 and Ch 2) sits horizontally. A label "From Vol 1: the number line". Phase 2: a second number line grows upward from the origin, rotating 90 degrees from horizontal to vertical. The horizontal line gains an "x" label; the new vertical line gains a "y" label. Grid lines fill in. Phase 3: the familiar teal dot from Ch 1 (the solution point) appears at a position on the x-axis, labelled "this was the solution". It then lifts off the axis and moves up to a position in the plane, labelled "now it's a point in the plane". Text: "One dimension → two dimensions."

*Response:* The animation plays once, then loops or waits for a "Replay" button.

*Builds on:* Ch 1's solution dot on the number line, Ch 2's shaded region, Ch 3's discrete dot plot grid. This is the explicit payoff of the visual thread.

```
<!-- VIZ: The number line becoming the coordinate plane

A three-phase animation, triggered by a "Begin" button (or auto-plays).

PHASE 1 (0–1s):
  Draw a horizontal number line, range −5 to 5.
  Style: identical to Ch 2's number line (same stroke weight, same ticks,
  same grey colour #9ca3af).
  Label it "x" at the right end.
  Place a teal dot (#0d9488) at position 3 on the line.
  Label below dot: "x = 3".
  Text below the line: "The number line you know from Vol 1."

PHASE 2 (1–2.5s):
  A new number line appears, initially horizontal, then rotates to vertical.
  Use a CSS/D3 transform-origin at the origin (x=0 position on the horizontal line).
  As it rotates to vertical, the "y" label appears at the top.
  Grid lines fade in: vertical lines from x = −5 to 5, horizontal lines from y = −5 to 5.
  The grid is the same light grey as Ch 3's dot plot grid (#f3f4f6).
  Text updates: "Add a vertical axis. Now every point has two coordinates."

PHASE 3 (2.5–4s):
  The teal dot at x = 3 lifts off the x-axis, animating upward to position (3, 4).
  A dashed teal line traces the path (vertical segment from (3,0) to (3,4)).
  A dashed purple line shows the horizontal component from origin to (3,0).
  The dot settles at (3, 4) with a label "(3, 4)".
  Below the original x = 3 label: "x = 3 was its address on one line."
  New label near (3, 4): "(3, 4) is its address on the plane."

REPLAY button appears after phase 3.

Colours:
  - x-axis arrow: teal (#0d9488)
  - y-axis arrow: purple (#7c3aed)
  - Grid: #f3f4f6 (same as Ch 3)
  - Solution dot: amber (#f59e0b) for the "lifted" point, to distinguish it from
    regular coordinate dots (which are teal from the coordinate explorer)

Duration: ~4 seconds total. Easing: ease-in-out for all movements.
-->
```

**[OPPORTUNITY 2] — Two lines crossing: the solution as intersection** (after worked Example 2 (phone plan) or as a standalone "intersection" section)

*Concept geometry:* The callout box near the end of the chapter mentions that two linear equations graph as two lines, and their intersection solves both simultaneously. This is the most important forward hook in the entire volume — it previews Vol 4's systems of equations, linear algebra, and ultimately all of engineering mathematics. It appears only in a callout box with no visual treatment.

*Interaction:* Show two lines on the coordinate plane with sliders. Line 1: y = m₁x + b₁ (teal). Line 2: y = m₂x + b₂ (purple). The intersection point (if within the view window) is marked with an amber dot and labelled "Solution: (x, y)". Below the graph, the two equations are shown, and the intersection values are substituted into both to verify.

*Response:* When the reader moves the slope/intercept sliders, the lines move and the intersection updates. If the lines are parallel (m₁ = m₂) the intersection dot disappears and a message appears: "Parallel lines — no intersection, no solution."

*Builds on:* The linear graph builder in this chapter. Forward thread: Vol 4 systems of equations, Vol 7 linear algebra.

```
<!-- VIZ: Two lines and their intersection

Show a coordinate plane, x: −5 to 10, y: −5 to 15.

LINE 1: y = m₁x + b₁, teal (#0d9488), stroke-width 2.
LINE 2: y = m₂x + b₂, purple (#7c3aed), stroke-width 2.

CONTROLS (four sliders):
  m₁: slope of Line 1, range −3 to 3, step 0.5, default 1. Label: "Slope of Line 1"
  b₁: y-intercept of Line 1, range −5 to 10, step 1, default 2. Label: "y-intercept of Line 1"
  m₂: slope of Line 2, range −3 to 3, step 0.5, default −1. Label: "Slope of Line 2"
  b₂: y-intercept of Line 2, range −5 to 10, step 1, default 8. Label: "y-intercept of Line 2"

INTERSECTION LOGIC:
  If m₁ ≠ m₂: intersection at x* = (b₂ − b₁) / (m₁ − m₂), y* = m₁x* + b₁.
    - If (x*, y*) is within the view window, mark with an amber circle (#f59e0b),
      labelled "(x*, y*)" with values to 1 decimal place.
    - Below the graph, show:
        "Line 1:  y = m₁x* + b₁ = [computed]  ✓"
        "Line 2:  y = m₂x* + b₂ = [computed]  ✓"
        "Both equations give the same value at x = x*. That point is the solution."
  If m₁ = m₂ (parallel):
    - No dot. Message below graph: "The lines are parallel — they never cross.
      No value of x satisfies both equations at once."
  If m₁ = m₂ and b₁ = b₂ (same line):
    - Lines coincide. Message: "The lines are the same — every point on the line
      satisfies both equations. Infinitely many solutions."

Equation labels on the graph (near the right end of each line):
  "y = [m₁]x + [b₁]" in teal
  "y = [m₂]x + [b₂]" in purple

This is the reader's first encounter with simultaneous equations as a
geometric object. The intersection is not just a calculation — it's a place.
-->
```

**[OPPORTUNITY 3] — Connecting Ch 3 dots to Ch 4 lines** (after "A note on curves" or near the callout about sequences)

*Concept geometry:* The chapter mentions in passing that an arithmetic sequence produces a straight-line graph. Ch 3 Opportunity 3 introduced the idea of "dots and the line through them". Ch 4 should visually complete that bridge: show the same arithmetic sequence dots from Ch 3, then extend the graph to show the continuous line, and allow the reader to compare.

*Interaction:* A small panel showing the Ch 3 sequence (arithmetic dots, teal) alongside the continuous line y = dx + (a₁ − d) that passes through them. Two sliders: a₁ and d (identical to Ch 3's sequence explorer). A toggle: "Show sequence (dots)" / "Show relation (line)".

*Response:* When "Show relation" is active, the dots remain but become smaller and partially transparent; the continuous line dominates. When "Show sequence" is active, the reverse. The formula displayed switches between "aₙ = a₁ + (n − 1)d" and "y = dx + (a₁ − d)".

*Builds on:* Ch 3 Opportunity 3 (line through the dots). This is the explicit visual payoff of that thread.

```
<!-- VIZ: From sequence to line — completing the thread from Ch 3

Show a coordinate plane, x: 0 to 12, y: 0 to (auto-scale from values).

CONTROLS:
  a₁: first term, range 1 to 20, step 1, default 3. Label: "First term a₁"
  d: common difference, range 1 to 5, step 1, default 4. Label: "Difference d"
  Toggle: "Sequence" (default) / "Relation"

"Sequence" mode:
  - Teal filled circles at integer n = 1 through 10, same style as Ch 3.
  - A faint dashed connecting line between dots (opacity 0.3).
  - x-axis labelled "n (position)".
  - Formula displayed: "aₙ = [a₁] + (n − 1) × [d]"

"Relation" mode:
  - Same dots, now smaller (r=3) and partially transparent (opacity 0.4).
  - A solid teal line y = [d]x + ([a₁] − [d]) drawn across the full width.
  - The line extends beyond n=1 and beyond n=10 (to show continuity).
  - x-axis relabelled "x".
  - Formula displayed: "y = [d]x + [a₁ − d]"  (simplified constant shown)

Annotation in "Relation" mode, near the line:
  "The same pattern — now extended to every real number"

This interactive completes the thread opened in Ch 3 and fulfils
the prose claim that arithmetic sequences are linear relations.
-->
```

---

### Visual threads

**[THREAD 1] — The coordinate plane as the culmination of Vol 2's visual arc**

The opening animation (Opportunity 1) is the payoff of the entire volume's visual thread. If only one new interactive is implemented across all four chapters, it should be this one. The reader who has seen the number line as a balance (Ch 1), as a region (Ch 2), and as a discrete grid (Ch 3) will find the coordinate plane *earned* rather than imposed.

**[THREAD 2] — Slope = rate of change (forward thread to differential calculus)**

The chapter explicitly seeds this: "You're already holding the seed of calculus in the phrase 'change in y over change in x'." The slope triangle in the existing graph builder already encodes rise and run. The forward thread to Vol 5 differential calculus should be visually foreshadowed: when the reader changes m in the graph builder, the slope triangle changes size. In Vol 5, that triangle will shrink toward a point, and the limiting ratio will be the derivative. No additional interactive needed here — but the viz-artist should ensure the slope triangle is the most visually prominent element in the graph builder (currently it is amber and visible, which is correct) and that its label always says "rise / run = m" not just individual measurements.

**[THREAD 3] — Intersection as the geometry of simultaneous equations**

The two-line intersection (Opportunity 2) is the last seed planted in Vol 2 for Vol 4's systems of linear equations and Vol 7's linear algebra. It should feel like a glimpse rather than a full treatment — the reader sees that two lines cross at one point and that this point is a solution, but the full machinery of solving systems comes later. Keep the visual simple: two lines, one dot, the substitution check.

**[THREAD 4] — The coordinate system as a mapping**

The coordinate plane explorer's two-arrow path from origin to point (teal horizontal, purple vertical) is the first appearance of the idea that a point is described by *two independent measurements*. This is the seed of vectors (Vol 7 linear algebra) and of parametric equations. The viz-artist should note that in Vol 7, the same two-arrow motif will be used to show vector addition. Keep the arrow style (dashed, annotated, colour-coded by axis) consistent so that readers recognise it when it reappears.

---

### Series-level design notes

The exercise in Chapter 4 asking students to compare two phone plans (Exercise 7, y = 4x + 5 and y = 2x + 15) notes "the graph has been removed". This is intentional, but it is a missed opportunity: the viz-artist could provide the graph as a *reveal*, so the reader who solves algebraically can then check their answer by pressing "Show the graph" and seeing the intersection at x = 5. This is a low-cost addition that reinforces the algebra-geometry connection that is the theme of the entire volume.

The `makeStepperHTML` function is duplicated verbatim in all four chapter files. This is a maintenance concern as the series grows. Before the series reaches `final` status, the viz-artist should extract this into a shared Quarto include or a module loaded once per volume. This is a technical note for the viz-artist, not a design issue.

---
---

## Volume-level design summary

### The visual thread: status assessment

| Chapter | Thread moment | Status |
|---------|--------------|--------|
| Ch 1 | Number line as balance; solution as point | Partial — balance exists but solution-as-point not yet linked to number line |
| Ch 2 | Number line as region (ray, segment) | Strong — number line explorer is well-implemented |
| Ch 3 | Discrete dots on a grid | Strong — dot plots are well-implemented; function-machine bridge missing |
| Ch 4 | Continuous line on a coordinate plane | Strong for plane; origin story (number line → plane transformation) missing |

### Priority ranking for viz-artist implementation

1. **Ch 4 Opportunity 1** — The number line becoming the coordinate plane. This is the visual climax of the volume. No other single interactive would do more to give the reader the sense that algebra *is* geometry.

2. **Ch 2 Opportunity 1** — The sign-flip rule as reflection. The most common source of errors in this chapter; the visual makes the rule inevitable rather than arbitrary.

3. **Ch 1 Opportunity 1** — The balance animation with a proper "settle at solution" payoff. The existing balance is static; it needs to tip and level.

4. **Ch 3 Opportunity 1** — The function machine. This is the conceptual bridge from "sequence" to "function" and must exist before the chapter reaches `review` status.

5. **Ch 4 Opportunity 2** — Two lines crossing. Forward hook to Vol 4 and Vol 7. Secondary, but the callout that references it in prose without a visual is currently a promise the chapter does not keep.

6. **Ch 1 Opportunity 2** — Two-cost comparison graph. Seeds the "equation as line" idea early.

7. **Ch 3 Opportunity 3** / **Ch 4 Opportunity 3** — Dots and line bridge. These two should be implemented together as a visual echo across chapters.

8. **Ch 2 Opportunity 2** — Compound inequality segment. Clean and useful; lower priority than the sign-flip.

### Colour and style consistency rules for viz-artist

- **Teal (#0d9488)**: primary algebraic elements — equations, solution points, arithmetic sequences, lines.
- **Purple (#7c3aed)**: secondary/geometric elements — the vertical axis component, geometric sequences, the second line in a two-line system, the y-arrow in coordinate navigation.
- **Amber (#f59e0b)**: highlights and annotations — the slope triangle, the currently-selected dot, the intersection point, the solution moment.
- **Warm amber (#fef3c7 background)**: the sign-flip warning context. Not red (danger) — amber (important note).
- **Grey (#9ca3af)**: axes, tick marks, structural elements.
- **Dark (#374151)**: prose-adjacent labels, structural SVG elements.

All SVGs: `viewBox` set, `width: 100%`, `max-width` capped at 560px (or 500px for square plots). `font-family: inherit`. No hardcoded pixel font sizes below 10px (accessibility).

The `makeStepperHTML` function should be extracted to a shared include before the volume reaches `final` status.
