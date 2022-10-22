library(palmerpenguins)
library(ggplot2)
library(tidyverse)
penguins <- palmerpenguins::penguins %>%
  drop_na

#View(penguins)
ggplot(penguins,aes(x = body_mass_g)
) +
  geom_density(
    aes(
      fill=species,
      col=species,
    ),
    alpha = 0.5
  ) +
  facet_wrap(sex ~ ., ncol = 1) +
  labs(
    y=NULL,
    x="Body Mass (g)",
    fill="Species",
    col="Species"
  )