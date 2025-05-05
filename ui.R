### Initialize Server
library(shiny)
library(leaflet)
library(DT)

### User Interface Build-out
shinyUI(fluidPage(
  
  ## Title Panel
  titlePanel(
    div(
      h1("High Seas Activity Viewer"),
      h4("Explore ocean use in areas beyond national jurisdiction (ABNJ) and proposed ABMTs under the BBNJ framework")
    )
  ),
  
  ## Sidebar Panel
  sidebarLayout(
    sidebarPanel(
      
      #create selectiond dropdown for ABMT to inspect
      selectInput(
        inputId = "selected_abmt",
        label = "Select Proposed ABMT:",
        choices = NULL  # Will be populated in server or global.R
      ),
      
      #create toggle of data layers
      checkboxGroupInput(
        inputId = "selected_layers",
        label = "Data Layers to Display:",
        choices = c(
          "Shipping Traffic" = "shipping",
          "Fishing Effort" = "fishing",
          "Deep-Sea Mining Claims" = "mining",
          "Biodiversity Hotspots" = "biodiversity"
        )
      )
    ),
    
    ## Map Panel
    mainPanel(
      leafletOutput("abmt_map", height = 600),
      br(),
      h4("Layer Information and Zonal Stats"),
      DTOutput("layer_table")
    )
  )
))
