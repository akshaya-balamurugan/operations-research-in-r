# Operations Research & Statistical Optimization in R

A collection of operations research and stochastic modeling implementations in R, covering linear/non-linear optimization, inventory control, and queuing theory.

## Models Included

1. **Linear Programming – Diet Cost Optimization (`01_linear_programming_diet_optimization.R`)**
   - Uses the `lpSolve` package to minimize daily hospital diet costs subject to multi-nutrient minimum constraints.
   - **Result:** Optimal mix of 2g Food A and 6g Food B at a minimum cost of **$18.00**.

2. **Non-Linear Programming – Lagrange Multipliers (`02_nonlinear_lagrange_multipliers.R`)**
   - Uses `Rsolnp` (Augmented Lagrange Multiplier solver) to minimize a quadratic objective function subject to linear equality and non-negativity constraints.
   - **Result:** Optimal solution at **(x₁, x₂, x₃) ≈ (0.8043, 0.3478, 0.2826)** with **Z ≈ 0.8478**.

3. **Inventory Analysis – Continuous Review Model (`03_inventory_continuous_review_model.R`)**
   - Models a continuous-review **(Q, r)** inventory policy with backorders and uniform lead-time demand **U(0, 100)**.
   - Computes optimal order quantity (**y\* ≈ 319.44 units**), reorder point (**p\* ≈ 93.61 units**), stockout probability, and total annual cost.

4. **Queuing Theory – Finite-Capacity M/M/1/K/FIFO Model (`04_queuing_model_mm1k.R`)**
   - Evaluates steady-state performance metrics (**ρ, P₀, Pₖ, λ_eff, Lₛ, Wₛ**) for a single-server bank queue capped at **K = 7** customers.

## Tools & Packages
- **Language:** R
- **Libraries:** `lpSolve`, `Rsolnp`
