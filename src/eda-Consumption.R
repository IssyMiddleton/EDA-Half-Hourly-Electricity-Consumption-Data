library("ProjectTemplate")
load.project()

if (!require("RColorBrewer")) {
  install.packages("RColorBrewer")
  library(RColorBrewer)
}

HHLine <- ggplot() +
  theme_bw() +
  geom_line(data = consumption, aes(timestamp, kWh), size = 0.14, colour = "darkcyan")+
  scale_x_datetime(date_labels="%d-%b-%y",date_breaks  ="30 days") +  
  # scale_y_continuous(breaks=seq(0,3.2,0.2),limits = c(0, 3.2)) +
  theme(axis.text.x = element_text(size = 6, angle = 45, hjust=1)) + 
  labs(y = "kWh (half hourly)", x = NULL, size = 8)

HHLine4Hours <- ggplot() +
  theme_bw() +
  geom_line(data = consumption, aes(timestamp, kWh), colour = "darkcyan", size = 0.8)+
  scale_x_datetime(date_labels="%d-%b-%y",date_breaks  ="60 days") +  
  theme(axis.text.x = element_text(size = 6, angle = 45, hjust=1)) +
  facet_wrap(~ timeofday) +
  labs(y = "kWh", x = NULL)

HHLine4Hours2020 <- ggplot() +
  theme_bw() +
  geom_line(data = consumption2020, aes(timestamp, kWh), colour = "darkcyan", size = 0.8)+
  scale_x_datetime(date_labels="%d-%b-%y",date_breaks  ="60 days") +  
  theme(axis.text.x = element_text(size = 6, angle = 45, hjust=1)) +
  facet_wrap(~ timeofday) +
  labs(y = "kWh", x = NULL)

HHLine4Hours2021 <- ggplot() +
  theme_bw() +
  geom_line(data = consumption2021, aes(timestamp, kWh), colour = "darkcyan", size = 0.8)+
  scale_x_datetime(date_labels="%d-%b-%y",date_breaks  ="60 days") +  
  theme(axis.text.x = element_text(size = 6, angle = 45, hjust=1)) +
  facet_wrap(~ timeofday) +
  labs(y = "kWh", x = NULL)

HHLine4Hours2022 <- ggplot() +
  theme_bw() +
  geom_line(data = consumption2022, aes(timestamp, kWh), colour = "darkcyan", size = 0.8)+
  scale_x_datetime(date_labels="%d-%b-%y",date_breaks  ="60 days") +  
  theme(axis.text.x = element_text(size = 6, angle = 45, hjust=1)) +
  facet_wrap(~ timeofday) +
  labs(y = "kWh", x = NULL)

HHLine4Hours2023 <- ggplot() +
  theme_bw() +
  geom_line(data = consumption2023, aes(timestamp, kWh), colour = "darkcyan", size = 0.8)+
  scale_x_datetime(date_labels="%d-%b-%y",date_breaks  ="60 days") +  
  theme(axis.text.x = element_text(size = 6, angle = 45, hjust=1)) +
  facet_wrap(~ timeofday) +
  labs(y = "kWh", x = NULL)

DailyLine <- ggplot() +
  theme_bw() +
  geom_line(data = Cons_d, aes(date, Total), colour = "darkcyan", size = 0.8)+
  theme(axis.text.x = element_text(size = 6, angle = 45, hjust=1)) +
  scale_x_date(date_labels="%d-%b-%y",date_breaks  ="30 days") +  
  labs(y = "kWh (total daily)", x = NULL)

YearWeekTimeofDay = ggplot(SummaryConsumption, aes(fill=timeofday, y=Total, x=weeks)) + 
  geom_bar(position="stack", stat="identity") +
  theme_bw() +
  guides(fill=guide_legend(title="Time of Day")) +
  scale_fill_brewer(palette="BrBG") +
  theme(axis.text.x = element_text(size = 6, angle = 45, hjust = 1)) + 
  facet_wrap(~ Year) +
  theme(legend.text = element_text(color = "black", size = 6),legend.position = c(.9, .4)) +
  labs(y = "kWh (total by week)", x = "week",colour = "Time of Day")

WeekYearToD2020 = ggplot(YearToDWeek2020, aes(fill=timeofday, y=Total, x=weeks)) + 
  geom_bar(position="stack", stat="identity") +
  theme_bw() +
  guides(fill=guide_legend(title="Time of Day")) +
  scale_fill_brewer(palette="BrBG") +
  theme(axis.text.x = element_text(size = 6, angle = 45, hjust = 1)) + 
  #facet_wrap(~ Year) +
  theme(legend.text = element_text(color = "black", size = 6)) +
  labs(y = "kWh (total by week)", x = "week",colour = "Time of Day")

WeekYearToD2021 = ggplot(YearToDWeek2021, aes(fill=timeofday, y=Total, x=weeks)) + 
  geom_bar(position="stack", stat="identity") +
  theme_bw() +
  guides(fill=guide_legend(title="Time of Day")) +
  scale_fill_brewer(palette="BrBG") +
  theme(axis.text.x = element_text(size = 6, angle = 45, hjust = 1)) + 
  #facet_wrap(~ Year) +
  theme(legend.text = element_text(color = "black", size = 6)) +
  labs(y = "kWh (total by week)", x = "week",colour = "Time of Day")

WeekYearToD2022 = ggplot(YearToDWeek2022, aes(fill=timeofday, y=Total, x=weeks)) + 
  geom_bar(position="stack", stat="identity") +
  theme_bw() +
  guides(fill=guide_legend(title="Time of Day")) +
  scale_fill_brewer(palette="BrBG") +
  theme(axis.text.x = element_text(size = 6, angle = 45, hjust = 1)) + 
  #facet_wrap(~ Year) +
  theme(legend.text = element_text(color = "black", size = 6)) +
  labs(y = "kWh (total by week)", x = "week",colour = "Time of Day")

WeekYearToD2023 = ggplot(YearToDWeek2023, aes(fill=timeofday, y=Total, x=weeks)) + 
  geom_bar(position="stack", stat="identity") +
  theme_bw() +
  guides(fill=guide_legend(title="Time of Day")) +
  scale_fill_brewer(palette="BrBG") +
  theme(axis.text.x = element_text(size = 6, angle = 45, hjust = 1)) + 
  #facet_wrap(~ Year) +
  theme(legend.text = element_text(color = "black", size = 6)) +
  labs(y = "kWh (total by week)", x = "week",colour = "Time of Day")

DailyProfile = ggplot(DayHH, aes(HH, Average)) +
  stat_summary(fun = mean, colour ="darkcyan")+
  theme_bw() +
  theme(legend.position="right") +
  #scale_color_brewer(palette="BrBG") +
  #scale_fill_brewer(palette = "BrBG") +
  theme(legend.text = element_text(color = "black", size = 6)) +
  theme(axis.text.x = element_text(size = 6, angle = 45, hjust=1)) +
  labs(x = "Half Hour")

Hourbyweek2020 = ggplot(WeekHour2020, aes(y=Total, x=hour)) + 
  geom_bar(position="stack", stat="identity", fill = "darkcyan", colour = "darkcyan") +
  theme_bw() +
  #guides(fill=guide_legend(title="Property")) +
  # scale_y_continuous(breaks=seq(0,120,30)) +
  scale_x_continuous(breaks=seq(0,23,2)) +
  theme(axis.text.x = element_text(size = 4, angle = 45, hjust = 1)) + 
  facet_wrap(~ weeks) +
  labs(y = "kWh", x = "Hour", colour = "Hour")

Hourbyweek2021 = ggplot(WeekHour2021, aes(y=Total, x=hour)) + 
  geom_bar(position="stack", stat="identity", fill = "darkcyan", colour = "darkcyan") +
  theme_bw() +
  #guides(fill=guide_legend(title="Property")) +
  # scale_y_continuous(breaks=seq(0,120,30)) +
  scale_x_continuous(breaks=seq(0,23,2)) +
  theme(axis.text.x = element_text(size = 4, angle = 45, hjust = 1)) + 
  facet_wrap(~ weeks) +
  labs(y = "kWh", x = "Hour", colour = "Hour")

Hourbyweek2022 = ggplot(WeekHour2022, aes(y=Total, x=hour)) + 
  geom_bar(position="stack", stat="identity", fill = "darkcyan", colour = "darkcyan") +
  theme_bw() +
  #guides(fill=guide_legend(title="Property")) +
  # scale_y_continuous(breaks=seq(0,120,30)) +
  scale_x_continuous(breaks=seq(0,23,2)) +
  theme(axis.text.x = element_text(size = 4, angle = 45, hjust = 1)) + 
  facet_wrap(~ weeks) +
  labs(y = "kWh", x = "Hour", colour = "Hour")

Hourbyweek2023 = ggplot(WeekHour2023, aes(y=Total, x=hour)) + 
  geom_bar(position="stack", stat="identity", fill = "darkcyan", colour = "darkcyan") +
  theme_bw() +
  #guides(fill=guide_legend(title="Property")) +
  # scale_y_continuous(breaks=seq(0,120,30)) +
  scale_x_continuous(breaks=seq(0,23,2)) +
  theme(axis.text.x = element_text(size = 4, angle = 45, hjust = 1)) + 
  facet_wrap(~ weeks) +
  labs(y = "kWh", x = "Hour", colour = "Hour")

heatmap <- ggplot(data = consumption, aes(x = date, y = hm, fill = kWh)) +
  geom_tile() +
  theme_bw() +
  scale_fill_distiller(palette = "YlGnBu") +
  scale_y_discrete(breaks = lab)+
  labs(y = "Hour", x = NULL)

Density = ggplot(consumption, aes(x = kWh)) + 
  geom_density(aes(fill = YearQ), fill = "darkcyan") + 
  theme_bw() +
  ggtitle("Density Estimates by Quarter") +
  labs(y = "Frequency of Half Hourly Readings", x = "kWH")+
  facet_grid(rows = vars(as.factor(YearQ)))+
  theme(strip.text.y = element_text(size = 5, color = "black")) +
  theme(axis.text.y = element_text(size = 5))
          

