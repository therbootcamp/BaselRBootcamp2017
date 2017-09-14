#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

   # Application title
   titlePanel("BaselRBootcamp's first Shiny App!"),

   # Sidebar with a slider input for number of bins
   sidebarLayout(
      sidebarPanel(
         sliderInput("bins",
                     "Number of bins:",
                     min = 1,
                     max = 50,
                     value = 30),

         selectInput(inputId = "bincolor",
                     label = "Color",
                     choices = colors(),
                     selected = "black"),

         checkboxInput(inputId = "addmean",
                       label = "Add mean line?",
                       value = FALSE),

         textInput(inputId = "main",
                   label = "Plot Title"),

         textInput(inputId = "xlab",
                   label = "X-axis label")
      ),



      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2]
      bins <- seq(min(x), max(x), length.out = input$bins + 1)

      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = input$bincolor, border = 'white',
           main = input$main, xlab = input$xlab)

      if(input$addmean) {

        # Add a vertical line at the mean of x
        abline(v = mean(x),
               lwd = 2,      # Thickness
               lty = 2)      # Dashed line

      }

   })
}

# Run the application
shinyApp(ui = ui, server = server)

