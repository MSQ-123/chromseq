#' Sort the chromosome list  according to the chromosome number
#'
#' @param id The identifier list of the Fasta file made by subFasID
#' @param tex A chromosome Fasta file in list format made by readToList function
#' @param chrsig The number of characters of the chromosome,
#' either "single" or "double", the previous means a single character
#' following "chr" in the Fasta identifier, the latter means two characters
#' following "chr" in the Fasta identifier. eg."chr1,chrX,chrY,chrM" is
#' "single";"chr10,chr11" is "double". If you want to obtain
#' both "single" and "double" sorted list of chromosome, try
#' "single" and "double" respectively
#'
#' @return The sorted chromosome Fasta file in list format.
#' @export
#'
#' @examples
#' data("tex")
#' data("text")
#' text<- replaceText(type = "text",input = text)
#' id <- subFasID(text = text)
#' tex2<- sortList(id=id,tex = tex,chrsig = "single")
#' tex3 <- sortList(id=id,tex = tex,chrsig = "double")
sortList <- function(id = id,tex = tex,chrsig = "single"){
  id2 <- c()
  if(chrsig == "single"){
    for(i in 1:length(id)){
      if(length(strsplit(strsplit(id[i],split=":")[[1]][1],split = "")[[1]]) == 5){
        id2 <- c(id2,id[i])
      }
    }
    id2<- sort(id2)
    tex2 <- list()
    for(i in 1:length(id2)){
      for(j in 1:length(tex)){
        if(tex[[j]][1] == id2[i]){
          tex2[[i]] <- tex[[j]]
        }
        
      }
    }
  }
  else if(chrsig == "double"){
    for(i in 1:length(id)){
      if(length(strsplit(strsplit(id[i],split=":")[[1]][1],split = "")[[1]]) == 6){
        id2 <- c(id2,id[i])
      }
    }
    id2<- sort(id2)
    tex2 <- list()
    for(i in 1:length(id2)){
      for(j in 1:length(tex)){
        if(tex[[j]][1] == id2[i]){
          tex2[[i]] <- tex[[j]]
        }
        
      }
    }
  }
  return(tex2)
}
