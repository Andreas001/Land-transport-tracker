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
      addMarkers(~items.longitude, ~items.latitude, popup = ~as.character(items.headings), label=~as.character(item.id))
  })
})
