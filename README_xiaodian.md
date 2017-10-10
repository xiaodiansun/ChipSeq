# Intructions for using ChipSeq

## Set up environment

Install the following softares firstly:

1. ngsplt(https://github.com/shenlab-sinai/ngsplot)
(1) Download the ngs.plot package to a desired folder, such as ~/packages, and extract it:

cd ~/packages
tar xzvf ngsplot-2.61.tar.gz

(2) Add ngsplot executables to your PATH.to your ~/.bash_profile

export PATH=~/packages/ngsplot/bin:$PATH

(3) Set environment variable NGSPLOT like this in your ~/.bash_profile:

export NGSPLOT=~/packages/ngsplot

(4) Then in the terminal, execute:

source ~/.bash_profile

(5) Install some required libraries in R

install.packages("doMC", dep=T)
install.packages("caTools", dep=T)
install.packages("utils", dep=T)
For R 3.0+, utils is no longer needed. For R <3.0, you probably already have caTools and utils installed but it does not hurt to check. Then execute in R:

source("http://bioconductor.org/biocLite.R")
biocLite( "BSgenome" )
biocLite( "Rsamtools" )
biocLite( "ShortRead" )


2. MACS(https://github.com/taoliu/MACS)

(1) Install python to local directory

mkdir ~/python      
cd ~/python
wget https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tgz
tar zxfv Python-2.7.11.tgz
find ~/python -type d | xargs chmod 0755
cd Python-2.7.11

./configure --prefix=$HOME/python
make && make install

Edit ~/.bashrc_profile and add the following lines:

export PATH=$HOME/python/Python-2.7.11/:$PATH
export PYTHONPATH=$HOME/python/Python-2.7.11

Finally, refresh the current session by running the command:

source ~/.bashrc_profile

which python

(2)  Install pip to local directory

Run the following command to install pip as a local user

wget https://pypi.python.org/packages/source/s/setuptools/setuptools-7.0.zip --no-check-certificate
unzip setuptools-7.0.zip
~/python/Python-2.7.11/python setup.py install
easy_install pip

After finishing the installation, we need to update our PATH variable. Open ~/.bashrc_profile and add the following line:

export PATH=$HOME/.local/bin:$PATH

Again, reload the session by the command source ~/.bashrc_profile or logout and login. Then, check if pip command is available:

which pip

(3) install numpy
python -m pip install --upgrade pip
pip install --user numpy scipy matplotlib ipython jupyter pandas sympy nose

# Consider adding this at the end of your ~/.bashrc file
vim ~/.bashrc
export PATH="$PATH:/nethome/xxs522/.local/bin"

(4) install Cython
pip install Cython --install-option="--no-cython-compile"

(5) install MACS-1.4.2-1
Download MACS-1.4.2-1.tar.gz from https://github.com/taoliu/MACS/downloads
python setup.py install --prefix /nethome/xxs522/MACS-1.4.2-1/

# Consider adding this at the end of your ~/.bashrc file
vim ~/.bashrc
/nethome/xxs522/MACS-1.4.2-1/lib/python2.7/site-packages
export PATH=/nethome/xxs522/MACS-1.4.2-1/bin:$PATH


3. sudo apt-get install libboost-dev

wget http://downloads.sourceforge.net/project/boost/boost/1.62.0/boost_1_62_0.tar.gz
tar -xzvf boost_1_62_0.tar.gz
cd boost_1_62_0
./bootstrap.sh
./b2
./b2 install

 export BOOST_ROOT=/nethome/xxs522/local/boost_1_62_0
 export LD_LIBRARY_PATH=$BOOST_ROOT/lib:$LD_LIBRARY_PATH


4. R -e 'library(devtools);devtools::install_github("hms-dbmi/spp", build_vignettes = FALSE)'

#wget www.netgull.com/gcc/releases/gcc-4.9.4/gcc-4.9.4.tar.gz  
module load gcc4.9.3
export CXX="/share/opt/gcc/4.9.3/bin/g++"
export CC="/share/opt/gcc/4.9.3/bin/gcc"

## Set Path

emacs .bashrc

export PYTHONPATH=/nethome/axy148/MACS-1.4.2-1/lib/python2.7/site-packages:$PYTHONPATH

export PATH=/nethome/axy148/MACS-1.4.2-1/bin:$PATH

export PATH=$HOME/NGS_tools/ngsplot/bin:$PATH

source .bashrc

## Use ChipSeq

```{r}
# install ChipSeq
# 
install.packages("RcppArmadillo")

library(devtools)
install_github("js229/Vennerable")

source("https://bioconductor.org/biocLite.R")
biocLite(C("ChIPseeker","ChIPpeakAnno","DiffBind","fgsea","DOSE","systemPipeR",
           "DESeq2","LOLA","TxDb.Hsapiens.UCSC.hg38.knownGene","TxDb.Hsapiens.UCSC.hg19.knownGene",
           "GOSemSim","EnsDb.Hsapiens.v75","org.Hs.eg.db","BSgenome.Hsapiens.UCSC.hg19",
           "GenomicFeatures","RBGL","graph")

R -e 'library(devtools);install_github("aiminy/ChipSeq")'

# Generate sample_infor_Danny_chip3.txt in ~/Danny_chip3
# 
R -e 'library(ChipSeq);library(ChipSeq);ChipSeq:::parseToSampleInfo("/projects/scratch/bbc/Project/Danny_chip3/Filtered_bam","*.bam$","~/Danny_chip3","sample_infor_Danny_chip3.txt","Danny_chip3")'

# Get CC plot on cluster
# 
R -e 'library(PathwaySplice);library(DoGs);library(ChipSeq);ChipSeq:::submitJob4useRunSppR(""~/Danny_chip3/sample_infor_Danny_chip3.txt","/projects/scratch/bbc/Project/Danny_chip3/Filtered_bam","/scratch/projects/bbc/aiminy_project/Danny_chip3_Chipseq_QC")'

# Get CC plot locally
# 
R -e 'library(ChipSeq);re <- ChipSeq:::useRunSppR("~/Danny_chip3/sample_infor_Danny_chip3.txt","/media/aiminyan/DATA/Danny_chip3","/media/aiminyan/DATA/Danny_chip3_chipSeq_QC")'

# Get heatmap locally

#install hg19 genome data if this data is not in your environment, 
# download ngsplotdb_hg19_75_3.00.tar.gz,ngsplotdb_hg19_75_3.00_enhancer.tar.gz and ngsplotdb_hg19_75_3.00_dhs.tar.gz to ~/Downloads
# install these data
ngsplotdb.py install ~/Downloads/ngsplotdb_hg19_75_3.00.tar.gz
ngsplotdb.py install ~/Downloads/ngsplotdb_hg19_75_3.00_enhancer.tar.gz
ngsplotdb.py install ~/Downloads/ngsplotdb_hg19_75_3.00_dhs.tar.gz

# if bam files are not sorted and indexed yet, run the foollowing 
R -e 'library(ChipSeq);re <- ChipSeq:::BamFileSortIndexVisualization("/media/aiminyan/DATA/Danny_chip3","*.bam$","/media/aiminyan/DATA/Danny_chip3_heatmap",5000,"Hs")'

# if bam files are already sorted and indexed, run the following 
R -e 'library(ChipSeq);re <- ChipSeq:::BamFileSortIndexVisualization("/media/aiminyan/DATA/Danny_chip3","*.bam$","/media/aiminyan/DATA/Danny_chip3_heatmap",5000,"Hs",bam.sort=TRUE)'

# Generate heatmap normalized by inputs, you need to make a Danny_chip3_4_ngs_plot.txt firstly
R -e 'library(ChipSeq);ChipSeq:::ngs2("/media/H_driver/Aimin_project/Danny_chip3_4_ngs_plot.txt",5000,"/media/H_driver/Aimin_project/heapmapNormalizedByInput")'


# Generate Normalized-By-Subtract-Inputs-Rm-BlackList-Region BigWig files
 R -e 'library(ChipSeq);ChipSeq:::getBwUseBamCompare("/media/H_driver/Aimin_project/Danny_chip3.txt","/media/H_driver/Aimin_project/REF/consensusBlacklist.bed","/media/H_driver/Aimin_project/Norma_sub_Coverage_rm_bl")'
```
## call peaks use macs2 without using input
```{r} 
 R -e 'library(ChipSeq);re <- ChipSeq:::peakCallAndAnnotationWithoutInput("/media/aiminyan/DATA/Danny_chip3","/media/H_driver/Danny_chip3_macs2_call","hs","macs2",0.0001)'
```

## Annotate peaks
```{r}
 R -e 'library(ChipSeq);re <- ChipSeq:::AnntationUsingChipSeeker3("/media/H_driver/Aimin_project/Danny_chip3_macs2_call/PeakCall","*.narrowPeak$","/media/H_driver/Aimin_project/Danny_chip3_macs2_annotation",txdb="hg19",DD=5000,distanceToTSS_cutoff=10000)'
```
## Call peaks use macs2 with input
```{r}
R -e 'library(ChipSeq);ChipSeq:::peakCall2("/media/H_driver/Aimin_project/Danny_chip3.txt","hs","/media/H_driver/Aimin_project/peak_call_with_input","macs2",0.00001)'

```
## Annotate peaks called with inputs
```{r}
R -e 'library(ChipSeq);re <- ChipSeq:::AnntationUsingChipSeeker3("/media/H_driver/Aimin_project/peak_call_with_input","*.narrowPeak$","/media/H_driver/Aimin_project/Danny_chip3_macs2_annotation_with_ input",txdb="hg19",DD=5000,distanceToTSS_cutoff=10000)'
```

## Get sequence around summit peak
```{r}
R -e 'library(ChipSeq);re <- ChipSeq:::getSummitSequence("/media/H_driver/Aimin_project/peak_call_with_input","*.xls$","hg19","/media/H_driver/Aimin_project/SummitSeq")'
```
