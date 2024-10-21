# 根据学习通资料部分的SMJ2223122-01_统计一键导出.xlsx数据，
##修改
# 导入数据。注意设置剔除前两行的选项。
library(readxl)
#skip指剔除前两行数据
mydat <- read_excel("C:\\Users\\Lenovo\\Desktop\\统计软件\\SMJ2223122-01_统计一键导出.xlsx",skip = 2)            
#lapply表明对数据框的每一列指示每列是否为数值型
#ulist将列表等形式转换为向量
#apply中的2表示对列进行操作，如果是`1`表示对行进行操作
apply(mydat[,unlist(lapply(mydat, is.numeric))],2,table)

str(apply(mydat[,unlist(lapply(mydat, is.numeric))],2,table))

mydat1 <- subset(mydat,select = ))

library(tidyverse)
# row:filter
# column:select
# create new variable:mutate
# group_by + summarise
# rank:arrange
library(magrittr)
library(dplyr)
mydat1 <- mydat %>% select(-'课程音视频(40%)',-'章节测验(20%)',-'作业(15%)',-'考试(15%)')

head(mydat1 %>% arrange(-综合成绩),5)

mydat2 <- mydat1 %>% mutate(平时成绩 = .3*综合成绩)
names(mydat2)
score <- mydat2 %>% select(学生姓名,"学号/工号",平时成绩) 

score %>% write.csv('score.csv',row.names = F)
getwd()
                 