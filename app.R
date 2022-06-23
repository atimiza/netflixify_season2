library(dplyr)
library(rsconnect)
library(shinydashboard)
library(DT)

d1 <- read.csv("https://github.com/atimiza/netflixify_season2/blob/main/netflixdata.csv", header = TRUE)

ui <- dashboardPage(
  title = "Netflix",
  skin = "blue",
  dashboardHeader(title = "Netflixify"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Getting Started", tabName = "gettingstarted", icon = icon("info")),
      menuItem("Recommender", tabName = "recommender", icon = icon("smile-wink"))
    )
  ),
  
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "gettingstarted",
              fluidRow(
                box(
                  width = 12,
                  h2("Welcome to Netflixify ^_^"),
                  h4("Find your desired Netflix show here!"),
                )
              ),
              fluidRow(
                box(
                  width = 12,
                  h3("Instructions:"),
                  h4("1. Go to Recommender menu."),
                  h4("2. Choose your preferred type of show, genre and country."),
                  h4("3. Click 'GO'"),
                  h4("4. Voila! You will now see lists of shows that might suit your interest."),
                  h4("Happy watching <3")
                )
              ),
              
      ),
      
      tabItem(tabName = "recommender",
              fluidRow(
                box(
                  width = 12,
                  h4("Fill In Your Preferences"),
                  selectInput("type", "Type", c("All", unique(as.character(d1$Type)))),
                  selectInput("genre", "Genre", c("All", unique(as.character(d1$Genre)))),
                  selectInput("country", "Country", c("All", unique(as.character(d1$Country)))),
                  submitButton(" GO", icon = icon("play")),
                )
              ),
              # Create a new row for the table.
              DT::dataTableOutput("table")
      )
    )
  )
)

server <- function(input, output) {
  
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    data <- d1
    if (input$type != "All") {
      data <- data[data$Type == input$type,]
    }
    if (input$genre != "All") {
      data <- data[data$Genre == input$genre,]
    }
    if (input$country != "All") {
      data <- data[data$Country == input$country,]
    }
    data
  }))
  
}

# Run the application 
shinyApp(ui = ui, server = server)
