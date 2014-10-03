\name{admix}
\alias{admix}
\docType{data}
\title{Simulated Admixed Population Data}
\description{
The data set provides simulated allele calls for 50 individuals from 3 populations. We consider a simple admixture scenario where two ancestral populations, popA (sample size \eqn{n_A = 15}) and popB (sample size \eqn{n_B = 15}), merged 160 generations ago to form the admixed population, popAB (sample size \eqn{n_{AB} = 20}). The ancestral populations contributed to the admixed population with probability 0.5.
}
\usage{data(admix)}
\format{
List with the following entries


\itemize{
  \item \bold{\code{data}}:  3,000 x 50 data matrix with 3,000 genotype calls (columns) versus 50 individuals (rows). Raw entries take the value 0 if heterozygous, and -1 or 1 if homozygous. SNPs are ordered by their physical positions. Column names list individual IDs, row names list SNP IDs.
  \item \bold{\code{map}}:  3,000 x 2 data matrix providing mapping to genetic distance (\sQuote{recombination distance}) for each SNP.
  \item \bold{\code{colplot}}:  vector of length 50. Plotting color for each individual. 
  \item \bold{\code{populations}}:  list of length 3. Character vectors giving the IDs of individuals in each population. IDs must map to the column names of the data matrix.
}


}
\details{
For further details, see accompanying paper.
}

\references{
Chen G.K., P. Marjoram and J.D. Wall. 2009. Fast and flexible simulation of DNA sequence data. \emph{Genome Research} 19:136-142. doi:10.1101 gr.083634.108.
}
\examples{
data(admix)
str(admix) 
}
\keyword{datasets}
