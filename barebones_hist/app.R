#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# User Interface:
ui <- fluidPage(
  mainPanel(
    textInput("Title", "Title"),

    # Create the plot output$displot
    plotOutput("myplot")
  )
)

server <- function(input, output) {

  # Define x
  x <- ChickWeight$weight

  # Send rendered plot to output
  output$myplot <- renderPlot({
    hist(x, main = input$Title)
  })
}

shinyApp(ui = ui, server = server)
