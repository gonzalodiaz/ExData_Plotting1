prepare_and_get_data <- function(){
    obtain_dataset()
    household_power_consumption <- read.table("./data/household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)
    household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y") 
    household_power_consumption <- filter(household_power_consumption, Date == "2007-02-01" | Date == "2007-02-02")
    household_power_consumption
}

obtain_dataset <- function(){
    # Install dependencies and obtain the DataSet
    loadDependencies()
    cat("Obtaining the data set...")
    if(!file.exists("./data")){dir.create("./data")}
    if(!file.exists("./data/Dataset.zip")){
        cat("Data Set not found. Downloading...")
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        ret = bdown(fileUrl, "./data/Dataset.zip")
    }
    cat("done.\n")
    cat("Unzipping DataSet...")
    old_dir = getwd(); setwd("./data")  
    unzip("Dataset.zip", overwrite = TRUE)
    setwd(old_dir)
    cat("done.\n")
}

## HELPER Methods

# Method to pull the file from the Web in a more efficient way.
bdown <- function(url, file){
    f = CFILE(file, mode="wb")
    a = curlPerform(url = url, writedata = f@ref, noprogress=FALSE)
    close(f)
    return(a)
}

# Install Dependencies only if they are not installed on the system
installDependencies <- function(){
    list_of_packages <- c('plyr', 'dplyr', 'RCurl', 'gdata')
    new_packages <- list_of_packages[!(list_of_packages %in% installed.packages()[,'Package'])]
    if(length(new_packages)) install.packages(new_packages)
}

# Load required dependencies
loadDependencies <- function(){
    installDependencies()
    library('plyr')
    library('dplyr')
    library('RCurl')
    library('gdata')
}
