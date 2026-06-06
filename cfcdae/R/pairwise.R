#' Pairwise comparisons
#'
#' Compute all pairwise comparisons among levels of a factor
#'	in a linear model using various multiplicity corrections.
#'
#' @aliases pairwise
#'
#' @param lmodel A model object from \code{lm}, \code{lmer}, or \code{lme}.
#' @param term A term (variable name) in the linear model.
#' @param confidence The level of confidence for interval estimates of pairwise differences.
#' @param type The type of multiplicity correction to use.
#'
#' @return A list of class \code{pairwise} with named elements "ests",
#'      "sds", "signif", "title", and "groupings"; see details below.
#'
#' @author Gary W. Oehlert \email{gary@umn.edu}
#'
#' @details This function computes pairwise comparisons among
#'	the levels of a factor in a linear model.  \code{term} must be a
#'	factor in the the model \code{lmodel}. \code{type} can be one of
#'	"hsd" (Tukey's Honest Significant Different, using the Studentized range),
#'	"bsd" (Bonferroni Significant Difference, using a Bonferroni correction),
#'	"lsd" (Lease Significant Difference, which makes no correction for multiplicity),
#'	"regwr" (Ryan-Einot-Gabriel-Welsch test that controls the strong familywise error rate),
#'	or "snk" (Student-Neuman-Keuls step down test).
#'
#'	\code{pairwise} is an alternative to \code{\link[stats:pairwise.t.test]{stats::pairwise.t.test}}.
#'	or \code{\link[stats:TukeyHSD]{stats::TukeyHSD}}. The
#'	functions have different choices of methods for controlling multiplicity,
#'	and \code{pairwise} works on the output of a (possibly multiway factorial) linear
#'	model, whereas the others work directly on data and a
#'	grouping factor.
#'	
#'	The value is a list that is not generally used directly.  Instead, it is printed
#'	via the method \code{\link{print.pairwise}} or plotted via the method
#'	\code{\link{plot.pairwise}} or displayed via \code{\link{sidelines}}.
#'	The returned list has named elements "ests",
#'	"sds", "signif", "title", and "groupings".  The title is simply a character string used
#'	to label the printed output or the plot.  ests is a (symmetric) matrix containing the
#'	pairwise differences, and signif is a logical matrix with i,j element TRUE if the i,j
#'	pair of treatments is significantly different and FALSE otherwise. sds is a little
#'	more complicated. The upper triangle contains the nominal significant differences for
#'	comparing a pair of treatments.  The lower triangle is just the reflection of the
#'	upper triangle except when using a pure stepdown method (regwr or snk).  In this case,
#'	if an pair of treatments is declared to be not significantly different because an
#'	enclosing pair is not significantly different, then the lower triangle in that element
#'	will contain -sigd, where sigd is the significant difference for the enclosing pair
#'	that was not significantly different. Finally, groupings will be NULL if all differences are
#'	significant.  Otherwise, groupings is a logical matrix;
#'	the columns of groupings indicate maximal consecutive (by rank order) groupings of
#'	treatments that do not differ significantly from each other (TRUE meaning not
#'	significantly different).
#'
#' @seealso \code{\link{print.pairwise}}, \code{\link{sidelines}}, \code{\link{compare.to.best}},
#'  \code{\link{compare.to.control}},
#'	\code{\link{plot.pairwise}}, \code{\link[stats:pairwise.t.test]{stats::pairwise.t.test}},
#'	\code{\link[stats:TukeyHSD]{stats::TukeyHSD}}
#'
#' @examples
#' data(FruitFlyLifespan)
#' fit.flies <- lm(longevity~companions,data=FruitFlyLifespan)
#' # all pairwise differences, .01 error rate, control strong family-wise error rate
#' pairwise(fit.flies,companions,type="regwr",confidence=.99)
#' data(ZincRetention)
#' fit.zinc <- lm(retention~m.zinc*m.protein+d.zinc,data=ZincRetention)
#' # also works for one factor in a factorial
#' pairwise(fit.zinc,m.protein,type="hsd")
#'
#' @import stats
#' @export
pairwise <- function(lmodel,term,confidence=.95,type="hsd")
{
	if(!is.numeric(confidence) || length(confidence) != 1 ||
		confidence <= 0 || confidence >= 1)
	{
		stop("confidence must be a number between 0 and 1")
	}
	if(match(type,c("hsd","lsd","snk","regwr","bsd"),nomatch=-1) < 0)
	{
		stop("type must be one of hsd, lsd, snk, regwr, bsd")
	}
	term <- deparse(substitute(term))
	out <- linear.contrast(lmodel,termname=term,allpairs=TRUE,returnedf=TRUE)
	nctr <- nrow(out$estimates)
	termlevels <- round((1+sqrt(1+8*nctr))/2,0)
	ests <- c(0,-out$estimates[1:(termlevels-1),1])
	ests <- ests - mean(ests)
	labs <- paste(1:termlevels)
	names(ests) <- labs
	diffs <- sds <- matrix(0,ncol=termlevels,nrow=termlevels,
		dimnames=list(labs,labs))
	signif <- matrix(TRUE,ncol=termlevels,nrow=termlevels,
		dimnames=list(labs,labs))
	ord <- order(ests)
	rks <- rank(ests)

	critvalfuns <- list(
		hsd=function(degf,alpha,grps,stretch)
			{
				qtukey(1-alpha,grps,degf)/sqrt(2)
			},
		lsd=function(degf,alpha,grps,stretch)
			{
				qt(1-alpha/2,degf)
			},
		bsd=function(degf,alpha,grps,stretch)
			{
				ct <- grps*(grps-1)/2
				qt(1-alpha/2/ct,degf)
			},
		snk=function(degf,alpha,grps,stretch)
			{
				qtukey(1-alpha,stretch,degf)/sqrt(2)
			},
		regwr=function(degf,alpha,grps,stretch)
			{
				if(grps-stretch <= 1)
				{
					qtukey(1-alpha,stretch,degf)/sqrt(2)
				}
				else
				{
					qtukey(1-alpha*stretch/grps,stretch,degf)/sqrt(2)
				}
			}
	)
	critvalfun <- critvalfuns[[type]]
	purestepdown <- type == "snk" || type == "regwr"
        #dfs <- anova(lmodel)[["Df"]]
        #edf <- dfs[length(dfs)]
	edf <- out$edf

	k <- 0
	for(i in 1:(termlevels-1))
	{
		for(j in (i+1):termlevels)
		{
			k <- k + 1
			diff <- ests[i]-ests[j]
			se <- out$estimates[k,2]*critvalfun(edf,1-confidence,termlevels,abs(rks[i]-rks[j])+1)
			diffs[i,j] <- diffs[j,i] <- diff
			sds[i,j] <- sds[j,i] <- se
		}
	}

	# now do step down
	ests <- ests[ord]
	sds <- sds[ord,ord]
	signif <- signif[ord,ord]
	diffs <- diffs[ord,ord]
	for(i in 1:(termlevels-1))
	{
		for(j in termlevels:(i+1))
		{
			if(!signif[i,j])  next
			test <- abs(diffs[i,j]) >= sds[i,j]
			if(!test)
			{
				sds[j,i] <- sds[i,j]
				signif[i,j] <- signif[j,i] <- FALSE
			}
			if(!test && j-i>1 && purestepdown)
			{
				for(ii in i:(j-1))
				{
					for(jj in (i+1):j)
					{
						sds[jj,ii] <- -sds[i,j]
						signif[ii,jj] <- signif[jj,ii] <- FALSE
					}
				}
				sds[j,i] <- sds[i,j]
			}
		}
	}

	pairs <- (!signif)*1
	pairs[seq(1,termlevels^2,termlevels+1)] <- 1
	# the lines or letters to describe this correspond to maximal
	# square blocks along the diagonal that are entirely 1s
	checked <- matrix(FALSE,ncol=termlevels,nrow=termlevels)
	groupings <- NULL
	for(i in 1:(termlevels-1))
	{
		for(j in i:termlevels)
		{
			stretch <- j-i+1
			if(sum(pairs[i:j,i:j]) == stretch^2)
			{
				jmax <- j
				next
			}
			break
		}
		if(i == jmax)
		{
			next
		}
		thisgroup <- rep(FALSE,termlevels)
		thisgroup[i:jmax] <- TRUE
		if(is.null(groupings))
		{
			# first group found
			groupings <- matrix(thisgroup,ncol=1)
			next
		}
		# check for inclusion
		if(groupings[jmax,ncol(groupings)])
		{
			next
		}
		# add new group
		groupings <- cbind(groupings,thisgroup)
	}

	ests <- ests[rks]
	sds <- sds[rks,rks]
	signif <- signif[rks,rks]
	groupings <- groupings[rks,]
	title <- paste("Pairwise comparisons (",type,") of",term)
	names(title) <- ""
	result <- list(ests=ests,sds=sds,signif=signif,title=title,groupings=groupings,labels=levels(model.frame(lmodel)[,term]))
	attr(result,"class") <- "pairwise"
	result
}

#' Print pairwise comparisons
#'
#' Print a summary of all pairwise comparisons among levels of a factor
#'	in a linear model using various multiplicity corrections.
#'
#' @param x An object of class "pairwise".
#' @param ... Currently ignored.
#'
#' @details The print method presents a printed output for displaying the
#'	results of pairwise comparisons from the \code{pairwise} function.  For each comparison
#'	it lists the estimated difference, the significant difference, and a confidence interval.
#'	For pure stepdown methods (snk and regwr), confidence intervals for nonsignificant differences
#'	use the margin of error for any enclosing nonsignificant comparison.
#'	
#'	Significant differences are marked with a star.
#'
#' @return Nothing returned.
#'
#' @seealso \code{\link{pairwise}}, \code{\link{sidelines}},
#'	\code{\link{plot.pairwise}}, \code{\link[stats:pairwise.t.test]{stats::pairwise.t.test}},
#'	\code{\link[stats:TukeyHSD]{stats::TukeyHSD}}
#'
#' @method print pairwise
#'
#' @export
print.pairwise <- function(x,...)
{
	pairstr <- x
	if(!inherits(pairstr,"pairwise"))
	{
		stop("argument must have class 'pairwise'")
	}
	ests <- pairstr$ests
	sds <- pairstr$sds
	signif <- pairstr$signif
	levels <- nrow(signif)
	numprs <- levels*(levels-1)/2
	result <- matrix(0,nrow=numprs,ncol=4)
	rowlabs <- rep("",numprs)
	labels <- x$labels
	if(is.null(labels)) labels <- as.character(1:levels)
	k = 0
	for(i in 1:(levels-1))
	{
		for(j in (i+1):levels)
		{
			k <- k+1
			result[k,1] <- ests[i] - ests[j]
			result[k,2] <- abs(sds[j,i])
			result[k,3] <- result[k,1] - abs(sds[j,i])
			result[k,4] <- result[k,1] + abs(sds[j,i])
			if(signif[i,j])
			{
				rowlabs[k] <- paste("*",labels[i],"-",labels[j])
			}
			else
			{
				rowlabs[k] <- paste(" ",labels[i],"-",labels[j])
			}
		}
	}
	dimnames(result) <- list(rowlabs,c("estimate","signif diff","lower","upper"))
	print(pairstr$title,quote=FALSE)
	print(result)
}

