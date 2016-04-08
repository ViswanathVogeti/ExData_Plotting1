
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

## Open  the plot2.png file
png(file="plot2.png",width = 480,height = 480)


## Plot a line  graph between Global Active Power and datetime

with(TwoDayEnergyDF,plot(DateTime,Global_active_power,xlab='',ylab = 'Global Active Power (kilowatts)',
                         type='l'))



## Close the png file
dev.off()

