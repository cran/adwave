\name{signal}
\alias{signal}
\title{Compute Localized Admixture Signals}
\description{
Produces estimates of localized ancestry for each individual. 
}
\usage{
signal(table, who = colnames(table), populations, popA = NA, popB = NA, 
	normalize = FALSE, n.pca = 5, PCAonly = FALSE, verbose = TRUE, tol = 0.001,
	n.signal = NULL, window.size = NULL, genmap = NULL)
}

\arguments{
  \item{table}{
matrix of genotype calls (rows, length \emph{T}) versus individuals (columns, length \emph{n}).}
  \item{who}{individuals to include in the analysis. }
  \item{populations}{list containing a vector of IDs for each population in the analysis.}
  \item{popA}{
name of ancestral population 1 (used for forming the axes of variation). Must match one of the names in \code{populations}. 
}
  \item{popB}{
name of ancestral population 2 (used for forming the axes of variation). Must match one of the names in \code{populations}. 
}
  \item{normalize}{
if \code{TRUE}, normalize the data matrix. Default is \code{FALSE}. 
}
  \item{n.pca}{
number of PCA axes to compute (only the first principal component is used for forming the signals, but additional components may be desired for visualization). Default is 5.
}
  \item{PCAonly}{
if \code{TRUE}, only compute the PCA, do not compute the signals. Default is\code{ FALSE}.
}
  \item{verbose}{
if \code{TRUE}, print summary to screen. Default is \code{TRUE}.
}
  \item{tol}{
tolerance for normalization of admixture signals (\eqn{\epsilon} in accompanying paper). Default is 0.001.
}
  \item{n.signal}{
\emph{(optional)} number of data points in the windowed signal. 
}
  \item{window.size}{
\emph{(optional)} size of window specified as a proportion of total length; \cr e.g., \code{window.size = 0.01} with signal of length \eqn{T} = 3000 SNPs generates windows of \eqn{0.01 x 3000 = 30} polymorphisms. Value need not be a round number. 
}
  \item{genmap}{
\emph{(optional)} genetic distance of genotype calls, supplied as vector of length \emph{T}. If specified, signals will be formulated in terms of genetic distance along the chromosome (rather than physical position).
}
}
\details{
Applies PCA to genome-wide data using ancestral reference populations. The first eigenvector reflects the population structure. All individuals are then projected on to this axis to form the SNP-level admixture signals. PCA scores are used to estimate the proportion of admixture at the level of individuals (\code{indP}) and populations (\code{popP}). There is no restriction on the length of the data (number of SNPs) and the default is to provide an estimate of localized ancestry at each SNP. \cr \cr
Optionally, it is also possible to window the signals, producing processed signals of length \code{n.signal}. The windows may be overlapping or disjoint with width specified through the \code{window.size} option (see examples). If \code{genmap} is specified, the signals will be formulated in terms of genetic distance along the chromosome (note: this function is not described in the accompanying paper).
}
\value{
Returns an object of class \code{adsig}, a list with the following components: 
\item{call}{function call.}
\item{date}{date of function call.}
\item{individuals}{individuals for whom projections on the first principal component are calculated.}
\item{n.snps}{number of polymorphisms in the table.}
\item{signals }{The admixture signals, output as a \eqn{T x n} data matrix, where \emph{n} is the number of individuals and \emph{T} is the number of data points (either the number of polymorphisms if \code{n.signal = NULL} or \code{n.signal} otherwise).}
\item{n.tol  }{the number of entries replaced by zero in the normalization procedure. This is dependent on the value set for the tolerance, tol.}
\item{popP }{estimated proportion of admixture for each population.}
\item{indP }{estimated proportion of admixture for each individual.}
\item{pa.ind }{columns are principal axes in individual coordinates (\eqn{n_A + n_B} rows, \code{n.pca} columns).}
\item{pa.snp }{columns are principal axes in polymorphism coordinates (\emph{T} rows, \code{n.pca} columns).}
\item{G }{matrix of quadratic form in individual coordinates. }
\item{ev }{vector of eigenvalues.}
\item{gendist }{(\emph{only if \code{genmap} is specified in input}) Vector of genetic distances along the chromosome, length \code{n.signal}.}


}
\references{
Sanderson J, H Sudoyo, TM Karafet, MF Hammer and MP Cox. 2015. Reconstructing past admixture processes from local genomic ancestry using wavelet transformation. \emph{Genetics} 200:469-481. \doi{10.1534/genetics.115.176842}
}
\author{
Jean Sanderson
}




\seealso{
 \code{\link{wavesum}},  \code{\link{plotsignal}}
}
\examples{
data(admix)

# EXAMPLE 1
# Generate the admixture signal 
AdexPCA <- signal(admix$data,popA="popA",popB="popB",populations=admix$populations,tol=0.001,
		n.signal=NULL)

# Plot the resulting PCA
plot(AdexPCA$pc.ind[,1],AdexPCA$pc.ind[,2],col=admix$colplot,xlab="PC1",ylab="PC2",pch=16)
legend("bottomright",c("popA","popB","popAB"),col=c(3,4,2),pch=16)


# EXAMPLE 2
# Generate the admixture signal with windowing
AdexPCA2 <- signal(admix$data,popA="popA",popB="popB",populations=admix$populations,tol=0.001,
		n.signal=1000,window.size=0.01)

# Plot resulting admixture signal for one individual
plotsignal(AdexPCA2,ind="AD00001",popA=AdexPCA2$popA,popB=AdexPCA2$popB)


# EXAMPLE 3
# Generate the admixture signal with windowing
# As in EXAMPLE 2 but with n.signal reduced to 100 to provide disjoint windows
AdexPCA3 <- signal(admix$data,popA="popA",popB="popB",populations=admix$populations,tol=0.001,
		n.signal=100,window.size=0.01)

# Plot resulting admixture signal for one individual
plotsignal(AdexPCA3,ind="AD00001",popA=AdexPCA2$popA,popB=AdexPCA2$popB)


# EXAMPLE 4
# Generate the admixture signal in terms of genetic distance
# As in EXAMPLE 2 but with genmap specified so that signals are formulated using genetic distances
AdexPCA4 <- signal(admix$data,popA="popA",popB="popB",populations=admix$populations,tol=0.001,
	n.signal=1000,window.size=0.01,genmap=admix$map[,2])

# Plot resulting admixture signal for one individual
plotsignal(AdexPCA4,ind="AD00001",popA=AdexPCA4$popA,popB=AdexPCA4$popB)
}

