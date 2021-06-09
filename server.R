#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(ggplot2)
library(maps)
library(dplyr)

mwdata <- read.csv("Minimum Wage Data.csv")
urdata <- read.csv("output.csv")


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({
        ##year <- input$year
        yeardata <- filter(mwdata5, Year %in% input$year)
        ggplot(data = yeardata, aes(x = State, y = State_Min_Wage)) +
            geom_bar(stat = "identity", fill = "blue") +
            theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
        
    })
    
    output$Plot2 <- renderPlot({
        if(input$radio == "1"){
            ggplot(data = mwdata6, aes(x = Year, y = Federal_Min_Wage)) + geom_bar(stat = "identity", fill = "blue")
        }else{
            ggplot(data = mwdata6, aes(x = Year, y = Effective_Min_Wage)) + geom_bar(stat = "identity", fill = "green")
        }
    })
    
    output$Plot3 <- renderPlot({
        if(input$radio2 == "1"){
            ggplot(data = urdata3, aes(x = Year, y = Rate)) + geom_bar(stat = "identity", fill = "purple")
        }else{
            ggplot(data = mwdata6, aes(x = Year, y = Effective_Min_Wage)) + geom_bar(stat = "identity", fill = "red")
        }
    })
    
    output$summary <- renderText({
        
    })

})
