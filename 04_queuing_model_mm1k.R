# Queuing Theory: Finite-Capacity M/M/1/K/FIFO Model

lambda <- 18              # Arrival rate (customers/hour)
service_time_mins <- 2.5  # Mean service time (minutes/customer)
mu <- 60 / service_time_mins  # Service rate = 24 customers/hour
K <- 7                    # Maximum system capacity (including customer in service)

# Traffic intensity
rho <- lambda / mu

# Probability system is empty (P0)
if (rho == 1) {
  P0 <- 1 / (K + 1)
} else {
  P0 <- (1 - rho) / (1 - rho^(K + 1))
}

# Helper function for steady-state probability Pn
get_Pn <- function(n, rho, P0) {
  if (rho == 1) return(P0)
  return(rho^n * P0)
}

PK <- get_Pn(K, rho, P0)        # Blocking probability (system full)
lambda_eff <- lambda * (1 - PK) # Effective arrival rate

# Average number of customers in system (Ls) and average wait time (Ws)
if (rho == 1) {
  Ls <- K / 2
} else {
  Ls <- (rho / (1 - rho)) * (1 - (K + 1) * rho^K + K * rho^(K + 1)) / (1 - rho^(K + 1))
}

Ws <- Ls / lambda_eff
Ws_minutes <- Ws * 60

P3 <- get_Pn(3, rho, P0)
P4 <- get_Pn(4, rho, P0)
P_admitted <- 1 - PK

# Output results
cat("--- QUEUING MODEL SOLUTIONS (M/M/1/7/FIFO) ---\n")
cat("1. Traffic Intensity (rho):", round(rho, 4), "\n")
cat("2. Probability System is Empty (P0):", round(P0, 4), "\n")
cat("3. Probability System is Full (P7):", round(PK, 4), "\n")
cat("4. Effective Arrival Rate (lambda_eff):", round(lambda_eff, 4), "cust/hour\n")
cat("5. Average Customers in System (Ls):", round(Ls, 4), "\n")
cat("6. Average Waiting Time in System (Ws):", round(Ws, 4), "hours (", round(Ws_minutes, 2), "mins )\n")
cat("7. Probability of Exactly 3 Customers (P3):", round(P3, 4), "\n")
cat("8. Blocking Probability:", round(PK, 4), "\n")
cat("9. Probability Arriving Customer is Admitted:", round(P_admitted, 4), "\n")
cat("10. Probability of 4 Customers in System (P4):", round(P4, 4), "\n")
