#!/usr/bin/env bash
# Creates seed-status stub .qmd files for all chapters listed in _quarto.yml
# that do not yet exist. Safe to re-run — skips existing files.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

stub() {
  local path="$ROOT/$1"
  local title="$2"
  local type="${3:-chapter}"
  if [[ -f "$path" ]]; then return; fi
  mkdir -p "$(dirname "$path")"
  cat > "$path" << YAML
---
title: "$title"
status: "seed"
---

*Seed — front matter to be completed before content is written.*
YAML
  echo "  created $1"
}

echo "Scaffolding stubs…"

# map
stub map/wayfinding.qmd "The Map" page
stub map/how-to-use.qmd "How to Use This Series" page

# vol-01
stub vol-01/index.qmd "Volume 1 — Numbers and operations" index
stub vol-01/01-number-line.qmd "The number line"
stub vol-01/02-ratio-proportion.qmd "Ratio and proportion"
stub vol-01/03-percent-rates.qmd "Percent and rates"
stub vol-01/04-integers.qmd "Integers and signed arithmetic"
stub vol-01/05-fractions-decimals.qmd "Fractions and decimals"
stub vol-01/06-statistics-probability.qmd "Statistics and probability"

# vol-02 (index and ch01 exist)
stub vol-02/02-inequalities.qmd "Inequalities"
stub vol-02/03-patterns-sequences.qmd "Patterns and sequences"
stub vol-02/04-graphing-relations.qmd "Graphing relations"

# vol-03
stub vol-03/index.qmd "Volume 3 — Shape and measure" index
stub vol-03/01-geometry-measurement.qmd "Geometry and measurement"
stub vol-03/02-trigonometry.qmd "Trigonometry"
stub vol-03/03-polynomials-factoring.qmd "Polynomials and factoring"
stub vol-03/04-functions-relations.qmd "Functions and relations"

# vol-04
stub vol-04/index.qmd "Volume 4 — Functions and change" index
stub vol-04/01-exponents-logarithms.qmd "Exponents and logarithms"
stub vol-04/02-complex-numbers.qmd "Complex numbers"
stub vol-04/03-systems-matrices.qmd "Systems and matrices"
stub vol-04/04-sequences-series.qmd "Sequences and series"

# vol-05
stub vol-05/index.qmd "Volume 5 — Analysis and proof" index
stub vol-05/01-limits-continuity.qmd "Limits and continuity"
stub vol-05/02-differential-calculus.qmd "Differential calculus"
stub vol-05/03-integral-calculus.qmd "Integral calculus"
stub vol-05/04-proof-reasoning.qmd "Proof and mathematical reasoning"

# vol-06
stub vol-06/index.qmd "Volume 6 — Probability and data" index
stub vol-06/01-probability-theory.qmd "Probability theory"
stub vol-06/02-distributions.qmd "Distributions"
stub vol-06/03-statistical-inference.qmd "Statistical inference"
stub vol-06/04-data-analysis.qmd "Data analysis"

# vol-07
stub vol-07/index.qmd "Volume 7 — Engineering mathematics" index
stub vol-07/odes/01-first-order.qmd "First-order ODEs"
stub vol-07/odes/02-second-order.qmd "Second-order ODEs"
stub vol-07/odes/03-systems-phase-plane.qmd "Systems and phase plane"
stub vol-07/odes/04-laplace-transforms.qmd "Laplace transforms"
stub vol-07/linear-algebra/01-matrices-systems.qmd "Matrices and linear systems"
stub vol-07/linear-algebra/02-eigenvalues.qmd "Eigenvalues and eigenvectors"
stub vol-07/linear-algebra/03-vector-differential.qmd "Vector differential calculus"
stub vol-07/linear-algebra/04-vector-integral.qmd "Vector integral calculus"
stub vol-07/fourier-pdes/01-fourier-series.qmd "Fourier series"
stub vol-07/fourier-pdes/02-fourier-transforms.qmd "Fourier transforms"
stub vol-07/fourier-pdes/03-partial-differential-equations.qmd "Partial differential equations"
stub vol-07/complex-analysis/01-complex-functions.qmd "Complex functions"
stub vol-07/complex-analysis/02-complex-integration.qmd "Complex integration"
stub vol-07/complex-analysis/03-series-residues.qmd "Series and residues"
stub vol-07/complex-analysis/04-conformal-mapping.qmd "Conformal mapping"
stub vol-07/numerics/01-numerical-methods.qmd "Numerical methods"
stub vol-07/numerics/02-numerical-linear-algebra.qmd "Numerical linear algebra"
stub vol-07/numerics/03-numerical-odes-pdes.qmd "Numerical ODEs and PDEs"
stub vol-07/optimisation/01-linear-programming.qmd "Linear programming"
stub vol-07/optimisation/02-graphs-networks.qmd "Graphs and networks"
stub vol-07/probability/01-probability-theory.qmd "Probability theory"
stub vol-07/probability/02-mathematical-statistics.qmd "Mathematical statistics"

echo "Done."
