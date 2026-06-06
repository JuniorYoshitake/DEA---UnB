#' Side by Side plot
#'
#' A side by side plot for the effects of a linear model (including fixed and/or random effects).
#'
#' @param lmodel A model object from one of \code{lm}, \code{lme}, \code{lmer}, or \code{bglmm}.
#' @param p.cex Expansion factor for drawn points in plot.
#' @param t.cex Expansion factor for text labeling drawn in margins.
#' @param left.margin Size of left margin (where term labels are drawn) in "lines".
#' @param show.intercept Should the intercept be included in the plot.
#' @param n.box Cutoff for displaying a boxplot instead of individual points.
#' @param ... Other arguments passed to \code{plot}.
#'
#' @return No value returned other than producing the plot.
#'
#' @details A side by side plot shows the estimated effects
#'	for each term in a linear model. Terms are displayed separately as
#'	points along a horizontal line, with a term label written
#'	in the left margin.
#'	
#'	Term labels can be quite long, so \code{cex} and
#'	\code{left.margin} can be used to make term labels smaller
#'	(e.g., \code{cex=.5}) or the left margin wider (e.g.,
#'	\code{left.margin=12}).
#'	
#'	\code{t.cex} can be used to change the size of the plotted points.
#'	
#'	The default is not to plot the intercept/constant in a model,
#'	as it is often of a very different magnitude than the
#'	effects.
#'	
#'	Terms with many values (particulary residuals), can be cluttered.
#'	For terms with as many as \code{n.box} values, a boxplot will be plotted
#'	instead of individual points.
#'
#' @author Gary W. Oehlert \email{gary@umn.edu}
#'
#' @examples
#' faults.orig <- lm(faults~(alg+ram+size+init)^3,data=PageFaults)
#' faults.log <- lm(log(faults)~(alg+ram+size+init)^3,data=PageFaults)
#' # see effects on original scale
#' sidebyside(faults.orig)
#' # interactions are relatively smaller when analyzed on log scale
#' sidebyside(faults.log)
#'
#' @import graphics
#' @export
sidebyside <- function(lmodel,p.cex=1,t.cex=1,left.margin=8,show.intercept=FALSE,n.box=30,...) {
    # We require that all factors use the contr.sum parameterization.
    # This is not required mathematically, but we require
    # it here to make the programming simpler.
    
    # make sure we have a linear model
    thisclass <- class(lmodel)
    if("lme" %in% thisclass)
    {
        useclass <- "lme"
    } else if("lmerMod" %in% thisclass || "merModLmerTest" %in% thisclass)
    {
        useclass <- "lmerMod"
    } else if("lm" %in% thisclass)
    {
        useclass <- "lm"
    } else if("bglmm" %in% thisclass) {
        useclass <- "bglmm"
    }
    else {
        stop("First argument must be fitted object from aov or lm or lme or lmer or bglmm")
    }
    
    if(useclass == "bglmm") {
	all.term.labels <- lmodel$all.term.labels
    } else {
		all.term.labels <- extract.model.bits(lmodel)$all.term.labels
    }
    
    point.list <- list()
    for(term in all.term.labels) {
        if(show.intercept || term != "(Intercept)")  point.list[[term]] <- model.effects(lmodel,term)
    }
    point.list[["residuals"]] <- residuals(lmodel)
    
    n.comps <- length(point.list)
    names.list <- names(point.list)
    tmp <- range(c(point.list,recursive=TRUE))
    old.mar <- new.mar <- par("mar")
    new.mar[2] <- left.margin
    par(mar=new.mar)
    plot(tmp,c(0,1),type='n',yaxt='n',xlab="",
        ylab="",...)
    abline(v=0)
    for(i in 1:n.comps) {
        y <- i/(n.comps+1)
        ydown <- y-.333/(n.comps+1)
        yup <- y+.333/(n.comps+1)
        x <- c(point.list[[i]])
        if(length(x) < n.box) {
            points(x,rep(y,length(x)),cex=p.cex)
        } else {
            smry <- summary(x)
            lines(c(smry[1],smry[2]),rep(y,2))
            lines(c(smry[5],smry[6]),rep(y,2))
            lines(c(smry[2],smry[5]),rep(ydown,2))
            lines(c(smry[2],smry[5]),rep(yup,2))
            lines(rep(smry[2],2),c(ydown,yup))
            lines(rep(smry[5],2),c(ydown,yup))
            lines(rep(smry[3],2),c(ydown,yup))
            
        }
        mtext(names.list[i],side=2,line=1,adj=1,cex=t.cex,las=2, at=y)
    }
    par(mar=old.mar)
}
