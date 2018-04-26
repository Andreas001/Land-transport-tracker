library(shiny)
library(shinydashboard)
library(leaflet)
library(jsonlite)
library(plotly)

shinyServer(function(input, output)
{
  library(jsonlite)
  
  g <- list
  (
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showland = TRUE,
  landcolor = toRGB("gray95"),
  subunitcolor = toRGB("gray85"),
  countrycolor = toRGB("gray85"),
  countrywidth = 0.5,
  subunitwidth = 0.5
  )
  
  jsonFile = fromJSON("http://api.metro.net/agencies/lametro/vehicles/")
  dataFrame <- as.data.frame(jsonFile)
    
  output$plot <- renderPlotly({
    dataFrame = dataFrame[1:input$count,]
    plot_geo(dataFrame, lat = ~items.latitude, lon = ~items.longitude) %>%
  add_markers(
    text = ~paste(headings, id, route_id),
    color = "read", symbol = I("square"), size = I(8), hoverinfo = "text"
  ) %>%
  colorbar(title = "Sucks") %>%
  layout(
    title = 'sucks)', geo = g
  })
})
