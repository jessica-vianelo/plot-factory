# config
#install.packages("shiny.router")
#install.packages("shinyjs")
suppressMessages(library(shiny))
suppressMessages(library(shiny.router))
suppressMessages(library(shinyjs))


addResourcePath("assets", "./src/assets") 



source("./src/components/SideBarPanel/index.R")
source("./src/components/SideBarPanelItem/index.R")


source("./src/routes/index.R")

