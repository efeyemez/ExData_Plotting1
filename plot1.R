
act_pow <- read.table("household_power_consumption.txt", sep=";", header = T, na="?",
                      colClasses = c("character",
                                     'character',
                                     'numeric',
                                     'numeric',
                                     'numeric',
                                     'numeric',
                                     'numeric',
                                     'numeric',
                                     'numeric'))


act_pow <- act_pow[which(act_pow$Date == '2/2/2007' | act_pow$Date=='1/2/2007'),]

act_pow$POSIX <-as.POSIXlt.character(paste(act_pow$Date,act_pow$Time),format = "%d/%m/%Y %H:%M:%S")

# Creating plot.1

png(filename="plot1.png",width=480, height=480)
hist(act_pow$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.off()