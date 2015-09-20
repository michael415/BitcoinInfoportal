library(quantmod)
library(Quandl)
library(forecast)

shinyServer(function(input, output, clientData, session) {
  dataInput <- reactive({
    Quandl(paste("BAVERAGE/", input$cur, sep=""), type="xts",
           start_date=input$dates[1], end_date=input$dates[2],
           authcode="EgDKD9Yo4Suhhad8y4LJ")
  })
  
  tsInput <- reactive({
    ts <- as.ts(dataInput()[,1])
    fore <- forecast(ts, h=100)
  })
  
  currentRate <- reactive({
    as.numeric(tail(dataInput(), 1))[1]
  })
  
  output$chart <- renderPlot({
      chartSeries(dataInput(), theme=chartTheme("white"), log.scale=input$log, name=paste("BTC/", input$cur, sep=""))
  })
  
  output$prediction <- renderPlot({
      plot(tsInput())
  })
  
  output$currentrate <- renderText({
      paste(as.character(currentRate()), input$cur)
    })
  
  output$btcOutput <- renderText({
      value <- as.numeric(input$btcInput)*currentRate()
      paste(as.character(value), input$cur)
  })
  
  output$curOutput <- renderText({
      value <- as.numeric(input$curInput)/currentRate()
      paste(as.character(value), "BTC")
  })
})