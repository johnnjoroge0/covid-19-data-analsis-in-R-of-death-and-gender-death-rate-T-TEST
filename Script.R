rm(list = ls()) #removes all variables stored previously
library(Hmisc) # import
DATA <- read.csv("C:/Users/KARIS/Downloads/COVID19/COVID19_line_list_data.csv")
describe(DATA) #Hmisc command
DATA$death_dummy <- as.integer(DATA$death != 0)
# death rate
sum(DATA$death_dummy) / nrow(DATA)
# claim: people who die are older
Dead = subset(DATA, death_dummy==1)
Alive= subset(DATA, death_dummy==0)
mean(Dead$age, na.rm = TRUE)
mean(Alive$age, na.rm = TRUE)
# is this statistically significant
t.test(Alive$age, Dead$age, alternative="two.sided", conf.level=0.95)
# normally, if p-value <0.05, we reject null hypothesis
# here, p-value - , so we reject the null hypothesis and
#conclude that this is statistically significant

#GENDER
#claim : gender has no effect
men = subset(DATA, gender=="male")
women= subset(DATA, gender=="female")
mean(men$death_dummy, na.rm = TRUE)
mean(women$death_dummy, na.rm = TRUE)
# is this statistically significant
t.test(men$death_dummy, women$death_dummy, alternative="two.sided", conf.level=0.95)
# 99% confidence: men have from .8% to 8.8% higher chance of dying
# p-value =0.802 -0.05 so this is statistically significant 

