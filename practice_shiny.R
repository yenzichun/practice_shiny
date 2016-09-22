library(shiny)
library(googleVis)
load(file = "ems_city_group_data.rda")

ui <- fluidPage(
  wellPanel(
    htmlOutput("view")
  )
)
server <- function(input, output, session) {
  output$view  <- renderGvis({
    library(tidyr)
    y <- city_group_count %>% spread(.,yy,count)
    
    library(googleVis)
    gvisColumnChart(y, xvar="city2", yvar=names(y)[-1], options = list(height=600,hAxes="[{title:'year'}]",isStacked=TRUE) )
    
  })
}
shinyApp(ui = ui, server = server)