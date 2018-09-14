# Define server logic for slider examples ----
server <- function(input, output) {
  
  # Reactive expression to create data frame of all input values ----
  sliderValues <- reactive({
    
    data.frame(
      Name = c("Height",
               "Weight",
               "BMI"
      ),
      Value = as.character(c(input$height,
                             input$weight,
                             (round(input$weight / ((input$height / 100) * (input$height / 100))))
      )),
      stringsAsFactors = FALSE)
    
  })
  
  # Show the values in an HTML table ----
  output$values <- renderTable({
    sliderValues()
  })
  
}