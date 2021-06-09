#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
mwdata <- read.csv("Minimum Wage Data.csv")
urdata <- read.csv("output.csv")

# Define UI for application that draws a histogram
shinyUI(
    navbarPage("INFO201 Final Project: US Minimum Wage and Unemployment Rate",
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
                                plotOutput("Plot3")
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
                                plotOutput("distPlot")
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
                               plotOutput("Plot2")
                            ))),
               tabPanel("Summary",
                        sidebarLayout(
                            sidebarPanel(
                                sliderInput("bins",
                                            "Number of bins:",
                                            min = 1,
                                            max = 50,
                                            value = 30)
                            ),
                            
                            
                            # Show a plot of the generated distribution
                            mainPanel(
                               ## plotOutput("distPlot")
                            )))
               

))
