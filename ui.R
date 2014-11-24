library(shiny)

shinyUI(pageWithSidebar(
    
    headerPanel("Simple ETF Dashboard"),
    
    sidebarPanel(
        selectInput("symbol", "Symbol:", selected='GDX',
                    list("GDX" = "GDX", 
                         "CORN" = "CORN", 
                         "SPY" = "SPY",
                         'QQQ' = 'QQQ')
            ),
        helpText('Choose ETF symbol that you wanna look at'),        
        textInput('drange', 'Date range:', value='last 3 month'),
        helpText("The range should be presented as xts valid range. Example1: 'last 3 years' Example2: '2014-10::2014-12'"),
        checkboxInput('VO', 'Bollinger Bands', value = T),
        submitButton('Browse')
        ),
    
    mainPanel(
        tabsetPanel(
            tabPanel("Plot", plotOutput('plt')),
            tabPanel("Documentation", 
                    p('This service present ETF candle chart for selected symbol'),
                    p('The number of symbols are restricted by 4 preselected'),
                    p('You can select time range to look at'),
                    p('ETF EOD data downloaded from Yahoo Finance (TM) service'),
                    p('Couse downloading is time consuming procedure all actions are takens after submit')
                    
            )
            )
        )
    )
)