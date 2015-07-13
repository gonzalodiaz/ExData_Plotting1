create_plot_1_alone <- function(){
    source("common.R")
    dataset <- prepare_and_get_data()
    create_plot_1(dataset)  
}

create_plot_1 <- function(dataset){
    png(filename = "plot1.png", width = 480, height = 480)
    do_plot()
    dev.off()   
}

do_plot <- function(){
    hist(dataset$Global_active_power, freq = TRUE, xlab = "Global Active Power (kilowatts)", col="red", main = "Global Active Power")    
}
