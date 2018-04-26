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
      sliderInput("count", "number", 1, 8, 2),
      menuItem("Dashboard"),
        menuSubItem("sub board", tabName = "map"),
      menuItem("new 1"),
      menuItem("new 2")
    ),
    
    dashboardBody
    (
      leafletOutput("map"),
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
              collapsible = TRUE
              #leafletOutput("map"),
              #sliderInput("count", "number", 1, 8, 2)
            ),
            box
            (
              title = "hah",
              collapsible = TRUE,
              #sliderInput("count", "number", 1, 8, 2)
            )
          )
        )
      )
    )
  )
)
