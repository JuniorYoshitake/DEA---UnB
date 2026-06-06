#' Plot linear contrasts
#'      
#' Plot a summary of linear contrasts produced by \code{linear.contrast}.
#'      
#' @param x An object of class "linear.contrast".
#' @param title The title for the plot.
#' @param adjust.method Method to adjust p-values
#' @param cex Expansion factor for contrast labels
#' @param marginlab If TRUE, contrast labels are put in the margin.
#' @param xaxis If TRUE, a horizontal line at y=0 is added.
#' @param plines If not NULL, a vector of p-value cutoffs where horizontal lines are drawn.
#' @param ... Additional graphical parameters.
#'
#' @details The plot method makes a plot displaying the
#'	results of linear contrasts from the \code{linear.contrast} function.  Each contrast
#'	is shown as a line segment representing the confidence (or posterior) interval along 
#'	the vertical axis with the contrasts ordered by p-value (or Bayes factor for contrasts
#'	from a \code{bglmm} object) along the horizontal axis.
#'	There is a separate curve showing the p-value (or Bayes factor) for each contrast.
#'	For non-Bayesian results, you may opt to adjust the p-values in \code{x} by one
#'	of the adjustment methods available to \code{p.adjust}. Note: the plotted intervals
#'	are the original individual intervals regardless of the choice of p-value adjustment.
#'
#' @return Nothing returned.
#'      
#' @seealso \code{\link{linear.contrast}}, \code{\link{p.adjust.methods}}.
#'
#' @examples
#'  data(FruitFlyLifespan)
#'  fit.flies <- lm(longevity~companions,data=FruitFlyLifespan)
#'	flies.allpairs <- linear.contrast(fit.flies,companions,allpairs=TRUE)
#'  plot(flies.allpairs,cex=.5,ylim=c(-35,45),plines=.05)
#'  # or control strong familywise error rate
#'  plot(flies.allpairs,cex=.5,ylim=c(-35,45),plines=.05,adjust="holm")
#'
#' @method plot linear.contrast
#'
#' @export
plot.linear.contrast <- function(x,title="",adjust.method="none",cex=1,
	marginlab=FALSE,xaxis=TRUE,plines=NULL,...)
{
	if(!(adjust.method %in% p.adjust.methods)) {
		stop("Unrecognized p-value adjustment method")
	}
	if(is.list(x)) {
		x <- x[[1]]
	}
	bayes <- FALSE
	if(ncol(x) <6) bayes <- TRUE
	if(bayes) {
		if(adjust.method != "none") {
			message("P-value adjustment ignored for Bayesian results")
		}
		ests <- x[,1]
		lower <- x[,3]
		upper <- x[,4]
		strength <- x[,5]
		str.label <- "   Bayes Factor"
	} else {
		ests <- x[,1]
		lower <- x[,5]
		upper <- x[,6]
		strength <- x[,4]
		str.label <- "   P-value"
		strength <- p.adjust(strength,adjust.method)
	}
	
	n.contr <- length(strength)
	myorder <- order(strength)
	ymin <- min(lower)
	ymax <- max(upper)
	plot(c(0,n.contr+1),
		c(ymin,ymax),type="n",xlab="",ylab="differences",main=title,xaxt="n",...)
	points(1:n.contr,ests[myorder],pch=16)
	for(i in 1:n.contr) {
		lines(c(i,i),c(lower[myorder[i]],upper[myorder[i]]))
	}
	if(xaxis) abline(h=0)
	nms <- rownames(x)
	for(i in 1:n.contr) {
		if(marginlab) {
			mtext(nms[myorder[i]],1,at=i,cex=cex)
		} else {
			text(i,upper[myorder[i]],paste(" ",nms[myorder[i]]),srt=45,adj=0,cex=cex)
		}
	}
	if(FALSE) {
		labs <- pretty(strength)
		str.labs <- as.character(labs)
	} else {
		strength <- log10(strength)
		labs <- 10^pretty(strength)
		str.labs <- as.character(labs)
		labs <- log10(labs)
	}
	strmin <- min(strength)
	strmax <- max(strength)
	newstrength <- (strength-strmin)/(strmax-strmin)*(ymax-ymin)+ymin
	#print(newstrength)
	lines(1:n.contr,newstrength[myorder],type="b",col="red")
	text(n.contr,max(newstrength),str.label,adj=0,col="red",cex=cex)
	newlabs <- (labs-strmin)/(strmax-strmin)*(ymax-ymin)+ymin
	axis(4,at=newlabs,labels=str.labs,col="red")
	
	if(!is.null(plines) && is.numeric(plines)) {
		plines <- plines[plines > 0 & plines < 1]
		print(plines)
		if(length(plines) > 0) {
			newplines <- (log10(plines)-strmin)/(strmax-strmin)*(ymax-ymin)+ymin
			print(newplines)
			for(i in 1:length(plines)) {
				abline(h=newplines[i],col="red")
			}
		}
	}
	
}
