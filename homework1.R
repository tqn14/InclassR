

salary <- read.csv("Salary.csv", header = TRUE)
data <- salary$Salary
hist(data, xlab='Salary', main = 'histogram of salary')



#The distribution is skewed to the right, with only a single peak. Thus, 
#this is a unimodel distribution. About 10 to 15% of the data ranges from 40 to 70
#while only 5% earned less or more than that.

mean(data)
sd(data)

#the mean of the data is 65.6, while std deviation is 30.8 (pretty large)