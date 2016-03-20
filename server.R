

shinyServer(
        function(input, output) {
           output$myContango <- renderPlot({
                   library(shiny)
                   library(zoo)
                   # We access a saved version of the cleaned up Oil Futures data going back to 1983
                   CL <- read.zoo("CL.csv", header = TRUE, check.names = FALSE)
                   # We create a Table with the picks from the ui.R file corresponding to the Time Periods
                   pd <- data.frame(pick = c(1, 2, 3, 4, 5), per = c(3650, 1825, 365, 30, 5))
                   
                   # The Time Period "pick" is inputted here to give us a period to subset the data
                   pr <- pd[pd$pick == input$pick,2]
                   library(zoo)
                   data <- window(CL, start = end(CL) - pr, end = end(CL))
                   # Creating data for a single specified "day"
                   sub <- t(data[as.Date(input$day)])
                   # Plotting that day's future strip
                   plot(sub, main = paste("Oil Futures Strip", input$day, sep=" "), type = "l", col = "green", xlab = "Contract Month", ylab = "Futures Price")
           }, height = 650, width = 500)
           
        }
)