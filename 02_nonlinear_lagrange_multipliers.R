# Non-Linear Programming with Equality Constraints
# Objective: Minimize Z = x1^2 + x2^2 + x3^2

install.packages("Rsolnp")
library(Rsolnp)

# Objective function
objfun <- function(x) {
  return(x[1]^2 + x[2]^2 + x[3]^2)}

# Equality constraints:
# x1 + x2 + 3*x3 = 2
# 5*x1 + 2*x2 + x3 = 5
eq_constraints <- function(x) {
  return(c(
    x[1] + x[2] + 3 * x[3] - 2,
    5 * x[1] + 2 * x[2] + x[3] - 5))
}

# Initial guess and non-negativity bounds
x0 <- c(1, 1, 1)
lower_bnd <- c(0, 0, 0)
upper_bnd <- c(Inf, Inf, Inf)

# Solve using Augmented Lagrange Multiplier method
result <- solnp(
  pars = x0,
  fun = objfun,
  eqfun = eq_constraints,
  eqB = c(0, 0),
  LB = lower_bnd,
  UB = upper_bnd)

# Output results (Exact fractions: x1 = 37/46, x2 = 8/23, x3 = 13/46, Z = 39/46)
cat("Minimum Objective Value (Z):", round(tail(result$values, 1), 4), "\n")
cat("Optimal Values (x1, x2, x3):", round(result$pars, 4), "\n")
