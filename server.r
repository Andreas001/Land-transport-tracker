library(shiny)
library(leaflet)
library(jsonlite)


shinyServer(function(input, output)
{
  library(jsonlite)
  jsonFile = fromJSON("http://api.metro.net/agencies/lametro/vehicles/")
  dataFrame <- as.data.frame(jsonFile)
  
  output$busLoc <- renderLeaflet
  ({
     leaflet(data = dataFrame[1:input$busCount,]) %>% addTiles() %>%
      addMarkers(~value.longitude, ~value.latitude, popup = ~as.character(value.display_name), label=~as.character(value.id))
  })
})
