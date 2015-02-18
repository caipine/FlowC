shinyUI(fluidPage(
        titlePanel("Flow Cytometry Analysis Application"),
        sidebarLayout(
                sidebarPanel(
                        fileInput('file1', 'Choose file to upload',
                                  accept = c(
                                          'text/csv',
                                          'text/comma-separated-values',
                                          'text/tab-separated-values',
                                          'text/plain',
                                          '.csv',
                                          '.fcs'
                                  )
                        ),
                        
                        
                        fluidRow(
                              column(5,
                                radioButtons('x_ch', 'Choose X Channel',
                                     c(FSC_A = 1,
                                       SSC_A = 2,
                                       FL1_A = 3,
                                       FL2_A = 4,
                                       FL3_A = 5), 3
                                     )),
                              column(5,
                                radioButtons('y_ch', 'Choose X Channel',
                                     c(FSC_A = 1,
                                       SSC_A = 2,
                                       FL1_A = 3,
                                       FL2_A = 4,
                                       FL3_A = 5), 2
                        ))
                        ),
                        
                        #numericInput('x_ch', 'Choose X Channel',3, min = 1, max = 5,),
                        #numericInput('y_ch', 'Choose Y Channel',2, min = 1, max = 5,),
                        #sliderInput('x_num', 'Choose Channel',value = 3, min = 1, max = 5, step = 1,),
                        #sliderInput('y_num', 'Choose Channel',value = 1, min = 1, max = 5, step = 1,),
                        textInput("x_lab", label = h4("please input X label"), value = ""),
                        textInput("y_lab", label = h4("please input Y label"), value = ""),
                        
                        sliderInput('xgate', 'Choose x gate line',value = 4, min = 0.5, max = 7.5, step = 0.1,),
                        sliderInput('ygate', 'Choose y gate line',value = 4, min = 0.5, max = 7.5, step = 0.1,),
                        
                        tags$hr(),
                        p('This app is for Flow Cytometry Data (.fcs file) analysis. Usually, you can use FCS_Express or Flowjo to analyze flow cytometry data, but you need buy such kind of programs.'),
                        p('Here, we provide a app to analyze you own .fcs data for free. The app loaded a default file, you change to your own .fcs file,  if you do not have your own .fcs file, you can download one example from.'), 
                        p('You can change the channel to choose different fluoresce color (in example files, FL1_A is green, FL2_A is blue, FL3_A is yellow,  but different FCS machine have different setting)'),
                        p('You can label the X or Y, such as different target protein in your experiment, such as CD45, EGFP.'),
                        p('X gate line and Y gate line will divide the sample as 4 areas, program will give the percentage of each area which covered events. You can change the X gate line and Y gate line to set new gate.')
                        
                        #submitButton('Submit')
                        
                        
                        
                ),
                mainPanel(
                        plotOutput('newPlot', width = "70%", height = "650px")
                )
        )
))