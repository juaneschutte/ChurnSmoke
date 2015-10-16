predictchurn <- function(input){
  #input can either be csv file or data    
  newdata <- if(is.character(input) && file.exists(input)){
    read.csv(input, sep=";",header=T)
  } else {
    as.data.frame(input)
  }
  stopifnot("client_id" %in% names(newdata))
  stopifnot("gender" %in% names(newdata))
  stopifnot("client_tenure" %in% names(newdata))
  stopifnot("client_age" %in% names(newdata))
  stopifnot("marital_status" %in% names(newdata))
  stopifnot("employment_status" %in% names(newdata))
  stopifnot("policy_branch" %in% names(newdata))
  stopifnot("product" %in% names(newdata))
  stopifnot("brandID" %in% names(newdata))
  stopifnot("claims_type" %in% names(newdata))
  stopifnot("inbound_outbound" %in% names(newdata))
  stopifnot("unfinalised_claim" %in% names(newdata))
  stopifnot("question_1" %in% names(newdata))
  stopifnot("question_2" %in% names(newdata))
  stopifnot("question_3" %in% names(newdata))
  stopifnot("question_4" %in% names(newdata))
  stopifnot("question_5" %in% names(newdata))
  stopifnot("question_6" %in% names(newdata))
  stopifnot("question_7" %in% names(newdata))
  stopifnot("question_8" %in% names(newdata))
  stopifnot("question_9" %in% names(newdata))
  stopifnot("question_10" %in% names(newdata))
  stopifnot("question_11" %in% names(newdata))
  stopifnot("question_1_escalated" %in% names(newdata))
  stopifnot("question_2_escalated" %in% names(newdata))
  stopifnot("question_3_escalated" %in% names(newdata))
  stopifnot("question_4_escalated" %in% names(newdata))
  stopifnot("question_5_escalated" %in% names(newdata))
  stopifnot("question_6_escalated" %in% names(newdata))
  stopifnot("question_7_escalated" %in% names(newdata))
  stopifnot("question_8_escalated" %in% names(newdata))
  stopifnot("question_9_escalated" %in% names(newdata))
  stopifnot("question_10_escalated" %in% names(newdata))
  stopifnot("question_11_escalated" %in% names(newdata))
  
  
  
  
  newdata[is.na(newdata)] <- 0
  to.drop <- c('client_id', 'question_11')
  feat.space <- newdata[,!(names(newdata) %in% to.drop)]
  
  yes.no.cols <- c("question_6","question_10", "question_1_escalated", "question_2_escalated", "question_3_escalated", "question_4_escalated", "question_5_escalated", "question_6_escalated", "question_7_escalated", "question_8_escalated", "question_9_escalated", "question_10_escalated", "question_11_escalated" )
  feat.space[yes.no.cols] <- feat.space[yes.no.cols] == "yes"
  
  
  
  #safety_model is included with the package
  require(randomForest, quietly=TRUE)
  
  churn.prob <- predict(clf,newdata=feat.space,type="prob")
  newdata$churn.risk <- churn.prob[colnames(churn.prob) == "Yes"]
  
  
  return(newdata)
  
}