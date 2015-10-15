churntable <- function(input){
  require(rCharts, quietly=TRUE)
  require(dplyr, quietly=TRUE)
  newdata_update <- select(newdata, client_id, policy_branch, product, Churn)
  newdata_update <- arrange(newdata_update, Churn)
  dt <- dTable(newdata_update, sPaginationType= "full_numbers")
  dt 
}