create_plot_2_alone <- function(){
    source("common.R")
    dataset <- prepare_and_get_data()
    create_plot_2(dataset)  
}

create_plot_2 <- function(dataset){
    png(filename = "plot2.png", width = 480, height = 480)
    do_plot()
    dev.off()   
}

do_plot <- function(){
    plot(dataset$DateTime, dataset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
}
