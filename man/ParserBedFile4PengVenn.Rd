% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ChipSeq.R
\name{ParserBedFile4PengVenn}
\alias{ParserBedFile4PengVenn}
\title{ParserBedFile4PengVenn}
\usage{
ParserBedFile4PengVenn(dir.name, input.file.pattern, out.dir.name)
}
\arguments{
\item{input.file.pattern}{}
}
\description{
ParserBedFile4PengVenn
}
\examples{

dir.name="/media/H_driver/2016/Yang/BedFromPeng/"
input.file.pattern="*combine_chr_st_end.bed"

input.file.pattern="*combine_chr_st.bed"



out.dir.name="/media/H_driver/2016/Yang/Results/"

re.from.bed.peng.4.venn<-ParserBedFile4PengVenn(dir.name,input.file.pattern,out.dir.name)


save.image(file=paste0(out.dir.name,"re_save_peng.RData"))
savehistory(file=paste0(out.dir.name,"re_save_peng.Rhistory"))

}
