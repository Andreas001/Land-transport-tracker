library(shiny)
library(shinydashboard)
library(leaflet)

shinyUI
(
  dashboardPage
  (
    dashboardHeader
    (
      title = "Bus things"
    ),
    
    dashboardSidebar
    (
      menuItem("Dashboard"),
        menuSubItem("Bus locations", tabName = "busLocation"),
        menuSubItem("Bus stop locations", tabName = "busSLocation"),
      menuItem("Raw data", tabName = "rawData")
    ),
    
    dashboardBody
    (    
      fluidRow
      (
        tabItems
        (
          tabItem
          (
            tabName = "busLocation",
            box
            (
              title = "Bus locations",
              collapsible = TRUE,
              leafletOutput("busLoc"),
              sliderInput(inputId = "busCount", label = "number", min = 1, max = 1500, value = 100)
            )
          ),
          tabItem
          (
              tabName = "busSLocation",
              box
              (
              title = "Bus Stops",
              collapsible = TRUE,
              leafletOutput("plot2"),
              sliderInput("count2", "number2", 1, 1500, 50)
              )
          ),
          tabItem
          (
              tabName = "rawData",
              box
              (
                title = "Raw data",
                collapsible = TRUE
              )
          )
        )
      )
    )
  )
)
