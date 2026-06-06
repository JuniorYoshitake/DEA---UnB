#' Randomization/Permutation Sign Test
#'
#' Sign test for zero mean of differences based on randomizing the signs.
#'
#' @param x A vector of numeric data, typically arising as a vector of differences.
#' @param y An optional vector of data.
#' @param ntrials Integer number of random sets of signs to use in simulating
#'	the permutation distribution.
#' @param plot Logical flag for whether to plot a histogram of the permuation distribution.
#' @param bins Number of bins to use in the (optional) histogram.
#' @param nullvalue Optional null value to subtract from the data.
#' @param data An optional data frame
#' @param confidence The coverage rate for a two-sided interval.
#'
#' @return A list with components x0, lower.p, upper.p, twosided.p containing the
#'	observed mean of the deviations of the data from the null value
#'	and the lower, upper, and two-sided p-values for testing
#'	the null hypothesis.
#'
#' @author Gary W. Oehlert \email{gary@umn.edu}
#'
#' @details \code{permsign.test} is a permutation test for the null hypothesis that
#' the mean of \code{x-nullvalue} is zero (or the mean of \code{x-y-nullvalue} if
#'  \code{y} is not NULL). The basis for the test is that the signs of the deviations from the null value are
#'	independent with a 50/50 channce of positive or negative. The mean of the
#'	deviations of the observed data from the null value is the test statistic, and the null distribution is estimated from
#'	a random sample of of \code{ntrials} means with the signs of the deviations from the null value
#'	randomized.
#'	
#'	\code{permsign.test(x)} is an alternative to the t-test or the sign test.
#'	\code{permsign.test(x-y)} (or equivalently \code{permsign.test(x,y)})
#'	is an alternative to the paired t-test.
#'	
#'	If \code{plot} is TRUE, then a histogram of the sampled null distribution is
#'	printed with a vertical line drawn at the observed value. You may adjust the
#'	number of bins in the histogram usings \code{bins}.
#'
#' @seealso \code{\link[stats:t.test]{stats::t.test}}
#'
#' @examples
#' data(RunStitch)
#' # paired two sample test using permuted differences
#' permsign.test(Standard,Ergonomic,data=RunStitch)
#' # test using permuted signs of differences
#' permsign.test(Standard-Ergonomic,data=RunStitch) # the same
#'
#' @export
permsign.test <- function(x,y=NULL,data=NULL, ntrials=10000,plot=FALSE,
                          bins=20,nullvalue=0,confidence=.95)
{
	
	xname <- deparse(substitute(x))
	x <- eval(substitute(x),data)
	yname <- deparse(substitute(y))
	y <- eval(substitute(y),data)
	
	if(!is.numeric(x) || !is.vector(x))
	{
		stop("argument must be numeric vector")
	}
	
	justx <- TRUE
	if(!is.null(y)) {
		if(!is.numeric(y) || length(y) != length(x)) {
			stop("x and y must be numeric and the same length")
		}
		x <- x-y
		justx <- FALSE
	} else {
		yname <- NULL
	}
	
	missing <- is.na(x)
	if(sum(missing) > 0) 
	{
		warning("missing values removed")
		x <- x[!missing]
		if(length(x) == 0) stop("all values missing")
	}
	if(any(!is.numeric(ntrials), length(ntrials) > 1, ntrials < 1))
	{
		stop("ntrials must be a positive count")
	}
	ntrials <- round(ntrials,0)
	if(any(!is.logical(plot), length(plot) > 1))
	{
		stop("plot must be TRUE or FALSE")
	} 
	if(any(!is.numeric(bins), length(bins) > 1, bins < 1))
	{
		stop("bins must be a positive count")
	}
	bins <- round(bins,0)
	if(any(!is.numeric(nullvalue), length(nullvalue) > 1))
	{
		stop("nullvalue must be a real scalar")
	}
	x <- x - nullvalue
	x0 <- sum(x)
	n <- length(x)
	dist <- apply(x* matrix(sample(c(-1,1),n*ntrials,replace=TRUE),nrow=n),2,sum)
	x0 <- x0/n
	dist <- dist/n
	low <- sum(x0 >= dist)/ntrials
	high <- sum(x0 <= dist)/ntrials
	two <- 2*min(low,high)
	if(plot) 
	{
		hist(dist,bins,main="Randomization Distribution",xlab="Mean of values")
		abline(v=x0,col="red")
	}
	dist <- sort(abs(dist),decreasing=TRUE)
	moe <- dist[floor((1-confidence)*ntrials)]
	
	out <- list(x0=x0+nullvalue,lower.p=low,upper.p=high,twosided.p=two,
			interval=x0+c(-1,1)*moe+nullvalue,nullvalue=nullvalue,confidence=confidence)
	class(out) <- "permsign"
	attr(out,"varnames") <- c(xname,yname)
	out
}

#' @method print permsign
#' @export
print.permsign <- function(x,...) {
	
	names <- attr(x,"varnames")
	outstring <- paste("Permutation Sign Test for",names[1])
	if(length(names) > 1) outstring <- paste(outstring,"-",names[2])
	outstring <- paste(outstring,"\n\n")

	outstring <- paste(outstring,"Null hypothesis mean value:",x$nullvalue,"\n\n")
	outstring <- paste(outstring,"Lower tail p-value",x$lower.p,"\n")
	outstring <- paste(outstring,"Upper tail p-value",x$upper.p,"\n")
	outstring <- paste(outstring,"Two tail p-value",x$twosided.p,"\n\n")
	
	outstring <- paste(outstring,100*x$confidence,"% confidence interval: ",
		signif(x$interval[1],4),", ",signif(x$interval[2],4),"\n",sep="")
		
	cat(outstring)
	
}
