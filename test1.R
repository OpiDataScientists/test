library(ggplot2)
library(leaflet)



 
#not-master

chart_data <- read.csv("http://freakonometrics.free.fr/popfr19752010.csv", header=TRUE)

chart_df <- chart_data[,c("long", "lat","com_nom", "pop_2010")]

colnames(chart_df) <- c("lng", "lat", "common_name", "pop_2010")

chart_df %>% leaflet() %>% addTiles() %>% addProviderTiles(providers$OpenStreetMap) %>% addMarkers(popup = paste("The population of ", chart_df$common_name, " is ", round(chart_df$pop_2010)),   clusterOptions = markerClusterOptions())
