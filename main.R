regenerate_all_plots <- function(){
    source("common.R")
    dataset <- prepare_and_get_data()
    source("plot1.R")
    create_plot_1(dataset)
    source("plot2.R")
    create_plot_2(dataset)
    source("plot3.R")
    create_plot_3(dataset)
    source("plot4.R")
    create_plot_4(dataset)
}
