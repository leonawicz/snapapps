library(shiny)
library(shinythemes)
library(snaputils)
addResourcePath("res", snap_res("images"))

shinyUI(fluidPage(theme=shinytheme("united"),
	headerPanel(
		HTML('Distributions of Random Variables v1
			<a href="http://snap.uaf.edu" target="_blank"><img align="right" src="res/snap_acronym_color.svg" height="35px"/></a>'
		), "Distributions of Random Variables"
	),
	fluidRow(
		column(4,
			wellPanel(
				radioButtons("dist","Distribution type:",
					list("Normal"="norm","Uniform"="unif","t"="t","F"="F","Gamma"="gam","Exponential"="exp","Chi-square"="chisq","Log-normal"="lnorm","Beta"="beta")),
				sliderInput("n","Sample size:",1,1000,500),
				uiOutput("dist1"),
				uiOutput("dist2"),
				checkboxInput("density","Show density curve",FALSE),
				conditionalPanel(
					condition="input.density==true",
					numericInput("bw","bandwidth:",1)
				),
				downloadButton("dldat", "Download Sample", class="btn-warning")
			)
		),
		column(8,
			tabsetPanel(
				tabPanel("Plot",plotOutput("plot",height="600px")),
				tabPanel("Summary",verbatimTextOutput("summary")),
				tabPanel("Table",tableOutput("table"))
			)
		)
	)
))
