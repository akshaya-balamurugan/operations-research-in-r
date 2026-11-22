# Inventory Analysis: Continuous Review (Q, r) Model with Uniform Lead-Time Demand

D  <- 1000  # Annual demand (units)
Co <- 100   # Ordering/setup cost per order (INR)
Ch <- 2     # Holding cost per unit per year (INR)
Cs <- 10    # Shortage/backorder cost per unit (INR)

# Uniform lead-time demand parameters U(a, b)
a <- 0
b <- 100

# Optimal order quantity (y*) and expected orders per year
y_star <- sqrt((2 * D * Co / Ch) * ((Ch + Cs) / Cs))
num_orders <- D / y_star

# Critical ratio / stockout probability and optimal reorder point (p*)
P_stockout <- (Ch * y_star) / (Cs * D + Ch * y_star)
p_star <- b - P_stockout * (b - a)

# Expected shortage per cycle and total annual inventory cost
expected_shortage <- ((b - p_star)^2) / (2 * (b - a))
ordering_cost_annual <- (D / y_star) * Co
holding_cost_annual  <- Ch * ((y_star / 2) + p_star - ((a + b) / 2))
shortage_cost_annual <- (D / y_star) * Cs * expected_shortage
total_annual_cost    <- ordering_cost_annual + holding_cost_annual + shortage_cost_annual

# Output results
cat("--- INVENTORY MODEL RESULTS ---\n")
cat("1. Optimal Order Quantity (y*):", round(y_star, 2), "units\n")
cat("2. Approximate No. of Orders per Year:", round(num_orders, 2), "\n")
cat("3. Optimal Reorder Point (p*):", round(p_star, 2), "units\n")
cat("4. Expected Shortage per Cycle:", round(expected_shortage, 4), "units\n")
cat("5. Total Annual Inventory Cost: INR", round(total_annual_cost, 2), "\n")
cat("6. Probability of Running Out of Stock:", round(P_stockout, 4), "\n")
