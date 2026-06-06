#' Plot pairwise comparisons
#'      
#' Plot a summary of all pairwise comparisons among levels of a factor.
#'      
#' @param x An object of class "pairwise".
#' @param title The title for the plot.
#' @param ... Currently ignored.
#'
#' @details The plot method makes a plot displaying the
#'	results of pairwise comparisons from the \code{pairwise} function.  Each comparison
#'	is shown as a line segment from the (i,j) means to the (j,i) means.  Significant differences
#'	are shown in red; nonsignificant differences are plotted in black.  For a significant difference,
#'	the cutoff for significance is plotted as a gray point on the red line.  Nonsignificant
#'	differences are bounded in a gray square going out to the required cutoff.
#'	For pure stepdown procedures (snk and regwr), the gray square for a comparison is not
#'	plotted if it is enclosed in a broader nonsignificant comparison.
#'
#' @return Nothing returned.
#'      
#' @seealso \code{\link{pairwise}}, \code{\link{print.pairwise}},
#'      \code{\link{sidelines}}, \code{link{plot.linear.contrast}},
#'  \code{\link[stats:pairwise.t.test]{stats::pairwise.t.test}},
#'      \code{\link[stats:TukeyHSD]{stats::TukeyHSD}}
#'
#' @examples
#' data(FruitFlyLifespan)
#' fit.flies <- lm(longevity~companions,data=FruitFlyLifespan)
#' pairwise.flies <- pairwise(fit.flies,companions,type="snk",confidence=.99)
#' plot(pairwise.flies)
#' data(ZincRetention)
#' fit.zinc <- lm(retention~m.zinc*m.protein+d.zinc,data=ZincRetention)
#' # also works for one factor in a factorial
#' pairwise.zinc <- pairwise(fit.zinc,m.protein,type="hsd")
#' plot(pairwise.zinc)
#'
#' @method plot pairwise
#'
#' @export
plot.pairwise <- function(x,title=x$title,...)
{
	pairstr <- x
	if(!inherits(pairstr, "pairwise"))
	{
		stop("argument must be a 'pairwise' object")
	}
	ests <- pairstr$ests
	sds <- pairstr$sds
	signif <- pairstr$signif
	nlevels <- length(ests)
	plotmax <- max(ests)
	plotmin <- min(ests)
	for(i in 1:(nlevels-1))
	{
		for(j in i:nlevels)
		{
			plotmax <- max(plotmax,(ests[i]+ests[j])/2+sds[i,j]/2)
			plotmin <- min(plotmin,(ests[i]+ests[j])/2-sds[i,j]/2)
		}
	}
	tmppty <- par("pty")
	par(pty="s")
	plot(c(plotmin,plotmax),c(plotmin,plotmax),type='n',xlab='',ylab='',
		main=title,pty="s")
	par(pty=tmppty)
	for(i in 1:(nlevels-1))
	{
		for(j in (i+1):nlevels)
		{
			#if(!signif[i,j])
			if(!signif[i,j] && sds[j,i] > 0)
			{
				lower <- (ests[i]+ests[j])/2-sds[j,i]/2
				upper <- (ests[i]+ests[j])/2+sds[j,i]/2
				rect(lower,lower,upper,upper,col="gray",border=NA)
			}
		}
	}
	for(i in 1:(nlevels-1))
	{
		for(j in (i+1):nlevels)
		{
			if(signif[i,j])
			{
				lines(c(ests[i],ests[j]),c(ests[j],ests[i]),
					col="red")
				text(ests[i],ests[j],paste(i),col="red")
				text(ests[j],ests[i],paste(j),col="red")
				lower <- (ests[i]+ests[j])/2-sds[i,j]/2
				upper <- (ests[i]+ests[j])/2+sds[i,j]/2
				points(c(lower,upper),c(upper,lower),col="gray")
			}
			else
			{
				lines(c(ests[i],ests[j]),c(ests[j],ests[i]))
				text(ests[i],ests[j],paste(i))
				text(ests[j],ests[i],paste(j))
			}
		}
	}
	title(main=pairstr$title)
}
