library(dplyr)
score = read.csv("2009score.csv", header = TRUE)
score[is.na(score)] = 0  #replace NA by 0

library(tidyr)
score %>% gather(HW, value, h1:h10, -h2)


# #function convert hw grade to points out of 100
# convert = function(x, max_val) {
#   val = x/ max_val
#   val = val * 100
# }
# 
# #create a hw subset of the orginal dataframe then use apply function to find max of each hw column
# max_list = score %>% select(h1,h2,h3,h4,h5,h6,h7,h8,h9,h10) %>% apply(.,2,max) 
# 
# #use mapply function to convert each entry hw to a point out of 100 
# result = mapply(convert, score %>% select(h1,h2,h3,h4,h5,h6,h7,h8,h9,h10), max_list)
# 
# #calculate avg hw score of each student using rowMeans
# hw_avg = rowMeans(result)
# 
# #create a new df with hw avg scores
# new_score = cbind(score, hw_avg)  
# 
# #function to calculate final grade 
# total_cal = function(x1, x2, x3, x4) {
#   total = x1*(1/18)*100*0.25 + x2*(1/20)*100*0.25 + x3*(1/35)*100*0.25 + x4*0.25 
# }
# 
# x1 = new_score$Mid1.Total.18.
# x2 = new_score$Mid2.Total.20.
# x3 = new_score$final.total.35
# x4 = new_score$hw_avg
# 
# 
# #apply function 
# final_grade = mapply(total_cal, x1, x2, x3, x4)
# 
# final_score = cbind(new_score, final_grade)
# 
