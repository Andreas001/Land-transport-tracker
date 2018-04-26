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
    
  output$plot <- renderPlotly({
    plot_ly(dataFrame, x = ~items.longitude, y = ~items.latitude)
  })
})
