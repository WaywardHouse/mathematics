# Senior Designer Brief — Volume 6 (Probability and Data)

**Auditor:** senior-designer agent
**Layer:** pre-university (Alberta Gr 11–12), readers age 16–18
**Audit scope:** Vol 6 Ch 1–4 (complete, fresh run)
**Date:** 2026-04-01

---

## Preamble

Vol 6 is the probability and data volume. Its four chapters carry one of the heaviest visual debts in the series, because every visual idiom introduced here is load-bearing for Vol 7 (engineering mathematics probability, regression, inference) and Vol 8 (estimation, reliability, Kalman filtering). Three inheritance obligations are specific and non-negotiable:

1. **"Distribution as landscape"** — the probability distribution as a shaped curve where area = probability. Introduced here in Ch 2; inherited by Vol 7 probability, Vol 7 Fourier (frequency domain as a distribution), Vol 8 Kalman filtering (Gaussian state estimate as a moving distribution).

2. **"Conditional probability as zooming"** — conditioning restricts the sample space; Bayes' theorem is an update in probability-space. Introduced here in Ch 1; inherited by Vol 7 Bayesian sections, Vol 8 posterior update / uncertainty band visuals.

3. **"Scatter cloud as correlation"** — the elongated ellipse as the geometric signature of linear association. Introduced here in Ch 4; inherited by Vol 7 regression (covariance matrix as a field of ellipses), Vol 8 error propagation.

**State of the chapters upon audit:** The viz-artist has already implemented substantial interactives in all four chapters without prior design direction. None of the interactives have `<!-- VIZ: -->` placeholders — they were coded directly. The audit therefore catalogues and rates the existing implementations, then identifies what is missing.

---

---

## Chapter 1 — Probability Theory

### Visual register: **Adequate → Barren**

The chapter has two implemented interactives (medical test table, independence table). Both are numerically functional. Neither visualises the geometry of probability. The foundational concepts — sample space, union, intersection, complement, conditional probability, independence, Bayes — are introduced entirely in symbols and tables. These concepts are intrinsically geometric. The geometry is absent. The chapter fails to establish the visual vocabulary that every subsequent chapter (and Vol 7) depends on.

---

### Existing interactives (no VIZ placeholders present — viz-artist coded directly)

**Interactive 1 — Medical testing contingency table**
Location: After Rule 3 / conditional probability definition, before Rule 4.
Description: Four sliders (population size, disease prevalence, test sensitivity, test specificity). Outputs: a live 2×2 contingency table; a prominent PPV display (green callout box); a low-prevalence warning (amber box when prevalence < 5%).

| # | Assessment | Action |
|---|-----------|--------|
| 1 | **Adequate** | Keep with design note |

*Detailed assessment:* The table correctly instantiates the conditional probability arithmetic. The low-prevalence warning is a thoughtful touch. However, the interactive is a table, not a visualisation. It shows that the numbers change; it does not show *what conditional probability looks like*. The "you are now restricted to the top row" insight — the geometric act of conditioning — is entirely absent. The reader adjusts sliders and reads numbers. They do not see the sample space narrowing.

*Action:* Keep. Pair with OPPORTUNITY 3 (conditional probability zoom), which provides the geometric counterpart.

---

**Interactive 2 — Independence probability grid**
Location: After Rule 5 / independence definition, before Bayes' theorem.
Description: Three controls: P(A) slider, P(B) slider, relationship type radio (Independent / Positively correlated / Negatively correlated). Outputs: a three-card comparison showing P(A∩B) under each mode; a 2×2 probability table for the selected mode; an explanatory note.

| # | Assessment | Action |
|---|-----------|--------|
| 2 | **Weak** | Replace table with rectangle diagram |

*Detailed assessment:* The concept geometry of independence is that the fraction of B that is also A equals the unconditional fraction of everything that is A. A table cannot show this. The "positively correlated" and "negatively correlated" modes are numerically interesting but visually inert — the reader sees a table cell update, not a relationship change. The native geometry of independence is the factorisation of a rectangle: if A occupies 30% of the horizontal axis and B occupies 40% of the vertical axis, and the overlap box is exactly 12% of the total area, the events are independent. This needs a Yule diagram (2D rectangle), not a 2×2 table.

*Rewritten brief:*

```
<!-- VIZ: Independence — replace table with 2D Yule rectangle
A rectangle representing the full sample space Ω. The horizontal axis is divided at P(A) (left strip = A, right strip = A^c). The vertical axis is divided at P(B) (lower strip = B, upper strip = B^c). The intersection box (bottom-left, area P(A)×P(B) when independent) is shaded in a distinct colour. Controls: P(A) slider [0.05–0.9], P(B) slider [0.05–0.9], relationship toggle (Independent / Positively correlated / Negatively correlated). In Independent mode, the overlap box has exactly area P(A)×P(B). In Positively correlated mode, the overlap box grows beyond P(A)×P(B). In Negatively correlated mode, it shrinks below.
Display: P(A∩B) = [value]. A note updates: "Independent: P(A∩B) = P(A)·P(B) = [value]×[value] = [value]" or "Positive correlation: P(A∩B) > P(A)·P(B)."
Caption: "Independence means the overlap box is exactly as big as it would be by coincidence. If A occupies 30% of the space and B 40%, and they are independent, the overlap is exactly 12%."
Thread: This Yule rectangle is the geometric basis of the multiplication rule for independent events, and directly precedes the Venn diagram treatment in OPPORTUNITY 2 below. -->
```

---

### Missed opportunities

**OPPORTUNITY 1 — The sample space as a rectangle** — After "Sample spaces and events" introduction, before Rule 1 (complement)

*Concept geometry:* The sample space Ω is the entire universe of possible outcomes. Draw it as a rectangle. An event A is a region inside it. P(A) is the fraction of the rectangle that A occupies. This is the geometric definition of probability, not a metaphor.

*Interaction:* A rectangle labelled Ω. Inside it, a draggable elliptical blob labelled A (series blue, opacity 0.4). The remainder (A^c) is lightly hatched or grey. Two labels update: P(A) = [fraction] and P(A^c) = 1 − P(A). The reader resizes A by dragging; both values update. A running label "$P(A) + P(A^c) = 1$" is always displayed.

*Response:* Enlarging A increases P(A), shrinks P(A^c), and the sum stays 1. The sum-to-one axiom is visually obvious.

*Builds on:* Establishes new thread. This is the first visual in the series vocabulary for probability.

```
<!-- VIZ: Sample space rectangle — P(A) as fraction of Ω
A rectangle labelled Ω (fill: light grey, border: series mid-grey). Inside it, a resizable elliptical region labelled A (fill: series blue, opacity 0.4, draggable boundary). The complement region A^c is lightly hatched (same fill, opacity 0.1). Two live labels: "P(A) = [0.00–1.00]" and "P(A^c) = 1 − P(A) = [value]". The constraint P(A) + P(A^c) = 1 is permanently displayed below. The reader drags the blob boundary to resize it. 
Caption: "The sample space Ω is the complete set of outcomes. Event A is any subset. Its probability is the fraction of Ω it occupies. The rest — where A does not happen — is the complement A^c."
Thread: This rectangle idiom is the visual foundation for all probability in Vols 6–7. Every subsequent visualisation of events, conditioning, and inference builds on it. -->
```

---

**OPPORTUNITY 2 — Venn diagram: union, intersection, complement** — After Rule 2 (addition rule)

*Concept geometry:* Two overlapping circles inside the Ω rectangle. Circle A, circle B. The union A∪B is both circles. The intersection A∩B is the overlap. The addition rule is a visual statement: you added A and B separately, but you counted the overlap twice.

*Interaction:* P(A) slider (controls circle A area), P(B) slider (controls circle B area), overlap slider (adjusts P(A∩B) within constraint ≤ min(P(A), P(B))). A toggle cycles shading through: A∪B (union), A∩B (intersection), A^c (complement of A). Below the diagram, the current form of the addition rule with numerical substitution is shown.

*Response:* When overlap slider is at zero, circles do not touch — mutually exclusive label appears, and the formula simplifies to P(A∪B) = P(A) + P(B). As overlap grows, the union shrinks. Each shading mode makes a set operation visible as a region.

*Builds on:* OPPORTUNITY 1 (rectangle = sample space).

```
<!-- VIZ: Venn diagram — union, intersection, complement
Two overlapping circles (A: series blue fill 0.3; B: series amber fill 0.3) inside a rectangle labelled Ω. Controls: P(A) slider [0.1–0.8, default 0.5], P(B) slider [0.1–0.8, default 0.4], overlap slider labelled "P(A∩B)" constrained to [0, min(P(A),P(B))]. A shading toggle cycles through three modes: (1) highlight A∪B (both circles, series blue+amber mix), (2) highlight A∩B (intersection only, series teal), (3) highlight A^c (everything outside circle A, grey).
Below the diagram: formula display with substituted values: "P(A ∪ B) = [P(A)] + [P(B)] − [P(A∩B)] = [result]"
When overlap = 0: label "Mutually exclusive — P(A ∪ B) = P(A) + P(B)."
Caption: "The addition rule corrects for double-counting the overlap. Each shading mode shows a different set operation as a coloured region."
Thread: Builds on OPPORTUNITY 1. Prerequisite for OPPORTUNITY 3 (conditional probability zoom). Inherited by Vol 7 probability wherever set notation is used. -->
```

---

**OPPORTUNITY 3 — Conditional probability as geometric zoom** — After the formula P(A|B) = P(A∩B)/P(B), before the 2×2 table

*Concept geometry:* This is the single most important visual in the chapter. P(A|B) restricts the sample space to B. In the Venn/rectangle picture: everything outside B fades out. The question becomes: what fraction of the surviving region (B) is also in A? That fraction is P(A∩B)/P(B). The formula is what you see when you zoom in.

*Interaction:* Start with the Venn diagram from OPPORTUNITY 2. Add a prominent "Condition on B →" button. When clicked: (1) the region outside B fades to near-invisible (grey, 10% opacity) over 600ms; (2) the B circle gently expands to fill the frame; (3) inside the new frame, the A∩B region is highlighted in blue. The probability display changes from P(A) to P(A|B) = P(A∩B)/P(B). A "Return to Ω" button restores the original view.

*Response:* Before conditioning: "P(A) = [value]." After conditioning on B: "P(A|B) = P(A∩B)/P(B) = [value]/[value] = [result]." If events are independent, zooming into B reveals the same proportion of A as before — P(A|B) = P(A). This is the geometric meaning of independence.

*Builds on:* OPPORTUNITY 1, OPPORTUNITY 2.

```
<!-- VIZ: Conditional probability — zoom into B
Starting from the Venn diagram in OPPORTUNITY 2. Add a prominent button "Condition on B →". On click, animate in three stages: (1) everything outside circle B fades to grey (opacity → 0.08) over 600ms; (2) circle B gently expands to fill the available frame (scale-up animation); (3) within the expanded B, the A∩B overlap region highlights in series blue; the non-A part of B is unshaded. Labels update: "Sample space reduced to: B only" and "P(A|B) = P(A∩B) / P(B) = [value] / [value] = [result]." An annotated callout draws an arrow from P(A∩B) label to the blue overlap region, and from P(B) label to the full B circle. A "Return to Ω" button reverses the animation.
Add a note below: "When P(A∩B) = P(A)·P(B) [independent events], P(A|B) = P(A) — zooming into B does not change A's proportion."
Caption: "Conditioning on B means 'given B happened.' Zoom into the B region. The fraction of B that A occupies is the conditional probability P(A|B)."
Thread: This zoom idiom is the geometric foundation of all conditional reasoning, Bayesian updating, and likelihood-ratio logic in Vol 7. When Vol 7 introduces likelihood ratios and posterior updates, it should explicitly invoke this zoom metaphor. Vol 8 Kalman filtering is this idiom applied repeatedly: each new measurement zooms the uncertainty landscape. -->
```

---

**OPPORTUNITY 4 — The probability axis [0,1]** — After Rule 1 (complement), as a conceptual orientation sidebar

*Concept geometry:* The interval [0,1] is the landscape the reader will live in for this entire volume and beyond. Impossible events sit at 0; certain events at 1. Bayesian updating is a point on this axis shifting in response to evidence.

*Interaction:* A horizontal number line from 0 to 1. Fixed anchor labels: "0 — impossible," "0.5 — even odds," "1 — certain." Example markers: 0.01 ("rare disease"), 0.30 ("rain today"), 0.50 ("fair coin flip"), 0.95 ("very reliable test"). A draggable dot. As the reader drags, a label shows the decimal value and a contextual phrase.

*Response:* Dragging produces phrases: below 0.05 ("quite rare"); 0.05–0.3 ("unlikely but possible"); 0.3–0.7 ("moderate probability"); 0.7–0.95 ("likely"); above 0.95 ("very likely"). [0, 0.5) shaded amber tint; (0.5, 1] shaded green tint.

*Builds on:* Establishes the probability axis thread. Ch 3 will use this axis to show where p-values and confidence levels live.

```
<!-- VIZ: The probability axis [0,1]
A horizontal number line spanning 0 to 1, full page width. Fixed anchor labels directly below the axis: "0 — impossible", "0.5 — even odds", "1 — certain". Four annotated example markers (small dots with labels above): 0.01 "rare disease", 0.30 "rain today", 0.50 "fair coin", 0.95 "reliable test". Background shading: [0, 0.5) in amber tint (10% opacity), (0.5, 1] in green tint (10% opacity). A draggable marker dot in series blue; dragging updates a label: "[value] — [contextual phrase]".
Caption: "Every probability lives on this axis. Impossible at 0, certain at 1. Everything else is somewhere between."
Thread: This axis is the visual coordinate system for all inference. Ch 3 should explicitly position p-values and confidence levels on this axis. Vol 7 probability should reference it when introducing probability measures. -->
```

---

### Visual threads — Ch 1

**THREAD 1 — Rectangle = sample space**
Introduced in OPPORTUNITY 1. Must be inherited by all Vol 7 probability material. Every treatment of conditioning in Vol 7 should use the rectangle and zoom idiom, not reinvent it with a table.

**THREAD 2 — Probability axis [0,1]**
Introduced in OPPORTUNITY 4. Must be visually echoed in Ch 2 (as the support of a distribution) and Ch 3 (as the axis where p-values and confidence levels live). Vol 7 probability chapters should reference it when introducing probability measures.

**THREAD 3 — Zoom-into-B for conditioning**
Introduced in OPPORTUNITY 3. Must be explicitly referenced in Vol 7 Bayesian sections. When Vol 7 introduces posterior distributions as updates on priors, it should show the zoom idiom again. When Vol 8 introduces the Kalman filter as a repeated Bayesian update, the geometric connection should be made explicit.

---

### Series-level design notes — Ch 1

The two existing interactives (medical test table, independence table) are numerically solid but geometrically silent. They compute the right answers without showing the reader what any of it looks like. The four opportunities above are not enhancements — they are the conceptual substrate that the existing interactives should rest on. The correct implementation order is: 1→2→3 (each builds on the prior); OPPORTUNITY 4 can be implemented in any order.

Priority for implementation: OPPORTUNITY 3 > OPPORTUNITY 2 > OPPORTUNITY 1 > replacement of Interactive 2 > OPPORTUNITY 4.

---

---

## Chapter 2 — Probability Distributions

### Visual register: **Adequate**

The chapter has two implemented D3 interactives: a binomial distribution explorer and a normal distribution explorer. Both are conceptually sound and functional. However, both are explorers of *parameters* — they let the reader shift μ and σ and watch the curve move. Neither establishes the prior conceptual layer: what a distribution *is* (probability spread as weight/mass/area), what the CDF is, or what it means to say a probability is an area rather than a height. The "distribution as landscape" thread that Vol 7 must inherit is present only partially.

---

### Existing interactives (no VIZ placeholders present)

**Interactive 1 — Binomial distribution PMF explorer**
Location: After the binomial formula derivation and mean/variance formulas.
Description: D3 bar chart. Controls: n slider [1–30], p slider [0.01–0.99], normal approximation toggle. Shows the PMF as bars, with μ and σ annotated in the top-right corner. When toggle is on, a dashed red normal curve overlays the bars.

| # | Assessment | Action |
|---|-----------|--------|
| 1 | **Strong** | Keep; add bar-click enhancement |

*Detailed assessment:* The normal approximation toggle is particularly effective — it shows the CLT in action as n grows. Watching the bars fill under the bell curve as n increases from 5 to 30 is the CLT demonstration done right. The μ/σ readout grounds the shape in its summary statistics. One missing element: the reader cannot click a specific bar to highlight P(X = k) explicitly and see the tail probability P(X ≥ k). This would begin building the CDF/tail vocabulary that Ch 3 requires for p-values.

*Action:* Keep. Add ENHANCEMENT 1 (bar-click for tail shading).

---

**Interactive 2 — Normal distribution explorer**
Location: After the z-score / 68-95-99.7 rule section.
Description: D3 bell curve. Controls: μ slider [-10, 10], σ slider [0.5, 5], mode toggle between "shade within kσ" (k ∈ {1,2,3}) and "shade P(a < X < b)". Shows shaded area with probability displayed. A mode-switch button toggles between the two modes.

| # | Assessment | Action |
|---|-----------|--------|
| 2 | **Strong** | Keep; add caption enhancement |

*Detailed assessment:* The dual-mode design is excellent. Switching between the 68-95-99.7 σ-band mode and the custom interval mode teaches both the empirical rule and the general probability-as-area idea in one interactive. The shaded area changing as the interval adjusts is precisely the right concept geometry.

One missing element: neither the caption nor the interactive text explicitly states that the *total* area under the curve equals 1, and that *every* probability is an area. This is the foundational statement the reader needs, and it is not made.

*Action:* Keep. Add ENHANCEMENT 2 (total area annotation to caption).

---

### Missed opportunities

**OPPORTUNITY 5 — What a distribution IS: the landscape visual** — After "Random variables" introduction, before the binomial section

*Concept geometry:* A distribution is a way of spreading weight (probability) across possible values. For discrete distributions, probability sits on spikes (bars). For continuous distributions, it is spread smoothly (a curve). The total weight is always 1. The mean is the balance point. Standard deviation measures how spread the weight is from the balance point. This is the "distribution as landscape" visual — the foundational concept geometry of this chapter.

*Interaction:* Two side-by-side panels. Left: discrete — a draggable bar chart on 6 values (like a die). The reader can drag bars up/down; the distribution renormalises so all bars sum to 1. A balance-point indicator (the mean) moves as the distribution shifts. Right: continuous — a normal curve with μ and σ sliders. The area under the curve is always 1 (indicated by a fill and a label). In both panels, the mean is a vertical dashed line labelled μ.

*Response:* Dragging the left-panel bars demonstrates that redistribution of probability must maintain the sum-to-one constraint. The balance point moves left/right as probability shifts. The right panel shows how σ controls the width/height tradeoff (wider curve = flatter peak, same total area).

*Builds on:* OPPORTUNITY 1 (probability as fraction/area). Establishes the landscape metaphor for Vol 7.

```
<!-- VIZ: Distribution as landscape — discrete and continuous side by side
Two panels sharing a horizontal axis range [0, 7] (discrete) and [-4, 4] (continuous, standardised).
LEFT PANEL: Six draggable bars (values 1–6, initial heights equal = 1/6 each). Bars are series blue. Dragging a bar handle changes its height; all others rescale proportionally so the sum remains 1.00 (label shows "Total probability = [1.000]"). A vertical dashed line marks the mean μ = Σ k·P(X=k), updating in real time. Label: "μ = [value] (balance point)."
RIGHT PANEL: Normal curve N(μ, σ²). Controls: μ slider [-3, 3], σ slider [0.3, 2]. The entire curve is filled with a light blue tint (area = 1, always). A prominent label inside the curve: "Total area = 1." The mean is a vertical dashed line. As σ increases, the curve flattens and widens; the area is preserved.
Panel titles: LEFT — "Discrete distribution: probability as height." RIGHT — "Continuous distribution: probability as area."
Caption: "A distribution is the complete picture of how probability is spread across all possible values. The total probability always adds to 1. The mean marks the balance point."
Thread: This landscape visual is the most important inheritance from Vol 6 → Vol 7. When Vol 7 introduces probability density functions formally, it should invoke this side-by-side idiom explicitly. When Vol 8 introduces the Gaussian state estimate in Kalman filtering, it should say 'you already know this shape — it is the landscape from Vol 6.' -->
```

---

**OPPORTUNITY 6 — The CDF as accumulation** — After the z-score section, before worked examples

*Concept geometry:* The cumulative distribution function F(x) = P(X ≤ x) answers "how much probability has accumulated up to here?" It rises from 0 to 1. It is an S-curve for the normal distribution. It is the visual that makes normal tables, z-score lookups, and p-values meaningful — the reader is already using CDF values throughout this chapter but has never seen the CDF itself.

*Interaction:* Two vertically stacked panels, linked by a draggable vertical cursor. Upper panel: the PDF f(x), with area to the left of the cursor shaded in series blue. Lower panel: the CDF F(x) S-curve, with a highlighted dot at the cursor's x-value. The y-value of the dot equals the shaded area above. Display between panels: "P(X ≤ [x]) = F([x]) = [value]." Controls: μ and σ sliders that affect both panels simultaneously.

*Response:* Dragging the cursor leftward decreases the shaded area and the CDF dot descends the S-curve together. Dragging rightward increases both. At x = μ, the shaded area = 0.5 and the CDF dot is at the S-curve's midpoint. The two panels are visually synchronised — the reader cannot fail to see that CDF value = shaded area.

*Builds on:* OPPORTUNITY 5 (distribution as landscape). Establishes the CDF vocabulary that Ch 3 needs for p-values as tail areas.

```
<!-- VIZ: PDF and CDF linked — accumulation visualization
Two vertically stacked SVG panels (approx. 300px height each) showing a N(μ, σ²) distribution.
TOP PANEL: The PDF curve f(x). A draggable vertical cursor line. The area to the LEFT of the cursor is filled in series blue (opacity 0.3). Label near top: "f(x) — probability density."
BOTTOM PANEL: The CDF S-curve F(x). A dot on the curve at (cursor_x, F(cursor_x)) highlighted in series blue. Label near top: "F(x) = P(X ≤ x) — cumulative probability."
BETWEEN PANELS: A text display: "P(X ≤ [x]) = F([x]) = [value to 4dp]."
CONTROLS (above top panel): μ slider [-5, 5, default 0], σ slider [0.5, 3, default 1]. Both panels update together.
The cursor is draggable along the x-axis; both panels update in sync.
Caption: "The CDF accumulates probability from left to right. The value F(x) equals the shaded area in the density curve above. This is how z-score tables work: they give you F(z) for the standard normal."
Thread: The CDF is the visual foundation of p-values and confidence intervals in Ch 3. When Ch 3 shows a p-value as a tail area, it must visually echo this two-panel PDF/CDF layout. -->
```

---

**OPPORTUNITY 7 — Two normals, same mean, different σ** — After the prose table comparing distributions A (σ=2) and B (σ=15)

*Concept geometry:* The prose presents a table with distributions A and B having the same mean but very different standard deviations. This calls for a direct visual comparison: two bell curves on the same axis, sharing a mean, with different widths. The reader should be able to adjust both σ values and see the shape difference.

*Interaction:* One plot with two simultaneously visible normal curves: curve A in series blue, curve B in series amber. Both centred at μ = 50. Sliders: σ_A [1, 20, default 2] and σ_B [1, 20, default 15]. Labels annotate each curve's peak: "σ_A = [value]" and "σ_B = [value]." Both curves always integrate to 1 (they do not share area — each is its own unit-area distribution, so the taller one has a higher peak).

*Response:* At σ_A = 2, σ_B = 15: one tall narrow spike and one wide flat mound, both centred at 50. The visual immediately makes σ = "width of the distribution shape."

*Builds on:* OPPORTUNITY 5. This is the most direct visual argument that σ measures shape, not location.

*Design note:* Do not merge this with the existing normal explorer. The existing explorer manipulates one curve; this one shows two simultaneously for direct comparison.

```
<!-- VIZ: Two normals — same mean, different σ
One SVG plot, x-axis 0–100. Two normal distribution curves drawn simultaneously.
Curve A: series blue, solid line, light fill (opacity 0.15). Centre fixed at μ = 50. σ_A slider [1, 20, default 2].
Curve B: series amber, solid line, light fill (opacity 0.15). Centre fixed at μ = 50. σ_B slider [1, 20, default 15].
Both curves always integrate to 1 (peak height = 1/(σ√2π)). A vertical dashed line at x = 50 labelled "μ = 50."
Annotations near each peak: "A: σ = [σ_A]" (blue) and "B: σ = [σ_B]" (amber).
Caption: "Same mean, different spread. Both distributions are centred at μ = 50. The standard deviation σ controls the width and flatness of the shape — not its location."
Builds on: The prose table in the "Mean, variance, and standard deviation" section. -->
```

---

### Enhancements to existing interactives

**ENHANCEMENT 1 — Binomial bar click: tail shading** (for Interactive 1)

Add to the binomial explorer: clicking a bar highlights it in accent colour and displays "P(X = k) = [value]" prominently. A secondary display shows "P(X ≥ k) = [value]" (right tail). This begins building the tail-area / CDF vocabulary that Ch 3 needs for p-values.

```
<!-- VIZ ENHANCEMENT: Binomial — bar click to show P(X=k) and P(X≥k)
On the existing binomial explorer: clicking bar k highlights it (series accent colour). A callout box appears: "P(X = k) = [value]." The bars to the right of k are shaded in a lighter tint, with a label: "P(X ≥ k) = [tail sum]." This introduces the concept of tail probability before Ch 3 requires it. -->
```

**ENHANCEMENT 2 — Normal explorer: total area caption**

Add to the existing normal explorer's caption: "The total area under any normal distribution curve equals exactly 1. Every probability is an area under this curve — the shaded region above is that area." This does not require code changes to the interactive itself — it is a caption addition. But it is a critical conceptual bridge that is currently missing.

---

### Visual threads — Ch 2

**THREAD 4 — Distribution as landscape**
OPPORTUNITY 5 establishes this. Vol 7 probability chapters must inherit it directly. Vol 8 Kalman filtering should invoke it when introducing the Gaussian state estimate: "the filter is maintaining this landscape and updating it with each measurement."

**THREAD 5 — CDF as accumulation / S-curve**
OPPORTUNITY 6 introduces the CDF. Ch 3 statistical inference immediately uses it (p-values are tail CDF values, confidence intervals are CDF intervals). The existing Ch 3 hypothesis test explorer shows p-values as shaded tails — this visually echoes OPPORTUNITY 6. The connection should be made explicit in the Ch 3 caption.

**THREAD 6 — Same mean, different σ**
OPPORTUNITY 7 establishes σ as a shape property. Vol 7 should explicitly reference this when introducing variance and moment generating functions. Vol 8 uses this directly in reliability analysis: tolerances are σ-based, and the "same mean, different spread" picture is the foundation of tolerance stack-up.

---

### Series-level design notes — Ch 2

The binomial and normal explorers are genuinely strong implementations. But they are explorers of individual distributions — they allow the reader to play with a distribution that already exists. OPPORTUNITIES 5 and 6 establish the *conceptual* layer that explains what a distribution is before the reader is asked to explore one. These are not optional additions. A reader who can adjust μ and σ but cannot say "probability is area under this curve" has memorised a tool without understanding the tool.

---

---

## Chapter 3 — Statistical Inference

### Visual register: **Adequate**

The chapter has two substantial implemented D3 interactives: a sampling distribution simulator and a hypothesis test explorer. These are the best implementations in the volume. The chapter is not barren. However, three things are missing: a visual argument for what a confidence interval means (the "many intervals" picture, which is the only way to make the correct interpretation tangible), a visual showing the Type I/Type II error tradeoff (which currently exists only in a table), and an extension of the CLT demonstration to non-normal populations.

---

### Existing interactives (no VIZ placeholders present)

**Interactive 1 — Sampling distribution simulator**
Location: After "The sampling distribution" section introduction.
Description: Button-press simulation. Each press draws 1000 samples of size n from a normal population N(μ, σ²). Histograms the resulting sample means. Overlays the theoretical N(μ, σ²/n) curve. Controls: population mean μ, population SD σ, sample size n. Shows SE in an info panel.

| # | Assessment | Action |
|---|-----------|--------|
| 1 | **Strong** | Keep; add population shape selector (OPPORTUNITY 8) |

*Detailed assessment:* Building the sampling distribution empirically through repeated button-press accumulation is the right pedagogical mechanism. The histogram narrowing as n increases — and converging to the theoretical bell — is the CLT demonstration in its most honest form. One weakness: the simulation always draws from a normal population. The CLT's genuine surprise — that it works for *non-normal* populations — is not demonstrated.

---

**Interactive 2 — Hypothesis test explorer**
Location: After the p-value and decision rule section, before the worked example.
Description: Full hypothesis test visualised in one interactive. Controls: μ₀, observed x̄, σ, n, test type (two-tailed / upper / lower), α. Draws N(μ₀, SE²). Marks the observed x̄ with a vertical line. Shades the rejection region(s). Shows SE, z, p-value, and the reject/fail-to-reject decision in a live info box. Decision text changes colour (red = reject, green = fail to reject).

| # | Assessment | Action |
|---|-----------|--------|
| 2 | **Strong** | Keep; see OPPORTUNITY 9 for dual-representation enhancement |

*Detailed assessment:* Showing the full test — sampling distribution, observed value, rejection region, p-value as a shaded tail, decision — in a single live interactive is exactly right. The one-tailed/two-tailed switching is handled correctly. One enhancement: the interactive shows the sampling distribution in original-scale units (marking x̄ on N(μ₀, SE²)). It does not simultaneously show the standard normal N(0,1) equivalent with the z-score marked. Both representations are valid; showing them together in a linked dual view would complete the vocabulary.

---

### Missed opportunities

**OPPORTUNITY 8 — CLT with non-normal populations** — Enhancement to Interactive 1

*Concept geometry:* The CLT's claim is that sample means approach normality *regardless of the population distribution*. A skewed population produces a skewed-looking histogram at n=1, a moderately normal histogram at n=5, and an unmistakably normal histogram at n=30. The contrast between the skewed population thumbnail and the bell-shaped histogram of means is the visual argument.

*Interaction:* Add a "Population shape" selector to the existing sampling distribution simulator. Options: Normal (current), Uniform, Skewed right (exponential-like), Bimodal (two-peak mixture). When a non-normal population is selected, a small thumbnail of the population distribution appears in the top-right corner. The simulation runs as before — button press accumulates sample means — and the histogram converges to the bell regardless.

*Response:* At n=1, the histogram of sample means mirrors the population thumbnail. At n=5, it's noticeably more symmetric. At n=30, it's indistinguishable from normal. At n≥30, a label appears: "Approximately normal — CLT applies."

*Builds on:* The existing simulator (Interactive 1). Extends OPPORTUNITY 5 (distribution shapes from Ch 2 — the reader now recognises the bell and can see other shapes approaching it).

```
<!-- VIZ: CLT population shape selector — enhancement to sampling distribution simulator
Add a "Population distribution" selector control to the existing simulator. Options: (1) Normal N(μ, σ²) — current behaviour, (2) Uniform on [μ−σ√3, μ+σ√3], (3) Exponential (rate = 1/μ, right-skewed), (4) Bimodal (50% from N(μ−1.5σ, 0.25σ²), 50% from N(μ+1.5σ, 0.25σ²)).
For non-Normal selections: show a thumbnail (approximately 80×60px) in the top-left of the main plot showing the population distribution, labelled "Population distribution."
The simulation samples from the selected population. At n ≥ 30, add an annotation on the histogram: "≈ Normal (CLT applies)" in series green.
Caption: "The CLT works for any population shape. Even skewed or bimodal populations produce sample means that pile up into a bell curve as n grows."
Thread: Vol 7 probability chapter should inherit this population-shape vocabulary. When introducing moment generating functions, reference the CLT demonstration here. -->
```

---

**OPPORTUNITY 9 — Confidence interval: the "many intervals" picture** — After the "What 95% confident actually means" section

*Concept geometry:* The correct interpretation of a 95% CI is that the *procedure*, repeated many times, captures the true μ 95% of the time. No static illustration makes this tangible. The "many intervals" picture — 100 intervals stacked vertically, with 95 crossing the true μ line in blue and 5 missing it in red — is the canonical visual argument. It is arguably the single most important visual in all of applied statistics education.

*Interaction:* A "Draw 100 samples" button. Each press simulates 100 random samples of size n from N(μ, σ²), computes x̄ and the 95% CI for each, and draws 100 horizontal interval bars stacked vertically. The true μ appears as a prominent horizontal dashed line. Intervals that contain μ: series blue. Intervals that miss μ: series red/orange. Running counter: "Coverage: [m]/[total] = [%]." Multiple button presses accumulate up to 500 total intervals (older intervals fade). Confidence level selector (90%, 95%, 99%) — changing the level shifts the coverage rate to match.

*Response:* The reader sees that 95% confidence is a property of the procedure — some intervals miss, and the fraction that misses is approximately 5%. The correct interpretation is made tangible. The selector showing 90% producing more red intervals and 99% producing fewer is the most direct possible argument for what confidence level means.

*Builds on:* The existing hypothesis test explorer. The confidence interval picture and the rejection region picture are duals — they should feel visually related.

```
<!-- VIZ: Confidence interval simulation — coverage demonstration
A vertically stacked panel of CI bars. The true μ is a prominent vertical dashed line.
Button: "Draw 100 samples." On click: generate 100 samples of size n from N(μ, σ²); compute x̄ ± z*·SE for each; draw each CI as a horizontal bar. Bars containing the true μ: series blue (opacity 0.7). Bars missing μ: series red/orange (opacity 0.7).
Running display (prominent): "Coverage: [m]/[total] = [percentage]%"
Controls: μ slider [50, 150], σ slider [5, 30], n slider [5, 100], confidence level selector [90%, 95%, 99%]. Multiple button presses accumulate intervals (max 500; oldest rows fade out as new ones scroll in).
Caption: "95% confidence means: repeat this procedure many times, and 95% of the resulting intervals will contain the true mean. It does not mean your specific interval has a 95% chance of being correct."
Thread: Vol 7 statistical inference must inherit this visual. It is the canonical argument for correct CI interpretation. Vol 7 treatments of Bayesian credible intervals and bootstrap CIs should explicitly contrast with this frequentist picture. -->
```

---

**OPPORTUNITY 10 — Type I and Type II errors: two overlapping distributions** — After the error types table, before "Connecting to the bigger picture"

*Concept geometry:* Both types of error live in a picture with two overlapping bell curves: the null distribution N(μ₀, SE²) and the alternative distribution N(μ_A, SE²). The rejection region cuts across both. The red tail of the null distribution beyond the cut is α (Type I error probability). The orange body of the alternative distribution to the left of the cut is β (Type II error probability). Power = 1 − β = the green area of the alternative distribution inside the rejection region. The tradeoff is visual: you cannot reduce α and β simultaneously unless you increase n (which moves the two distributions apart by shrinking their SE).

*Interaction:* Two overlapping distributions (null in series blue, alternative in series amber/orange). Controls: effect size Δ = μ_A − μ₀ slider [0, 5·SE], sample size n [5, 200], α selector [0.01, 0.05, 0.10]. Live readouts: α, β, Power = 1−β. As Δ increases or n increases, the distributions separate, overlap decreases, and power rises. As α decreases, the cut point moves right and β rises.

*Response:* The tradeoff is made visually inescapable. The reader can see that the only way to reduce both types of error is to increase n — moving the two distributions apart. This is the visual argument for why clinical trials are large.

*Builds on:* The existing hypothesis test explorer (Interactive 2). Adds the alternative distribution to the picture.

```
<!-- VIZ: Type I, Type II, and power — two overlapping distributions
Draw two normal curves on the same x-axis.
Null distribution: N(μ₀, SE²), series blue fill opacity 0.2, outline 2px.
Alternative distribution: N(μ₀+Δ, SE²), series amber fill opacity 0.2, outline 2px.
The critical value is a dashed red vertical line at μ₀ + z*·SE.
Shaded regions:
  - Tail of null distribution beyond critical value: red tint (α = Type I error).
  - Body of alternative distribution left of critical value: orange tint (β = Type II error).
  - Body of alternative distribution right of critical value: green tint (Power = 1−β).
Controls: Δ slider [0, 5, labeled "Effect size (how far apart are the two means, in SE units)"], n slider [5, 200, step 5], α selector [0.01, 0.05, 0.10].
Note: SE = σ/√n updates automatically with n; the distributions narrow and separate as n grows.
Live readout panel: "α = [value]  β = [value]  Power = 1−β = [value]"
Caption: "Both types of error live in the same picture. Increasing n separates the two distributions and reduces both errors. Reducing α (moving the cut right) reduces Type I errors but increases Type II."
Thread: Vol 7 statistical inference must build on this directly when introducing power curves and sample size calculations. Vol 8 reliability engineering uses this picture when setting acceptance/rejection thresholds. -->
```

---

### Visual threads — Ch 3

**THREAD 7 — Sampling distribution as the engine of inference**
The simulator (Interactive 1 + OPPORTUNITY 8) establishes that x̄ has a shape, centre, and spread. All confidence intervals and hypothesis tests depend on this. Vol 7 must reference it when introducing the t-distribution (the shape changes when σ is unknown, but the structure is identical).

**THREAD 8 — Confidence intervals as procedure, not event**
OPPORTUNITY 9 establishes the correct interpretation of confidence. Vol 7's treatments of maximum likelihood, Bayesian credible intervals, and bootstrap CIs should contrast explicitly with this frequentist picture.

**THREAD 9 — Two distributions / power**
OPPORTUNITY 10 introduces the two-overlapping-distributions picture. Vol 7 hypothesis testing theory and Vol 8 reliability threshold-setting must inherit this geometry.

---

### Series-level design notes — Ch 3

Ch 3 is the strongest chapter visually. The two existing interactives are substantial and correct. The three missing visuals (CLT population shapes, CI simulation, error tradeoff) are each load-bearing:

- The CLT population-shape selector makes the CLT genuinely surprising rather than just stated.
- The CI simulation is the only argument that makes the correct interpretation of "95% confident" tangible. Prose alone has never succeeded at this. Show the intervals. Show the red ones that miss.
- The error tradeoff visual is the only way to make the α/β/power/n relationship intuitive. The prose table is insufficient; the visual makes the tradeoff inescapable.

---

---

## Chapter 4 — Data Analysis

### Visual register: **Adequate → Barren (first half); Adequate (second half)**

The chapter has two implemented interactives: a scatter plot correlation explorer and a click-to-draw regression playground. Both are well-conceived and strong for the bivariate half of the chapter (Sections 3–7). But the chapter's entire first half — Sections 1–2, covering types of data, centre, spread, and the five-number summary — is treated purely in prose and formulas. Histograms, dot plots, and box plots are *described* but never *shown*. A reader who leaves Section 2 has never seen a box plot drawn. This is a significant gap in a data analysis chapter.

---

### Existing interactives (no VIZ placeholders present)

**Interactive 1 — Scatter plot correlation explorer**
Location: After the Pearson correlation section.
Description: Scatter cloud with a target correlation ρ controlled by a slider [-1, 1]. Preset buttons for r=0.9, 0.5, 0.1, -0.7. Outlier toggle adds three extreme points. Live display of computed r. Outlier points shown in red.

| # | Assessment | Action |
|---|-----------|--------|
| 1 | **Strong** | Keep; add ENHANCEMENT 3 (regression line toggle) |

*Detailed assessment:* Seeing the cloud elongate from circular (r=0) to a thin diagonal (r=0.9) as the slider moves is exactly the right interaction for "correlation as visual elongation." The outlier toggle demonstrating how three extreme points distort r is excellent practical knowledge. One enhancement: the regression line should be optionally shown, because the regression section follows immediately and the connection between cloud shape → r → regression slope should be made explicit.

---

**Interactive 2 — Click-to-draw regression playground**
Location: After the least-squares formulas.
Description: Click-on-blank-canvas to add points (up to 20). The least-squares line updates in real time. Toggle for showing residual lines. Clear button. Live display of b₀, b₁, R².

| # | Assessment | Action |
|---|-----------|--------|
| 2 | **Strong** | Keep; add ENHANCEMENT 4 (squared residuals) |

*Detailed assessment:* Direct manipulation — click to add points, watch the line react — is the best possible way to make "least squares" intuitive. The residual lines toggle makes the "minimise vertical distances" criterion visual. One missing element: showing residuals as lines is incomplete — the "squares" in "least squares" are never squared. Showing them as actual filled squares (where the area of each square = e_i²) would make the name literal and visible.

---

### Missed opportunities

**OPPORTUNITY 11 — Three views of one dataset: dot plot, histogram, box plot** — After Section 2 (Describing one variable), alongside or after the five-number summary

*Concept geometry:* The seven-value work-hours dataset used in the prose is the perfect vehicle. Show it simultaneously in three views sharing the same x-axis: (1) dot plot — each value as a dot on a number line, stacked for repeats; (2) histogram with adjustable bin width; (3) box plot with five-number summary annotated. The outlier at 42 is visually dramatic in all three.

*Interaction:* All three panels share an x-axis from 0 to 50. The bin width slider (1–10) adjusts only the histogram. The outlier at 42 is shown in the series accent colour (red/orange) in all three panels. Q₁, median, Q₃ are labelled on the box plot.

*Response:* Adjusting bin width shows that histogram shape depends on the choice of bins — a practical lesson about histogram sensitivity. The dot plot and box plot are stable. The outlier's visual isolation across all three panels makes the argument for flagging it as an outlier immediate.

*Builds on:* OPPORTUNITY 5 (distribution as landscape from Ch 2 — the histogram is the empirical counterpart to the theoretical density curve).

```
<!-- VIZ: Three views of one dataset — dot plot, histogram, box plot
Dataset: {4, 6, 6, 8, 9, 11, 42}. Three vertically stacked panels, shared x-axis [0, 50].
PANEL 1 — Dot plot: each value is a circle (series blue, r=6px) placed on a number line; stacked dots for repeated values (6 appears twice, stacked vertically). The value 42 is rendered in series accent red/orange with a label "42."
PANEL 2 — Histogram: bin width slider [1, 10, default 3]. Bars from 0. The bar containing 42 is in accent colour. Bin width slider is labelled.
PANEL 3 — Box plot: box from Q1=6 to Q3=11 (series blue fill), median line at 8 (white), left whisker to min=4, right whisker to fence=18.5. Outlier dot at 42 in accent colour. Labels: Q1, median, Q3 annotated above the box; "42 (outlier)" labelled. Upper fence = 18.5 marked with a small dashed vertical line.
Caption: "Three ways to see the same seven values. The dot plot shows every value. The histogram groups into bins — its shape depends on bin width. The box plot captures the five-number summary and flags the outlier. Each emphasises different aspects of the shape."
Thread: These three plot types are the standard visual vocabulary of data analysis. They must appear in Vol 7 wherever data is described or model assumptions are checked. -->
```

---

**OPPORTUNITY 12 — Distribution shape gallery** — After the five-number summary / box plot description, before Section 3 (Describing relationships)

*Concept geometry:* Real data comes in recognisable shapes. A symmetric bell (mean ≈ median), skewed right (mean > median, right tail), skewed left (mean < median, rare), bimodal (two peaks, single summary statistics misleading). Recognising shape is a prerequisite for choosing the right summary statistics and the right model.

*Interaction:* A 2×2 grid of panels. Each panel shows a histogram (100 simulated values) with its matching box plot below it. Clicking a panel highlights it and shows the mean/median lines, annotating the relationship ("mean ≈ median," "mean > median, pulled by right tail," etc.). Cases: (1) Symmetric/normal — exam scores; (2) Skewed right — income or social media hours; (3) Bimodal — mixture of two groups; (4) Uniform.

*Response:* Clicking between shapes reinforces the pattern: which shape produces which mean/median relationship. The bimodal case demonstrates that a single summary statistic can be actively misleading.

*Builds on:* OPPORTUNITY 11. OPPORTUNITY 5 (connecting empirical histogram shapes to theoretical distribution shapes from Ch 2).

```
<!-- VIZ: Distribution shape gallery — 2×2 grid
Four panels arranged in a 2×2 grid. Each panel: a histogram (100 simulated values) with a box plot directly below it, sharing the same x-axis.
Panel 1 (top-left) — Symmetric: data ~ N(65, 12²). Label: "Symmetric / bell-shaped."
Panel 2 (top-right) — Skewed right: data ~ Exponential(mean=20), capped at 120. Label: "Skewed right."
Panel 3 (bottom-left) — Bimodal: 50% from N(40, 5²), 50% from N(70, 5²). Label: "Bimodal."
Panel 4 (bottom-right) — Uniform: data ~ Uniform(0, 100). Label: "Uniform."
Clicking a panel highlights it. When highlighted: add vertical lines for mean (series blue dashed) and median (series amber dashed). Show a callout: "Mean = [value], Median = [value], [relationship note]."
Relationship notes: Panel 1 "mean ≈ median (symmetric)"; Panel 2 "mean > median (pulled by right tail)"; Panel 3 "mean and median between the two peaks — neither is representative"; Panel 4 "mean = median (symmetric)."
Caption: "Data distributions come in recognisable shapes. The shape determines whether the mean or median better describes the centre."
Thread: The bimodal case previews mixture distributions in Vol 7 probability. The skewed-right case previews the exponential distribution. The shape vocabulary established here is used throughout Vol 7 when introducing parametric assumptions. -->
```

---

**OPPORTUNITY 13 — Correlation cloud gallery: the visual taxonomy** — Before or alongside Interactive 1 (correlation explorer)

*Concept geometry:* The scatter cloud has a shape. A circular cloud means no linear association. An elongated ellipse means strong linear association. The direction of elongation gives the sign. The thinness of the ellipse corresponds to |r|. This is a *static* reference grid — a visual taxonomy the reader can return to — not a slider interactive.

*Interaction:* A 2×3 grid of scatter plots. Row 1 (positive): r ≈ 0 (circle), r ≈ 0.5 (elongated), r ≈ 0.9 (very thin diagonal). Row 2 (negative): r ≈ 0 (circle, same), r ≈ -0.5 (elongated, down-slope), r ≈ -0.9 (very thin, down-slope). Each cloud has a covariance ellipse overlaid in the series accent colour, making the elongation explicit. The regression line is drawn through each ellipse.

*Response:* Static — no interactive behaviour needed. The panel grid is arranged by |r| increasing left to right. Each panel is labelled "r ≈ [value]."

*Builds on:* Interactive 1 (the static grid provides vocabulary; the interactive provides exploration).

```
<!-- VIZ: Correlation cloud gallery — static reference grid (2 rows × 3 columns)
Six scatter plots. Each contains approximately 60 bivariate normal points. No user interaction needed (static SVG).
Row 1 (positive): r ≈ 0 (circular cloud), r ≈ 0.5 (elongated ellipse, upward slope), r ≈ 0.9 (very thin ellipse, steep upward slope).
Row 2 (negative): r ≈ 0 (same circular cloud), r ≈ -0.5 (elongated ellipse, downward slope), r ≈ -0.9 (very thin ellipse, steep downward slope).
In each panel: draw the covariance ellipse (series accent colour, opacity 0.25, no fill), and the least-squares regression line (series blue, 2px). Label each panel prominently: "r ≈ [value]."
Caption: "The shape of the scatter cloud encodes the correlation. A circular cloud means no linear association. An elongated ellipse means strong association — its slope tells you the direction."
Thread: This gallery is the visual foundation for Vol 7 regression. When Vol 7 introduces the covariance matrix and multiple regression, it should reference this gallery as the intuition source for what a correlation matrix 'looks like.' -->
```

---

### Enhancements to existing interactives

**ENHANCEMENT 3 — Regression line toggle on correlation explorer** (Interactive 1)

Add a "Show regression line" toggle to the existing correlation explorer. The regression line appears over the scatter cloud, its slope responding to r. As r changes from 0 to 0.9, the line rotates and the cloud elongates around it. Labels the line "ŷ = b₀ + b₁x."

```
<!-- VIZ ENHANCEMENT: Regression line on correlation scatter plot
Add "Show regression line" toggle to Interactive 1. When on: compute the least-squares regression line for the generated bivariate normal data and draw it over the scatter cloud (series blue, 2px). As r slider changes, the line's slope updates in real time. Label near line: "ŷ = b₀ + b₁x." When r = 0, the line is nearly horizontal; when r = 0.9, it is steep. -->
```

**ENHANCEMENT 4 — Squared residuals in regression playground** (Interactive 2)

Add a "Show squared residuals" toggle to the regression playground. When on: replace residual lines with filled squares, each with side length |e_i|. Display "SSR = Σe² = [value]." Caption note: "The least-squares line minimises the total area of these squares — hence the name."

```
<!-- VIZ ENHANCEMENT: Squared residuals in regression playground
Add a "Show squared residuals" mode to Interactive 2. When selected (replacing or alongside the line-residual mode): draw each residual as a filled square. The square for data point i has one corner at (x_i, y_i) and the opposite corner at (x_i, ŷ_i), so its side length = |e_i|. Fill: series red/pink, opacity 0.3. Display below the plot: "SSR = Σe_i² = [value]." A note: "The least-squares line minimises the total area of these squares." -->
```

---

### Visual threads — Ch 4

**THREAD 10 — Scatter cloud as correlation vocabulary**
OPPORTUNITY 13 (cloud gallery) and Interactive 1 (enhanced) establish the elongated ellipse as the visual idiom for correlation. Vol 7 regression chapter must inherit this. When Vol 7 introduces multiple regression and the covariance matrix, the gallery should be explicitly referenced.

**THREAD 11 — Regression residuals and goodness of fit**
Interactive 2 (enhanced with squared residuals) establishes residuals as a visual object with geometric meaning. Vol 7's OLS treatment and model diagnostics build on this. When Vol 7 introduces residual analysis, it should call back to this playground as the intuitive foundation.

**THREAD 12 — Distribution shape vocabulary for real data**
OPPORTUNITIES 11 and 12 establish that real data has shape, and that different shapes require different summary choices. Vol 7 probability and statistics must use this vocabulary when introducing parametric assumptions, goodness-of-fit testing, and QQ plots.

---

### Series-level design notes — Ch 4

The two existing interactives are among the strongest in the volume. The click-to-draw regression playground is particularly good — it is the kind of interactive a reader returns to. The chapter's gap is entirely in its first half: everything from "Types of data" through "Five-number summary" is treated symbolically and never visually. A student who reads the entire chapter without once seeing a box plot drawn or a histogram generated is underprepared for any practical data work. OPPORTUNITIES 11 and 12 address this. They are not optional.

---

---

## Volume-level visual threads summary

| Thread | Introduced | Inherited by |
|--------|-----------|-------------|
| Sample space as rectangle (Ω = rectangle, event = region) | Ch 1 — OPP. 1 | Vol 7 probability Ch 57, all conditional probability treatments |
| Probability axis [0,1] | Ch 1 — OPP. 4 | Ch 2 (distribution support), Ch 3 (p-values, CI levels), Vol 7 |
| Venn diagram (union/intersection as coloured regions) | Ch 1 — OPP. 2 | Ch 1 exercises, Vol 7 set-based probability |
| Zoom-into-B (conditioning as restriction of sample space) | Ch 1 — OPP. 3 | Vol 7 Bayesian sections; Vol 8 Kalman filter (repeated zoom) |
| Yule rectangle (independence as factorisation) | Ch 1 — Interactive 2 replacement | Vol 7 wherever independence is defined |
| Distribution as landscape (discrete/continuous, area = probability) | Ch 2 — OPP. 5 | Ch 3 sampling distribution; Vol 7 probability; Vol 8 Kalman Gaussian state |
| CDF as accumulation (S-curve linked to PDF shading) | Ch 2 — OPP. 6 | Ch 3 (p-values as tail CDF values), Vol 7 continuous distributions |
| Same mean, different σ (shape vs location) | Ch 2 — OPP. 7 | Vol 7 variance theory, Vol 8 tolerance stack-up in reliability |
| CLT — non-normal population convergence | Ch 3 — OPP. 8 | Vol 7 CLT proof context, Vol 8 Monte Carlo justification |
| CI as procedure — many intervals picture | Ch 3 — OPP. 9 | Vol 7 inference (frequentist vs Bayesian vs bootstrap distinction) |
| Two distributions / power / error tradeoff | Ch 3 — OPP. 10 | Vol 7 hypothesis testing theory, Vol 8 reliability thresholds |
| Three views of data (dot plot / histogram / box plot) | Ch 4 — OPP. 11 | Vol 7 wherever data is described; all model diagnostics |
| Distribution shape vocabulary (symmetric / skewed / bimodal) | Ch 4 — OPP. 12 | Vol 7 parametric assumptions, goodness-of-fit testing |
| Scatter cloud as correlation (elongated ellipse) | Ch 4 — OPP. 13 | Vol 7 regression (covariance matrix as ellipse array) |
| Squared residuals (SSR as geometric area) | Ch 4 — ENH. 4 | Vol 7 OLS theory, model diagnostics |

---

## Implementation priority across all four chapters

**Tier 1 — Required for the visual vocabulary to exist (implement first)**

The following interactives are prerequisites for the reader to understand what comes after them, or for the Vol 7 inheritance to be coherent. They cannot be deferred.

1. **Ch 1: OPPORTUNITY 3** — Conditional probability as zoom. The single most important visual in the volume. Without it, the Bayes' theorem section has no geometry, and Vol 7's Bayesian sections arrive at an empty visual.
2. **Ch 1: OPPORTUNITY 2** — Venn diagram with shading toggle. Prerequisite for OPPORTUNITY 3 (the zoom starts from the Venn diagram).
3. **Ch 2: OPPORTUNITY 5** — Distribution as landscape (discrete/continuous side by side). The foundational idiom for all distribution work in Vols 6, 7, and 8.
4. **Ch 2: OPPORTUNITY 6** — PDF/CDF linked view. Prerequisite for Ch 3 p-values to be understood as areas.
5. **Ch 4: OPPORTUNITY 11** — Three views of one dataset. The first half of Ch 4 contains no visuals of data at all. This is an embarrassing gap for a data analysis chapter.

**Tier 2 — Required for the vocabulary to be complete**

6. **Ch 3: OPPORTUNITY 9** — CI simulation (many intervals). Correct interpretation of confidence is currently prose-only. This is the only effective visual argument for that interpretation.
7. **Ch 3: OPPORTUNITY 10** — Error types / power (two overlapping distributions). The α/β/power tradeoff is a table without this visual.
8. **Ch 1: Interactive 2 replacement** — Replace the independence table with the Yule rectangle diagram.
9. **Ch 4: OPPORTUNITY 12** — Distribution shape gallery. Shapes are mentioned but never shown.
10. **Ch 4: OPPORTUNITY 13** — Correlation cloud gallery (static reference grid).

**Tier 3 — Enrichments and enhancements**

11. **Ch 1: OPPORTUNITY 1** — Sample space rectangle. Foundational but can follow OPPORTUNITIES 2 and 3.
12. **Ch 1: OPPORTUNITY 4** — Probability axis [0,1]. Orientation landmark.
13. **Ch 2: OPPORTUNITY 7** — Two normals comparison (same mean, different σ).
14. **Ch 3: OPPORTUNITY 8** — CLT population shape selector.
15. **Ch 4: ENHANCEMENT 3** — Regression line toggle on correlation explorer.
16. **Ch 4: ENHANCEMENT 4** — Squared residuals in regression playground.
17. **Ch 2: ENHANCEMENT 1** — Binomial bar click for tail shading.
18. **Ch 2: ENHANCEMENT 2** — Normal curve total area caption addition.

---

*End of Senior Designer Brief — Vol 6 Chs 1–4*
