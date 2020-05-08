#' Fasta file of chromosome sequence
#'
#' A downsampled dataset containing the hg19 chromosome sequence from
#' the hg19 blacklist. The hg19 blacklist is obtained from the supplementary
#' dataset from "Massively parallel single-cell chromatin landscapes of human 
#' immune cell development and intratumoral T cell exhaustion."
#' The dataset is sent to the UCSC Table Browser for obtaining the corresponding 
#' sequence file. The sequence file is processed with replaceText function to 
#' simplify the fasta id. To best illustate the usage, the sequence file is downsampled.
#'
#' @docType data
#'
#' @usage data(text)
#'
#' @format A character sequence with 2099 elements.
#'
#' @keywords datasets
#'
#' @references Satpathy A T, Granja J M, Yost K E, et al. (2019) Nature biotechnology 37, 925–936.
#' (\href{https://www.ncbi.nlm.nih.gov/pubmed/31375813}{PubMed})
#'
#' @examples
#' data(text)
"text"


#' Fasta file of chromosome sequence produced from sequence character
#'
#' Data from "Three representative inter and intra-subspecific crosses
#'  reveal the genetic architecture of reproductive isolation in rice."
#'
#' @docType data
#'
#' @usage data(tex)
#'
#' @format A large list containing 62 elements.
#'
#' @keywords datasets
#'
#' @references Li, G. et al. (2017) The Plant Journal 92, 349–362.
#' (\href{https://www.ncbi.nlm.nih.gov/pubmed/28805257}{PubMed})
#'
#' @examples
#' data(tex)
"tex"

#' Sampled Fasta file of chromosome sequence from hg19 blacklist
#'
#' This dataset is sampled from The hg19 blacklist.
#' For splitting a chromosome Fasta file, sometimes the
#' Fasta identifier is too complicated to manipulate. This data
#' can be used to show how to simplify the Fasta identifier.
#'
#' @docType data
#'
#' @usage data(id)
#'
#' @format A character sequence with 20 elements
#'
#' @keywords datasets
#'
#'
#' @references Satpathy A T, Granja J M, Yost K E, et al. (2019) Nature biotechnology 37,925–936.
#' (\href{https://www.ncbi.nlm.nih.gov/pubmed/31375813}{PubMed})
#'
#'@examples
#'data(id)
"id"
