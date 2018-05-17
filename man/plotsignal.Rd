\name{plotsignal}
\alias{plotsignal}
\title{Plot Localized Admixture Signals}
\description{
Plotting function for objects of class \code{adsig}. 
}
\usage{
plotsignal(x, ind = NULL, popA = NULL, popB = NULL, xlab = NULL, ylab = NULL, 
		ylim = NULL, main = NULL)
}

\arguments{
  \item{x}{
object of class \code{adsig} for plotting. 
}
  \item{ind}{
character giving ID of a single individual to plot. 
}
  \item{popA}{
\emph{(optional)} name of ancestral population 1.
}
  \item{popB}{
\emph{(optional)} name of ancestral population 2.
}
  \item{xlab}{
\emph{(optional)} character string for x axis label. 
}
  \item{ylab}{
\emph{(optional)} character string for y axis label. 
}
  \item{ylim}{
\emph{(optional)} vector giving plotting range for y axis.
}
  \item{main}{
\emph{(optional)} character string for title. 
}
}

\value{
Produces figure.
}
\references{
Sanderson J, H Sudoyo, TM Karafet, MF Hammer and MP Cox. 2015. Reconstructing past admixture processes from local genomic ancestry using wavelet transformation. \emph{Genetics} 200:469-481. \url{https://doi.org/10.1534/genetics.115.176842}
}
\author{
Jean Sanderson
}


\seealso{
\code{\link{signal}}
}
\examples{
data(admix)

# Generate the admixture signal with windowing
AdexPCA2 <- signal(admix$data,popA="popA",popB="popB",populations=admix$populations,
		tol=0.001,n.signal=1000,window.size=0.01)

# Plot resulting admixture signal for one individual
plotsignal(AdexPCA2,ind="AD00001",popA=AdexPCA2$popA,popB=AdexPCA2$popB)
}

