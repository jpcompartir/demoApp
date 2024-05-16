library(shiny)
library(here)

options(shiny.autoreload=TRUE)
options(shiny.port = 7775)
options(shiny.host = "127.0.0.1")

source(here("R/app/ui.R"))
source(here("R/app/server.R"))

shiny::runApp(here("R/app"))