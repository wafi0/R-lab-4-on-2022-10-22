library(palmerpenguins)
library(ggplot2)
library(tidyverse)
library(ggthemes)
penguins <- palmerpenguins::penguins

ggplot(
  penguins,
  aes(
    x = flipper_length_mm,
    y = bill_length_mm,
    col = species,
    shape = species
  )
) +
  geom_point(
  ) +
  geom_smooth(
    method = "lm",
    se = FALSE
  ) +
  labs(
    y="Bill length (mm)",
    x="Flipper length (mm)",
    shape="Penguin species",
    col="Penguin species"
  ) +
  theme(legend.position = c(0.8, 0.2)) +
  scale_color_manual(
    values = c(
      "orange",
      "magenta",
      "#008888"
    )
  )
