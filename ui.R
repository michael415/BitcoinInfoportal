library(shiny)

predictionExplanation <- "The prediction is simply for demonstrational purposes and
                          naturally is by no means accurate. In most cases, it will
                          even be flat due to the way the forecast algorithm works."

calculatorExplanation <- "The prediction is simply for demonstrational purposes and
                          naturally is by no means accurate. In most cases, it will
                          even be flat due to the way the forecast algorithm works."

shinyUI(fluidPage(
  titlePanel("Bitcoin Infoportal"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select a currency to compare with. 
        Information will be collected from Quandl."),
    
      selectInput("cur", "Currency:", c("USD", "EUR", "CNY")),
      
      helpText("Current rate: "),
      textOutput("currentrate"),
      
      hr(),
    
      dateRangeInput("dates", 
        "Date range",
        start = "2014-09-15", 
        end = as.character(Sys.Date())),
      
      checkboxInput("log", "Plot y axis on log scale", 
        value = FALSE)
    ),
    
    mainPanel(tabsetPanel(type = "tabs",
              tabPanel("Chart", plotOutput("chart")),
              tabPanel("Prediction", verticalLayout(plotOutput("prediction"),
                                                helpText(predictionExplanation))),
              tabPanel("Calculator", inputPanel(fluidRow(textInput("btcInput", "Bitcoins:", "10"),
                                                verbatimTextOutput("btcOutput")),
                                                fluidRow(textInput("curInput", "Currency:", "10"),
                                                verbatimTextOutput("curOutput"))),
                                                helpText(calculatorExplanation)
                                                )))
  )
))