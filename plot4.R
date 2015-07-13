create_plot_4_alone <- function(){
    source("common.R")
    dataset <- prepare_and_get_data()
    create_plot_4(dataset)  
}

create_plot_4 <- function(dataset){
    png(filename = "plot4.png", width = 480, height = 480)
    do_plot()
    dev.off()   
}

do_plot <- function(){
    par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
    
    # First
    plot(dataset$DateTime, dataset$Global_active_power, type="l", xlab="", ylab="Global Active Power")
    
    # Second
    plot(dataset$DateTime, dataset$Voltage, type="l", xlab="datetime", ylab="Voltage")
    
    # Third 
    with(dataset, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black"))
    with(dataset, lines(DateTime, Sub_metering_2, col="red"))
    with(dataset, lines(DateTime, Sub_metering_3, col="blue"))
    legend("topright", lty = 1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    # Fourth
    plot(dataset$DateTime, dataset$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
}
