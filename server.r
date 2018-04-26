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
  
  jsonFile2 = fromJSON("http://api.metro.net/agencies/lametro/routes/704/stops/")
  dataFrame2 <- as.data.frame(jsonFile2)
  
  output$plot <- renderPlotly
  ({
     dataFrame = dataFrame[1:input$count,]
    plot_ly(dataFrame, x = ~items.longitude, y = ~items.latitude)
  })
   
  output$plot2 <- renderPlotly
  ({
     dataFrame2 = dataFrame2[1:input2$count2,]
     plot_ly(dataFrame2, x = ~items.longitude, y = ~items.latitude)
  })
})
