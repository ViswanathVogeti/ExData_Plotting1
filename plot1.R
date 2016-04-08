
## Read the household power consumption dataset and store it into a dataframe
EnergyDF<-read.table(file = "household_power_consumption.txt",header = TRUE,sep=";",
                     stringsAsFactors=FALSE
                     )

## Convert the Date field to the class Date
EnergyDF$Date<-as.Date(EnergyDF$Date,"%d/%m/%Y")

## Subset the power consumption dataframe by selecting only the data for 2007-02-01 and 2007-02-02

TwoDayEnergyDF<-EnergyDF[EnergyDF$Date=="2007-02-01" | EnergyDF$Date=="2007-02-02",]

## Open the png file plot1.png in which the histogram needs to be plotted
png(file="plot1.png",width = 480,height = 480)


## Remove NAs in the variable Globall_active_power

Global_Active_Power_No_NA<-as.numeric(TwoDayEnergyDF$Global_active_power[complete.cases(as.numeric(TwoDayEnergyDF$Global_active_power))])

## Plot the histogram for the variable Global_active_power
  
hist(Global_Active_Power_No_NA,main="Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",col="Red")

## Close the png file
dev.off()


