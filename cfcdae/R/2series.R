# This function is based on FrF2::DanielPlot, which is in turn based on
# BsMD::DanielPlot. Our change is to offer Basso-Salmaso-based significance marking.

#' Half-Normal or Pareto Effects Plots
#'
#' This function is a modification of FrF2::DanielPlot, which is itself a modification
#'	of BsMD::DanielPlot. The changes implemented here include:
#'	\itemize{
#'	\item Added Pareto plots.
#'	\item Significant effects are selected using the Basso-Salmaso permutation test.
#'	\item Removed (full) normal plot of effects.
#'	\item Data are always on the x-axis.
#'	\item Optional selection of significant effects using the Lenth PSE (with marking for individual and simultaneous margin of error).
#'	\item Plotting characters are set and not optional.
#'  \item More error checking.
#'	}
#'
#' @param data An optional data frame.
#' @param fit Either a linear model formula or an object of class lm for a two-series model.
#' @param alpha The significance level for testing effects. This is a  strong familywise error rate for
#'	the Basso-Salmaso permutation and a per comparison error rate for the Lenth test.
#' @param recode Logical flag (default FALSE) indicating whether factor names should be replaced with A, B, C, etc.
#' @param signif.only Logical flag. If TRUE (the default), then labels are only shown for significant effects.
#' @param term.labels NULL or list. If NULL, point labels are automatically determined according to the setting of recode (i.e. A,B,C etc. for recode=TRUE and
#'	natural effect names otherwise) and signif.only (i.e. all effects are labelled if signif.only=FALSE, only significant effects are labelled if
#'	signif.only=TRUE). Otherwise, term.labels can be used for manual labelling of certain effects and should be a list with components index
#'  (integer vector referring to position of terms to be labelled once pivoted terms are eliminated) and label (character vector of labels) components.
#' @param block NULL or integer vector. If non-null, the terms corresponding to the entries in \code{block} will be labeled "Block".
#' @param B The number of random permutations to use for testing effects using the Basso-Salmaso test.
#' @param type Either "half" (default, for half-normal) or "pareto", indicating the type of plot to make.
#' @param pse Logical flag indicating whether effects significant according to the Lenth PSE approach should also be labeled.
#' @param cex.fac numeric. Factor label character size.
#' @param cex.lab numeric. Labels character size.
#' @param cex.pch numeric. Points character size.
#' @param cex.legend numeric. Legend size in case of recodes.
#' @param main NULL or character. Title of plot. If NULL, automatic title is generated.
#' @param subtitle NULL or character. Sub title of plot.
#' @param ... Additional graphical parameters to be passed to plot.
#'
#' @details
#' The model must be a saturated linear model for a (fractional) factorial 2-level design. Completely aliased effects are allowed, but
#'  partial aliasing is not allowed. Effects (except for the intercept) are
#'	displayed in a Pareto or half-normal plot with the effects on the x-axis.
#'
#'	Significant effects according to the Basso-Salmaso permutation test (strong familywise error rate) are shown with a solid dot, while other effects
#'	are shown with an open dot. If \code{signif.only} is true, only the significant effects are labeled. If
#'	\code{pse} is also true, any additional effects that are significant using the (per comparison error rate) Lenth
#'	procedure will also be labeled, but they will not be given the solid dot. This will also show
#'	per comparison and simultaneous margin of error for the Lenth pse.
#'
#'  B will be set to a reasonable value if unspecified.
#'
#' @author Ernesto Barrios, modified by Ulrike Groemping, further modified by Gary W. Oehlert (\email{gary@umn.edu}). Code
#'	for the permutation test by Gary W. Oehlert.
#'
#' @references
#' Basso, D. and L. Salmaso (2006). "A Discussion of Permutation Tests Conditional to Observed Responses in
#' Unreplicated 2^m Full Factorial Designs," \emph{Communications in Statistics - Theory and Methods} \strong{35}, 83-97.
#'
#' Lenth, R.V. (1989) "Quick and easy analysis of unreplicated factorials," \emph{Technometrics} \strong{31}, 469-473.
#'
#' @seealso \code{\link[FrF2:DanielPlot]{FrF2::DanielPlot}}
#'
#' @examples
#'  \dontrun{data(ImageID)}
#'  \dontrun{TwoSeriesPlots(fracID~A*B*C*D*E*F*G,data=ImageID,block=block)}
#'  \dontrun{TwoSeriesPlots(fracID~A*B*C*D*E*F*G,data=ImageID,
#'       term.labels=list(index=c(5,127),label=c("I'm term E","I'm a block")))}
#'
#' @export
#' @importFrom DoE.base ME.Lenth
TwoSeriesPlots <- function (fit, alpha=.05, data=NULL, B=NULL, type=c("half","pareto")[1], block = NULL, pse=FALSE,
	recode = FALSE, signif.only = TRUE, term.labels = NULL,
	cex.fac = par("cex.lab"),cex.lab = par("cex.lab"), cex.pch = par("cex"), cex.legend = par("cex.lab"),
	main = NULL, subtitle = NULL,...)
{

  if(!is.null(data) && !is.data.frame(data)) {
		stop("data must be NULL or a data frame")
	}
	
	if("formula" %in% class(fit)) {
		fit <- lm(fit,data=data)
	}
	if (!("lm" %in% class(fit) | "aov" %in% class(fit))) {
		stop("fit must be a linear model object (lm or aov)")
	}

	fit <- force.all.factors(fit,data=data) # also checks for 2 series and forces intercept
	if(!is.orthogonal(fit)) {
		stop("The model cannot have partial aliasing.")
	}
	n <- length(residuals(fit))
		
	if(!is.numeric(alpha) || length(alpha)>1 || alpha <= 0 || alpha >= 1) {
		stop("alpha must be a real scalar between 0 and 1")
	}
	alpha.adjust <- 1 - (1-alpha)^(1/(n-2))
	
	if(is.null(B)) {
		B <- max(floor(10/alpha.adjust),3000)
		message(paste("B set to",B))
	}
	if(!is.numeric(B) || B < 0 || length(B) != 1 || B != round(B)) {
		stop("B should be a positive integer scalar")
	}
	
	if(!is.logical(recode) || length(recode) != 1) {
		stop("recode must be a logical scalar")
	}
	
	if(!is.logical(signif.only) || length(signif.only) != 1) {
		stop("signif.only must be a logical scalar")
	}
	
	if(!is.null(term.labels)) {
		if( !is.list(term.labels)  || !all(c("index","label") %in% names(term.labels)) ||
			length(term.labels$index) != length(term.labels$label)) {
				stop("term.labels must be NULL or a list with components index and label with the same lengths")
		}
		if(!is.numeric(term.labels$index) || any(term.labels$index != round(term.labels$index)) ||
			any(term.labels$index < 1) || any(term.labels$index >= n)) {
				stop("term.labels$index must be a vector of non-negative integers no more than the number of terms in the model")
		}
		if(!is.character(term.labels$label)) {
			stop("term.labels$label must be a character vector")
		}
	}
	
	block <- eval(substitute(block),data)
	if(!is.null(block)) {
		if(is.numeric(block)) {
			if(any(block != round(block)) || min(block) < 1 || max(block) > (n-1)) {
				stop("If block is numeric, it must be an integer vector of values between 1 and the number of terms in the model")
			}
		} else if(is.factor(block)) {
			if(length(block) != n) {
				stop("A factor block must have length equal response")
			}
		} else {
			stop("block must be a factor or a vector of term indices")
		}
	}
	
	if(!is.character(type) || length(type) > 1 || (type != "half" && type != "pareto")) {
		stop("type must be 'half' or 'pareto'.")
	}
	
	# remove intercept (which we forced in) and double coefs to get total effects
	factor.effects <- 2 * coef(fit)[-1]
	term.effects <- 2 * coef(fit)[-1]
	names(term.effects) <- get.term.names(fit,recode,term.labels,block)
	
	if(!is.null(term.labels)) {
		signif.only <- FALSE
	}
	translation <- NULL
	if(recode) {
		translation <- get.term.legend(fit)
	}
	used.columns <- !is.na(term.effects)
	term.effects <- term.effects[used.columns]
	X <- model.matrix(fit)[,used.columns]
	Y <- fit$fitted.values+fit$residuals
	
	yname <- colnames(fit$model)[attr(attr(fit$model, "terms"),"response")]
	
	n <- length(term.effects)
	
	all.crit.Lenth <- DoE.base::ME.Lenth(term.effects, alpha = alpha)
	crit.Lenth <- all.crit.Lenth$ME
	index.Lenth <- which(crit.Lenth < abs(term.effects))
	
	
	index <- index.BS <- which(Basso.Salmaso(Y,X,alpha,B)$reject)
	
	if(pse) index <- unique(c(index.Lenth,index.BS))
	
	thispch <- rep(1,n)
	thispch[index.BS] <- 16
	
	new.term.labels <- names(term.effects)
	if(signif.only) {
		if(length(index) == 0) {
			new.term.labels <- rep("",length(new.term.labels))
		} else {
			new.term.labels[-index] <- ""
		}
	}
	
	if(type[1]=="pareto") {
		if(is.null(main)) main <- paste("Pareto Plot for ", yname, ", alpha=",alpha,sep="")
		xy <- list(y = (1:n)[rank(abs(term.effects),ties.method="random")],
				x = abs(term.effects))
		ylab <- ""
		xlab <- "absolute effects"
		plot.default(xy, xlim = c(0, max(xy$x) + diff(range(xy$x))/5),
			pch = thispch, xlab = xlab, ylab = ylab, cex = cex.pch, cex.lab = cex.lab,
			mgp = c(2, 1, 0), main = main, yaxt="n", bty="n",...)
		for(i in 1:n) {
			lines(c(0,xy$x[i]),rep(xy$y[i],2))
		}
		abline(v=0)
	} else {
		if(is.null(main)) main <- paste("Half-Normal Plot for ", yname, ", alpha=",alpha,sep="")
		xy <- list(y = qnorm(0.5 + ppoints(n, a = 1/2)/2)[rank(abs(term.effects),ties.method="random")],
				x = abs(term.effects))
		ylab <- "half-normal scores"
		xlab <- "absolute effects"
		plot.default(xy, xlim = c(0, max(xy$x) + diff(range(xy$x))/5),
				pch = thispch, xlab = xlab, ylab = ylab, cex = cex.pch, cex.lab = cex.lab,
					mgp = c(2, 1, 0), main = main, ...)
			
		null.effects <- sort(abs(term.effects))
		if(length(index.BS) > 0) {
			null.effects <- sort(abs(term.effects[-index.BS]))
		}
		null.scores <- qnorm(0.5 + ppoints(length(term.effects), a = 1/2)/2)[1:length(null.effects)]
		null.fit <- lm(null.scores~null.effects-1)
		abline(0,null.fit$coef,lty=1)
	}
	if (!is.null(subtitle)) mtext(subtitle)
	if(pse) {
		abline(v=all.crit.Lenth$ME,lty=2)
		abline(v=-all.crit.Lenth$ME,lty=2)
		abline(v=all.crit.Lenth$SME,lty=3)
		abline(v=-all.crit.Lenth$SME,lty=3)
	}
	
	text(xy$x,xy$y, paste(" ",new.term.labels), cex = cex.fac, adj = 0)
	if(recode) mtext(side = 1, line = 3.5, translation, cex = cex.legend)

	invisible(list(xy=as.data.frame(xy),term=names(term.effects),translation=translation,pchs=thispch))
}

get.term.names <- function(fit,recode,effect.labels,block) {
	N <- length(residuals(fit))
	if(!is.null(effect.labels)) {
		if(!is.list(effect.labels)) {
			stop("effect.labels must be a list with index and label components")
		}
		term.names <- rep("",N-1)
		term.names[effect.labels$index] <- effect.labels$label
		term.names <- paste(" ",term.names,sep="")
		return(term.names)
	}
	term.names <- attr(fit$terms,"term.labels")
	if(recode) {
		codes <- c(LETTERS[-9], letters[-9])
		nfactors <- sum(attr(fit$terms,"order")==1)
		codes <- codes[1:nfactors]
		presence <- attr(fit$terms,"factors")[-1,]
		for(i in 1:length(term.names)) {
			term.names[i] <- paste(codes[presence[,i]>0],collapse=":")
		}
	}
	if(is.numeric(block)) {
		term.names[block] <- "Block"
	} else if(is.factor(block)) {
		fit2 <- lm(model.matrix(fit)[,-1]~block)
		abscfssum <- apply(abs(coef(fit2)),2,FUN=sum)
		term.names[abscfssum > 1e-5] <- "Block"
	}
	return(term.names)
}

get.term.legend <- function(fit) {
	codes <- c(LETTERS[-9], letters[-9])
	nfactors <- sum(attr(fit$terms,"order")==1)
	codes <- codes[1:nfactors]
	factor.labels <- attr(fit$terms,"term.labels")[attr(fit$terms,"order")==1]
	translation <- paste(codes,factor.labels,sep="=")
	translation <- paste(translation,collapse=", ")
	return(translation)
}

Basso.Salmaso <- function(y,X,alpha,B) {
	N <- nrow(X)
	k <- log(N,2)
	X <- X[,-1] # remove intercept
	alpha.adjust <- 1 - (1-alpha)^(1/(N-2))
	if(is.null(B)) B <- max(floor(10/alpha.adjust),3000)
	
	# get permuted y
	yindex <- matrix(runif(N*B),ncol=B)
	yindex <- apply(yindex,2,function(x){sort(x,index.return=TRUE)$ix})
	yperm <- matrix(y[yindex],ncol=B)
	
	betahat <- t(X) %*% y
	betahat.index <- sort(abs(betahat),index.return=TRUE)$ix
	
	betahat.sort <- betahat[betahat.index]
	X.sort <- X[,betahat.index]
	sq.betahat.sort <- betahat.sort^2
	sq.betahat.sort.cumsum <- cumsum(sq.betahat.sort)
	h <- sq.betahat.sort[-1]/sq.betahat.sort.cumsum[-(N-1)]
	
	sq.betahatperm.sort <- (t(X.sort) %*% yperm)^2
	sq.betahatperm.sort <- apply(sq.betahatperm.sort,2,FUN=sort)
	sq.betahatperm.sort.cumsum <- apply(sq.betahatperm.sort,2,FUN=cumsum)
	htilde <- sq.betahatperm.sort[-1,]/sq.betahatperm.sort.cumsum[-(N-1),]
	
	# Salmaso's code computes p-value based on htilde, but the 2006 paper
	# says that in step j you should include the previous small terms. That is,
	# not just b_3^2/(b_1^2+b_2^2) but also b_2^2/(b_1^2+b_3^2) and  b_1^2/(b_2^2+b_3^2)
	
	pvalues <- apply( (h - htilde) < 0, 1, FUN=sum)/B
	pvalues <- c(1,pvalues)
	names(pvalues) <- colnames(X.sort)
	
	reject <- rep(FALSE,N-1)
	low <- which(pvalues < alpha.adjust)
	if(length(low) > 0) reject[low[1]:(N-1)] <- TRUE
	reject[betahat.index] <- reject
	names(reject) <- colnames(X)
	
	return(list(reject=reject,pvalues=pvalues))
}



force.all.factors <- function(lmfit,data=NULL) {
	model.frame <- lmfit$model
	intercept.col <- attr(lmfit$terms, "intercept")
	response.col <- attr(lmfit$terms, "response")
	for(j in 1:ncol(model.frame)) {
		if(j==intercept.col || j==response.col)
			next
		if(!is.factor(model.frame[,j]))
			model.frame[,j] <- factor(model.frame[,j])
		if(length(levels(model.frame[,j])) != 2 )
			stop("Design must be a two-series factorial.")
	}
	trms <- terms(lmfit)
	# force intercept
	attr(trms,"intercept") <- 1
	old.contrasts <- options()$contrasts
	options(contrasts=c("contr.sum","contr.poly"))
	names.data <- names(data)
	names.model.frame <- names(model.frame)
	needed <- !(names.data %in% names.model.frame)
	if(sum(needed) > 0) {
	  tmp <- data.frame(data[,needed])
	  names(tmp) <- names.data[needed]
	  model.frame <- data.frame(cbind(model.frame,tmp))
	}
	newfit <- lm(trms,data=model.frame)
	#newfit <- lm(trms,data=data)
	if(sum(!is.na(coef(newfit))) != length(residuals(newfit)))
		stop("Two-series model must be saturated (fit all possible df).")
	options(contrasts=old.contrasts)
	newfit
}



is.orthogonal <- function(lmfit) {
	design.mat <- model.matrix(lmfit)
	N <- nrow(design.mat)
	XtX <- t(design.mat) %*% design.mat
	lt <- abs(XtX[lower.tri(XtX)])
	if(any(lt > 1e-5 & lt < (N - 1e-5))) return(FALSE)
	TRUE
}


