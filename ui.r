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
        menuSubItem("Bus locations", tabName = "Bus location"),
        menuSubItem("Bus stop locations", tabName = "Bus stop location"),
      menuItem("Raw data", tabName = "Raw data")
    ),
    
    dashboardBody
    (    
      fluidRow
      (
        tabItems
        (
          tabItem
          (
            tabName = "Bus location",
            box
            (
              title = "Bus locations",
              collapsible = TRUE,
              leafletOutput("busLoc"),
              sliderInput(inputId = "busCount", label = "number", min = 1, max = 70, value = 30)
            )
          ),
          tabItem
          (
              tabName = "Bus stop location",
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
              tabName = "Raw data",
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
