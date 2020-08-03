# APLICATION FOR THE COURSERA DEVELOPING DATA PRODUCTS COURSE. 

library(shiny)

shinyUI(fluidPage(

    # Application title
    titlePanel(strong("Distance Prediction APP")),

    # Inputs
    sidebarLayout(
        sidebarPanel(
            h2(strong("Inputs")), 
            sliderInput("Speed",
                        "Speed value",
                        min = 4,
                        max = 25,
                        value = 15),
            checkboxInput("ShowModel", "Show model?", value=TRUE),
            checkboxInput("ShowLeastSquare", "Least Squares?", value=TRUE),
            numericInput("num", "Diagnostic plot number", min=1, 
                         max=6, value=1, step=1)
        ),

        # TABS
        mainPanel(
           tabsetPanel(type="tabs",
                        tabPanel("Model Plot", br(),  
                                 h3("Model fit plot"), 
                                 plotOutput("modelPlot"),
                                 br(),
                                 plotOutput("Diagnostic")),
                       
                        tabPanel("Information", br(), 
                                 h2(strong("Coursera: Developing data products")),
                                 h3(strong("Student:"), 
                                           "Janick Reales"),
                                 tagList(strong("Git hub:"),
                                         "https://shiny.rstudio.com/articles/tabsets.html"),
                                 br(),
                                 tagList(strong("Pitch Presentation:"),
                                         "https://rpubs.com/jarealess/645709"),
                                 br(),
                                 br(),
                                 tagList("This aplication can be used to study the relationship
                                         between the speed and the distance reached by a car. The data
                                         used was taken from the CARS data set.
                                         You can fit the regression lines, show the leats squared
                                         lines and see a prediction made by the model for a given speed
                                         value and its dist value over the red line.
                                         The aplication also shows the diagnostics plots, where the
                                         user can select a number from 1 to 6 and see the respective
                                         diagnostic plot he/she wants to explore.")))
        )
    )
))
