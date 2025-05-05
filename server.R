### Initialize Server
library(shiny)
library(leaflet)
library(DT)

### Server Build-Out
shinyServer(function(input, output, session) {
  
  ## ABMT Options
  observe({
    updateSelectInput(session, "selected_abmt", choices = c("ABMT 1", "ABMT 2", "ABMT 3"))
  })
  
  ## Render Leaflet Map
  output$abmt_map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(lng = 0, lat = 0, zoom = 2)
  })
  
  # Update map based on ABMT selection and layer toggles
  observeEvent({
    input$selected_abmt
    input$selected_layers
  }, {
    # Logic to update leaflet map will go here
    print(paste("ABMT:", input$selected_abmt))
    print(paste("Layers:", paste(input$selected_layers, collapse = ", ")))
  })
  
  # Placeholder for data table
  output$layer_table <- renderDT({
    datatable(data.frame(
      Layer = input$selected_layers,
      Description = paste("Info about", input$selected_layers)
    ))
  })
})