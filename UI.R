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