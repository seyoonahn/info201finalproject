library(shiny)
library(ggplot2)
library(maps)
library(dplyr)


mwdata2 <- mwdata %>% 
  group_by(State, Year) %>% 
  summarize(Year = Year, State = State, State_Min_Wage = mean(State.Minimum.Wage.2020.Dollars), Federal_Min_Wage = mean(Federal.Minimum.Wage.2020.Dollars), Effective_Min_Wage = mean(Effective.Minimum.Wage.2020.Dollars))
mwdata3 <- distinct(mwdata2)

mwdata4 <- filter(mwdata3, State_Min_Wage > 0)

mwdata5 <- select(mwdata4, State, Year, State_Min_Wage)
View(mwdata4)

mwdata6 <- select(mwdata4, Year, Federal_Min_Wage, Effective_Min_Wage)
View(mwdata6)

urdata2 <- urdata %>%
  group_by(State, Year) %>%
  summarize(Year = Year, State = State, Rate = mean(Rate))
urdata3 <- distinct(urdata2)
View(urdata3)

