library("randomForest")
setwd("/Users/juaneshutte/Documents/startups/Aldemak/SMOKECSS/")
df <- read.csv("survey_results_ideal.csv", header = TRUE, sep = ";")
churn.result <- factor(df$Churn)

to.drop <- c('client_id', 'question_11', 'Churn')
churn.feat.space <- df[,!(names(df) %in% to.drop)]

yes.no.cols <- c("question_6","question_10", "question_1_escalated", "question_2_escalated", "question_3_escalated", "question_4_escalated", "question_5_escalated", "question_6_escalated", "question_7_escalated", "question_8_escalated", "question_9_escalated", "question_10_escalated", "question_11_escalated" )
churn.feat.space[yes.no.cols] <- churn.feat.space[yes.no.cols] == "yes"

feats <- names(churn.feat.space)

clf <- randomForest(churn.feat.space,y=churn.result, importance=TRUE)
round(importance(clf), 2)

churn.prob <- predict(clf,newdata=churn.feat.space,type="prob")
churn.risk <- churn.prob[colnames(churn.prob) == "Yes"]
data.frame(churn.risk)


save(clf, file="/Users/juaneshutte/Tech/Git/ChurnSmoke/data/clf.rda")


head(predictchurn(input="survey_results_ideal_test_prediction.csv"))
newdata = read.csv("survey_results_ideal.csv", sep=";", header=T)
save(newdata, file="/Users/juaneshutte/Tech/Git/ChurnSmoke/data/newdata.rda")


devtools::install_github("timelyportfolio/stmBrowser@htmlwidget")

devtools::install_github("cmpolis/datacomb",subdir="pkg")
library(datacomb)
data(newdata)
Datacomb(newdata)
