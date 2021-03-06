% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ChipSeq.R
\name{parser4diffbind}
\alias{parser4diffbind}
\title{parser4diffbind}
\usage{
parser4diffbind(input.sample.file, input.bed.dir, input.file.pattern,
  output.dir, summit_peak = NULL)
}
\arguments{
\item{input.file.pattern}{}
}
\description{
parser4diffbind
}
\examples{
 
input.sample.file = "/Volumes/Bioinformatics$/2017/DannyNewData/SampleID_INFO_ChIP_new_Danny.csv"
input.bed.dir = "/Volumes/Bioinformatics$/2017/DannyNewData/PeakCall/"
input.file.pattern = "bed"
output.dir="BindDiff_4_7_2017-cutoff_10k_test"
resmcf<-parser4diffbind(input.sample.file,input.bed.dir,input.file.pattern,output.dir)

}
