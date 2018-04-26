library(shiny)
library(shinydashboard)
library(leaflet)
library(jsonlite)
library(plotly)

shinyServer(function(input, output)
{
  library(jsonlite)
  
  jsonFile = fromJSON("http://api.metro.net/agencies/lametro/vehicles/")
  dataFrame <- as.data.frame(jsonFile)
    
  p <- plot_geo(dataFrame, lat = ~items.latitude, lon = ~items.longitude) %>%
  add_markers(
    color = "red", symbol = I("square"), size = I(8), hoverinfo = "text"
  ) %>%
  colorbar(title = "Incoming flights<br />February 2011")
    
  output$plot <- renderPlotly({values$p})
})
