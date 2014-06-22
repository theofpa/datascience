library(shiny)
library(XML)
cityWeather <- function(city) {
  address=city
  url = paste( "http://api.openweathermap.org/data/2.5/weather?mode=xml&q=", URLencode(address), sep="" )
  xml = xmlTreeParse(url, useInternalNodes=TRUE) # take a look at the xml output:
  condition=xpathSApply(xml,"//current/clouds",xmlGetAttr,"name")
  temp_c=xpathSApply(xml,"//current/temperature",xmlGetAttr,"value")
  humidity=xpathSApply(xml,"//current/humidity",xmlGetAttr,"value")
  country=xpathSApply(xml,"//current/city/country",xmlValue)
  city=xpathSApply(xml,"//current/city",xmlGetAttr,"name")
  return(cat(paste("The weather prediction for", city, "in",country,"reports", condition, "
The temperature is", temp_c, "Kelvin and humidity is", humidity, "%.")))
}

shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({input$city})
    output$prediction <- renderPrint({cityWeather(input$city)})
  }
)
