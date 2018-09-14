Reproducible Pitch
========================================================
author: Madelon den Boeft
date: 14 september 2018
autosize: true

========================================================

BMI Calculator

Developing data products assignment week 4

Madelon den Boeft

14 september 2018 

========================================================

The BMI application is created with RStudio Shiny, developed as part of the final project in the Developing Data Products course. 

The BMI applicator includes: 
- a slider for height (cm), range 50-220 cm
- a slider for weight (kg), range 5-250 kg

The sliders are limited on normal values. 

The result is the Body Mass Index. 
The normal BMI should be between 20-25. 

This app is hosted at: https://mdenboeft.shinyapps.io/bmiapp/

========================================================

The reactivity of the Shiny BMI application is automatically triggered by getting the right values in the two slider bars. 

Application - ui.R
========================================================


```r
library(shiny)

# Define UI for slider demo app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("BMI Calculator"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar to demonstrate various slider options ----
    sidebarPanel(
      
      # Input: Height ----
      sliderInput("height", "Height (cm):",
                  min = 50, max = 220,
                  value = 0, step = 1,
                  ),
      
      # Input: Weight ----
      sliderInput("weight", "Weight (kg):",
                  min = 5, max = 250,
                  value = 0, step = 0.5,
                  )
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Table summarizing the values entered ----
      tableOutput("values")
      
    )
  )
)
```

Application - server.R
========================================================


```r
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
```

