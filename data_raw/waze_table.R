library("tidyverse")

folder_path <- list.files("data_raw/")[-20]

files_path <- list.files(paste0("data_raw/", folder_path))

tables_path <- files_path[str_detect(files_path, "Table")]

files_path

path_year <- paste0("data_raw/", folder_path, "")

for (i in path_year) {
  list.files(i) |> print()
}
