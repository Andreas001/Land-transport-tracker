library(shiny)
library(shinydashboard)
library(leaflet)
library(jsonlite)

shinyServer(function(input, output)
{
  library(jsonlite)
  
  jsonFile = fromJSON("http://api.metro.net/agencies/lametro/vehicles/")
  dataFrame <- as.data.frame(jsonFile)
  
  observe
  ({
    invalidateLater(1000, session)
    jsonFile = fromJSON("http://ihealth.sepdek.net/")
    dataFrame <- as.data.frame(jsonFile)
    
    leaflet(data = dataFrame[1:input$count,]) 
    leaflet() %>% addTiles() %>%
    addMarkers(~items.longitude, ~items.latitude, popup = ~as.character(items.heading), label =~as.character(items.id))
 })
  
})
