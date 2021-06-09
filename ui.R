#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
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

# Define UI for application that draws a histogram
shinyUI(
    navbarPage("INFO201 Final Project: US Minimum Wage and Unemployment Rate",
               tabPanel("Project Overview",
                        sidebarLayout(
                          sidebarPanel(
                            h2("Project Purpose:"),
                            p("In the United States, states and the federal government set minimum hourly pay (\"minimum wage\") that workers can
                               receive to ensure that citizens experience a minimum quality of life. Along with the history of minimum wage, the question
                               of whether the increase of minimum wage has positive or negative impact on the economics, specifically unemployment rate, has been
                               an on-going debate. Our project is designed to analyze the impact of minimum wage in local and national economy using unemployment rate as a measurement."),
                            h2("Data Source"),
                            p("The data is taken from the ",a("Kaggle Minimum Wage", href='https://www.kaggle.com/lislejoem/us-minimum-wage-by-state-from-1968-to-2017'), "and the", 
                              a("Kaggle Unemployment Rate", href='https://www.kaggle.com/jayrav13/unemployment-by-county-us'), " databases.
                              These datasets provide the minimum wage data set by each state and the federal government from 1968 to 2020 and US unemployment rate by county from 1990 to 2016.")
                          ),
                          
                          # Show a plot of the generated distribution
                          mainPanel(
                            img(src='minimumwage.jpg', height = 50, width = 50)
                          ))),
               tabPanel("Unemployment Rate Correlation with Minimum Wage",
                        sidebarLayout(
                            sidebarPanel(
                              radioButtons("radio2",
                                           "Minimum Wage vs Unemployment Rate",
                                           choices = list("Unemplyment Rate" = 1, "Effective Minimum Wage" = 2), 
                                           selected = 1)
                            ),
                            
                            # Show a plot of the generated distribution
                            mainPanel(
                                plotOutput("Plot3"),
                                h2("This graph shows the national unemployment rate of the US for each year from 1990 to 2016"),
                                h2("It also shows another graph that displays the effective minimum wage for each year from 1968 to 2020")
                            ))),
               tabPanel("State Minimum Wages",
                        sidebarLayout(
                            sidebarPanel(
                                sliderInput("year",
                                            "Year",
                                            min = 1968,
                                            max = 2020,
                                            value = 1968)
                            ),
                            
                            # Show a plot of the generated distribution
                            mainPanel(
                                plotOutput("distPlot"),
                                h2("This graph displays the minimum wages of different states in different years.
                                The states that don't have state minimum wages, like Alabama, are not represented in this graph.")
                            ))),
               tabPanel("Minimum Wage Increase",
                        sidebarLayout(
                            sidebarPanel(
                                radioButtons("radio",
                                            "Federal vs Effective",
                                            choices = list("Federal Minimum Wage" = 1, "Effective Minimum Wage" = 2), 
                                            selected = 1)
                            ),
                
                            
                            # Show a plot of the generated distribution
                            mainPanel(
                               plotOutput("Plot2"),
                               h2("You can choose to see two graphs, that display either the Effective Minimum Wage or the Federal Minimum Wage over the time period of 1968 to 2020")
                            ))),
               tabPanel("Conclusion",
                        h2("Conclusion"),
                        p("Unemployment rate and minimum wage trends showed overall 2 different patterns: both showing up or downward
                          trends together and each data showing opposite trends. The first pattern was especially notable in 1990-2000 unemployment 
                          and minimum wage trends. While the unemployment rate showed more fluctuation, an overall increasing trend in both unemployment rate 
                          and minimum wage. However, in the 2010s, the unemployment rate showed a huge downward trend while the minimum wage stayed relatively stable. 
                          Taking both patterns into consideration, the minimum wage has not shown an explicit impact on the national unemployment rate. Throughout the historical 
                          data of minimum wage and unemployment rate, the unemployment rate showed a weak correlation with the increase or decrease in the federal or effective minimum wage. This illustrates that 
                          the increase in minimum wage does not necessarily lead to an economic hardship nationwide and an upgrade in worker's quality of life can be ensured without strong macroeconomic concerns such as the unemployment rate."),
                        h2("Quality of Data:"),
                        p("While we found our data reasonable and clear, the data leaves out a lot of different factors such as the unemployment rate by race or gender, which can possibly undermine the economic damage to certain group of people 
                          in the country possibly correlating with the increase of minimum wage."),
                        h2("Future Idea:"),
                        p("For future research, we would like to include datasets that contain different factors and groups that could be influenced stronger by the change in the minimum wage than other workers such as unemployment rate by race or gender or minimum wage for tip workers.")
                        )
               

))
