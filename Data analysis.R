data= read.csv("/mnt/drive/COVID AIR Nov 6/Data/Air Quality and COVID19_Delhi&Dhaka - Delhi.csv")
View(data)
NO2= data$NO2..mol.m2.
SO2= data$SO2.mol.m2.
AER = data$AER..AQI.
CO= data$CO..mol.m2.
PM= data$PM2.5
AQI=data$AQI
weekly_covid= data$Incidence
total_covid= data$Total_Incidence
date= data$Date


r <- c(mean(data$NO2..mol.m2.),var(data$NO2..mol.m2., ))
#Descriptive analysis 
summary(data)
par(mfrow=c(4,3))
boxplot(NO2)
title("NO2")
boxplot(SO2)
title("SO2")
boxplot(AER))
title("AER")
boxplot(CO)
title("CO")
boxplot(PM)
title("PM2.5")
boxplot(AQI)
title("AQI")


#covid status barplot
par(mfrow=c(2,2))
barplot(NO2)
a= barplot(NO2,
        main = "Weekly NO2 2020, Dhaka",
        xlab = "Date",
        ylab = "NO2(Molec/m2",
        names.arg = date,
        col = "darkred")
w_cov= barplot(weekly_covid,
           main = "Weekly Covid 2020, Dhaka",
           xlab = "Date",
           ylab = "Weekly Covid",
           names.arg = date,
           col = "darkred")
b= barplot(T_covid,
           main = "Total Covid Incident 2020, Dhaka",
           xlab = "Date",
           ylab = "Incident",
           names.arg = date,
           col = "darkred")
cov<- rbind(weekly_covid, total_covid)

colors <- c("darkblue", "red")

c= barplot(cov,
           main = " Covid Incident 2020, Dhaka",
           xlab = "Date",
           ylab = "Incident",
           names.arg = date,
           beside=T,
           col= colors,
           )
legend(x="center", legend = rownames(cov), fill=colors)
options(scipen=999)

summary(weekly_covid)
summary(total_covid)

#negative binomial regression 
NO2 <- NO2 %>% 
        filter(sav>0,
               inc <20000,
               sav < inc)


