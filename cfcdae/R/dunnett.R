#' Quantiles of the Dunnett distribtion.
#'
#' @aliases dunnett qdunnett
#'
#' @param ngroups Number of groups (including control) for making comparisons to control.
#' @param errordf Error degrees of freedom when computing significance levels.
#' @param  alpha Percent point for the Dunnett critical value.
#' @param  twosided Logical flag indicating whether the Dunnett distribution should
#	be onesided (the default) or twosided.
#'
#' @return A list with the requested quantile of the Dunnett distribution (multivariate t)
#'  and the difference between the obtained probability and the requested probability.
#'
#' @examples
#' qdunnett(5,20,alpha=.01,twosided=TRUE)
#' @export
#' @importFrom mvtnorm qmvt

qdunnett <- function(ngroups,errordf,alpha=.025,twosided=FALSE)
{
# this is based on critVal in package MCPMod
# it calls qmvt from package mvtnorm

	if(!is.numeric(ngroups) || length(ngroups) > 1 || abs(ngroups-round(ngroups,0)) > 1e-7
		|| ngroups < 2)
	{
		stop("ngroups must be a positive integer greater than 1")
	}
	if(!is.numeric(errordf) || length(errordf) > 1 || abs(errordf-round(errordf,0)) > 1e-7
		|| errordf < 2)
	{
		stop("errordf must be a positive integer greater than 1")
	}
	if(!is.numeric(alpha) || length(alpha) > 1 || alpha <=0
		|| alpha >= 1)
	{
		stop("alpha must be between 0 and 1")
	}
	if(!is.logical(twosided))
	{
		stop("twosided must be a logical variable")
	}
	twosided <- twosided[1]

	contr.coefs <- matrix(0,ncol=ngroups-1,nrow=ngroups)
	for(i in 2:ngroups)
	{
		contr.coefs[1,i-1] <- -1
		contr.coefs[i,i-1] <- 1
	}
	vmat <- t(contr.coefs)%*%contr.coefs
	cormat <- vmat/2
	if(twosided)
	{
		tails <- "both.tails"
	}
	else
	{
		tails <- "lower.tail"
	}
	mvtnorm::qmvt(1-alpha,tail=tails,df=errordf,corr=cormat)
}

#' Multiple comparisons with control. 
#'
#' Multiple comparisons of levels of a factor to a control level, with
#'	error controlled via the Dunnett distribution.
#'
#' @aliases compare.to.control
#'
#' @param lmodel A model object from \code{lm}, \code{lmer}, or \code{lme}.
#' @param term A term (variable name) in the linear model.
#' @param confidence The level of confidence for interval estimates of differences with control.
#' @param control.level The level of the factor that represents the control.
#'
#' @return A matrix with columns giving the estimated 
#'	difference in mean response between each non-control level of the factor and the
#'	control level, and the lower and upper confidence limits for those differences.
#'
#' @details \code{compare.to.control} computes two-sided confidence intervals
#'	for the difference in mean between every non-control level of the factor
#'	and the control level of the factor.  These intervals are simultaneous with
#'	coverage rate given by the selected confidence parameter.  Significant differences
#'	are marked with a star.
#'	
#'	For linear mixed models, error df are estimated with the Kenward and Roger method.
#'
#' @author Gary W. Oehlert \email{gary@umn.edu}
#'
#' @seealso \code{\link{pairwise}}, \code{\link{compare.to.best}},
#'	\code{\link[stats:pairwise.t.test]{stats::pairwise.t.test}},
#'	\code{\link[stats:TukeyHSD]{stats::TukeyHSD}}
#'
#' @examples
#' data(FruitFlyLifespan)
#' fit.flies <- lm(longevity~companions,data=FruitFlyLifespan)
#' compare.to.control(fit.flies,companions,5) # group 5 is no companions
#'
#' @export
compare.to.control <- function(lmodel,term,control.level,confidence=.95)
{
	term <- deparse(substitute(term))
	out2 <- linear.contrast(lmodel,termname=term,controlpairs=control.level,returnedf=TRUE)
	out <- out2$estimates
	termlevels <- nrow(out)+1
	signif <- logical(nrow(out))
	ord <- order(out[,1])

        #dfs <- anova(lmodel)[["Df"]]
        #edf <- dfs[length(dfs)]
	edf <- out2$edf

	qmult <- qdunnett(termlevels,edf,1-confidence,twosided=TRUE)$quantile
	sds <- out[,2]*qmult
	signif <- abs(out[,1]) > sds

	ests <- out[ord,1]
	sds <- sds[ord]
	signif <- signif[ord]
	result <- cbind(ests,ests-sds,ests+sds)
	labs <- names(ests)
	siglab <- rep(" ",termlevels-1)
	siglab[signif] <- "*"
	rlabs <- paste(siglab,labs)
	clabs <- c("difference","lower","upper")
	dimnames(result)<-list(rlabs,clabs)
	result
}


#' Multiple comparisons with best. 
#'
#' Multiple comparisons of levels of a factor to the "best" level, which could
#'	be either the highest or lowest response, with
#'	error controlled via the Dunnett distribution.
#'
#' @aliases compare.to.best
#'
#' @param lmodel A model object from \code{lm}, \code{lmer}, or \code{lme}.
#' @param term A term (variable name) in the linear model.
#' @param confidence The level of confidence for interval estimates of differences with control.
#' @param lowisbest A logical determining whether the highest or lowest response is best.
#'
#' @return A matrix with columns giving the estimated 
#'	difference in mean response between each non-control level of the factor and the
#'	best level, and the confidence limits for those differences.
#'
#' @details \code{compare.to.best} computes one-sided confidence intervals for the difference
#'	in mean between the best treatment and every other treatment. The output includes the 
#'	differences and the one-sided allowance. Significant differences are marked with a star.
#'	The true best treatment is in the unstarred group with the selected confidence rate.
#'	By default, the best is considered to be a maximum response.  That can be
#'	changed via \code{lowisbest}.
#'	
#'	For linear mixed models, error df are estimated with the Kenward and Roger method.
#'
#' @author Gary W. Oehlert \email{gary@umn.edu}
#'
#' @seealso \code{\link{pairwise}}, \code{\link{compare.to.control}},
#'	\code{\link[stats:pairwise.t.test]{stats::pairwise.t.test}},
#'	\code{\link[stats:TukeyHSD]{stats::TukeyHSD}}
#'
#' @examples
#' data(WeedControl)
#' # transform response for variance stability
#' weeds.separate <- lm(sqrt(100-pct.control)~treatment,data=WeedControl)
#' compare.to.best(weeds.separate,treatment,conf=.99,lowisbest=TRUE)
#'
#' @export
compare.to.best <- function(lmodel,term,confidence=.95,lowisbest=FALSE)
{
	term <- deparse(substitute(term))
	out2 <- linear.contrast(lmodel,termname=term,controlpairs=1,returnedf=TRUE)
	out <- out2$estimates
	ests <- c(0,out[,1])
	termlevels <- nrow(out)+1
	if(lowisbest)
	{
		maxindex <- order(ests)[1]
	}
	else
	{
		maxindex <- order(ests)[termlevels]
	}
	out <- linear.contrast(lmodel,termname=term,controlpairs=maxindex)
	signif <- logical(nrow(out))

        #dfs <- anova(lmodel)[["Df"]]
        #edf <- dfs[length(dfs)]
	edf <- out2$edf

	qmult <- qdunnett(termlevels,edf,1-confidence)$quantile
	sds <- out[,2]*qmult
	signif <- abs(out[,1]) > sds

	ord <- order(out[,1],decreasing=TRUE)
	#if(lowisbest)
	#{
	#	ord <- order(out[,1])
	#}
	ests <- out[ord,1]
	sds <- sds[ord]
	signif <- signif[ord]
	if(lowisbest)
	{
		result <- cbind(ests,sds)
	}
	else
	{
		result <- cbind(ests,-sds)
	}
	if(lowisbest)
	{
		result <- rbind(result,c(0,NA))
	}
	else
	{
		result <- rbind(c(0,NA),result)
	}
	labs <- names(ests)
	bestlab <- levels(model.frame(lmodel)[,term])[maxindex]
	siglab <- rep(" ",termlevels-1)
	siglab[signif] <- "*"
	if(lowisbest)
	{
		rlabs <- c(paste(siglab,labs),paste("best is",bestlab))
	}
	else
	{
		rlabs <- c(paste("best is",bestlab),paste(siglab,labs))
	}
	clabs <- c("difference","allowance")
	dimnames(result)<-list(rlabs,clabs)
	result
}

