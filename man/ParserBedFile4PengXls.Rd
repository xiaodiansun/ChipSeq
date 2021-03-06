% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ChipSeq.R
\name{ParserBedFile4PengXls}
\alias{ParserBedFile4PengXls}
\title{ParserBedFile4PengXls}
\usage{
ParserBedFile4PengXls(dir.name, input.file.pattern, out.dir.name)
}
\arguments{
\item{input.file.pattern}{}
}
\description{
ParserBedFile4PengXls
}
\examples{

dir.name="/media/H_driver/2016/Yang/MACS/MACS/"
input.file.pattern="*.xls"

out.dir.name="/media/H_driver/2016/Yang/Results/"

re.from.bed.peng.Xls<-ParserBedFile4PengXls(dir.name,input.file.pattern,out.dir.name)

re.from.bed.peng.Xls.2<-ParserBedFile4PengXls(dir.name,input.file.pattern,out.dir.name)

re.from.bed.peng.Xls.3<-ParserBedFile4PengXls(dir.name,input.file.pattern,out.dir.name)

save.image(file=paste0(out.dir.name,"re_save_peng.RData"))
savehistory(file=paste0(out.dir.name,"re_save_peng.Rhistory"))

}
