library(tidyverse)
library(readxl)
read_excel_easy <- function(path,sheet=1,all=FALSE,col_types=c("text")){
  if(length(path)==1){
    return(read_excel(path = path,sheet = sheet,col_types = col_types))
  }else{
    if(all==FALSE){
      return(map_df(path,~read_excel(.x,sheet = sheet,col_types = col_types)))
    }else{
      return(map(path,~pmap(list(
        path=.x,
        sheet=c(1:sheet),
        col_types=col_types),read_excel)
      ))
    }
  }
}
  
