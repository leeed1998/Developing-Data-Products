#library(shiny) # Load shiny package

library(RCurl)
urlfile <- 'https://raw.githubusercontent.com/leeed1998/Developing-Data-Products/master/Testdata_WJ.csv'
Testdata_WJ <- read.csv(url(urlfile))


shinyServer(
  
  
  function(input, output) {
    
    output$text1 <- renderText({ 
      colm = as.numeric(input$var)
      paste("Data set variable/column name is", names(Testdata_WJ[colm]))
      
    })
    
    output$text2 <- renderText({ 
      paste("Color of histogram is", input$color)
    })
    
    output$text3 <- renderText({ 
      paste("Number of histogram BINs is", input$Months)
    })
    
    output$myhist <- renderPlot(
      
      {
        colm = as.numeric(input$var)
        hist(Testdata_WJ[,colm], col =input$color, xlim = c(0, max(Testdata_WJ[,colm])),
             main = "Histogram of WJ KPI dataset", 
             breaks = seq(0, max(Testdata_WJ[,colm]),
            l=input$Months+1), 
            xlab = names(Testdata_WJ[colm]))}
      
    )    
  }
)