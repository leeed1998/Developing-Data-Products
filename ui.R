
# Install the shiny package if not already installed
# install.packages("shiny")

#library(shiny) # load the shiny package

# Define UI for application
shinyUI(fluidPage(
  
  # Header or title Panel 
  titlePanel(h4('A Histogram with of KPI for WJ', align = "center")),
  
  # Sidebar panel
  sidebarPanel(
    
    selectInput("var", label = "1. Select the KPI to Check", 
                choices = c("Ave_Freq" = 7, "Ave_Spend" = 6, "Ave_ticket" = 8, "People"=3),
                selected = 3), 
    
    sliderInput("Months", "2. Select the number of histogram Months by using the slider below", min=1, max=12, value=1),
    
    radioButtons("color", label = "3. Select the color of histogram",
                 choices = c("Green", "Red",
                             "Yellow"), selected = "Green")
  ),
  
  # Main Panel
  mainPanel(
    textOutput("text1"),
    textOutput("text2"),
    textOutput("text3"),
    plotOutput("myhist")
    
  )
  
)
)