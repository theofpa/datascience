library(shiny)

# Define UI for dataset viewer application
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Weather prediction"),
  
    sidebarPanel(
      textInput('city', "Please specify the name of the city and optionally its country code." , "Amsterdam,NL"),
      submitButton('Submit')
    ),
    mainPanel(
        h4("You've search for:"),
        verbatimTextOutput("inputValue"),
        h4('Available results:'),
        verbatimTextOutput("prediction")
    )
  )
)

