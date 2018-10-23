library(shiny)

ui<-  fluidPage(
    titlePanel("My Shiny App"),
    sidebarLayout(
      sidebarPanel(
        radioButtons("x", "Select X-axis:",
                     list("Sepal.Length"='a',
                          "Sepal.Width"='b',
                          "Petal.Length"='c',
                          "Petal.Width"='d')),
        radioButtons("y", "Select Y-axis:",
                     list("Spal.Length"='e',
                          "Sepal.Width"='f',
                          "Petal.Length"='g',
                          "Petal.Width"='h'))
      ),
      mainPanel(
        plotOutput("distPlot")
      )
    )
  )

server <-function(input, output) {
  output$distPlot <- renderPlot({
    if(input$x=='a'){
      i<-1
    }
    
    if(input$x=='b'){
      i<-2
    }
    
    if(input$x=='c'){
      i<-3
    }
    
    if(input$x=='d'){
      i<-4
    }
    
    if(input$y=='e'){
      j<-1
    }
    
    if(input$y=='f'){
      j<-2
    }
    
    if(input$y=='g'){
      j<-3
    }
    
    if(input$y=='h'){
      j<-4
    }
    s    <- iris[, i]
    k    <- iris[, j]
    plot(s,k)
  })
}

shinyApp(ui=ui,server=server)