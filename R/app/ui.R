library(shiny)
library(bslib)
library(shinyWidgets)
library(plotly)

ui <- shiny::fluidPage(
  theme = bslib::bs_theme(version = 5L, preset = "bootstrap"),
  title = "Explore",
  bslib::page_sidebar(
    title = "Data Exploration",
    sidebar = bslib::sidebar(
      width = "400px",
      shiny::selectInput(
        "dataset",
        label = "Select data",
        choices = c("Automotive", "Health & Beauty", "Food & Beverage"),
        selectize = FALSE
      ),
      shiny::varSelectInput(
        inputId = "colourVar",
        label = "Colour plot by",
        selected = NULL,
        data = mtcars # Place holder
      ),
      shinyWidgets::searchInput(
        inputId = "search",
        label = "Search",
        placeholder = "Search for a keyword",
        btnSearch = icon("search"),
        btnReset = icon("remove"),
        btnClass = "btn-default btn-outline-secondary"
      )
    ),
    plotly::plotlyOutput(
      outputId = "landscapePlot",
      height = "800px"
    )
  )
)