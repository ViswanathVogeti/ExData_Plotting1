
## Read the household power consumption dataset and store it into a dataframe
EnergyDF<-read.table(file = "household_power_consumption.txt",header = TRUE,sep=";",
                     stringsAsFactors=FALSE
)

## Convert the Date field to the class Date
EnergyDF$Date<-as.Date(EnergyDF$Date,"%d/%m/%Y")

## Subset the power consumption dataframe by selecting only the data for 2007-02-01 and 2007-02-02

TwoDayEnergyDF<-EnergyDF[EnergyDF$Date=="2007-02-01" | EnergyDF$Date=="2007-02-02",]

## Combine the columns date and time and convert it into POSIXct object and add the field to the dataframe

TwoDayEnergyDF<-cbind(TwoDayEnergyDF,DateTime=as.POSIXct(paste(TwoDayEnergyDF$Date,TwoDayEnergyDF$Time),format='%Y-%m-%d %H:%M:%S',tz='GMT'))

## Open  the plot3.png file
png(file="plot3.png",width = 480,height = 480)


with(TwoDayEnergyDF,plot(DateTime,Sub_metering_1,xlab='',ylab = 'Energy sub metering',
                         type='n'))
lines(TwoDayEnergyDF$DateTime,TwoDayEnergyDF$Sub_metering_1)
lines(TwoDayEnergyDF$DateTime,TwoDayEnergyDF$Sub_metering_2,col='red')
lines(TwoDayEnergyDF$DateTime,TwoDayEnergyDF$Sub_metering_3,col='blue')

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)


## Close the png file
dev.off()
