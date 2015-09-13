##read in data using read.table()
data <- read.table("../household_power_consumption.txt", na.strings="?", sep=";", header=TRUE, stringsAsFactors=FALSE)

##reformat $date variable to Date class data using as.Date()
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

##subset data to the dates specified (2007-02-01 and 2007-02-02)
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##convert date format using as.POSIXct
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

##plot histogram
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##create png file
dev.copy(png, file="plot1.png")
png("plot1.png", width=480, height=480, units="px")
dev.off()
