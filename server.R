library(shiny)
library(quantmod)

shinyServer(function(input, output) {
    output$plt <- renderPlot({
        getSymbols(input$symbol, source='yahoo') 
        candleChart(get(input$symbol), subset = input$drange, 
                    name = input$symbol,
                    theme=chartTheme('white'))
        if(input$VO) {
            addBBands()
        }
        
    })
})