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
              plotlyOutput("plot"),
              sliderInput("count", "number", 1, 500, 50)
            )
          ),
          tabItem
          (
              tabName = "Bus stop location",
              box
              (
              title = "Bus Stops",
              collapsible = TRUE,
              plotlyOutput("plot2"),
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
