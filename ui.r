library(shiny)
library(shinydashboard)
library(leaflet)

shinyUI
(
  dashboardPage
  (
    dashboardHeader
    (
      title = "DA WEI"
    ),
    
    dashboardSidebar
    (
      menuItem("Dashboard"),
        menuSubItem("sub board", tabName = "map"),
      menuItem("new 1"),
      menuItem("new 2")
    ),
    
    dashboardBody
    (    
      fluidRow
      (
        tabItems
        (
          tabItem
          (
            tabName = "map",
            box
            (
              title = "Heh",
              collapsible = TRUE,
              leafletOutput("plot")
              #sliderInput("count", "number", 1, 8, 2)
            ),
            box
            (
              title = "hah",
              collapsible = TRUE,
              sliderInput("count", "number", 1, 8, 2)
            )
          )
        )
      )
    )
  )
)
