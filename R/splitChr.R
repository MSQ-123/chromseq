#' Split all chromosomes from the sorted chromosome list
#'
#' @param tex The sorted chromosome list made by sortList function.
#' @param chr The chromosome number sequence, if the chromosome list is "single" which means a single character following "chr" in the Fasta identifier, be sure starting with 1 and ending with 9;
#' if the chromosome list is "double" which means two characters following "chr" in the Fasta identifier, be sure that starting with 10 but the ending can be changed.
#' @param sex Whether to output the sex chromosomes like X chromosome and Y chromosome.
#' @param outdir The output directory.
#'
#' @return Write the splitted chromosome Fasta file to separated txt files according to the chromosome number.
#' @export
#' @importFrom utils tail
#'
#' @examples
#' data(tex)
#' data(text)
#' #Simplify the Fasta id
#' text<- replaceText(type = "text",input = text)
#' #Subtract id
#' id <- subFasID(text = text)
#' #Sort the fasta according to the chromosome number in id
#' tex2<- sortList(id=id,tex = tex,chrsig = "single")
#' tex3 <- sortList(id=id,tex = tex,chrsig = "double")
#' outdir <- tempdir()
#' #Output the results
#' splitChr(tex = tex2,chr=seq(1,9),sex = TRUE,outdir = outdir)
#' splitChr(tex = tex3,chr=seq(10,22),sex = FALSE,outdir = outdir)
#' @author Shaoqian Ma
splitChr <- function(tex = tex,chr=chr,sex = FALSE, outdir = "."){
  pos2 <- list()
  #calculate the length of each chromosome
  for(eachchr in chr){
    t <- unlist(lapply(lapply(tex, function(x){grep(strsplit(x,split = ":")[[1]][1],
                                                    pattern = paste("chr",eachchr,sep = ""))}),
                       function(x){ifelse(x == 0, FALSE, TRUE)}))
    pos2[eachchr] <- length(t)#pos2 stores the length of each chromosome Fasta file
    
  }
  fil <- list() #each element in fil list is the Fasta file of the same chromosome number.
  
  #output each chromosome
  for(eachchr in chr){
    txtpath <- file.path(outdir,paste("chr",eachchr,".txt",sep = ""))
    if(eachchr == 1){
      fil[[1]] <- unlist(tex[1:pos2[[eachchr]]])
      write(fil[[eachchr]],file = txtpath)
    }
    else if(eachchr == 10){
      fil[[10]] <- unlist(tex[1:pos2[[eachchr]]])
      write(fil[[eachchr]],file = txtpath)
    }
    else{
      fil[[eachchr]] <- unlist(tex[(pos2[[eachchr-1]]+1):((pos2[[eachchr-1]]+1) + pos2[[eachchr]]-1)])
      pos2[[eachchr]]<- pos2[[eachchr-1]]+1 + pos2[[eachchr]]-1
      write(fil[[eachchr]],file = txtpath)
    }
  }
  #Note that single char chromosomes like X and Y can be output separately
  if(sex == TRUE){
    txtpath <- file.path(outdir,paste("sexchrom",".txt",sep = ""))
    tX <-  unlist(lapply(lapply(tex, function(x){grep(strsplit(x,split = ":")[[1]][1],
                                                      pattern = "chr[XY]$",fixed = F)}),
                         function(x){ifelse(x == 0, FALSE, TRUE)}))
    posx <- length(tX)
    fil2 <- list()
    #for chr = seq(1,9), the X and Y chromosomes are output lastly
    Xnum <- tail(chr,1)+1
    fil[[Xnum]] <- unlist(tail(tex,posx))
    write(fil[[Xnum]],file = txtpath)
  }
}
