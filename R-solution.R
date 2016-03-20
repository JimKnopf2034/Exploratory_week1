library('ggplot2')
#library('jpeg')

data_name = './data/household_power_consumption.txt'

check_setup <- function(){
    if (!dir.exists('./data')){
        dir.create('./data')
    }
    if (!file.exists(data_name)){
        print("Downloading the data")
        dowload.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
                    destfile='./data/exdata_data_houshold_power_consumption.zip')
        print("Unziping files")
        unzip('./data/exdata_data_houshold_power_consumption.zip', exdir='./data/')
    }
    return(TRUE)
}

readData <-function(fname){
    # read and clean the data. Not available data points are filled with a ?
    data <- read.csv(fname, na.strings='?')
}


# Task 1 Plot the global active Power

gap <- function(data){
    # open the png device
    png()
    # close the device
    dev.off()
}

print("creating Plots for the project")
if (!check_setup()){
    stop("Data not available!")
}


data <- readData(data_name)
