#' Subtract chromosome ids from Fasta file
#'
#' @param text Large character read by readLines from chromosome Fasta file.
#'
#' @return The id list of the Fasta file.
#' @export
#'
#' @examples
#' data("text")
#' text<- replaceText(type = "text",input = text)
#' id <- subFasID(text = text)
subFasID <- function(text = text){
  id = list()
  sum = 0
  #Fasta id is started with ">"
  
  for (i in 1:length(text)) {
    if(strsplit(text[i],split = "")[[1]][1] == ">"){
      sum = sum + 1
      id[[sum]] <- text[i]
    }
  }
  return(unlist(id))
}
