displayPlot <- function(id){
  ns <- NS(id)
  
  tags$div(
    class = "blue-border",
    plotlyOutput("plot")
  )
}

displayPlotServer <- function(id){
  moduleServer(
    id,
    function(input, output, session){
      code <- reactiveValues(text = NULL)
      
      output$plot <- renderPlotly({
        req(session$userData$plotOptions$title)
        
        result <- typeOffPlot(
          session = session,
          dataframe = "dataframe",
          plotOptions = session$userData$plotOptions,
          plotConfig = session$userData$plotConfig
        )
        
        code$text <- result$text
        eval(parse(text = paste0("session$userData$dataframe$data %>% ", result$plot)))
      })
      
      rreturn(code)
    }
  )
}