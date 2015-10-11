topicmodel <- function(input){
  
  require(htmlwidgets, quietly=TRUE)

  
  
  
  
  newdata_update <- select(newdata, client_id, Department, Critical.Role, Months.till.resignation)
  newdata_update <- arrange(newdata_update, Months.till.resignation)
  dt <- dTable(newdata_update, sPaginationType= "full_numbers")
  dt 
}