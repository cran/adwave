\name{wavesum}
\alias{wavesum}
\title{Wavelet Summaries of Localized Admixture Signals}
\description{
Produces wavelet summaries for each individual and group. Returns the wavelet variance and average block size metric (ABS).
}
\usage{
wavesum(x, populations, popA = NA, popB = NA, ml = NULL, type = "la8",
    t.factor = 1, fullWT = FALSE)
}

\arguments{
  \item{x}{
object of class \code{adsig}. 
}
  \item{populations}{
list containing a vector of individual IDs for each population in the analysis. 
}
  \item{popA}{
name of ancestral population 1 (used for forming the axes of variation). Must match one of the names in \code{populations}. 
}
  \item{popB}{
name of ancestral population 2 (used for forming the axes of variation). Must match one of the names in \code{populations}. 
}
  \item{ml}{
number of wavelet scales in the decomposition. Must not exceed \eqn{log_2(T)}, where \emph{T} is the length of the signal.
}
  \item{type}{
name of the wavelet to use in the decomposition. The default, \dQuote{la8}, is Daubechies Least Asymmetric wavelet of length 8. Other options include \dQuote{haar}.
}
  \item{t.factor}{
multiplicative factor for thresholding. See paper for details. Default is 1.
}
  \item{fullWT}{
if \code{TRUE}, save the full wavelet periodogram, as well as the wavelet variance. Object size will be large. Default is \code{FALSE}.
}
}
\details{
Produces wavelet summaries for objects of class \code{adsig}. The function computes the wavelet variance for each individual and population, extracts the informative wavelet variance based on levels observed in the ancestral populations, and computes summary measures of average block size metric (ABS) and peak wavelet scale for each individual and population. \cr \cr
See \code{waveslim} documentation for details of the \code{modwt} function and alternative wavelet options.

}
\value{
The code returns a list with the following components: 

\item{n.ind}{number of individuals in the analysis.}
\item{n.group}{number of groups in the analysis.}
\item{rv.ind}{matrix of dimension \eqn{n x ml}, returning the raw wavelet variance for each individual.}
\item{rv.group}{matrix of dimension \eqn{n.group x ml}, returning the raw wavelet variance for each group.}
\item{threshold }{vector of length \eqn{ml}, returning threshold values for each wavelet scale.}
\item{iv.ind}{matrix of dimension \eqn{n x ml}, returning the informative (thresholded) wavelet variance for each individual.}
\item{iv.group}{matrix of dimension \eqn{n.group x ml}, returning the informative (thresholded) wavelet variance for each group.}
\item{abs.ind}{vector of length \eqn{n}, returning the average block size metric (ABS) for each individual.}
\item{abs.group}{vector of length \code{n.group}, returning the average block size metric (ABS) for each group.}
\item{pws.ind}{vector of length \eqn{n}, returning the peak wavelet scale for each individual.}
\item{pws.group}{vector of length \code{n.group}, returning the peak wavelet scale for each group.}
\item{wtmatrix}{ \emph{(only if \code{fullWT = TRUE})}. Array of dimension \eqn{T x n x ml}, containing squared wavelet coefficients for each individual.}
\item{wtmatrix.group}{\emph{(only if \code{fullWT = TRUE})}. Array of dimension \eqn{T x n.group x ml}, squared wavelet coefficients, averaged for each group.}

}
\references{
Sanderson J, H Sudoyo, TM Karafet, MF Hammer and MP Cox. 2015. Reconstructing past admixture processes from local genomic ancestry using wavelet transformation. \emph{Genetics} 200:469-481. \doi{10.1534/genetics.115.176842}
}
\author{
Jean Sanderson
}



\seealso{
 \code{\link{signal}}
}
\examples{
data(admix)

# Generate the admixture signal 
AdexPCA <- signal(admix$data,popA="popA",popB="popB",populations=admix$populations,
  tol=0.001, n.signal=NULL)

# Compute wavelet summaries
WSN <- wavesum(AdexPCA,populations=admix$populations,popA="popA",popB="popB")

# Plot raw wavelet variance for each population
barplot(WSN$rv.group[3,],ylim=c(0,0.9),col="red", names.arg=1:11,border=NA)
barplot(WSN$rv.group[1,],ylim=c(0,0.9),col="green3",names.arg=1:11,border=NA,add=TRUE)
barplot(WSN$rv.group[2,],ylim=c(0,0.9),col="blue", names.arg=1:11,border=NA,add=TRUE)
legend("topright",c("popA","popB","popAB"),col=c(3,4,2),pch=15)
box()

# Plot informative wavelet variance for admixed population
barplot(WSN$iv.group[3,],ylim=c(0,0.15),col="red",names.arg=1:11,border=NA)
ABS <- round(WSN$abs.group[3],2) 
text(11,0.13,paste("ABS=",ABS))
box()
}
