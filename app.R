#install.packages("shiny")
library(shiny)
library(ggplot2)
library(tidyverse)

bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)

#runExample("01_hello")


ui <- fluidPage(
  titlePanel("BC Liquor Store Prices"),
  # Input
  sidebarLayout(
    sidebarPanel(
     sliderInput("priceInput", "Price", min = 0, max = 100, value = c(25,40), pre = "$"),
     radioButtons("typeInput", "product type", choices = c("BEER", "REFESMMENT", "SPIRITS", "WINE"), selected = "WINE"),
     selectInput("countryInput", "Country", choices = c("CANADA", "FRANCE", "ITALY"))
    ),
    # output
    mainPanel(
      plotOutput("coolplot"),
      br(), br(),
      tableOutput("results")
    )
  )
)

server <- function(input, output, session) {
  filtered <- reactive({
    req(input$priceInput, input$typeInput, input$countryInput)
      bcl %>% 
      filter(
        Price >= input$priceInput[1],
        Price <= input$priceInput[2],
        Type == input$typeInput,
        Country == input$countryInput
      )
    
  })
  
  output$coolplot <- renderPlot({
    req(filtered)
    
       ggplot(filtered(), aes(Alcohol_content)) +
      geom_histogram()
   })
  
  output$results <- renderTable({
    req(filtered)
    
    filtered()
  })
  
}

shinyApp(ui, server)

