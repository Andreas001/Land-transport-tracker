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
    dataFrame = dataFrame[1:input$count,]
    plot_ly(dataFrame, x = ~items.longitude, y = ~items.latitude)
  })
})
