library(readr)
library(dplyr)
library(ggplot2)

dir.create("figures", recursive = TRUE, showWarnings = FALSE)

bicycle_counts <- read_csv("data/processed/bicycle_counts_clean.csv", show_col_types = FALSE)

glimpse(bicycle_counts)

distribution_plot <- bicycle_counts |>
  filter(!is.na(total_count)) |>
  ggplot(aes(x = total_count)) +
  geom_histogram(bins = 40, fill = "#2A7F62", colour = "white") +
  labs(
    title = "Daily bicycle counts are strongly right-skewed",
    x = "Daily bicycle count",
    y = "Number of station-days"
  ) +
  theme_minimal()

weather_plot <- bicycle_counts |>
  filter(!is.na(total_count), !is.na(mean_temp)) |>
  ggplot(aes(x = mean_temp, y = total_count, colour = station)) +
  geom_point(alpha = 0.35, size = 1.2) +
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), se = FALSE, linewidth = 0.8) +
  labs(
    title = "Warmer days tend to have higher bicycle counts",
    x = "Mean daily temperature (C)",
    y = "Daily bicycle count",
    colour = "Station"
  ) +
  theme_minimal()

ggsave("figures/distribution.png", distribution_plot, width = 7, height = 4)
ggsave("figures/weather-temperature.png", weather_plot, width = 7, height = 4)
