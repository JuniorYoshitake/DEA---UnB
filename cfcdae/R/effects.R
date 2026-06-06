
#' Get all model effects (including redundant effects)
#'
#' Construct vector or table of all (generalized) linear model coefficients,
#'	filling in redundant effects by exploting zero sum constraints.
#'
#' @aliases model.effects
#'
#' @param lmodel A model object of class \code{lm}, \code{lme}, \code{lmerMod}, or
#'	\code{bglmm}.
#' @param termname A character string giving the name of a term in the model.
#' @param data An optional data frame.
#'
#' @return A vector or matrix giving the complete set of term effects (coefficients).
#'
#' @author Gary W. Oehlert \email{gary@umn.edu}
#'
#' @details This function only works for models that were fit using the
#'	\code{"contr.sum"} model contrasts. These models have effects that add
#'	zero across any subscript. Fittting functions, e.g. \code{lm}, leave out
#'	the redundant coefficients. This function merely computes the redundant
#'	coefficients by enforcing the zero sum constraint.
#'
#' @examples
#' data(SproutingBarley)
#' # transform response
#' barleyfit <- lm(sqrt(sprouting)~water*weeks,data=SproutingBarley)
#' coef(barleyfit) # only non-redundant coefficients get fit
#' model.effects(barleyfit,water)
#' model.effects(barleyfit,weeks)
#' model.effects(barleyfit,water:weeks)
#' \dontrun{
#' model.effects(barleyfit,weeks:water) # won't find it
#' }
#'
#'
#' @export
model.effects <- function(lmodel,termname,data=NULL)
{
	thisclass <- class(lmodel)
	if(!(inherits(lmodel, c("lme","lm","lmerMod","merModLmerTest","bglmm"))))
		stop("lmodel must be fitted object from lm or lme or lmer or bglmm")
	if(!is.null(data) && !is.data.frame(data))
		stop("Parameter data must be a data frame")
	
	UseMethod("model.effects")
}

#' @rdname model.effects
#' @method model.effects default
#' @export
model.effects.default <- function(lmodel,termname,data=NULL){
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
    }  else
	{
		stop("First argument must be fitted object from aov or lm or lme or lmer")
	}
    
	oldwarn <- getOption("warn");options(warn= -1)
	tryit <- try(eval(substitute(termname),data),silent=TRUE)
	if("try-error" %in% class(tryit)) {
		tryit <- try(eval(substitute(termname),parent.frame()),silent=TRUE)
	}
	options(warn=oldwarn)
	if("try-error" %in% class(tryit) || !is.character(tryit)) {
		termname <- deparse(substitute(termname))
	} else if(is.character(tryit)) {
		termname <- tryit[1]
	}

	modelstuff <- extract.model.bits(lmodel)
    
	# check for intercept
	has.intercept <- modelstuff$has.intercept

	# check for Scheffe style parameterization
	modmat <- model.matrix(lmodel)
	if(!modelstuff$all.contr.sum)
	{
		stop("model.effects requires all R-contrasts (parameterizations) to be contr.sum, try options(contrasts=c('contr.sum','contr.poly'))")
	}

	all.var.names <- modelstuff$all.var.names
	all.var.classes <- modelstuff$all.var.classes
	all.var.levels <- modelstuff$all.var.levels
	all.var.labels <- modelstuff$all.var.labels
	
	# make sure term is present in model
	
	termno <-match(termname,modelstuff$all.term.labels,nomatch=-1)
	if(termno < 0)
	{
		stop(paste(termname,"is not an explicit term in the model"))
	}

	# get variables in the term
	vars.in.term <- modelstuff$vars.in.all.terms[,termno]
	var.codings <- vars.in.term[vars.in.term > 0]
	var.indices <- (1:length(vars.in.term))[vars.in.term > 0]
	var.classes <- all.var.classes[var.indices]
	var.names <- all.var.names[var.indices]
	nvars <- length(var.classes)

	levels.in.effect <- all.var.levels[vars.in.term > 0]
	effect <- array(0,dim=levels.in.effect)
	reduced.effect <- array(0,
		dim=(levels.in.effect-((var.codings == 1) & (var.classes == "factor"))))
	effect.indices <- array(1:prod(levels.in.effect),dim=levels.in.effect)
	effect.labels <- all.var.labels[vars.in.term > 0]


	cfs <- modelstuff$betahats
	whichcfs <- modelstuff$fixed.term.assignments == termno
	cfs <- cfs[whichcfs]
	has.nas <- sum(is.na(cfs)) > 0
	cfs[is.na(cfs)] <- 0

# if this is first model term in model and no intercept, then use coefficients as is

	if(!has.intercept && termno == 1)
	{
		effect[1:length(cfs)] <- cfs
		dimnames(effect) <- effect.labels
		return(effect)
	}

	reduced.effect[1:length(cfs)] <- cfs
	for(i in 1:nvars)
	{
		if(var.classes[i] == "factor" && var.codings[i] == 1)
# var.codings 1 means the usual contrasts, whatever they are
# var.codings 2 means that there was a missing lower order term and
# the variable enters the term as a full set of dummies regardless of
# what contrasts are chosen. In that case, there is no additional
# zero sum constraint effect to compute from the other estimated effects

		{
			if(nvars == 1)
			{
				reduced.effect <- c(reduced.effect,-sum(reduced.effect))
				reduced.effect <- array(reduced.effect)
				break
			}
			for.perm <- c((1:nvars)[-i],i)
			rev.perm <- order(for.perm)
			perm.effect <- aperm(reduced.effect,for.perm)
			sums <- apply(perm.effect,1:(nvars-1),sum)
			thisdim <- dim(perm.effect)
			thisdim[length(thisdim)] <- thisdim[length(thisdim)]+1
			perm.effect <- array(c(perm.effect,-sums),dim=thisdim)
			reduced.effect <- aperm(perm.effect,rev.perm)
		}
	}
	dimnames(reduced.effect) <- effect.labels
	reduced.effect
}

