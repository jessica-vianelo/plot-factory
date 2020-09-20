
uiDataImport <- tags$div(
  class = "dataImport",
  sideBarPanel(id = "sideBarPanelDataImport"),
  
  mainPanel(
    mainText = mainText(
      title = "Importando dados!",
      text = "O primeiro passo para a conatrução de qq grafico e importante o banco de daods. Para isso clique no botão abaixo",
      p(
        "É importante ressaltar q os dados devem estar livres de erros e com formatação correta de suas variavesis. Para que isso"
      )
    ),
    
   importPanel(id = "importPanelDataImport"),
   forwardBackwardButtons(id = "forwardBackwardButtonsDataImport")
  )
  
)

serverDataImport <- function(input, output, session){
  sideBarPanelServer(id = "sideBarPanelDataImport")
  dataframe <- importPanelServer(id = "importPanelDataImport")
  
  observe({
    forwardBackwardButtonsServer(
      id = "forwardBackwardButtonsDataImport",
      backward = "/",
      forward = "type",
      {
        req(dataframe$data)
        session$userData$dataframe$data <- dataframe$data
      }
    )
  })
}