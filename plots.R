library(shiny)
library(ggplot2)
library(maps)
library(dplyr)

View(mwdata)

mwdata2 <- mwdata %>% 
  group_by(State, Year) %>% 
  summarize(Year = Year, State = State, State_Min_Wage = mean(State.Minimum.Wage.2020.Dollars), Federal_Min_Wage = mean(Federal.Minimum.Wage.2020.Dollars), Effective_Min_Wage = mean(Effective.Minimum.Wage.2020.Dollars))
mwdata3 <- distinct(mwdata2)
View(mwdata3)
mwdata4 <- filter(mwdata3, State_Min_Wage > 0)
View(mwdata4)
mwdata5 <- select(mwdata4, State, Year, State_Min_Wage)
View(mwdata5)

mwdata6 <- select(mwdata6, Year, Federal_Min_Wage, Effective_Min_Wage)
View(mwdata6)

urdata2 <- urdata %>%
  group_by(State, Year) %>%
  summarize(Year = Year, State = State, Rate = mean(Rate))
urdata3 <- distinct(urdata2)
View(urdata3)

