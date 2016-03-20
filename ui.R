#
# This is a Shiny application that plots Oil Contango for specified dates. 
# Its a simple application that takes Oil Futures price data on contracts for 36 forward months.
# The prices plotted for a given day represent a Oil Futures Strip. If the price curve is a positively
# sloping curve, then Oil (or any commodity that exhibits that) is called to be in Contango.
# If the price curve is a negatively sloping curve, then Oil is said to be in Backwardation.
# Contango implies that the market expects future prices to be higher which prompts producers to store 
# the commodity for future sales which depresses current demand.
# In backwardation, the market expects prices to be lower in the future prompting producers to store less
# and sell more today or that producers may already have been pumping a lot of Oil recently - that does not
# bode well for the current demand-supply situation and that prices of Oil could be heading south.
# The App asks for input on the time period during that the user wants to look at the strip data for.
# and also plots the strip data for a specific date. "Flipping through" the historical dates can show where the 
# the curve changed the slope from Contango to Backwardation and vice versa and what followed with the Oil price thereafter.

# Look at the dates surrounding Oct 2014 to see how the curve changed and then Oil prices tumbled.
# Backwardation switching to Contango could be bearish for Oil prices while vice versa could be bullish.

# To run the App do runApp() at the prompt when your current working directory holds the ui.R and server.R files.


library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Oil Contango"),
  sidebarPanel(
       checkboxGroupInput("pick", "Time Period to Plot:",
                          c("10 years" = "1",
                            "5 years" = "2",
                            "1 year" = "3",
                            "1 month" = "4",
                            "5 days" = "5"), selected = "2"),
        dateInput("day", "Date:", value = as.Date("2014-10-20"))
    ),
    
    mainPanel(
       plotOutput('myContango')
    )
))
