library("tidyverse")

folder_path <- list.files("data_raw/")[-20]

files_path <- list.files(paste0("data_raw/", folder_path))

tables_path <- files_path[str_detect(files_path, "Table")]

read_waze <- function(type) {
  files <- tables_path[str_detect(tables_path, type)] |> unique()
  files_path <- paste0("data_raw/", folder_path, "/", files)
  read_csv(files_path)
}

accidents <- read_waze("Accidents")
alerts <- read_waze("Alerts_Table")
irregularities <- read_waze("Irregularities")

write_csv(accidents, "data/accidents.csv")
# write_csv(alerts, "data/alerts.csv")
write_csv(irregularities, "data/irregularities.csv")

save(accidents, file = "data/accidents.rda")
save(alerts, file = "data/alerts.rda")
save(irregularities, file = "data/irregularities.rda")
