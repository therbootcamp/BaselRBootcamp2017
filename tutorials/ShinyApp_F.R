library(shiny)
library(tidyverse)

# Define UI for application that draws a histogram
ui <- fluidPage(

  # Application title
  titlePanel("My First Shiny App!"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(

      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30),

      selectInput(inputId = "mydata",
                  label = "Dataset",
                  choices = c("geyser", "diamonds", "economics"),
                  selected = "geyser"),

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

    mainPanel(
      # Output: Tabset w/ plot, summary, and table ----
      tabsetPanel(type = "tabs",
                  tabPanel("Histogram", plotOutput("distPlot")),
                  tabPanel("Summary", verbatimTextOutput("summary")),
                  tabPanel("Description",
                           h3("Shiny is Awesome!"),
                           p("You can really do anything with Shiny!"),
                           a("Click me to go to the Shiny page",
                             href = "https://shiny.rstudio.com/gallery/")
                  )
      )
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  x_reactive <- reactive({

    switch(input$mydata,
           "geyser" = faithful[,2],
           "economics" = economics$unemploy,
           "diamonds" = diamonds$price)

  })


  output$distPlot <- renderPlot({

    bins <- seq(min(x_reactive()), max(x_reactive()), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(x_reactive(),
         breaks = bins,
         col = input$bincolor,   # HERE!!! Change color based on input$bincolor
         border = 'white',
         main = input$main,
         xlab = input$xlab)

    if(input$addmean) {

      # Add a vertical line at the mean of x
      abline(v = mean(x_reactive()),
             lwd = 2,      # Thickness
             lty = 2)      # Dashed line

    }


  })

  # Generate a summary of the data ----
  output$summary <- renderPrint({
    summary(x_reactive())
  })

}

# Run the application
shinyApp(ui = ui, server = server)
