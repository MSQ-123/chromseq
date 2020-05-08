<!-- README.md is generated from README.Rmd. Please edit that file -->

### chromseq

Some fasta files contain all chromosomes from one genome，sometimes
users have to split these chromosomes into different files according to
their number label.The msqchr can help to handle this, so that the specific chromosome fasta file can be used for downstream analysis.

### Installation

``` r
devtools::install_github("MSQ-123/chromseq")
```

### Usage

Replace tedious chromosome identifier into simple format. So that the
subtracted ids are easy to manipulate.

``` r
data("id")
simpleID<- replaceText(type = "text",input = id)
```

Subtract chromosome ids from a fasta file

``` r
data("text")
text<- replaceText(type = "text",input = text)
id <- subFasID(text = text)
```

Transform the large character object into special list:

``` r
fil <- tempfile(fileext = ".data")
write(text,file = fil)
con0 <- file(fil, "r")
tex <- readToList(id,text = text,con = con0)
```

Sort the chromosome list according to their number. Note: the “single”
and “double” chromosome should be sort separately. Note: This data is
already sorted, this is just for expository purposes.

``` r
tex2<- sortList(id=id,tex = tex,chrsig = "single")
tex3 <- sortList(id=id,tex = tex,chrsig = "double")
```

Now we can split the chromosome fasta file into different files
according to their number.

``` r
outdir <- tempdir()
splitChr(tex = tex2,chr=seq(1,9),sex = TRUE,outdir = outdir)
#chromosome X or Y is "single",so the tex should be a
#"single" chromosome list.
#In the below case, sex should be F.
splitChr(tex = tex3,chr=seq(10,22),sex = FALSE,outdir = outdir)
```