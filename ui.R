library(shiny)

billede <- "https://cdn-rdb.arla.com/Files/arla-dk/2636745693/029e06c3-4c5a-428b-8cb0-5f439523ea25.jpg"

shinyUI(fluidPage(
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

))
