library(tidyverse)
library(ggthemes)
library(ggplot2)

g <- 9.81

t <- function(v0) {
  return(2*v0/g)
}

R <- function(omega, t) {
  return(omega*t)
}

sideUp <- function(v0, omega) {
  t_val <- t(v0)
  R_val <- R(omega, t_val)
  if((2*R_val)%%2<1)
    return("HEADS")
  else
    return("TAILS")
}

omega_vals <- seq(0,10,length=600)
v0_vals <- seq(0,10,length=600)



# Method 1
end_states <- expand_grid(v0_vals, omega_vals) %>%
  group_by(v0_vals,omega_vals) %>%
  summarise(
    result = sideUp(v0_vals,omega_vals)
  )

# Method 2
states <- c("TAILS","HEADS")
end_states <- expand_grid(v0_vals, omega_vals) %>%
  mutate(
    tstar = 2*v0_vals/g,
    R = omega_vals*tstar,
    result = states[((2*R)%%2<1)+1]
  )


ggplot(
  end_states,
  aes(
    x = v0_vals,
    y = omega_vals,
    fill = result,
  )
) +
  geom_raster() +
  scale_fill_manual(
    values = c(
      "#440154",
      "#fde725"
    )
  ) +
  labs(
    y="Angular rotations (per s)",
    x="Initial velocity (m/s)",
    fill=NULL
  )