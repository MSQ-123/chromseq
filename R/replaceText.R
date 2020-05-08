#' Replace tedious chromosome identifier into simple format
#'
#' Make the chromosome id starting with ">" into simple format like
#' ">chr:1091194-1093520...",this is helpful for sorting the chromosome according to their number
#' @param type This can be either "text" or "list", The previous is a large character containing each line of the Fasta file, the latter is a list in which each element contains a unit of Fasta file
#' @param input The large character or list containing ids that need to be simplified
#'
#' @return The large character or list of Chromosome Fasta file with simplified id.
#' @export
#'
#' @examples
#' data("id")
#' simpleID<- replaceText(type = "text",input = id)
#' @author Shaoqian Ma
replaceText <- function(type = "text",input = input){
  if(type == "text"){
    for (i in 1:length(input)) {
      if(strsplit(input[i],split = "")[[1]][1] == ">"){
        n <- regexpr(pattern = "chr",input[i])[1]
        m<- length(strsplit(input[i],split = "")[[1]])
        chr <- ">"
        for(c in strsplit(input[i],split = "")[[1]][c(seq(from = n,to=m))]){
          chr = paste(chr,c,sep = "")
        }
        input[i]<- replace(x = input[i],values = chr)
      }
    }
    return(input)
  }
  if(type == "list"){
    for (i in 1:length(input)) {
      n <- regexpr(pattern = "chr",input[[i]][1])[1]
      m<- length(strsplit(input[[i]][1],split = "")[[1]])
      chr <- ">"
      for(c in strsplit(input[[i]][1],split = "")[[1]][c(seq(from = n,to=m))]){
        chr = paste(chr,c,sep = "")
      }
      input[[i]][1]<- replace(x =input[[i]][1],values = chr)
    }
    return(input)
  }
}
