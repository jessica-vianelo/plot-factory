# sidebarpanel

sideBarPanel <- function(id){
  ns <- NS(id) # cria o preficho do id - do obj que voce ta criando
  tags$div(
    class = "sideBarPanel",
    img(src = "./assets/logos/logoWithTagline.svg", class = "Logo"),
    tags$div(
      class = "navigation",
      sideBarPanelItem(id = ns("home")),
      sideBarPanelItem(id = ns("dataImport")),
      sideBarPanelItem(id = ns("type")),
      sideBarPanelItem(id = ns("edition")),
      sideBarPanelItem(id = ns("result"))
      
    ),
    tags$div(
      class = "footer",
      img(src = "./assets/icons/copyright.svg"),
      p("Eu estou cansada!")
    )
   )
}

sideBarPanelServer <- function(id){
  moduleServer(
    id,
    function(input, output, session){
      sideBarPanelItemServer(
        id = "home", ref = "/", label = "Página Incial"
      )
      sideBarPanelItemServer(
        id = "dataImport", ref = "dataImport", label = "Importando dados"
      )
      sideBarPanelItemServer(
        id = "type", ref = "type", label = "Tipo de gráfico"
      )
      sideBarPanelItemServer(
        id = "edition", ref = "edition", label = "Edição"
      )
      sideBarPanelItemServer(
        id = "result", ref = "result", label = "Resultado"
      )
    }
  )
}