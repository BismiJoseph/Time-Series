# Installing packages
install.packages(c("dlm", "forecast", "lubridate", "tsa", "tseries", "xts", 
                   "zoo"), dependencies = TRUE)
install.packages(c("expsmooth", "fpp", "TSA", "astsa"))
install.packages("ggthemes")
library(tidyverse)
library(ggplot2)
library(ggthemes)
library(forecast)
library(tseries)


## Importing dataset
data<-read.csv("C:/Users/Bismi Joseph/Downloads/candy_production.csv")
data

#data
str(data)
## Changing column names .
colnames(data)<-c("Date","Production")

# Convert data into time series dataset
attach(data)
candydata<-ts(data,c(1972,1),c(2017,8),12)
str(candydata)

## Data Cleaning
candydata

##Checking the missing value

# Check for missing values
sum(is.na(candydata))

frequency(candydata)             ## Frequency of time series
cycle(candydata)                 ## Cycle of time series

## Summary of data
summary(candydata)

##Visualizations
##Time series plot
plot(candydata,xlab="Year", ylab = "Candy Production ",main="Monthly US Candy Production ")

##Boxplot
boxplot(candydata~cycle(candydata))
##Boxplot reveals that candy production is higher in months 10 to 12, having higher means and lower variances than the other months.

autoplot(candydata) + labs(x ="Year", y = "Candy Production", title="Monthly US Candy Production ") + theme_classic()







##The candy production numbers increase over time with each year from 1972 to early 2000's which may be indicative of an increasing linear trend, perhaps due to increasing demand for candies during that time period. 

