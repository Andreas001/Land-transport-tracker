library(shiny)
library(shinydashboard)
library(leaflet)
library(jsonlite)

shinyServer(function(input, output)
{
  library(jsonlite)
  
  jsonFile = fromJSON("http://api.metro.net/agencies/lametro/vehicles/")
  dataFrame <- as.data.frame(jsonFile)
  newDataFrame <- dataFrame[c(3,4,6,7)]
  
  output$map <- renderLeaflet
  ({
      leaflet(data = newDataFrame[1:input$count,]) 
      leaflet(height = "100%") %>% addTiles() %>% setView(19.08, 60.25, zoom = 4) %>%
      addMarkers(~items.longitude, ~items.latitude, popup = ~as.character(items.heading), label=~as.character(items.id)) 
  })
  
})
