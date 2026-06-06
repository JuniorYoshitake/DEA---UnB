#' Power for F tests
#'
#' Compute power for F tests with multiple possible definitions of noncentrality
#'	and degrees of freedom.
#'
#' @param  means  A vector of assumed treatment means.
#' @param ns Sample sizes for each level of the treatment factor.
#' @param sigma2 The error variance.
#' @param ncp The noncentrality parameter.
#' @param df1 Numerator degrees of freedom.
#' @param df2 Denominator degrees of freedom.
#' @param alpha Type I error rate for test.
#'
#' @author Gary W. Oehlert \email{gary@umn.edu}
#'
#' @return The power for the test.
#'
#' @details Specify either a vector of means, a vector of sample
#'	sizes, and an error variance, or specify a noncentrality parameter,
#'	numerator degrees of freedom, and denominator degrees of freedom. If the
#'	sample sizes are all equal, then the samples size can be specified as a
#'	scalar.
#'	
#'	The noncentrality parameter is computed in the following way:
#'	\code{grandmean <- sum(ns*means)/sum(ns)}
#'	\code{ncp <- sum(ns*(means-grandmean)^2)/sigma2}
#'	
#'	\code{ncp}, \code{df1}, \code{df2} can be vectors or scalars. Values will be
#'	recycled as needed if they are not all the same length.
#'
#' @seealso \code{sample.size.f.test}
#'
#' @examples
#'  # means 1:5, ni==4, error variance 4.5, alpha .05 (default)
#'  power.f.test(means=c(1,2,3,4,5),ns=4,sigma2=4.5)
#'  # same computation, but via degrees of freedom and non-centrality
#'  power.f.test(ncp=4*sum(((1:5)-3)^2)/4.5,df1=4,df2=15) # same thing
#'
#' @import stats
#' @export
power.f.test <- function(means=NULL,ns=NULL,sigma2=NULL,ncp=NULL,
	df1=NULL,df2=NULL,alpha=.05)
{
	if(any(!is.numeric(alpha), length(alpha) > 1, is.na(alpha), alpha <=0, alpha >= 1))
	{
		stop("alpha must be a scalar between 0 and 1")
	}
	if(!is.null(means) || !is.null(ns) || !is.null(sigma2))
	{
		if(any(is.null(means),is.null(ns),is.null(sigma2)))
		{
			stop("you must specify all three of means, ns, and sigma2")
		}
		if(any(!is.null(ncp),!is.null(df1), !is.null(df2)))
		{
			stop("specify either means, ns, and sigma2 or ncp, df1, and df2")
		}
		if(!all(is.numeric(means),is.numeric(ns),is.numeric(sigma2)))
		{
			stop("means, ns, and sigma2 must be numeric")
		}
		if(all(length(means) != length(ns),length(ns) != 1))
		{
			stop("ns must be of length 1 or same length as means")
		}
		if(sum(is.na(means)) + sum(is.na(ns)) + sum(is.na(sigma2)) > 0)
		{
			stop("missing values not allowed in means, ns, or sigma2")
		}
		if(any(sum(ns < 0) > 0 || sum(max(abs(ns-round(ns,0))) > 1e-7)))
		{
			stop("ns must be a vector of positive integers")
		}
		if(sigma2 <= 0 || length(sigma2) > 1)
		{
			stop("sigma2 must be a positive scalar")
		}
		if(length(ns) == 1)
		{
			ns <- rep(ns,length(means))
		}
		wtmean <- sum(ns*means)/sum(ns)
		ncp <- sum(ns*(means-wtmean)^2)/sigma2
		df1 <- length(means)-1
		df2 <- sum(ns) - length(ns)
	}
	else
	{
		if(any(is.null(ncp),is.null(df1),is.null(df2)))
		{
			stop("you must specify all three of ncp, df1, and df2")
		}
		if(any(!is.null(means),!is.null(ns), !is.null(sigma2)))
		{
			stop("specify either means, ns, and sigma2 or ncp, df1, and df2")
		}
		if(!all(is.numeric(ncp),is.numeric(df1),is.numeric(df2)))
		{
			stop("ncp, df1, and df2 must be numeric")
		}
		if(length(ncp) + length(df1) + length(df2) != 3)
		{
#			stop("ncp, df1, and df2 must be of length 1")
		}
		if(sum(is.na(ncp)) + sum(is.na(df1)) + sum(is.na(df2)) > 0)
		{
			stop("missing values not allowed in ncp, df1, or df2")
		}
		if(any(ncp <= 0, df1 <= 0, df2 <= 0))
		{
			stop("ncp, df1, and df2 must be positive")
		}
	}
	pf(qf(alpha,df1,df2,lower.tail=FALSE),df1,df2,ncp=ncp,lower.tail=FALSE)
}

#' Sample size for F tests
#'
#' Compute the sample size needed for an F test to achieve a given power,
#'	 with multiple possible definitions of noncentrality.
#'
#' @param reqpower The minimum power needed.
#' @param means  A vector of assumed treatment means.
#' @param alpha Type I error rate for test.
#' @param sigma2 The error variance.
#' @param ncp1 The noncentrality parameter when all sample sizes are 1.
#' @param ngrps The number of treatment means (number of groups in the num).
#' @param propvec An optional vector giving the relative sizes requested for different treatments.
#'
#' @author Gary W. Oehlert \email{gary@umn.edu}
#'
#' @return A list including the calculated sample sizes and the achieved power for the test.
#'
#' @details In addition to the requested power and type I error rate,
#'	you must specify either the means and the error
#'	variance \emph{or} the number of groups and \code{ncp1}
#'	(the noncentrality parameter when
#'	all sample sizes are equal to 1).
#'	
#'	When calling the function using means, you may also supply propvec,
#'	which should be a positive vector of the same length as the number of means.
#'	The function will compute sample sizes that are approximately proportional
#'	to the elements of the vector.
#'
#' @seealso \code{power.f.test}
#'
#' @examples
#'  sample.size.f.test(.8,means=1:5,sigma2=4.5)
#'  sample.size.f.test(.8,ncp1=sum(((1:5)-3)^2)/4.5,ngrps=5) # same thing
#'  # more samples in middle needs more total data
#'  sample.size.f.test(.8,means=1:5,sigma2=4.5,propvec=c(1,2,2,2,1))
#'  # more samples at ends needs fewer total data
#'  sample.size.f.test(.8,means=1:5,sigma2=4.5,propvec=c(2,1,1,1,2))
#'
#' @export
sample.size.f.test <- function(reqpower,alpha=.05,means=NULL,sigma2=NULL,ncp1=NULL,
	ngrps=NULL,propvec=NULL)
{
	if(any(!is.numeric(reqpower),length(reqpower)>1,is.na(reqpower),reqpower <= 0,reqpower >= 1))
	{
		stop("reqpower must be a scalar between 0 and 1")
	}
	if(any(!is.numeric(alpha),length(alpha)>1,is.na(alpha),alpha <= 0,alpha >= 1))
	{
		stop("alpha must be a scalar between 0 and 1")
	}
	if(!is.null(means) || !is.null(sigma2))
	{
		if(any(is.null(means),is.null(sigma2)))
		{
			stop("you must specify both of means and sigma2")
		}
		if(any(!is.null(ncp1),!is.null(ngrps)))
		{
			stop("specify either means and sigma2 or ncp1 and ngrps")
		}
		if(!all(is.numeric(means),is.numeric(sigma2)))
		{
			stop("means and sigma2 must be numeric")
		}
		if(any(length(means) == 1,length(sigma2) != 1))
		{
			stop("sigma2 must have length 1, and means must have length greater than 1")
		}
		if(sum(is.na(means)) + sum(is.na(sigma2)) > 0)
		{
			stop("missing values not allowed in means or sigma2")
		}
		if(sigma2 <= 0 || length(sigma2) > 1)
		{
			stop("sigma2 must be a positive scalar")
		}
		if(is.null(propvec))
		{
			propvec <- rep(1,length(means))
		}
		if(any(length(propvec) != length(means),!is.numeric(propvec),sum(is.na(propvec)) > 0,
			min(propvec) <= 0))
		{
			stop("propvec must be positive with the same length as means and no missing values")
		}
	}
	else
	{
		if(any(is.null(ncp1),is.null(ngrps)))
		{
			stop("you must specify both of ncp1 and ngrps")
		}
		if(any(!is.null(means),!is.null(propvec), !is.null(sigma2)))
		{
			stop("cannot use means, sigma2, or propvec with ncp1 and ngrps")
		}
		if(!all(is.numeric(ncp1),is.numeric(ngrps)))
		{
			stop("ncp1 and ngrps must be numeric")
		}
		if(length(ncp1) + length(ngrps) != 2)
		{
			stop("ncp1 and ngrps must have length 1")
		}
		if(sum(is.na(ncp1)) +  sum(is.na(ngrps)) > 0)
		{
			stop("missing values not allowed in ncp1 or ngrps")
		}
		if(any(ncp1 <= 0, ngrps <= 0, abs(ngrps-round(ngrps,0) > 1e-7)))
		{
			stop("ncp1 must be positive, and ngrps must be a positive integer")
		}
		propvec <- rep(1,ngrps)
	}

	df1 <- length(propvec)-1
	ngrps <- length(propvec)
	propvec <- propvec/sum(propvec)

	rightN <- ngrps
	rightnis <- round(rightN*propvec,0);rightnis[rightnis < 1] <- 1
	rightN <- sum(rightnis)
	rightpow <- 0
	iter <- 0
	while(rightpow < reqpower && iter < 30)
	{
		iter <- iter + 1

		leftpow <- rightpow
		leftN <- rightN
		leftnis <- rightnis

		rightN <- 2*rightN
		rightnis <- round(rightN*propvec,0);rightnis[rightnis < 1] <- 1
		rightN <- sum(rightnis)
		if(!is.null(ncp1))
		{
			ncp <- ncp1*rightnis[1]
		}
		else
		{
			wtmean <- sum(rightnis*means)/sum(rightnis)
			ncp <- sum(rightnis*(means-wtmean)^2)/sigma2
		}
		df2 <- sum(rightnis)-ngrps
		if(df2 > 0)
		{
			rightpow <- pf(qf(alpha,df1,df2,lower.tail=FALSE),
				df1,df2,ncp=ncp,lower.tail=FALSE)
		}
	}
	if(rightpow < reqpower)
	{
		warning("sample sizes truncated; required power not reached.")
		return(list(nis=rightnis,power=rightpow))
	}

	# now we have a bracket, time to bisect

	lasttryp <- 0
	while(sum((rightnis-leftnis)^2) > 0.5) {
		tryN <- (rightN + leftN)/2
		trynis <- round(tryN*propvec,0);trynis[trynis < 1] <- 1
		tryN <- sum(trynis)
		if(!is.null(ncp1))
		{
			ncp <- ncp1*trynis[1]
		}
		else
		{
			wtmean <- sum(trynis*means)/sum(trynis)
			ncp <- sum(trynis*(means-wtmean)^2)/sigma2
		}
		df2 <- sum(trynis)-ngrps
		if(df2 > 0)
		{
			trypow <- pf(qf(alpha,df1,df2,lower.tail=FALSE),
				df1,df2,ncp=ncp,lower.tail=FALSE)
		}
		if(trypow > reqpower) { # replace right side
			rightN <- tryN
			rightnis <- trynis
			rightpow <- trypow
		} else {
			leftN <- tryN
			leftnis <- trynis
			leftpow <- trypow
		}
		if(abs(lasttryp-trypow) < 1e-6) {
			break
		}
		lasttryp <- trypow
	}
	list(nis=rightnis,power=rightpow)
}

#' Sample size for confidence intervals
#'
#' Compute the per group sample size needed for a confidence interval for a linear combination
#'	of g group means to have coverage 1-alpha and be no wider than a determined width.
#'
#' @param width The maximum width (twice the margin of error) for the confidence interval.
#' @param sigma2  A the true error variance.
#' @param sumw2 The sum of squared linear coefficients.
#' @param g The number of groups.
#' @param alpha The error rate for the interval (1-alpha coverage).
#'
#' @author Gary W. Oehlert \email{gary@umn.edu}
#'
#' @return The minimum per group sample size to achieve the coverage and width.
#'
#' @details The sample variance is assumed to be a pooled MSE from a
#'	model with g groups and equal per group sample sizes.
#'
#' @seealso \code{sample.size.f.test} and \code{sample.size.bayes.interval}
#'
#' @examples
#'  # .02 margin of error, .25 error variance, pairwise comparison, 5 groups
#' sample.size.t.interval(.04,.25,2,5)
#'
#' @export
sample.size.t.interval <- function(width,sigma2,sumw2,g,alpha=.05) {
	n <- ceiling(4*qnorm(1-alpha/2)^2*sigma2*sumw2/width^2)
	while(n < 4*qt(1-alpha/2,g*(n-1))^2*sigma2*sumw2/width^2) {
		n <- n+1
	}
	n
}

