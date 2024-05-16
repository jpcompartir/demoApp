server <- function(input, output, session){
  generate_data <- function(){
    
    set.seed(111)
    data <- data.frame(
      x = rnorm(500, mean = 4, sd = 1),
      y = rnorm(500, mean = 4.5, sd = 1.2)
    )
    
    return(data)
  }
  data <- generate_data()
  clusters <- kmeans(data, centers = 10)
  data$cluster <- factor(clusters$cluster)
  
  
  output$landscapePlot <- plotly::renderPlotly({
    p <- plot_ly(data, x = ~x, 
            y = ~y, 
            type = "scattergl", 
            mode = "markers",
            color =~cluster)
    
    p <- p %>% layout(
      xaxis = list(
        title = FALSE,
        showgrid = FALSE,  # Remove gridlines
        zeroline = FALSE,  # Remove zero line
        showline = FALSE,  # Remove axis line
        showticklabels = FALSE  # Remove tick labels
      ),
      yaxis = list(
        showgrid = FALSE,  
        zeroline = FALSE,  
        showline = FALSE,  
        showticklabels = FALSE,
        title = FALSE
      ))
      
    p
  })
  
}