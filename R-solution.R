#library('ggplot2')
#library('jpeg')

data_name <- './data/household_power_consumption.txt'

check_setup <- function(){
    # check if data directory exists, if not create
    if (!dir.exists('./data')){
        dir.create('./data')
    }
    # check if img directory for output exits, if not create
    if(!dir.exists('./img')){
        dir.create('./img')
    }
    # check if data is there, if not, download and unzip
    if (!file.exists(data_name)){
        print("Downloading the data")
        download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
                    destfile='./data/exdata_data_houshold_power_consumption.zip')
        print("Unziping files")
        unzip('./data/exdata_data_houshold_power_consumption.zip', exdir='./data/')
    }
    return(TRUE)
}

readData <-function(fname){
    # read and clean the data. Not available data points are filled with a ?
    data <- read.table(fname, header=TRUE, na.strings='?', sep=';')
    # convert columns to dates
    data$Date <- as.Date(data$Date, format="%d/%m/%Y")
    data$Timestamp <- strptime(paste(data$Date,data$Time), format="%Y-%m-%d %H%M%S")
    data
}


# Task 1 Plot the global active Power
gap <- function(data){
    # open the png device
    gapow <- subset(data, Date>=as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
    #print(head(gapow))
    png(file='./img/plot1.png')
    hist(gapow$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
    # close the device
    dev.off()
}

# Task 2
task2 <- function(data){
    twoDays <- subset(data, Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))
    png(file='./img/plot2.png')
    line(twoDays$Global_active_power, twoDays$Timestamp)
    dev.off()
}

task3 <- function(data){
    twoDays <- subset(data, Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))
    png(file='./img/plot3.png')
    dev.off()
}

# Task 4
task4 <- function(data){
    twoDays <- subset(data, Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))
    png(file='./img/plot4.png')
    par(mfrow=c(2,2))
    dev.off()
}

print("creating Plots for the project")
if (!check_setup()){
    stop("Data not available!")
}


data <- readData(data_name)

gap(data)
task2(data)
task3(data)
task4(data)
