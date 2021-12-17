# install functions 
install.packages("tidyverse")
install.packages("ggmap")
install.packages("stringr")
install.packages("viridis")
install.packages("rstudioapi")

# necessary library
library(tidyverse)
library(ggmap)
library(stringr)
library(viridis)

# api key registry
library(rstudioapi)
register_google (key="AIzaSyD5OLaAyoW3QSmMpjzSUp47UcY6Y5m4gqI")

# read data file
sf_crawdad <- read.csv("C://tryon.csv")

# test plot
ggplot() +
  geom_point(data = sf_crawdad, aes(x=lon2, y = lat2), alpha = .05)

# test heatmap
ggplot() +
  stat_density2d(data = sf_crawdad, aes(x=lon2, y=lat2,
  fill = ..density..), geom = 'tile', contour = F)

# get map 
map_sf <- get_map('Tryon Creek State Natural Area', zoom = 14, source = 'google', maptype = 'satellite')
ggmap(map_sf)


ggmap(map_sf) +
  stat_density2d(data = sf_crawdad,aes(x=lon, y=lat, fill = ..density..), geom = 'tile', contour = F, alpha = .5) +
  scale_fill_viridis(option = 'inferno') 

  



