---
title: "The German Tank Problem"
author: "Sage Roy-Burman"
format: html
---

```{r}
library(tidyverse)
library(knitr)
library(kableExtra)

# Load necessary packages

```

```{r}
single_trial <- function(N, n) {
  x <- sample(1:N, n, FALSE)
  xbar <- mean(x)
  xmax <- max(x)
  c(
    MLE = xmax,
    MOM = 2*xbar - 1,
    UMVUE = ((n + 1)/n) * xmax - 1
  )
}

# This function performs a single simulation of the problem, calculating the three estimators for the one sim.

```

```{r}
run_sim <- function(N, n, R = 5000) {
  sims <- replicate(R, single_trial(N, n))
  sims <- t(sims)
  
  data.frame(
    Estimator = colnames(sims),
    Mean = colMeans(sims),
    Bias = colMeans(sims) - N,
    SD = apply(sims, 2, sd),
    MSE = colMeans((sims-N)^2)
  )
}

# This function runs the simulation study for a given population size and sample size. It repeats the sampling process 5,000 times, 
# computes each estimator for each simulated dataset, and calculates mean, bias, SD, and MSE.

```

```{r}
small_N_small_n <- run_sim(250, 6)
large_N_small_n <- run_sim(2000, 6)
small_N_large_n <- run_sim(250, 30)
large_N_large_n <- run_sim(2000, 30)

# This block applies the simulation function to the four scenarios.

```

```{r}
all_results <- bind_rows(
  small_N_small_n,
  large_N_small_n,
  small_N_large_n,
  large_N_large_n
) %>%
  select(Estimator, Mean, Bias, SD, MSE)

kable(all_results, digits = 2, row.names = FALSE,
      caption = "Mean, bias, empirical standard deviation, and MSE for each estimator") %>%
  kable_styling(full_width = FALSE, position = "center") %>%
  pack_rows("N = 250, n = 6", 1, 3) %>%
  pack_rows("N = 2000, n = 6", 4, 6) %>%
  pack_rows("N = 250, n = 30", 7, 9) %>%
  pack_rows("N = 2000, n = 30", 10, 12)

# This table summarizes the performance of each estimator across scenarios.

```

```{r, echo = FALSE}
library(ggplot2)

ggplot(bind_rows(
  mutate(small_N_small_n, Scenario = "N = 250, n = 6"),
  mutate(large_N_small_n, Scenario = "N = 2000, n = 6"),
  mutate(small_N_large_n, Scenario = "N = 250, n = 30"),
  mutate(large_N_large_n, Scenario = "N = 2000, n = 30")
), aes(x = Estimator, y = MSE)) +
  geom_col() +
  facet_wrap(~Scenario, scales = "free_y") +
  labs(
    title = "Mean Squared Error of Different Estimators",
    x = "Estimator",
    y = "MSE"
  )

# This code plots the MSE of different estimators across scenarios

```

```{r}
library(tidyverse)

sim_data <- replicate(5000, single_trial(n = 6, N = 250))
sim_data <- t(sim_data)
sim_data <- as.data.frame(sim_data)

sim_data_long <- sim_data %>%
  pivot_longer(cols = everything(),
               names_to = "Estimator",
               values_to = "Estimate")

# This code generates 5,000 simulated samples for a fixed scenario, and computes the three estimators for each sample. 
# It is then reshaped into long format, where each row corresponds to a single estimate and its associated estimator. 
# This format is used for easier vizualization.

```

```{r, echo = FALSE}
ggplot(sim_data_long, aes(x = Estimator, y = Estimate, fill = Estimator)) +
  geom_boxplot(alpha = 0.7) +
  geom_hline(yintercept = 250, color = "red", linetype = "dashed") +
  labs(
    title = "Distribution of Estimators for N (N = 250, n = 6)",
    y = "Estimated N"
  )

# This plot shows the distribution of estimators across simulated samples for a specific scenario.

```
