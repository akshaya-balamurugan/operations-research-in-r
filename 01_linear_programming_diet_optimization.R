#Linear Programming: Diet Cost Minimization
#Objective: Minimize Z = 3*X1 + 2*X2 subject to daily nutritional constraints
install.packages("lpSolve")
library(lpSolve)

# Cost per gram for Food A ($3) and Food B ($2)
obj_coeff <- c(3, 2)

# Nutritional contribution matrix (rows = Nutrients 1, 2, 3; cols = Food A, Food B)
const_matrix <- matrix(
  c(1, 1,   # Nutrient 1: X1 + X2 >= 8
    2, 1,   # Nutrient 2: 2*X1 + X2 >= 10
    1, 2),  # Nutrient 3: X1 + 2*X2 >= 6
  nrow = 3, byrow = TRUE)

const_dir <- c(">=", ">=", ">=")
const_rhs <- c(8, 10, 6)

# Solve linear program
result <- lp(
  direction = "min",
  objective.in = obj_coeff,
  const.mat = const_matrix,
  const.dir = const_dir,
  const.rhs = const_rhs)

# Output results (Expected: X1 = 2g, X2 = 6g, Minimum Cost = $18.00)
cat("Status (0 = Success):", result$status, "\n")
cat("Minimum Cost (Z): $", result$objval, "\n")
cat("Optimal Food A (X1):", result$solution[1], "grams\n")
cat("Optimal Food B (X2):", result$solution[2], "grams\n")
