shinyUI(fluidPage(
        titlePanel("Flow Cytometry Analysis Application"),
        sidebarLayout(
                sidebarPanel(
                        fluidRow(
                                column(5,
                                        fileInput('file1', 'Choose file1 to upload',
                                        accept = c(
                                          'text/csv',
                                          'text/comma-separated-values',
                                          'text/tab-separated-values',
                                          'text/plain',
                                          '.csv',
                                          '.fcs'
                                                )  ),
                                       textInput("title_in1", label = h4("please input main title"), value = "1")
                                  ),
                                column(5,
                                       fileInput('file2', 'Choose file2 to upload',
                                                 accept = c(
                                                         'text/csv',
                                                         'text/comma-separated-values',
                                                         'text/tab-separated-values',
                                                         'text/plain',
                                                         '.csv',
                                                         '.fcs'
                                                     ) ),
                                       textInput("title_in2", label = h4("please input main title"), value = "2")
                                       
                                  )
                                ),
                        fluidRow(
                                column(5,
                                       fileInput('file3', 'Choose file3 to upload',
                                                 accept = c(
                                                         'text/csv',
                                                         'text/comma-separated-values',
                                                         'text/tab-separated-values',
                                                         'text/plain',
                                                         '.csv',
                                                         '.fcs'
                                                 ) ),
                                       textInput("title_in3", label = h4("please input main title"), value = "3")
                                       ),
                                column(5,
                                       fileInput('file4', 'Choose file4 to upload',
                                                 accept = c(
                                                         'text/csv',
                                                         'text/comma-separated-values',
                                                         'text/tab-separated-values',
                                                         'text/plain',
                                                         '.csv',
                                                         '.fcs'
                                                 )),
                                       textInput("title_in4", label = h4("please input main title"), value = "4")
                                       )
                        ),
                        checkboxInput("title_check", "Show main title as 'Flow Cytometry Analysis' , Xlab and Ylab index", FALSE),
                        
                        fluidRow(
                              column(5,
                                radioButtons('x_ch', 'Choose X Channel',
                                     c(FSC_A_ch1= 1,
                                       SSC_A_ch2 = 2,
                                       FL1_A_ch3 = 3,
                                       FL2_A_ch4 = 4,
                                       FL3_A_ch5 = 5), 4
                                     )),
                              column(5,
                                radioButtons('y_ch', 'Choose X Channel',
                                     c(FSC_A_ch1 = 1,
                                       SSC_A_ch2 = 2,
                                       FL1_A_ch3 = 3,
                                       FL2_A_ch4 = 4,
                                       FL3_A_ch5 = 5), 2
                        ))
                        ),
                        
                        fluidRow(
                                column(5,textInput("x_lab", label = h4("please input X label"), value = "")                                       
                                ),
                                column(5,textInput("y_lab", label = h4("please input Y label"), value = "")
                                )
                        ),
                        sliderInput('xgate', 'Choose x gate line',value = 4, min = 0.5, max = 7.5, step = 0.1,),
                        sliderInput('ygate', 'Choose y gate line',value = 4, min = 0.5, max = 7.5, step = 0.1,),
                        submitButton('Submit'),
                        tags$hr(),
                        p('This app is for Flow Cytometry Data (.fcs file) analysis. Usually, you can use FCS_Express or Flowjo to analyze flow cytometry data, but you need buy such kind of programs.'),
                        p('Here, we provide this app to analyze your own .fcs data for free. The app loaded a default .fcs file, however, you can change to your own .fcs file. If you do not have .fcs file, please download examples from https://github.com/caipine/FlowC/blob/master/Cell%20control.fcs?raw=true  https://github.com/caipine/FlowC/blob/master/Cell%20SARA%20treated.fcs?raw=true'), 
                        p('You can change the channel to choose different fluoresce color (in example files, FL1_A is green, FL2_A is blue, FL3_A is yellow,  but different FCS machine have different setting)'),
                        p('You can label main title, X or Y, such as different target protein in your experiment, such as CD45, EGFP.'),
                        p('X gate line and Y gate line will divide the sample as 4 areas, program will calculati the percentage of each area which covered events. You can change the X gate line and Y gate line to set new gate.')
                        
                ),
                mainPanel(
                        p("Manual is on the bottom of the page,please be patient, it takes about 1 minute to show plot,"),
                        p("After change setting, submit! Any suggestion, email: caipine@yahoo.com. 2-27-2015"),
                        #verbatimTextOutput("main_title_test"),
                        plotOutput('newPlot', width = "70%", height = "950px")
                        
                )
        )
))