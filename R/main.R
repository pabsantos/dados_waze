library(tidyverse)
library(sf)
library(leaflet)

load("data/accidents.rda")

accidents |> view()

ggplot(accidents, aes(x = `Avg Reliability`)) +
  geom_histogram()

accidents_sf <- accidents |> 
  st_as_sf(wkt = "Location")

leaflet(data = accidents_sf) |> 
  addTiles() |> 
  addMarkers()
