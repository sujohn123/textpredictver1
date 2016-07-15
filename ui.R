

library(shiny)

shinyUI(pageWithSidebar(
        
        headerPanel("Word Predictor"),
        
        sidebarPanel(h2("Type anything here"),
                     
                textInput('t',"","type"),verbatimTextOutput("text"))
        ,mainPanel()
        #plotOutput("newplot")
        ))







