topicmodel <- function(input){
  
  require(htmlwidgets, quietly=TRUE)
  library(stm)
  library(stmBrowser)
  library(pipeR)

  load("~/Downloads/stm_model_data.Rdata")
  
  
  
  stmBrowser_widget(
    mod = mod_out
    ,data = out$meta
    ,covariates = c("treatment", "pid_rep")
    ,text = "open.ended.response"
  )
}