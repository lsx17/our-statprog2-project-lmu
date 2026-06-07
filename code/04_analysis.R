library(readr)
library(dplyr)

bicycle_counts <- read_csv("data/processed/bicycle_counts_clean.csv", show_col_types = FALSE)

station_summary <- bicycle_counts |>
  group_by(station) |>
  summarise(
    observations = n(),
    first_day = min(date),
    last_day = max(date),
    median_daily_count = median(total_count, na.rm = TRUE),
    mean_daily_count = round(mean(total_count, na.rm = TRUE), 1),
    .groups = "drop"
  ) |>
  arrange(desc(mean_daily_count))

simple_weather_data <- bicycle_counts |>
  filter(
    !is.na(total_count),
    !is.na(mean_temp),
    !is.na(precipitation)
  )

simple_weather_model <- lm(
  total_count ~ mean_temp + precipitation,
  data = simple_weather_data
)

print(station_summary)
print(summary(simple_weather_model))
