# Preprocessing script

#Ensure the column name can be identified
colnames(consumption)[1] <- c("Timestamp")

#Ensure demand value is a number
consumption$Value = as.numeric(consumption$Value)

#remove errors
consumption = na.omit(consumption)

#convert units to kWh
consumption$kWh = round(consumption$Value/1000, digits = 2)

#convert the Timestamp column of characters to a timestamp, date and day
consumption$timestamp = as.POSIXct(c(consumption$Timestamp))
consumption$date = as.Date(as.POSIXct(c(consumption$Timestamp)))
consumption$day <- weekdays(as.Date(as.POSIXct(c(consumption$Timestamp))))

#add time of day
consumption$hour = strftime(consumption$timestamp, format="%H")
consumption$hour = as.numeric(consumption$hour)
consumption$Month = strftime(consumption$timestamp, format="%B")
consumption$Year = strftime(consumption$timestamp, format="%Y")
consumption$HH = strftime(consumption$timestamp, format="%H:%M")
consumption$timeofday <- ifelse (consumption$hour == 0 | consumption$hour == 1 | consumption$hour == 2 | consumption$hour == 3, "00:00hrs - 04:00hrs", ifelse (consumption$hour == 4 | consumption$hour == 5 | consumption$hour == 6 | consumption$hour == 7, "04:00hrs - 08:00hrs", ifelse (consumption$hour == 8 | consumption$hour == 9 | consumption$hour == 10 | consumption$hour == 11, "08:00hrs - 12:00hrs", ifelse (consumption$hour == 12 | consumption$hour == 13 | consumption$hour == 14 | consumption$hour == 15, "12:00hrs - 16:00hrs", ifelse (consumption$hour == 16 | consumption$hour == 17 | consumption$hour == 18 | consumption$hour == 19, "16:00hrs - 20:00hrs", "20:00hrs - 24:00hrs")))))
consumption$weeks = format(as.Date(consumption$date), "%W")

#categorical data configuration
consumption$timeofday = as.factor(consumption$timeofday)
consumption$day = as.factor(consumption$day)
consumption$Year = as.numeric(consumption$Year)

#sort by timestamp
consumption <- consumption[order(consumption$timestamp), ]

#full days only
#consumption = consumption[-c(1:2), ]

#code to correct weeks to ensure 7 days of data
Year2020a = filter(consumption, Year == 2020)
Year2020 = filter(Year2020a, weeks != "00")
Year2021 = filter(consumption, Year == 2021)
Year2022 = filter(consumption, Year == 2022)
Year2023 = filter(consumption, Year == 2023)
Week00Year2020 = filter(Year2020a,weeks == "00")
Week00Year2020$weeks = "52"
Week00Year2020$Year = 2019
consumption = rbind(Year2020,Year2021,Year2022, Year2023, Week00Year2020)

Year2020 = filter(consumption, Year == 2020)
Year2021a = filter(consumption, Year == 2021)
Year2021 = filter(Year2021a, weeks != "00")
Year2022 = filter(consumption, Year == 2022)
Year2023 = filter(consumption, Year == 2023)
Week00Year2021 = filter(Year2021a,weeks == "00")
Week00Year2021$weeks = "52"
Week00Year2021$Year = 2020
consumption = rbind(Year2020,Year2021,Year2022, Year2023, Week00Year2021)

Year2020 = filter(consumption, Year == 2020)
Year2022a = filter(consumption, Year == 2022)
Year2022 = filter(Year2022a, weeks != "00")
Year2021 = filter(consumption, Year == 2021)
Year2023 = filter(consumption, Year == 2023)
Week00Year2022 = filter(Year2022a,weeks == "00")
Week00Year2022$weeks = "52"
Week00Year2022$Year = 2021
consumption = rbind(Year2020, Year2021,Year2022,Week00Year2022, Year2023)

Year2020 = filter(consumption, Year == 2020)
Year2023a = filter(consumption, Year == 2023)
Year2023 = filter(Year2023a, weeks != "00")
Year2021 = filter(consumption, Year == 2021)
Year2022 = filter(consumption, Year == 2022)
Week00Year2023 = filter(Year2023a,weeks == "00")
Week00Year2023$weeks = "52"
Week00Year2023$Year = 2022
consumption = rbind(Year2020,Year2021,Year2022, Year2023,Week00Year2023)

#split data out for 2020
consumption2020 = filter(consumption, Year == 2020)
WeekHour2020 = consumption2020 %>% group_by(weeks, hour) %>% summarise(Min = min(kWh), Max = max(kWh), Average = mean(kWh), Total = sum(kWh))
YearToDWeek2020 = consumption2020 %>% group_by(Year, timeofday, weeks) %>% summarise(Min = min(kWh), Max = max(kWh), Average = mean(kWh), Total = sum(kWh))

#split data out for 2021
consumption2021 = filter(consumption, Year == 2021)
WeekHour2021 = consumption2021 %>% group_by(weeks, hour) %>% summarise(Min = min(kWh), Max = max(kWh), Average = mean(kWh), Total = sum(kWh))
YearToDWeek2021 = consumption2021 %>% group_by(Year, timeofday, weeks) %>% summarise(Min = min(kWh), Max = max(kWh), Average = mean(kWh), Total = sum(kWh))

#split data out for 2022
consumption2022 = filter(consumption, Year == 2022)
WeekHour2022 = consumption2022 %>% group_by(weeks, hour) %>% summarise(Min = min(kWh), Max = max(kWh), Average = mean(kWh), Total = sum(kWh))
YearToDWeek2022 = consumption2022 %>% group_by(Year, timeofday, weeks) %>% summarise(Min = min(kWh), Max = max(kWh), Average = mean(kWh), Total = sum(kWh))

#split data out for 2023
consumption2023 = filter(consumption, Year == 2023)
WeekHour2023 = consumption2023 %>% group_by(weeks, hour) %>% summarise(Min = min(kWh), Max = max(kWh), Average = mean(kWh), Total = sum(kWh))
YearToDWeek2023 = consumption2023 %>% group_by(Year, timeofday, weeks) %>% summarise(Min = min(kWh), Max = max(kWh), Average = mean(kWh), Total = sum(kWh))

#report tables

Cons_d = consumption %>% group_by(date, Year)%>% summarise(Min = min(kWh), Max = max(kWh), Average = mean(kWh), Total = sum(kWh))

Stats_a = consumption %>% group_by(day, weeks, Year, timeofday) %>% summarise(Min = min(kWh), Max = max(kWh), Average = mean(kWh), Total = sum(kWh))
Stats_a$day <- factor(Stats_a$day, levels= c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))
#Stats_9C <- Stats_9C[order(Stats_9C$day), ]
colnames(Stats_a)[1]<- "Day"
colnames(Stats_a)[2]<- "Week No."
colnames(Stats_a)[3]<- "Year"
colnames(Stats_a)[4]<- "Time of Day"
colnames(Stats_a)[5]<- "Min kWh"
colnames(Stats_a)[6]<- "Max kWh"
colnames(Stats_a)[7]<- "Ave kWh"
colnames(Stats_a)[8]<- "kWh"
Stats_a <- Stats_a[order(-Stats_a$kWh),]
Peak = head(Stats_a, 10)
Peak$`Ave kWh` = round(as.numeric(Peak$`Ave kWh`), digit = 2)

Stats_b = head(consumption[order(-consumption$Value),],10)
Stats_b = Stats_b[c("timestamp", "day", "weeks","kWh")]
colnames(Stats_b)[1]<- "Timestamp"
colnames(Stats_b)[2]<- "Day of the Week"
colnames(Stats_b)[3]<- "Week No."
colnames(Stats_b)[4]<- "kWh"

#stats for graphs
SummaryConsumption = consumption %>% group_by(Year, timeofday, weeks) %>% summarise(Min = min(kWh), Max = max(kWh), Average = mean(kWh), Total = sum(kWh))
DayHH = consumption %>% group_by(day,HH) %>% summarise(Average = mean(kWh))

Cons_Year2020 = consumption2020 %>% group_by(Year, weeks)%>% summarise(Average = mean(kWh), Total = sum(kWh))
Cons_Year2020$Daily <- Cons_Year2020$Total/7
Cons_Year2020$Daily = round(as.numeric(Cons_Year2020$Daily), digit = 2)
Cons_Year2020$Average = round(as.numeric(Cons_Year2020$Average), digit = 2)
colnames(Cons_Year2020)[1] <- "Year"
colnames(Cons_Year2020)[2]<- "Week No."
colnames(Cons_Year2020)[3]<- "Average 30 mins kWh"
colnames(Cons_Year2020)[4]<- "Total kWh"
colnames(Cons_Year2020)[5]<- "Average Daily kWh"


Cons_Year2021 = consumption2021 %>% group_by(Year, weeks)%>% summarise(Average = mean(kWh), Total = sum(kWh))
Cons_Year2021$Daily <- Cons_Year2021$Total/7
Cons_Year2021$Daily = round(as.numeric(Cons_Year2021$Daily), digit = 2)
Cons_Year2021$Average = round(as.numeric(Cons_Year2021$Average), digit = 2)
colnames(Cons_Year2021)[1] <- "Year"
colnames(Cons_Year2021)[2]<- "Week No."
colnames(Cons_Year2021)[3]<- "Average 30 mins kWh"
colnames(Cons_Year2021)[4]<- "Total kWh"
colnames(Cons_Year2021)[5]<- "Average Daily kWh"

Cons_Year2022 = consumption2022 %>% group_by(Year, weeks)%>% summarise(Average = mean(kWh), Total = sum(kWh))
Cons_Year2022$Daily <- Cons_Year2022$Total/7
Cons_Year2022$Daily = round(as.numeric(Cons_Year2022$Daily), digit = 2)
Cons_Year2022$Average = round(as.numeric(Cons_Year2022$Average), digit = 2)
colnames(Cons_Year2022)[1] <- "Year"
colnames(Cons_Year2022)[2]<- "Week No."
colnames(Cons_Year2022)[3]<- "Average 30 mins kWh"
colnames(Cons_Year2022)[4]<- "Total kWh"
colnames(Cons_Year2022)[5]<- "Average Daily kWh"

Cons_Year2023 = consumption2023 %>% group_by(Year, weeks)%>% summarise(Average = mean(kWh), Total = sum(kWh))
Cons_Year2023$Daily <- Cons_Year2023$Total/7
Cons_Year2023$Daily = round(as.numeric(Cons_Year2023$Daily), digit = 2)
Cons_Year2023$Average = round(as.numeric(Cons_Year2023$Average), digit = 2)
colnames(Cons_Year2023)[1] <- "Year"
colnames(Cons_Year2023)[2]<- "Week No."
colnames(Cons_Year2023)[3]<- "Average 30 mins kWh"
colnames(Cons_Year2023)[4]<- "Total kWh"
colnames(Cons_Year2023)[5]<- "Average Daily kWh"

# create date variable for the x-axis
consumption$date <- as.Date(consumption$timestamp, format = "%Y-%m-%d")

# get H:M components
consumption$hm <- format(consumption$timestamp, "%H:%M")  

# create date variable for the x-axis
consumption$date <- as.Date(consumption$timestamp, format = "%Y-%m-%d")

lab <- with(consumption, paste(format(consumption$timestamp, "%H"), "00", sep = ":"))

# get H:M components
consumption$MonthYear <- format(consumption$timestamp, "%m-%Y")  
consumption$WeekYear = format(as.Date(consumption$date), "%W-%Y")
consumption$Q = quarters(as.Date(consumption$date))
consumption$YearQ = paste(consumption$Q,consumption$Year)
days = max(consumption$date) - min(consumption$date)
days = as.numeric(days)
