#' Linear contrasts for linear models
#'
#' Do inference for linear contrasts of factor treatment coefficients in linear models.
#'
#' @aliases linear.contrast
#'
#' @param lmodel A model object from \code{lm}, \code{lmer}, \code{lme}, or \code{bglmm}.
#' @param term A term (variable name) in the linear model.
#' @param contr.coefs A real vector or matrix contrast coefficients, 
#'	each column summing to zero, with one row for each level of the factor \code{term}.
#' @param confidence The level of confidence for interval estimates of contrasts.
#' @param joint Logical flag for whether to compute an overall assessment for the
#'	situation where all of the contrasts are zero. This is an F-test in the non-Bayesian
#'	case and a (exact, not approximate) Bayes factor for objects of class \code{bglmm}
#'	(from \code{bcfcdae::bglmm()}).
#' @param byvar If we have a single contrast in one variable, we may optionally evaluate 
#'	it at each level of a second variable, called the by variable.
#' @param contr.labels An optional character vector of labels for the contrasts.
#' @param allpairs A logical flag indicating whether to make all pairwise comparisons.
#' @param controlpairs The number of the control treatment if pairwise comparisons with 
#'	the control are desired.
#' @param termname A character variable giving the name of the treatment factor;
#'	an alternative spacification to \code{term}.
#' @param bonferroni A logical flag indicating whether confidence intervals and p-values should
#'	        be adjusted with a Bonferroni correction; not applicable for an object of class \code{bglmm}.
#' @param scheffe A logical flag indicating whether confidence intervals and p-values should
#'	be adjusted with a Scheffe correction; not applicable for an object of class \code{bglmm}.
#' @param returnedf A logical flag indicating whether to return the error degrees of freedom;
#'	not applicable for an object of class \code{bglmm}.
#' @param exactBF A logical flag for whether to use an approximate Bayes factor,
#'	which is fast, or an exact Bayes factor, which is slow. Applicable only for
#'	an object of class \code{bglmm} (from \code{bcfcdae::bglmm()}).
#' @param ... Other parameters passed to \code{bcfcdae::bglmm()}.
#'
#' @return If \code{lmodel} is of class \code{bglmm} (from \code{bcfcdae::bglmm()}), the value is a
#'	matrix with one row for each contrast and columns for posterior estimate,
#'	posterior standard deviation, lower and upper endpoints for a posterior
#'	interval, and (approximate) Bayes factor for the full model relative to the model
#'	with the contrast
#'	constrained to be zero.
#'	Otherwise, the value is a matrix with one
#'	row for each contrast and columns for estimate, standard error,
#'	t-value (null hypothesis of zero), p-value, and lower and upper
#'	confidence limits. When \code{joint} is true, the value is a list
#'	with components for the basic output as well as the overall Bayes
#'	factor (for \code{bglmm} objects) or F
#'	and optionally its error degrees of freedom.
#'
#' @details This function is used for computing linear contrasts in the
#'	levels of a factor. The confidence level for the intervals can be set via the
#'	the \code{confidence} argument. This also applies in the Bayesian context.
#'
#'	A single contrast is computed when \code{contr.coefs} is a vector
#'	summing to zero with one element for each level of the contrast
#'	variable \code{term}.  Multiple contrasts in \code{term} are
#'	represented by a matrix with one row for each level of \code{term},
#'	and each column summing to zero.
#'
#'	Either \code{allpairs} or \code{controlpairs} can be used in place of
#'	specifying contrast coefficients.  In the first case, all pairwise
#'	comparisons will be computed.  In the second case, if controlpairs is
#'	the number of a treatment, you will get the pairwise differences
#'	of the other treatments with this treatment.
#'
#'	A by variable allows you compute a contrast in \code{variable} separately
#'	for each level of \code{byvar}.  If you use a by variable,
#'	that variable and its interaction with the contrast variable must
#'	be explicit terms in the model. Also, by variables only work with single contrasts.
#'	For \code{bglmm} objects, no Bayes factors are reported when you use a by
#'	variable.
#'
#'	By default, contrasts are simply labeled by number. You may set
#'	your own labels with the \code{contr.labels} argument, which should
#'	be a character vector with one element for each contrast.
#'
#'	In a non-Bayesian setting, it is possible to compute a joint F-test of the null hypothesis that
#'	all of the contrasts are zero.  The numerator degrees of freedom
#'	for this test will be at most the number of contrasts you compute but
#'	can be less if the contrasts are not linearly independent.
#'
#'	In a non-Bayesian setting, you may specify either Bonferroni
#'	or Scheffe corrections for multiple comparisons. The Bonferroni
#'	correction will adjust for the number of contrasts in this function
#'	call, whereas the Scheffe correction will adjust for all possible
#'	contrasts, including contrasts suggested by the data.
#'	
#'	Getting estimated error degrees of freedom 
#'	for the output of \code{lmer()} is done with the Kenward and Roger method.
#'
#'	The approximate Bayes factor for objects of class \code{bglmm} employs a BIC-style approximation. It should
#'	be more accurate as the sample size increases. Beyond using BIC instead of
#'	the Bayes factor, it also employs a normal approximation to the likelihood
#'	rather than maximizing a constrained likelihood.
#'	
#'	\emph{Note:} \code{linear.contrast} should not be confused with the
#'	\code{contrast} option in R. The latter establishes the basis or
#'	parameterization for a factor, which might, or might not, be a
#'	contrast in the sense that \code{linear.contrast} uses the term.
#'
#' @author Gary W. Oehlert \email{gary@umn.edu}
#'
#' @examples
#' data(ConcreteFaulting)
#' # fit a linear model
#' fit <- lm(faulting~dowels*base*subgrade*wcratio,data=ConcreteFaulting)
#' # compare first two levels of base
#' linear.contrast(fit,base,c(1,-1,0)) 
#' # compare first two levels of base separately by levels of subgrade; overall test
#' linear.contrast(fit,base,c(1,-1,0),byvar="subgrade",joint=TRUE)
#' # all pairwise comparisons of base; HSD default
#' linear.contrast(fit,base,allpairs=TRUE)
#' # all pairwise comparisons of base with custom labels
#' linear.contrast(fit,base,allpairs=TRUE,contr.labels=c("1 vs 2","1 vs 3","2 vs 3"))
#' # all pairwise comparisons of base using Bonferroni
#' linear.contrast(fit,base,allpairs=TRUE,bonferroni=TRUE)
#' @import stats
#' @import utils
#' @export
linear.contrast <- function(lmodel,term,contr.coefs,confidence=.95,
	joint=FALSE,byvar=NULL,contr.labels=NULL,allpairs=FALSE,
	controlpairs=0,termname=NULL,bonferroni=FALSE,scheffe=FALSE,
	returnedf=FALSE,exactBF=FALSE,...)
{
	thisclass <- class(lmodel)
	if(!(class(lmodel) %in% c("lme","lm","lmerMod","merModLmerTest","bglmm")))
		stop("lmodel must be fitted object from lm or lme or lmer or bglmm")
	
	UseMethod("linear.contrast")
}

linear.contrast.common <- function(lmodel,term,contr.coefs,confidence,
	joint,byvar,contr.labels,allpairs,
	controlpairs,termname,bonferroni,scheffe,
	returnedf,exactBF,termlevels,byvarlevels,byvarno)
{
	# check on confidence level
	if(!is.numeric(confidence) || length(confidence) > 1 ||
		confidence <= 0 || confidence >= 1)
	{
		stop("confidence must be between 0 and 1")
	}

	# do we have a standard set of contrasts?
	if(!is.logical(allpairs))
	{
		stop("allpairs must be TRUE or FALSE")
	}
	allpairs <- allpairs[1]
	if(!is.numeric(controlpairs) || abs(controlpairs[1] - round(controlpairs[1],0)) > 1e-7 )
	{
		stop("controlpairs must be a nonnegative integer")
	}
	controlpairs <- controlpairs[1]
	if(controlpairs > termlevels)
	{
		stop(paste("control level number is larger than number of levels in",termname))
	}
	if(controlpairs < 0) {
		stop("controlpairs must be a nonnegative integer")
	}

	if(allpairs && controlpairs)
	{
		stop("only one of allpairs or controlpairs can be used")
	}
	if(allpairs)
	{
		contr.coefs <- matrix(0,nrow=termlevels,ncol=termlevels*(termlevels-1)/2)
		k <- 0
		for(i in 1:(termlevels-1))
		{
			for(j in (i+1):termlevels)
			{
				k <- k+1
				contr.coefs[i,k] <- 1
				contr.coefs[j,k] <- -1
			}
		}
	}
	if(controlpairs > 0)
	{
		contr.coefs <- matrix(0,nrow=termlevels,ncol=termlevels)
		for(i in 1:(termlevels))
		{
			if(i == controlpairs) next
			contr.coefs[i,i] <- 1
			contr.coefs[controlpairs,i] <- -1
		}
		contr.coefs <- contr.coefs[,-controlpairs]
	}

	labels=levels(model.frame(lmodel)[,termname])
	if(!is.null(contr.labels) && is.character(contr.labels) &&
	length(contr.labels) == ncol(contr.coefs))
	{
		rowlabs <- contr.labels
	}
	else if(allpairs)
	{
		rowlabs <- NULL
		for(i in 1:(termlevels-1))
		{
			for(j in (i+1):termlevels)
			{
				rowlabs <- c(rowlabs,paste(labels[i],"-",labels[j]))
			}
		}
	}
	else if(controlpairs > 0)
	{
		rowlabs <- paste(labels[1:termlevels],"-",labels[controlpairs])
		rowlabs <- rowlabs[-controlpairs]
	}
	else
	{
		rowlabs <- paste(1:(ncol(as.matrix(contr.coefs))*byvarlevels))
	}
	
	# make sure contrasts are numeric and sum to zero as needed
	if(!is.numeric(contr.coefs) && sum(is.na(contr.coefs)) > 0)
	{
		stop("coefficients in contrast must be numeric with no missing values")
	}
	if(!is.vector(contr.coefs) && !is.matrix(contr.coefs))
	{
		stop("coefficients must be a vector or a matrix")
	}
	contr.coefs <- as.matrix(contr.coefs)
	tests <- apply(contr.coefs,2,sum)/apply(abs(contr.coefs),2,sum)
	if(max(abs(tests)) > 1e-7)
	{
		stop("each column of coefficients in contrast must add to zero")
	}
	
	# cannot use byvar with multiple contrasts
	if(byvarno > 0 && ncol(contr.coefs) > 1)
	{
		stop("cannot use a by variable with multiple contrasts")
	}

	# right number of contrast coefficients?
	if(termlevels != nrow(contr.coefs))
	{
		stop("number of contrast coefficients does not match number of levels in factor")
	}
	
	assign("rowlabs",rowlabs,envir=parent.frame())
	assign("contr.coefs",contr.coefs,envir=parent.frame())
}

#' @rdname linear.contrast
#' @method linear.contrast default
#' @export
linear.contrast.default <- function(lmodel,term,contr.coefs,confidence=.95,
	joint=FALSE,byvar=NULL,contr.labels=NULL,allpairs=FALSE,
	controlpairs=0,termname=NULL,bonferroni=FALSE,scheffe=FALSE,
	returnedf=FALSE,exactBF=FALSE,...)
{
	# We require that all factors use the contr.sum parameterization.
	# In the case of a by variable, we require that both the by
	# variable and its interaction with our variable of interest be
	# explicitly in the model, ie, we need both main effects and the
	# interaction present;  we also require an explicit intercept.
	# finally, we require the Scheffe parameterization using contr.sum
	# None of these is required mathematically, but we require
	# them here to make the programming simpler.
	

	# make sure we have a linear model
	thisclass <- class(lmodel)
	if("lme" %in% thisclass)
	{
		useclass <- "lme"
	} else if("lmerMod" %in% thisclass || "merModLmerTest" %in% thisclass)
	{
		useclass <- "lmerMod"
	} else if("glm" %in% thisclass)
	{
		useclass <- "glm"
	} else if("lm" %in% thisclass)
	{
		useclass <- "lm"
	}	else
	{
		stop("lmodel must be fitted object from lm or lme or lmer or bglmm")
	}
	
	# make sure term is present in model and is a factor
	if(!is.null(termname))
	{
		if(!is.character(termname))
		{
			stop("termname must be a character variable")
		}
	}
	else
	{
		termname <- deparse(substitute(term))
	}

	byvarname <- as.character(substitute(byvar))
	byvar <- eval(substitute(byvar),model.frame(lmodel))
	byvarno <- -1
	byvarlevels <- 1

	
	# check on joint
	if(!is.logical(joint) || length(joint) > 1)
	{
		stop("joint must be a logical scalar")
	}
	
	

	#modelstuff <- cfcdae:::extract.model.bits(lmodel)
	modelstuff <- extract.model.bits(lmodel)

	if(!modelstuff$has.intercept || !modelstuff$all.contr.sum)
	{
		contr.list <- list()
		for(i in 1:length(modelstuff$all.var.classes)) {
			if(modelstuff$all.var.classes[i] == "factor") {
				contr.list[modelstuff$all.var.names[i]] <- "contr.sum"
			}
		}
		lmodel <- update(lmodel,~.+1,contrasts=contr.list)
		modelstuff <- extract.model.bits(lmodel)
	}
	# check for intercept
	if(!modelstuff$has.intercept)
	{
		stop("model must include an intercept")
	}

	# check for Scheffe style parameterization
	modmat <- model.matrix(lmodel)
	if(!modelstuff$all.contr.sum)
	{
		stop("linear.contrast requires all R-contrasts (parameterizations) to be contr.sum,\ntry options(contrasts=c('contr.sum','contr.poly'))")
	}


	modterms <- terms(lmodel) # this only gets fixed effects in lme

	var.classes <- modelstuff$all.var.classes
	term.labels <- modelstuff$all.term.labels
	# at present we only do main effects contrasts
	varno <-match(termname,modelstuff$all.var.names,nomatch=-1)
	if(varno < 0 || var.classes[varno] != "factor")
	{
		stop(paste(termname,"is not a factor in the model"))
	}
	termno <-match(termname,term.labels,nomatch=-1)
	if(termno < 0)
	{
		stop(paste(termname,"is not an explicit term in the model"))
	}

	# if byvar is present, make sure it's a factor and in model

	if(!is.null(byvar))
	{
		byvarno <-match(byvarname,modelstuff$all.var.names,nomatch=-1)
		# can only "by" on a single factor
		if(byvarno < 0 || var.classes[byvarno] != "factor")
		{
			stop(paste(byvarname,"is not a factor in the model"))
		}
	}

	# if byvar is present, make sure that the interaction of term and
	# byvar is in the model
	bytermno <- -1
	byinttermno <- -1
	if(byvarno > 0)
	{

		bytermno <- match(byvarname,term.labels,nomatch=-1)
		byint1lab <- paste(termname,byvarname,sep=":")
		byint2lab <- paste(byvarname,termname,sep=":")
		byint1 <- match(byint1lab,term.labels,nomatch=-1)
		byint2 <- match(byint2lab,term.labels,nomatch=-1)
		byinttermno <- max(byint1,byint2)
		if(min(bytermno,byinttermno) < 0)
		{
			mess <- paste(byvarname,"and",byint1lab,"must be explicit terms in model")
			stop(mess)
		}
		termbeforeby <- TRUE
		if(byint1 < 0)
		{
			termbeforeby <- FALSE
		}
	}

	# extract levels of term and byvar
	termlevels <- modelstuff$all.var.levels[termname]
	if(bytermno > 0)
	{
		byvarlevels <- modelstuff$all.var.levels[byvarname]
	}

	
	rowlabs <- "" # this will be reset in the next call, but it avoids a NOTE in CHECK
	linear.contrast.common(lmodel,term,contr.coefs,confidence,
	joint,byvar,contr.labels,allpairs,
	controlpairs,termname,bonferroni,scheffe,
	returnedf,exactBF,termlevels,byvarlevels,byvarno)


	if(bytermno > 0)
	{
		contr.coefs <- matrix(rep(contr.coefs,byvarlevels),ncol=byvarlevels)
	}

	# set up linear combination of complete model coefficients
	full.contr.coefs <- matrix(0,nrow=length(modelstuff$fixed.term.assignments),ncol=ncol(contr.coefs))
	whichcfs <- modelstuff$fixed.term.assignments == termno

	# we aren't actually allowing the first two cases below, because the requirement
	# of an intercept knocks out the first, and contr.sum knocks out the second.
	# But someday we might.

	if(sum(whichcfs) == termlevels)
	{
		term.contr <- "dummy"
		full.contr.coefs[whichcfs,] <- contr.coefs
	}
	# remaining cases should have one fewer coefficient
	else if(attr(modmat,"contrasts")[[termname]] == "contr.treatment")
	{
		term.contr <- "contr.treatment"
		full.contr.coefs[whichcfs,] <- contr.coefs[-1,]
	}
	else if(attr(modmat,"contrasts")[[termname]] == "contr.sum")
	{
		term.contr <- "contr.sum"
		#contr.coefs.red <- t( t(contr.coefs[-termlevels,]) -contr.coefs[termlevels,])
		# I'd really like to do the above line, but R will turn a single row
		# into a column vector.
		tmp <- matrix(contr.coefs[-termlevels,],ncol=ncol(contr.coefs))
		contr.coefs.red <- t( t(tmp) -contr.coefs[termlevels,])
		full.contr.coefs[whichcfs,] <- contr.coefs.red
	}
	else
	{
		stop("factors in linear model must be parameterized as 'treatment' or 'sum'")
	}
	# now add additional stuff to handle byvar, if present
	if(bytermno > 0)
	{
		bymat <- cbind(diag(rep(1,byvarlevels-1)),-1)
		if(termbeforeby)
		{
			bymat <- kronecker(bymat,contr.coefs.red[,1])
		}
		else
		{
			bymat <- kronecker(contr.coefs.red[,1],bymat)
		}
		whichbycfs <- attr(modmat,"assign") == byinttermno
		full.contr.coefs[whichbycfs,] <- bymat
	}
	# OK, now we can figure out if the contrast is actually estimable
	# contrast coefficients must lie entirely in the row space of the model matrix
	tmp <- qr(t(model.matrix(lmodel)))
	resid <- qr.resid(tmp,full.contr.coefs)
	nonestimable <- apply(abs(resid),2,sum) > 1e-7

	if(sum(nonestimable) == length(nonestimable))
	{
		stop("contrast(s) are not estimable")
	}
	if(sum(nonestimable) > 0)
	{
		warning("some contrasts not estimable")
	}

	# the things that are estimable are not going to depend on anything
	# that was pivoted out of the model, so we can strip the NAs in results

	cfs <- modelstuff$betahats
	use <- !is.na(cfs)
	cfs <- cfs[use]
	# cov.mat already removes rows/cols corresponding to NA coefs,
	# so no need to modify it
	full.contr.coefs <- full.contr.coefs[use,]


	cov.mat <- vcov(lmodel)
	result.est <- t(full.contr.coefs) %*% cfs
	result.var <- as.matrix(t(full.contr.coefs) %*% cov.mat %*% full.contr.coefs)
	result.se <- sqrt(diag(result.var))

	edf <- 100 # need something if you use lmer and not KR
	if(useclass == "lm")
	{
		dfs <- anova(lmodel)[["Df"]]
		edf <- dfs[length(dfs)]
	}
	if(useclass == "glm")
	{
		edf <- tail(anova(lmodel)$"Resid. Df",1)
	}
	if(useclass == "lme")
	{
		dfs <- anova(lmodel)[["denDF"]]
		edf <- dfs[termno]
		if(modelstuff$has.intercept)
			edf <- dfs[termno+1]
	}
	if(useclass == "lmerMod")
	{
		# variance and approx df via Kenward and Rogers
		# my implementation
		# outKR <- KR.lmer(lmodel,full.contr.coefs)
		# result.var <- outKR$LVaradj
		# edf <- outKR$mstar
		# result.se <- sqrt(diag(result.var))
		# now use pbkrtest package

		tmp <- pbkrtest::KRmodcomp(lmodel,t(full.contr.coefs))

		edf <- tmp$stats$ddf
		result.var <- t(full.contr.coefs) %*% as.matrix(pbkrtest::vcovAdj(lmodel)) %*% full.contr.coefs

		result.se <- sqrt(diag(result.var))
	}

	mult <- qt(1-(1-confidence)/2,edf)
	if(!is.logical(bonferroni))
	{
		stop("bonferroni must be TRUE or FALSE")
	}
	bonferroni <- bonferroni[1]
	if(!is.logical(scheffe))
	{
		stop("scheffe must be TRUE or FALSE")
	}
	scheffe <- scheffe[1]
	if(bonferroni && scheffe)
	{
		stop("only one of bonferroni and scheffe can be TRUE")
	}
	
	tvals <- result.est/result.se
	pvals <- 2*pt(-abs(tvals),edf)
	if(bonferroni)
	{
		mult <- qt(1-(1-confidence)/2/length(result.est),edf)
		pvals <- pvals * length(result.est)
	}
	if(scheffe)
	{
		mult <- sqrt((termlevels-1)*qf(confidence,termlevels-1,edf))
		pvals <- pf(tvals^2/(termlevels-1),termlevels-1, edf,lower.tail=FALSE)
	}
	lower <- result.est-mult*result.se
	upper <- result.est+mult*result.se
	
	results.all <- cbind(result.est,result.se,tvals,pvals,lower,upper)

	dimnames(results.all) <- list(rowlabs,c("estimates","se","t-value",
		"p-value","lower-ci","upper-ci"))
	results.all[nonestimable,] <- NA
	result.est[nonestimable] <- NA
	result.se[nonestimable] <- NA
	#list(result.est,result.se)
	out <- results.all
	if(returnedf) {
		out <- list(estimates=results.all,edf=edf)
	}
	if(joint)
	{
		egn <- eigen(result.var)
		ndf <- sum(egn$values > 1e-7)
		tmp <- t(result.est)%*%egn$vectors[,1:ndf]
		ctr <- diag(1/egn$values[1:ndf],ndf,ndf)
		fstat <- tmp %*% ctr %*% t(tmp) / ndf
		fpval <- pf(fstat,ndf,edf,lower.tail=FALSE)
		fout <- matrix(c(fstat,ndf,edf,fpval),nrow=1)
		dimnames(fout) <- list("",c("F","df1","df2","p-value"))
		if(returnedf) {
			out <- list(estimates=results.all,Ftest=fout,edf=edf)
		} else {
			out <- list(estimates=results.all,Ftest=fout)
		}
	}
	
	attr(out,"class") <- "linear.contrast"
	return(out)
}


