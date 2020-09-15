# routes

source("./src/pages/Home/index.R", encoding = "UTF-8")
source("./src/pages/DataImport/index.R", encoding = "UTF-8")
source("./src/pages/Type/index.R", encoding = "UTF-8")
source("./src/pages/Edition/index.R", encoding = "UTF-8")
source("./src/pages/Result/index.R", encoding = "UTF-8")

router <- make_router(
  route("/", uiHome, serverHome),
  route("dataImport", uiDataImport, serverDataImport),
  route("type", uiType, serverType),
  route("edition", uiEdition, serverEdition),
  route("result", uiResult, serverResult)
)