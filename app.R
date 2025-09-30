library(shiny)

ui <- fluidPage(
  titlePanel("Let's Do Arithmetic!"),
  sidebarLayout(
    sidebarPanel(
      numericInput("number1", "Number 1", value = 0),
      numericInput("number2", "Number 2", value = 0),
      actionButton("add", "Add"),           # NEW add button
      actionButton("multiply", "Multiply")  # Multiply button
    ),
    mainPanel(
      h2("The sum of the two numbers is:"),
      textOutput("sum"),
      h2("The product of the two numbers is:"),
      textOutput("result")
    )
  )
)

server <- function(input, output) {
  sum_val <- reactiveVal(0)       # store sum
  product_val <- reactiveVal(0)   # store product
  
  # Add button
  observeEvent(input$add, {
    x1 <- as.numeric(input$number1)
    x2 <- as.numeric(input$number2)
    sum_val(x1 + x2)
  })
  
  # Multiply button
  observeEvent(input$multiply, {
    x1 <- as.numeric(input$number1)
    x2 <- as.numeric(input$number2)
    product_val(x1 * x2)
  })
  
  output$sum <- renderText({
    sum_val()
  })
  
  output$result <- renderText({
    product_val()
  })
}

shinyApp(ui = ui, server = server)

