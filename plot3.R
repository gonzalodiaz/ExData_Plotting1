create_plot_3_alone <- function(){
    source("common.R")
    dataset <- prepare_and_get_data()
    create_plot_3(dataset)  
}

create_plot_3 <- function(dataset){
    png(filename = "plot3.png", width = 480, height = 480)
    do_plot()
    dev.off()   
}

do_plot <- function(){
    plot(dataset$DateTime, dataset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    with(dataset, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black"))
    with(dataset, lines(DateTime, Sub_metering_2, col="red"))
    with(dataset, lines(DateTime, Sub_metering_3, col="blue"))
    legend("topright", lty = 1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}
