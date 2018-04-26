library(shiny)
library(shinydashboard)
library(leaflet)
library(jsonlite)

shinyServer(function(input, output)
{
  library(jsonlite)
  
  jsonFile = fromJSON("http://api.metro.net/agencies/lametro/vehicles/")
  dataFrame <- as.data.frame(jsonFile)
  makeReactiveBinding("dataFrame")
  
  newData <- reactive
  ({
    leaflet(data = dataFrame[1:input$count,]) 
  })
  
  output$map <- renderLeaflet
  ({
    dataFrame <- newData()
    leaflet() %>% addTiles() %>%
    addMarkers(~items.longitude, ~items.latitude, popup = ~as.character(items.heading), label =~as.character(items.id))
  })
  #newDataFrame <- dataFrame[c(3,4,6,7)]
})
