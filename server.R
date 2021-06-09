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

mwdata2 <- mwdata %>% 
    group_by(State, Year) %>% 
    summarize(Year = Year, State = State, State_Min_Wage = mean(State.Minimum.Wage.2020.Dollars), Federal_Min_Wage = mean(Federal.Minimum.Wage.2020.Dollars), Effective_Min_Wage = mean(Effective.Minimum.Wage.2020.Dollars))
mwdata3 <- distinct(mwdata2)

mwdata4 <- filter(mwdata3, State_Min_Wage > 0)

mwdata5 <- select(mwdata4, State, Year, State_Min_Wage)


randommwdata <- mwdata %>% 
    group_by(Year) %>% 
    summarize(Year = Year, Federal_Min_Wage = mean(Federal.Minimum.Wage.2020.Dollars), Effective_Min_Wage = mean(Effective.Minimum.Wage.2020.Dollars))
mwdata6 <- distinct(randommwdata)


urdata2 <- urdata %>%
    group_by(Year) %>%
    summarize(Year = Year, Rate = mean(Rate))
urdata3 <- distinct(urdata2)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({
        ##year <- input$year
        yeardata <- filter(mwdata5, Year %in% input$year)
        ggplot(data = yeardata, aes(x = State, y = State_Min_Wage)) +
            geom_bar(stat = "identity", fill = "blue") +
            theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))+
            labs(title = "State Minimum Wage for Each State")
        
    })
    
    output$Plot2 <- renderPlot({
        if(input$radio == "1"){
            ggplot(data = mwdata6, aes(x = Year, y = Federal_Min_Wage)) + geom_bar(stat = "identity", fill = "blue") + labs(title = "Federal Minimum Wage Each Year")
        }else{
            ggplot(data = mwdata6, aes(x = Year, y = Effective_Min_Wage)) + geom_bar(stat = "identity", fill = "green") + labs(title = "Effective Minimum Wage Each Year")
        }
    })
    
    output$Plot3 <- renderPlot({
        if(input$radio2 == "1"){
            ggplot(data = urdata3, aes(x = Year, y = Rate)) + geom_bar(stat = "identity", fill = "purple") + labs(title = "National Unemployment Rate Each Year")
        }else{
            ggplot(data = mwdata6, aes(x = Year, y = Effective_Min_Wage)) + geom_bar(stat = "identity", fill = "red") + labs(title = "Effective Minimum Wage Each Year")
        }
    })
    
    output$summary <- renderText({
        
    })

})
