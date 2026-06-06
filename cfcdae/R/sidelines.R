
#' Display pairwise comparisons
#'
#' Display an "underline"  summary of all pairwise comparisons among levels of a factor.
#'
#' @param x An object of class "pairwise".
#' @param ... Currently ignored.
#'
#' @details The sidelines method presents an "underline" diagram for displaying the
#'	results of pairwise comparisons from the \code{pairwise} function. Any two
#'	treatments that are covered by a single line are not significantly different.
#'	
#'	This implementation arranges the output vertically, so the "underlines" are actually
#'	running vertically along the side, hence sidelines.
#'
#' @return Nothing returned.
#'
#' @seealso \code{\link{pairwise}}, \code{\link{print.pairwise}},
#'	\code{\link{plot.pairwise}}, \code{\link[stats:pairwise.t.test]{stats::pairwise.t.test}},
#'	\code{\link[stats:TukeyHSD]{stats::TukeyHSD}}
#'
#' @examples
#' data(FruitFlyLifespan)
#' fit.flies <- lm(longevity~companions,data=FruitFlyLifespan)
#' pairwise.flies <- pairwise(fit.flies,companions,type="hsd",confidence=.99)
#' sidelines(pairwise.flies)
#' data(ZincRetention)
#' fit.zinc <- lm(retention~m.zinc*m.protein+d.zinc,data=ZincRetention)
#' # also works for one factor in a factorial
#' pairwise.zinc <- pairwise(fit.zinc,m.protein,type="hsd")
#' sidelines(pairwise.zinc)
#'
#' @export
sidelines <- function(x,...)
{
	pairstr <- x
	if(!inherits(pairstr,"pairwise"))
	{
		stop("argument must have class 'pairwise'")
	}
	ests <- pairstr$ests
	cests <- format(ests,digits=3)
	termlevels <- length(ests)
	groupings <- pairstr$groupings
	if(is.null(groupings))
	{
		blanks <- rep(" ",termlevels)
	}
	else
	{
		blanks <- rep(" ",length(groupings))
		blanks[c(groupings)] <- "|"
		blanks <- matrix(blanks,nrow=termlevels)
	}
	cout <- cbind(cests,blanks)
	ord <- order(ests)
	cout <- cout[ord,]
	if(is.null(x$labels)) {
		dimnames(cout) <- list(paste(1:termlevels)[ord],rep("",ncol(cout)))
	} else {
		dimnames(cout) <- list(x$labels[ord],rep("",ncol(cout)))
	}
	print(cout,quote=FALSE)
}
