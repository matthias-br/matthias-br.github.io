library(shiny)

ui <- fluidPage(
  titlePanel("ShinyLive Test"),
  sidebarLayout(
    sidebarPanel(
      numericInput("sample_size", "Select a sample size:",
                   value = 100, min = 1, max = 1000, step = 1)
    ),
    mainPanel(
      plotOutput("histogram")
    )
  )
)

server <- function(input, output) {
  output$histogram <- renderPlot({
    x <- sample(1:100, input$sample_size, replace = TRUE)
    hist(x, col = "blue", main = "Histogram of Random Samples", xlab = "Values")
  })
}

shinyApp(ui, server)