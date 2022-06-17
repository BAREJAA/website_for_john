library(shiny)
library(shinyjs)
library(tidyverse)

df <- tribble(
    ~Question, ~Answer,
    "Which function would you use to choose particular rows?", "filter()",
    "Which function would you use to choose particular columns?", "select()",
    "Which geom_*() function would you use to make a scatter plot?", "geom_point()",
    "How does arrange() order numeric values?", "From lowest to highest",
    "group_by() works especially well with which other dplyr function?", "summarise()/summarize()",
    "'%>%' is knows as the...", "pipe operator",
    "In a tidy dataset, what's another term for rows?", "Observations",
    "In a tidy dataset, what's another term for columns?", "Variables",
    "Which function can we use to assign a title to a plot?", "labs()"
)

ui <- fluidPage(
    useShinyjs(),
    titlePanel("Tidybiology Flashcards"),
    
    fluidRow(
        column(3,
               tags$head(
                   tags$style(HTML('#question{background-color:blue;
                                color:white}'))
               ),
               actionButton("question", "Next Question", width = '150px', icon = icon('refresh')),
               tags$head(
                   tags$style(HTML('#answer{background-color:blue;
                                color:white}'))
               ),
               uiOutput("button2")
        ),
        column(9,
               tags$head(
                   tags$style(HTML('#Question{font-size: 25px;
                                           text-align: center}'))
               ),
               textOutput("Question"),
               tags$head(
                   tags$style(HTML('#Answer{font-size: 25px;
                                         text-align: center}'))
               ),
               textOutput("Answer")
        )
    )
)

server <- function(input, output) {
    
    df1 <- NULL
    df2 <- NULL
    observeEvent(input$question, {
        output$Answer <- renderText({})
        
        df1 <<- df[sample(nrow(df), 1), ]
        df2 <<- df1
        question <- df1$Question
        
        output$Question <- renderText({question})
        
        output$button2 <- renderUI({
            actionButton("answer", label = "Show Answer", width = '150px', icon = icon('check'))
        })
        
    })
    
    observeEvent(input$answer, {
        output$Answer <- renderText({})
        answer <- df2$Answer
        
        output$Answer <- renderText({answer})
        shinyjs::hide("answer")
    })
    
}

shinyApp(ui = ui, server = server)



