## SERVER

library(shiny)

# Developing the model
shinyServer(function(input, output) {
    
    ### model fit
    data("cars")
    modelFit <- lm(dist~speed, data=cars)
    
    ### predictions
    ### I'll use then to plot 
    modelPred <- coef(modelFit)[1]+coef(modelFit)[2]*cars$speed
    
   ### plot
    output$modelPlot <- renderPlot({
        plot(cars$speed, cars$dist, main="Car speed vs distance",
             xlab = "Speed", ylab="Distance",
             pch=19, col="grey", lwd=2)
        
        if(input$ShowModel){
            ## regression line
            abline(modelFit, lwd=2, col="red")
            
            ## predicted value
            speedInput <- as.numeric(input$Speed)
            PredictedPoint <- coef(modelFit)[1]+coef(modelFit)[2]*speedInput
            points(speedInput,PredictedPoint, lwd=4, col="red")
            
            ## text
            text(speedInput, PredictedPoint, round(PredictedPoint,2), pos=3)

        } 
        
        if(input$ShowLeastSquare){
            
            for (i in 1:length(cars$speed)) {
                lines(c(cars$speed[i], cars$speed[i]), 
                      c(cars$dist[i], modelPred[i]), col="blue")
            }
        }
    })
    
    
    ### Diagnostic plot
    output$Diagnostic <- renderPlot({
        
        numberD <- as.numeric(input$num)
        plot(modelFit, numberD, pch=19, col="grey", lwd=2)
    })


})
