library(shiny)
library(leaflet)


shinyServer(function(input, output)
{
  dataFrame = read.csv("BusData.csv")
  
  output$busLoc <- renderLeaflet
  ({
    busCount <- seg(min(dataFrame), max(dataFrame), length.out = input$busCount + 1)
     leaflet(data = dataFrame[1:input$busCount,]) %>% addTiles() %>%
      addMarkers(~value.longitude, ~value.latitude, popup = ~as.character(value.display_name), label=~as.character(value.id))
  })
})
