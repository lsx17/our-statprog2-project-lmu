library(readr)
library(dplyr)
library(lubridate)

raw_files <- list.files(
  "data/raw",
  pattern = "^rad_[0-9]{4}_daily\\.csv$",
  full.names = TRUE
)

if (length(raw_files) == 0L) {
  stop("No raw bicycle-count CSV files found. Run code/01_download.R first.")
}

parse_bicycle_date <- function(x) {
  parsed <- suppressWarnings(ymd(x))
  missing <- is.na(parsed)

  if (any(missing)) {
    parsed[missing] <- suppressWarnings(ymd(gsub("\\.", "-", x[missing])))
  }

  parsed
}

read_bicycle_file <- function(path) {
  read_csv(
    path,
    col_types = cols(.default = col_character()),
    locale = locale(encoding = "UTF-8"),
    show_col_types = FALSE
  ) |>
    mutate(source_file = basename(path))
}

bicycle_raw <- bind_rows(lapply(raw_files, read_bicycle_file))

bicycle_clean <- bicycle_raw |>
  mutate(
    date = parse_bicycle_date(datum),
    year = year(date),
    month = month(date, label = TRUE, abbr = TRUE),
    weekday = wday(date, label = TRUE, abbr = TRUE, week_start = 1),
    station = zaehlstelle,
    direction_1 = parse_number(richtung_1),
    direction_2 = parse_number(richtung_2),
    total_count = parse_number(gesamt),
    min_temp = parse_number(`min.temp`),
    max_temp = parse_number(`max.temp`),
    mean_temp = (min_temp + max_temp) / 2,
    precipitation = parse_number(niederschlag),
    cloud_cover = parse_number(bewoelkung),
    sunshine_hours = parse_number(sonnenstunden),
    comment = na_if(kommentar, "NA")
  ) |>
  select(
    date, year, month, weekday, station,
    direction_1, direction_2, total_count,
    min_temp, max_temp, mean_temp,
    precipitation, cloud_cover, sunshine_hours,
    comment, source_file
  ) |>
  arrange(date, station)

dir.create("data/processed", recursive = TRUE, showWarnings = FALSE)
write_csv(bicycle_clean, "data/processed/bicycle_counts_clean.csv")

message("Wrote cleaned bicycle data to data/processed/bicycle_counts_clean.csv")
