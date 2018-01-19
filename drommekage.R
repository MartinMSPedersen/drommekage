library(shiny)
source("ingredienser.R")

billede <- "https://cdn-rdb.arla.com/Files/arla-dk/2636745693/029e06c3-4c5a-428b-8cb0-5f439523ea25.jpg"


server <- function(input, output) {
    kage <- data.frame(
		mængde = c(4, 300, 2, 50, 250, 3, 1) / 20,
		enhed = c("", "g", "dl", "g", "g", "tsk", "tsk"),
		ingrediens = c("æg", "sukker", "mælk", "smør", 
			"hvedemel", "bagepulver", "vaniljesukker"),
		stringsAsFactors = FALSE
	    )

	    fyld <- data.frame(
		mængde = c(100, 150, 225) / 20,
		enhed = c("g", "g", "g"),
		ingrediens = c("smør", "kokosmel", "brun farin"),
		stringsAsFactors = FALSE
	    )

	    scaleKage <- reactive({
		df <- kage
		df$mængde <- df$mængde * input$antal
		df
	    })

	    scaleFyld <- reactive({
		df <- fyld
		df$mængde <- df$mængde * input$antal
		df
	    })

    output$kage <- renderTable(scaleKage(),
	    include.rownames = FALSE,
	    include.colnames = FALSE)

    output$fyld <- renderTable(scaleFyld(), 
	    include.rownames = FALSE,
	    include.colnames = FALSE)
}

ui <- 
    fluidPage(
	tags$b(h1("Drømmekage fra Brovst")),
	p("Kageopskrift fra ", 
	    a("Arla", href = "http://www.arla.dk/opskrifter/drommekage-fra-brovst/")),
	img(src = billede),
	p("Hvor mange stykker kage?"),
	numericInput("antal", "", 10, min = 10, step = 5),
	h2("Ingredienser til kagen"),
	tableOutput("kage"),  
	h2("Ingredienser til fyldet"),
	tableOutput("fyld"),  
	h2(tags$i("Sådan gør du")),
	h3(tags$b("Selve kagen")),
	tags$ul(
	    tags$li("Pisk æg og sukker lyst og luftigt. Varm imens mælk og smør (lillefingervarmt)."),
	    tags$li("Bland mel, bagepulver og vaniljesukker sammen."),
	    tags$li("Vend det forsigtigt, drysset gennem en sigte, i dejen skiftevis med mælkeblandingen."),
	    tags$li("Hæld dejen i en lille bradepande beklædt med bagepapir og bag kagen midt i oven.")
	    ),
	h3(tags$b("Fyldet")),
	tags$ul(
	    tags$li("Kom smør, kokosmel, farin og mælk i en tykbundet gryde og bring det i kog under omrøring."),
	    tags$li("Tag kagen ud (den skal være næsten færdigbagt) og skru op for ovnen."),
	    tags$li("Fordel fyldet på kagen og bag den færdig, stadig midt i ovnen.")
	    ),
	h3(tags$b("Bagetid")),
	p("Ca. 20 min. ved 200 grader - traditionel ovn"),
	p(a("Source kan findes her:", href = "https://github.com/MartinMSPedersen/drommekage"))
)

shinyApp(ui = ui, server = server)
