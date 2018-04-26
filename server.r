library(shiny)
library(shinydashboard)
library(leaflet)
library(jsonlite)

shinyServer(function(input, output)
{
  library(jsonlite)
  
  values <- reactiveValues(A=1)

  reactiveB <- reactive({
  values$A + 1
  })
  
  jsonFile = fromJSON("http://api.metro.net/agencies/lametro/vehicles/")
  dataFrame <- as.data.frame(jsonFile)
  
  output$map <- renderLeaflet
  ({
    leaflet(data = dataFrame[1:input$count,]) 
    leaflet() %>% addTiles() %>%
    addMarkers(~items.longitude, ~items.latitude, popup = ~as.character(items.heading), label =~as.character(items.id))
  })
})
