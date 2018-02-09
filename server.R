library(shiny)



shinyServer(function(input, output) {

    kage <- data.frame(
	    maengde = c(4, 300, 2, 50, 250, 3, 1) / 20,
	    enhed = c("", "g", "dl", "g", "g", "tsk", "tsk"),
	    ingrediens = c("æg", "sukker", "mælk", "smør", 
		"hvedemel", "bagepulver", "vaniljesukker"),
	    stringsAsFactors = FALSE
	    )

    fyld <- data.frame(
	    maengde = c(100, 150, 225) / 20,
	    enhed = c("g", "g", "g"),
	    ingrediens = c("smør", "kokosmel", "brun farin"),
	    stringsAsFactors = FALSE
	    )

    scaleKage <- reactive({
	    df <- kage
	    df$maengde <- df$maengde * input$antal
	    df
    })

    scaleFyld <- reactive({
	    df <- fyld
	    df$maengde <- df$maengde * input$antal
	    df
    })

    output$kage <- renderTable(scaleKage(),
	    include.rownames = FALSE,
	    include.colnames = FALSE)

    output$fyld <- renderTable(scaleFyld(), 
	    include.rownames = FALSE,
	    include.colnames = FALSE)
})
