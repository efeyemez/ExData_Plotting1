
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

# Creating plot.4

png(filename="plot4.png",width=480, height=480)
par(mfrow=c(2,2))
plot(x=act_pow$POSIX ,y=act_pow$Global_active_power, type = 'l', xlab='',ylab = 'Global Active Power')
plot(x=act_pow$POSIX ,y=act_pow$Voltage, type = 'l', xlab='datetime',ylab = 'Voltage')
plot(x=act_pow$POSIX,y=act_pow$Sub_metering_1, type='l', col = 'black', ylab = 'Energy sub metering', xlab = '')
lines(x=act_pow$POSIX,y=act_pow$Sub_metering_2, col='red')
lines(x=act_pow$POSIX,y=act_pow$Sub_metering_3, col='blue')
legend('topright', legend = c('Sub_metering_1',"Sub_metering_2","Sub_metering_3"), col = c('black','red','blue'), lty = 1, bty = "n")
plot(x=act_pow$POSIX ,y=act_pow$Global_reactive_power, type = 'l', xlab='datetime',ylab = 'Global_reactive_power')
dev.off()