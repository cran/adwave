\name{admix}
\alias{admix}
\docType{data}
\title{Simulated Admixed Population Data}
\description{
The example dataset provides simulated allele calls for 50 individuals from 3 populations. We consider a simple admixture scenario where two ancestral populations, popA (sample size \eqn{n_A} = 15) and popB (sample size \eqn{n_B} = 15), merged 160 generations ago to form the admixed population, popAB (sample size \eqn{n_{AB}} = 20). The ancestral populations contributed to the admixed population with probability 0.5.
}
\usage{data(admix)}
\format{
A list with the following entries:

\itemize{
  \item \bold{\code{data}}:  3,000 x 50 data matrix with 3,000 genotype calls (rows) for 50 individuals (columns). Raw entries take the value 0 if heterozygous, and -1 or 1 if homozygous. Polymorphisms are ordered by their physical positions. Column names list individual IDs, row names list polymorphism IDs.
  \item \bold{\code{map}}:  3,000 x 2 data matrix providing a mapping to genetic distance (\sQuote{recombination distance}) for each polymorphism.
  \item \bold{\code{colplot}}:  vector of length 50. Plotting color for each individual. 
  \item \bold{\code{populations}}:  list of length 3. Character vectors giving the IDs of individuals in each population. IDs must map to the column names of the data matrix.
}


}
\details{
Further description of the dataset can be found in Sanderson et al. (2015). The data were simulated using MaCS (Chen et al. 2009).
}

\references{
Sanderson J, H Sudoyo, TM Karafet, MF Hammer and MP Cox. 2015. Reconstructing past admixture processes from local genomic ancestry using wavelet transformation. \emph{Genetics} 200:469-481. \url{https://doi.org/10.1534/genetics.115.176842}

Chen GK, P Marjoram and JD Wall. 2009. Fast and flexible simulation of DNA sequence data. \emph{Genome Research} 19:136-142. \url{https://doi.org/10.1101/gr.083634.108}
}
\examples{
data(admix)
str(admix) 
}
\keyword{datasets}
