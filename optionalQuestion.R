library(readxl)

covid = read_excel("Texas COVID-19 Case Count Data by County.xlsx") 
covid = as.data.frame(covid)

library(dplyr)

covid = covid %>% replace(is.na(.),0.0)

library(stringr)
library(purrr)

dateList = as.list(covid[2,2:194])
covidDate= as.numeric(gsub("[^[:digit:]]+", "", dateList))
new = paste("20200",sep = "" ,as.character(covidDate))
covidDate= as.Date(new, format = "%Y%m%d")

DateCol = c("County Name/Date", as.character(covidDate))

covid = covid[-c(1,2),]
covid = rbind(DateCol, covid) 

test = read_excel("Cumulative Tests over Time by County_Legacy.xlsx")
test = as.data.frame(test)

test = test %>% replace(is.na(.),0.0)

library(lubridate)


dateTest = as.list(test[1,2:146])

new1 = paste("2020",sep = "" ,dateTest)
testDate = ymd(new1)

Col_2 = c("County Name/Date", as.character(testDate))

test = test[-c(1),]
test = rbind(Col_2, test)
library(tidyr)
Anderson = covid %>% filter(., `COVID-19 Total Cases by County, 3/4/2020 - 09/15/20 at 9:30 AM CST` == "Anderson", preserve = TRUE)
Anderson_t = test %>% filter(., `COVID-19 Cumulative Total Tests Performed in Texas by County (Legacy reporting)` == "Anderson", preserve = TRUE)

library(plyr)
t = rbind.fill(Anderson, Anderson_t)


