# this is a modification of the built in interaction.plot function
#' Interaction plots
#'
#' Produce an interaction plot, with optional confidence limits 
#'	on group means.
#'
#' @param x.factor A factor whose levels will form the x axis. 
#' @param trace.factor A second factor (or interaction) whose levels will form the traces.
#' @param response The variable giving the response.
#' @param type with lines, points, or both.
#' @param legend Logical. Should a legend be included describing the traces?
#' @param trace.label Title for the legend.
#' @param fixed Logical. Are traces labeled in original order or
#'	resorted by values on the right?
#' @param xlab x axis label.
#' @param ylab y axis label.
#' @param lty Line types for traces.
#' @param col Plotting color(s).
#' @param pch Plotting characters for traces.
#' @param leg.bg Parameter passed to legend().
#' @param leg.bty Parameter passed to legend().
#' @param confidence Level of confidence (between 0 and 1) for confidence
#'	 intervals on cell means.
#' @param pooled Logical.  Should confidence intervals be based on
#'	a pooled estimate of variance or on individual cell variances?
#' @param sigma2 External pooled variance for use in confidence intervals.
#' @param df External degrees of freedom for use in confidence intervals.
#' @param jitterwidth How far (horizontally) should points be spread so
#'	that confidence intervals do not overlap?
#' @param at Optional vector giving horizontal positions for the cells.
#' @param ... Other arguments passed to graphics functions.
#' @param data An  optional data frame.
#'
#' @return None. Called for its side effect of drawing an interaction plot.
#'
#' @author Gary W. Oehlert \email{gary@umn.edu}
#'
#' @details This function is a modification of the builtin
#'	\code{\link[stats:interaction.plot]{stats::interaction.plot()}} function.
#'	\code{interactplot} can plot confidence intervals for each cell mean,
#'	with optional confidence intervals jittered for observability.
#'	\code{interactplot} can only plot cell means, whereas 
#'	\link[stats:interaction.plot]{stats::interaction.plot()} can plot other functions
#'	of cell data.  
#'	
#'	If you have multiple factors, for example, A, B, and C, and you with to plot
#'	the combinations of B and C against A as the x factor, use \code{B:C}
#'	as the trace factor.
#'	
#'	You may include confidence intervals for means by setting \code{confidence}
#'	to something between 0 and 1.  By default, intervals are based on a pooled
#'	estimate of variance that combines variability of all the groups. Alternatively,
#'	you may get within group variances by using \code{pooled = FALSE}.  Note,
#'	the non-pooled estimates of error have many fewer degrees of freedom and the
#'	confidence intervals will be correspondingly longer.  
#'	
#'	Both pooled and unpooled estimates of error will be inappropriate if there are
#'	additional active factors that are not reflected in the plot.  To permit
#'	sensible plots in such cases you can directly specify an error
#'	variance and degrees of freedom to use.
#'	
#'	Confidence intervals will overplot each other unless they are offset 
#'	horizontally.  The \code{jitterwidth} argument allows you to control the
#'	amount of horizontal offset.
#'	
#'	Other arguments should act in the same way as for \code{interaction.plot()}.
#'
#' @examples
#'  data(ZincRetention)
#'  interactplot(m.protein,m.zinc,retention,data=ZincRetention)
#'  # Can have combinations of factors as x or trace
#'  interactplot(m.protein,m.zinc:d.zinc,retention,data=ZincRetention)
#'  interactplot(m.zinc:d.zinc,m.protein,retention,data=ZincRetention)
#'  # add intervals while specifying error and error df
#'  interactplot(m.protein,d.zinc,retention,confidence=.95,sigma2=9,df=7,
#'       data=ZincRetention)
#'  # These intervals are too long because the variability due to a significant
#'  # third factor is included in error.
#'  interactplot(m.protein,d.zinc,retention,confidence=.95,
#'     main="These intervals are too long",data=ZincRetention)
#'  # at is useful for unequally spaced quantitative factors
#'  interactplot(m.protein,d.zinc,retention,at=c(10,15,20,30),data=ZincRetention)
#'
#' @export
interactplot <- function (x.factor, trace.factor, response, type = c("b","l", 
    "p"), legend = TRUE, trace.label = deparse(substitute(trace.factor)), 
    fixed = FALSE, xlab = deparse(substitute(x.factor)), ylab = ylabel, 
    lty = nc:1, col = 1, pch = c(1L:9, 
        0, letters),  leg.bg = par("bg"), leg.bty = "n", 
	confidence=0, pooled=TRUE, sigma2=NULL, df=NULL, 
	jitterwidth = .1, at=NULL, data=NULL, ...)
{
    xtick <- FALSE
    xaxt <- "s"
    axes <- TRUE
    xpd <- NULL
    ylabel <- paste("Mean of ", deparse(substitute(response)))
	# grab these before doing eval in data
	xlab <- xlab
	trace.label <- trace.label
    type <- match.arg(type)
	if(is.null(data)) {
	  x.factor <- as.factor(x.factor)
	  trace.factor <- as.factor(trace.factor)
	} else {
	  x.factor <- eval(substitute(as.factor(x.factor)),data)
	  trace.factor <- eval(substitute(as.factor(trace.factor)),data)
	  response <- eval(substitute(response),data)
	}
	cells <- tapply(response, list(x.factor, substitute(trace.factor)), mean,na.rm=TRUE)
    nr <- nrow(cells)
    nc <- ncol(cells)
    myvar <- function(x) {
		if(is.null(x)) return(0)
		tmp <- x[!is.na(x)]
		if(is.null(tmp)) return(0)
		var(tmp)
	}
	mylen <- function(x) {
		if(is.null(x)) return(0)
		tmp <- x[!is.na(x)]
		length(tmp)
   }
    ns <- tapply(response, list(x.factor, trace.factor), mylen)
    vars <- tapply(response, list(x.factor, trace.factor), myvar)
    dfs <- ns-1
    vtmp <- vars[ns>1]
    ntmp <- ns[ns>1]
    pooledv <- sum((ntmp-1)*vtmp)/sum(ntmp-1)
    pooleddf <- sum(ntmp-1)
    if(pooleddf == 0 && is.null(sigma2))
    {
		warning("no degrees of freedom for estimating error")
		pooleddf <- 10
		pooledv <- 10
		confidence <- 0
    }
    if(is.null(sigma2) && pooled)
    {
		vars <- matrix(pooledv,ncol=nc,nrow=nr)
		dfs <- pooleddf
    }
    else if(is.null(sigma2))
    { # now not pooled
		if(sum(ns<= 1) > 0) {
			warning("variance imputed for cells with one data point")
			vars[ns <= 1] <- pooledv
			dfs[ns <= 1] <- pooleddf
		}
    } else
    {   
		if(is.null(df)) stop("you must specify df when you use sigma2")
		vars <- matrix(sigma2,ncol=nc,nrow=nr)
		dfs <- df
    }
    margoferror <- qt(1-(1-confidence)/2,dfs)*sqrt(vars/ns)
    tops <- cells+margoferror
    bottoms <- cells-margoferror
    xvals <- matrix(rep(1L:nr,nc),nrow=nr)
    if (is.ordered(x.factor)) {
        wn <- getOption("warn")
        options(warn = -1)
        xnm <- as.numeric(levels(x.factor))
        options(warn = wn)
        if (!any(is.na(xnm))) 
            xvals <- matrix(rep(xnm,nc),ncol=nc)
    }
	if(!is.null(at)) {
		if(length(at) != nr) stop("'at' argument has wrong length.")
		xvals <- matrix(rep(at,nc),ncol=nc)
	}
    if(confidence > 1e-7)
    {
		for(i in 1:nc)
		{
			xvals[,i] <- xvals[,i] + jitterwidth*(i-1)/nc
		}
    }
    xlabs <- rownames(cells)
    ylabs <- colnames(cells)
    nch <- max(sapply(ylabs, nchar, type = "width"))
    if (is.null(xlabs)) 
        xlabs <- as.character(xvals)
    if (is.null(ylabs)) 
        ylabs <- as.character(1L:nc)
    xlim <- range(xvals)
    ylim <- range(c(tops,bottoms))
    xleg <- xlim[2L] + 0.05 * diff(xlim)
    xlim <- xlim + c(-0.2/nr, if (legend) 0.2 + 0.02 * nch else 0.2/nr) * 
        diff(xlim)
    matplot(xvals, cells, ..., type = type, xlim = xlim, ylim = ylim, 
        xlab = xlab, ylab = ylab, axes = axes, xaxt = "n", col = col, 
        lty = lty, pch = pch)
    if(confidence > 1e-7)
    {
		for(i in 1:(nr*nc))
		{
		   lines(rep(xvals[i],2),c(bottoms[i],tops[i]),col="blue")
		}
    }
    if (axes && xaxt != "n") {
        axisInt <- function(x, main, sub, lwd, bg, log, asp, 
            ...) axis(1, x, ...)
        mgp. <- par("mgp")
        if (!xtick) 
            mgp.[2L] <- 0
        axisInt(1, at = xvals[,1], labels = xlabs, tick = xtick, 
            mgp = mgp., xaxt = xaxt, ...)
    }
    if (legend) {
        yrng <- diff(ylim)
        yleg <- ylim[2L] - 0.1 * yrng
        if (!is.null(xpd) || {
            xpd. <- par("xpd")
            !is.na(xpd.) && !xpd. && (xpd <- TRUE)
        }) {
            op <- par(xpd = xpd)
            on.exit(par(op))
        }
        text(xleg, ylim[2L] - 0.05 * yrng, paste("  ", trace.label), 
            adj = 0)
        if (!fixed) {
            ord <- sort.list(cells[nr, ], decreasing = TRUE)
            ylabs <- ylabs[ord]
            lty <- lty[1 + (ord - 1)%%length(lty)]
            col <- col[1 + (ord - 1)%%length(col)]
            pch <- pch[ord]
        }
        legend(xleg, yleg, legend = ylabs, col = col, pch = if (type %in% 
            c("p", "b")) 
            pch, lty = if (type %in% c("l", "b")) 
            lty, bty = leg.bty, bg = leg.bg)
    }
    invisible()
}

