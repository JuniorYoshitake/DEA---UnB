extract.model.bits <- function(model)
{
	# this function finds the bits needed of linear models from several
	# different types (lm, lmer, lme?) and extracts them into a standard
	# form

        thisclass <- class(model)
        if("lme" %in% thisclass)
        {
                useclass <- "lme"
        } else if("lmerMod" %in% thisclass || "merModLmerTest" %in% thisclass)
        {
                useclass <- "lmerMod"
        } else if("lm" %in% thisclass)
        {
                useclass <- "lm"
        }
        else if("bglmm" %in% thisclass) {
            useclass <- "bglmm"
        } else {
                stop("First argument must be fitted object from aov or lm or lme or lmer or bglmm")
        }

	# What bits do we want?
	# presence of intercept
	# contr.sum type of parameterization
	# a list of model terms
	# a list of term labels
	# the classes of variables in model
	# the names of variables in model
	# the number of levels for factors 
	# the labels for the levels of factors


	# NOTE: for mixed effects models, only fixed terms are referenced in the output

	if(useclass == "lme") 
	{
		terms <- model$terms
	} else if (useclass == "bglmm")
	{
		stop("You can't use extract.model.bits with a bglmm")
		
	} else
	{
		terms <- terms(model)
	}

	modmat <- model.matrix(model)
	all.contr.types <- attr(modmat,"contrasts")
	all.contr.sum <- sum(c(all.contr.types!="contr.sum")) < .5

	all.var.names <- labels(attr(terms(model),"factors"))[[1]]
	all.var.levels <- rep(1,length(all.var.names))
	names(all.var.levels) <- all.var.names
	all.var.classes <- rep("numeric",length(all.var.names))
	all.var.labels <- list()
	if(useclass == "mer")
	{
		all.var.classes <- attr(terms,"dataClasses")
		fr <- model@frame
		for(i in 1:length(all.var.classes)) 
		{
			all.var.labels[[ i ]] <- all.var.names[i]
			if(all.var.classes[i] == "factor")
			{
				all.var.levels[i] <- length(unique(fr[ ,i]))
				all.var.labels[[ i ]] <- levels(fr[ ,i ])
			}
		}
		betahats <- model@fixef
	}
	else if(useclass == "lmerMod")
	{
		fr <- model@frame
		for(i in 1:length(all.var.classes)) 
		{
			all.var.labels[[ i ]] <- all.var.names[i]
			thisvar <- fr[,all.var.names[i]]
			if(is.factor(thisvar))
			{
				all.var.classes[i] <- "factor"
				all.var.levels[i] <- length(unique(thisvar))
				all.var.labels[[ i ]] <- levels(thisvar)
			}
		}
		betahats <- lme4::getME(model,"beta")
	}
	else if(useclass == "lme")
	{
		for(i in 1:length(all.var.classes))
		{
			all.var.labels[[ i ]] <- all.var.names[i]
			thisvar <- mget(all.var.names[i],new.env(),ifnotfound=as.numeric(1),inherits=TRUE)[[1]]
			if(is.factor(thisvar)) 
			{
				all.var.classes[i] <- "factor"
				if(length(thisvar) == 1)
				{
					warning(paste("Could not find variable",all.var.names[i],"to determine labeling"))
				}
				all.var.labels[[ i ]] <- levels(thisvar)
				all.var.levels[[ i ]] <- length(levels(thisvar))
			}
		}
		betahats <- nlme::fixef(model) # nlme::fixef(model)
	}
	else # lm
	{
		all.var.classes <- attr(terms,"dataClasses")
		factor.levels <- sapply(model$xlevels,length)
		all.var.levels[all.var.classes=="factor"] <- factor.levels
		for(i in 1:length(all.var.classes))
		{
			all.var.labels[[ i ]] <- all.var.names[i]
			if(all.var.classes[i] == "factor")
			{
				all.var.labels[[ i ]] <- model$xlevels[[ all.var.names[i] ]]
			}
		}
		betahats <- coefficients(model)
	}
	
	all.term.labels <- attr(terms,"term.labels")


	list(has.intercept=(attr(terms,"intercept") == 1),
		all.contr.types=all.contr.types,
		all.contr.sum=all.contr.sum,
		all.var.names=all.var.names,
		all.var.classes=all.var.classes,
		all.var.levels=all.var.levels,
		all.var.labels=all.var.labels,
		all.term.labels=all.term.labels,
		vars.in.all.terms=attr(terms,"factors"),
		fixed.term.assignments=attr(model.matrix(model),"assign"),
		betahats=betahats
		 )
		
}

