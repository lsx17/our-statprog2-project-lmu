dir.create("data/raw", recursive = TRUE, showWarnings = FALSE)

daily_resources <- data.frame(
  year = c(2021L, 2022L, 2023L, 2024L),
  url = c(
    "https://opendata.muenchen.de/dataset/022a11ff-4dcb-4f03-b7dd-a6c94a094587/resource/561fb0d5-2d27-41bb-bda9-a383d6d42ad1/download/rad_2021_tage_19_06_23_r.csv",
    "https://opendata.muenchen.de/dataset/022a11ff-4dcb-4f03-b7dd-a6c94a094587/resource/05a2178d-3138-4874-a9fd-1ede6f0cedc1/download/rad_2022_tage_19_06_23_r.csv",
    "https://opendata.muenchen.de/dataset/022a11ff-4dcb-4f03-b7dd-a6c94a094587/resource/35a5825b-a8c8-4414-92f3-11c880576bd4/download/tages_werte_2023na2korr.csv",
    "https://opendata.muenchen.de/dataset/022a11ff-4dcb-4f03-b7dd-a6c94a094587/resource/d50ed6f4-93ee-4021-b30d-6d763b7b9603/download/tages_werte_2024_korr.csv"
  ),
  file = file.path("data/raw", paste0("rad_", c(2021L, 2022L, 2023L, 2024L), "_daily.csv"))
)

for (i in seq_len(nrow(daily_resources))) {
  if (!file.exists(daily_resources$file[i])) {
    download.file(daily_resources$url[i], daily_resources$file[i], mode = "wb")
  }

  message("Available raw file for ", daily_resources$year[i], ": ", daily_resources$file[i])
}
