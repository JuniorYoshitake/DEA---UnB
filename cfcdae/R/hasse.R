
#' Tools for a classical approach to balanced mixed-effects factorials.
#'
#' Classical analysis of balanced mixed-effects factorials begins by computing
#'	the ANOVA as if all effects were fixed, calculating the expected mean squares
#'	of the terms in the ANOVA acknowledging the random nature of some factors,
#'	and creating (sometimes approximate) F-tests for effects and interactions based
#'	on the expected mean squares. This has been largely supplanted by modern REML
#'	approaches, but some classical tools are still useful, particularly in regard
#'	to power and understanding the design. Tools here compute expected mean squares,
#'	display the form of (approximate) F-tests, draw Hasse diagrams, and compute
#'	power.
#'
#' @param formula A one-sided formula (~terms) describing the factorial model.
#' @param levels An integer vector giving the levels of the factors and replication
#'	in the model.
#' @param random A (possibly NULL) character vector giving the names of random factors.
#' @param restricted A logical flag indicating whether restricted model assumptions
#'	(zero sums across levels of fixed factors) should be used for mixed terms; default
#'	is TRUE.
#' @param grid A logical flag indicating whether a tabular form of the results should
#'	be returned; see Details. Default is FALSE.
#' @param elements A list of named components giving the values of the "representative
#'	elements", with the name of the component indicating the effect.
#'	For a random effect, its element is its variance. For a fixed effect,
#'	its element is the sum of the squared effects across all levels divided by degrees
#'	of freedom. Unspecified elements are assumed to be zero. Residual variance is named "Error".
#' @param alpha Significance level to be used in computing power; default is .05.
#' @param cex Character size in Hasse diagrams; default is 1.7.
#' @param vert.off Offset for how far line segments should end from plotting position
#'	of nodes in Hasse diagram; default is .2 (i.e., 20 percent of inter-level distance).
#' @param lwd Width of lines in Hasse diagram; default is 2.
#' @param xeps Larger values squeeze the Hasse diagram into the center of the plot. Should be between 0
#'	and .5; default is .1.
#' @param show.super Include superscript on Hasse diagram.
#' @param show.sub Include subscript on Hasse diagram.
#' @param max.depth Maximum depth for the Hasse diagram.
#' @param alt.names A named list of character strings giving alternative labels for
#'   for the Hasse diagram nodes corresponding to the component names.
#' @param ... Other parameters. These are currently ignored, allowing the user to employ
#'	the same arguments in all of these utilities for classical mixed effects.
#'
#' @return
#'	\code{mixed.ems} computes the expected mean square for each term in the model as a vector
#'	of character strings. If \code{grid==TRUE}, the result is a list including a
#'	square integer matrix with
#'	one row/column for each effect in the model. Element i,j (row, column) gives the multiplier
#'	for the contribution of the jth effect to the ems of the ith effect.
#'
#'	\code{mixed.tests} returns the (approximate) F-test for each term in
#'	the model as a vector of character strings of the form "MS[term1]/MS[term2]",
#'	"(MS[term1]+MS[term2])/(MS[term3]+MS[term4])", etc. If \code{grid==TRUE},
#'	the result is a list including a matrix with one row for every test and one column
#'	for every MS. Element (i,j) (row, column) is 1 if MS j appears in the numerator of the
#'	test for effect i and -1 if it appears in the denominator.
#'
#'	\code{mixed.power} returns a matix with one row for each test and columns for power and for expected
#'	values and (Satterthwaite approximate) degrees of freedom of the numerator and denominator
#'	of the (approximate) F test.
#'
#'	\code{mixed.hasse} has no return value and is used for the side effect of plotting the
#'	Hasse diagram.
#'
#' @details These functions assume \strong{balanced} designs. They give incorrect
#'	results for unbalanced designs, although many of the insights may be similar.
#'
#'	For a k-factor design, the \code{levels} argument must have k+1 elements, representing
#'	the number of levels of the k factors and the number of replications. The factors must
#'	be entered in the same order as they appear in the R model. This order is not always
#'	obvious (R rearranges terms), so looking at \code{attr(terms(formula),"factors")}
#'	to see the order of rows can be helpful.
#'
#'	Contributions to EMS
#'	from random effects are shown as "V[effect]", meaning the variance component for that
#'	effect. Contributions from fixed effects are shown as "Q[effect]", meaning the sum of
#'	the squared effects divided by degrees of freedom for the effect (a variance of a sort).
#'	For example, for a two-factor interaction of factors with a and b levels, Q would
#'	be the sum of the ab squared effects divided by (a-1)(b-1). This calculation should
#'	also be used when specifying the
#'	"representative element" for a non-null effect in \code{mixed.power} via the \code{element}
#'	argument.
#'
#'	Interactions such as a:b are not valid names in R, so you will need to quote the name
#'	when creating the argument for \code{elements}. For example, \code{elements = list(a=1, b=2, "a:b"=6, 
#'	Error=10)}.
#'
#' @author Gary W. Oehlert \email{gary@umn.edu}
#'
#' @examples
#'  # These examples are for three-factor models with factors A, B, and C having
#'  # 3, 5, and 7 levels respectively. There are n=2 replications at each ABC
#'  # combination.
#'  #
#'  # EMS for fully crossed model with A and B random.
#'  mixed.ems(~A*B*C,levels=c(3,5,7,2),random=c("A","B")) # restricted is default
#'  mixed.ems(~A*B*C,levels=c(3,5,7,2),random=c("A","B"),restricted=FALSE)
#'  mixed.ems(~A*B*C,levels=c(3,5,7,2),random=c("A","B"),grid=TRUE) # return grid form
#'  # nest B in A
#'  mixed.ems(~(A/B)*C,levels=c(3,5,7,2),random=c("A","B"))
#'  # F tests for test models
#'  mixed.tests(~A*B*C,levels=c(3,5,7,2),random=c("A","B")) # restricted is default
#'  mixed.tests(~A*B*C,levels=c(3,5,7,2),random=c("A","B"),restricted=FALSE)
#'  mixed.tests(~(A/B)*C,levels=c(3,5,7,2),random=c("A","B"))
#'  # Hasse diagrams
#'  mixed.hasse(~A*B*C,levels=c(3,5,7,2),random=c("A","B"))
#'  # nest B in A
#'  mixed.hasse(~(A/B)*C,levels=c(3,5,7,2),random=c("A","B"))
#'  # just the skeleton diagram
#'  mixed.hasse(~(A/B)*C,levels=c(3,5,7,2),random=c("A","B"),
#'    show.sub=FALSE,show.super=FALSE)
#'  # power
#'  mixed.power(~A*B*C,levels=c(3,5,7,2),random=c("A","B"),
#'     elements=list(A=2,C=1,Error=5))
#'  # AC variability reduces power for A and C
#'  mixed.power(~A*B*C,levels=c(3,5,7,2),random=c("A","B"),
#'     elements=list(A=2,C=1,"A:C"=2,Error=5))
#'
#' @name MixedTools
NULL



#' @importFrom utils head
mixed.core <- function(formula,levels,random=NULL,...) {
	formula <- as.formula(formula)
	if(length(formula) != 2) {
		stop("formula must be a one-sided formula")
	}
	term.matrix <- attr(terms(formula),"factors")
	factor.names <- c(rownames(term.matrix),"Error")
	term.names <- c("Intercept",colnames(term.matrix),"Error")
	term.matrix <- cbind(0,term.matrix,1)
	term.matrix <- rbind(term.matrix,0)
	term.matrix[length(term.matrix)] <- 1
	colnames(term.matrix) <- term.names
	rownames(term.matrix) <- factor.names
	
	presence.matrix <- 1*(term.matrix > 0)
	n.factors <- nrow(term.matrix)
	n.terms <- ncol(term.matrix)
	term.layers <- apply(presence.matrix,2,sum)
	
	if(length(levels) != n.factors) {
		stop("'levels' must have length equal to the number of variables in the model.")
	}
	#if(min(levels) < 2) stop("Only factors are allowed, not variates.")
	N <- prod(levels)
	
	term.levels <- rep(1,n.terms)
	for(i in 2:n.terms) {
		term.levels[i] <- prod(levels[presence.matrix[,i]>0])
	}
	
	first.appearance <- rep(0,n.factors)
	for(i in 1:n.factors) {
		first.appearance[i] <- which(presence.matrix[i,] > 0)[1]
	}
	# a term can introduce at most one new factor
	if(length(unique(first.appearance)) < n.factors) stop("A term can introduce at most one new factor")
	
	# if a variable first appears intereacted with other variables, then the new term must always appear
	# interacted with those variables.
	for(i in 1:n.factors) {
		if(sum(presence.matrix[,first.appearance[i]]) == 1) next
		tmp <- presence.matrix[ presence.matrix[,first.appearance[i]]>0,which(presence.matrix[i,] > 0)]
		if(sum(tmp < 1) > 0) {
			stop("If a variable first appears intereacted with other variables, then the new variable must always appear interacted with those other variables.")
		}
	}
	
	
	row.above.col <- matrix(0,n.terms,n.terms)
	colnames(row.above.col) <- term.names
	rownames(row.above.col) <- term.names
	row.above.col[1,-1] <- 1 # for intercept
	for(i in 2:n.terms) {
		tmp <-  apply(matrix(presence.matrix[ presence.matrix[,i] > 0,],nrow=sum(presence.matrix[,i])),2,FUN=prod)
		row.above.col[i,tmp>0] <- 1
		row.above.col[i,i] <- 0
	}
	
	# this matrix determines "lines" in Hasse diagram
	row.directly.above.col <- row.above.col
	for(i in 1:n.terms) {
		for(j in 1:n.terms) {
			for(k in 1:n.terms) {
				# if i is above k, and k is above j, remove i above j link
				if(row.above.col[i,k] && row.above.col[k,j]) row.directly.above.col[i,j] <- 0
			}
		}
	}
	
	random.vars <- rep(FALSE,n.factors)
	if(!is.null(random)) {
		tmp <- match(random,factor.names,NA)
		if(sum(is.na(tmp)) > 0) stop("name in 'random' does not match a factor in the formula")
		random.vars[tmp] <- TRUE
	}
	random.vars[n.factors] <- TRUE # error
	
	random.terms <- rep(FALSE,n.terms)
	tmp <- matrix(presence.matrix[random.vars,],ncol=n.terms)
	if(length(tmp)>0) {
		random.terms[apply(tmp,2,sum) > 0] <- TRUE
	}
	
	# need to fix term labels now
	for(i in 1:n.factors) {
		combined <- which(presence.matrix[,first.appearance[i]]>0)
		if(length(combined) < 2) next
		combined <- combined.k <- head(combined,-1)
		combined <- paste0(factor.names[combined],":")
		for(j in i:n.terms) {
			if(presence.matrix[i,j] < 1) next
			tn <- term.names[j]
			for(k in combined) {
				tn <- gsub(k,"",tn)
			}
			term.names[j] <- tn
			presence.matrix[combined.k,j] <- 0
		}
	}
	colnames(presence.matrix) <- term.names
	
	
	term.df <- term.levels
	for(i in 2:n.terms) {
		for(j in 1:n.terms) {
			if(row.above.col[j,i] > 0) term.df[i] <- term.df[i] - term.df[j]
		}
	}
	
	return(list(presence.matrix=presence.matrix,row.above.col=row.above.col,
		row.directly.above.col=row.directly.above.col,random.vars=random.vars,
		random.terms=random.terms,term.levels=term.levels,N=N,term.layers=term.layers,
		n.terms=n.terms,n.factors=n.factors,term.df=term.df))
}

#' @aliases ems
#' @rdname MixedTools
#' @export
mixed.ems <- function(formula,levels,random=NULL,restricted=TRUE,grid=FALSE,...) {
	core.out <- mixed.core(formula,levels,random)
	out <- NULL
	n.terms <- core.out$n.terms
	row.above.col <- core.out$row.above.col
	random.terms <- core.out$random.terms
	random.vars <- core.out$random.vars
	presence.matrix <- core.out$presence.matrix
	term.names <- colnames(presence.matrix)
	term.levels <- core.out$term.levels
	N <- core.out$N
	
	in.ems <- 0*row.above.col
	for(i in 1:n.terms) {
		this.out <- ""
		this.fixed <- presence.matrix[!random.vars,i]
		for(j in n.terms:1) {
			if(row.above.col[i,j] < 1) next
			if(!random.terms[j]) next
			test.fixed <- presence.matrix[!random.vars,j]
			new.fixed <- sum((test.fixed+this.fixed) > 0) > sum(this.fixed)
			if(restricted && new.fixed) next
			mult <- N/term.levels[j]
			in.ems[i,j] <- mult
			if(mult< 2) mult <- ""
			if(this.out != "") this.out <- paste0(this.out,"+")
			this.out <- paste0(this.out,mult,"V[",term.names[j],"]")
		}
		mult <- N/term.levels[i]
		in.ems[i,i] <- mult
		if(mult< 2) mult <- ""
		if(this.out != "") this.out <- paste0(this.out,"+")
		if(random.terms[i]) {
			this.out <- paste0(this.out,mult,"V[",term.names[i],"]")
		} else {
			this.out <- paste0(this.out,mult,"Q[",term.names[i],"]")
		}
		out <- c(out,this.out)
	}
	names(out) <- term.names
	if(grid) return(list(ems=out,in.ems=in.ems))
	out
}

#' @aliases Hasse
#' @rdname MixedTools
#' @export
mixed.hasse <- function(formula,levels,random=NULL,cex=1,vert.off=.2,lwd=1,xeps=.1,
		max.depth=10,show.super=TRUE,show.sub=TRUE,alt.names=NULL,...) {
	core.out <- mixed.core(formula,levels,random)

	n.terms <- core.out$n.terms
	row.above.col <- core.out$row.above.col
	row.directly.above.col <- core.out$row.directly.above.col
	random.terms <- core.out$random.terms
	random.vars <- core.out$random.vars
	presence.matrix <- core.out$presence.matrix
	term.names <- colnames(presence.matrix)
	term.levels <- core.out$term.levels
	term.layers <- core.out$term.layers
	term.df <- core.out$term.df
	N <- core.out$N
	
	layer.cts <- table(term.layers)
	
	max.n.this.group <- 0
	for(depth in sort(unique(term.layers))) {
		this.group <- which(term.layers == depth)
		n.this.group <-length(this.group)
		max.n.this.group <- max(max.n.this.group,n.this.group)
	}
	x.step <- (1-2*xeps)/(max.n.this.group-1)
	if(max.n.this.group==1) x.step <- 0

	
	x.pos <- y.pos <- rep(0,n.terms)
	plot(c(0,1),c(0,-max(term.layers+1)),type='n',xaxt='n',yaxt='n',xlab="",ylab="",bty='n',xlim=c(0,1))
	for(depth in sort(unique(term.layers))) {
		if(depth >  max.depth) next
		this.group <- which(term.layers == depth)
		n.this.group <-length(this.group)
		x <- 1
		x.ctr <- (n.this.group+1)/2
		for(i in this.group) {
			this.name <- term.names[i]
			if(is.list(alt.names)) {
			  if((this.alt <- match(this.name,names(alt.names),nomatch=0)) > 0) {
			    this.name <- alt.names[[this.alt]]
			  }
			}
			if(random.terms[i]) this.name <- paste0("(",this.name,")")
			x.pos[i] <- .5+(x-x.ctr)*x.step
			y.pos[i] <- -term.layers[i]-.5
			if(show.super && show.sub) {
				label <- substitute(name[df]^lev,list(name=this.name,df=term.df[i],lev=term.levels[i]))
			}
			if(show.super && !show.sub) {
				label <- substitute(name^lev,list(name=this.name,lev=term.levels[i]))
			}
			if(!show.super && show.sub) {
				label <- substitute(name[df],list(name=this.name,df=term.df[i]))
			}
			if(!show.super && !show.sub) {
				label <- substitute(name,list(name=this.name))
			}
			text(x.pos[i],y.pos[i],label,cex=cex)
			x <- x+1
		}
	}
	
	for(i in 1:n.terms) {
		for(j in 1:n.terms) {
			if(term.layers[j] > max.depth) next
			if(row.directly.above.col[i,j]) {
				lines(x.pos[c(i,j)],c(y.pos[i]-vert.off,y.pos[j]+vert.off),lwd=lwd)
			}
		}
	}
	
}
	
#' @rdname MixedTools
#' @export
mixed.tests <- function(formula,levels,random=NULL,restricted=TRUE,grid=FALSE,...) {
	core.out <- mixed.core(formula,levels,random)
	out <- NULL
	n.terms <- core.out$n.terms
	row.above.col <- core.out$row.above.col
	random.terms <- core.out$random.terms
	random.vars <- core.out$random.vars
	presence.matrix <- core.out$presence.matrix
	term.names <- colnames(presence.matrix)
	term.levels <- core.out$term.levels
	N <- core.out$N
	
	in.ems <- mixed.ems(formula,levels,random,restricted,grid=TRUE)$in.ems
	#in.ems[i,j] gives multiplier for var term j in ems for term i
	tin.ems <- t(in.ems)
	tests <- 0*in.ems
	for(i in 1:(n.terms-1)) {
		tmpy <- -tin.ems[,i]
		tmpy[i] <- 0
		out <- lm(tmpy~tin.ems-1)
		tests[i,] <- round(coef(out))
		tests[i,i] <- 1
	}
	tests <- tests[-nrow(tests),]
	cnames <- colnames(tests)
	
	ratios <- NULL
	for(i in 1:nrow(tests)) {
		num <- paste0("MS[",cnames[tests[i,]>0],"]",collapse="+")
		den <- paste0("MS[",cnames[tests[i,]<0],"]",collapse="+")
		if(sum(abs(tests[i,]))>2) {
			num <- paste0("(",num,")")
			den <- paste0("(",den,")")
		}
		ratios <- c(ratios,paste(num,den,sep="/"))
	}
	names(ratios) <- rownames(tests)
	if(grid) return(list(tests=ratios,test.grid=tests))
	return(ratios)
}

#' @aliases power
#' @rdname MixedTools
#' @importFrom utils head
#' @export
mixed.power <- function(formula,levels,elements,random=NULL,restricted=TRUE,alpha=.05,...) {
	core.out <- mixed.core(formula,levels,random)
	out <- NULL
	n.terms <- core.out$n.terms
	row.above.col <- core.out$row.above.col
	random.terms <- core.out$random.terms
	random.vars <- core.out$random.vars
	presence.matrix <- core.out$presence.matrix
	term.names <- colnames(presence.matrix)
	term.levels <- core.out$term.levels
	term.df <- core.out$term.df
	N <- core.out$N
	ems.grid <- mixed.ems(formula,levels,random,restricted,grid=TRUE)$in.ems
	# i,j is multiplier of element j in ems i
	test.grid <- mixed.tests(formula,levels,random,restricted,grid=TRUE)$test.grid
	# i,j is +1 if term j in numerator for test of term i, -1 if denominator
	
	term.ele <- term.ev <- 0*test.grid[1,]
	nms <- names(elements)
	for(i in nms) {
		term.ele[match(i,term.names)] <- elements[[i]]
	}
	term.ev <- apply(term.ele*t(ems.grid),2,sum)
	
	pow <- num.ev <- den.ev <- num.df <- den.df <- rep(0,nrow(test.grid))
	
	for(i in 1:nrow(test.grid)) {
		num.terms <- which(test.grid[i,] > 0)
		num.ev[i] <- sum(term.ev[num.terms])
		num.df[i] <- num.ev[i]^2/sum(term.ev[num.terms]^2/term.df[num.terms])
		den.terms <- which(test.grid[i,] < 0)
		den.ev[i] <- sum(term.ev[den.terms])
		den.df[i] <- den.ev[i]^2/sum(term.ev[den.terms]^2/term.df[den.terms])
		if(random.terms[i]) {
			pow[i] <- pf(den.ev[i]/num.ev[i]*qf(1-alpha,num.df[i],den.df[i]) ,num.df[i],den.df[i],lower.tail=FALSE)
		} else {
			ncp <- term.ele[i]*term.df[i]*ems.grid[i,i]/den.ev[i]
			pow[i] <- pf(qf(1-alpha,num.df[i],den.df[i]),num.df[i],den.df[i],ncp,lower.tail=FALSE)
		}
	}
	data.frame(term=rownames(test.grid),num.ev=num.ev,den.ev=den.ev,num.df=round(num.df,1),
		den.df=round(den.df,1),power=round(pow,2))
	out <- cbind(num.ev,den.ev,round(num.df,1),round(den.df,1),round(pow,2))
	rownames(out) <- head(term.names,-1);#rownames(test.grid)
	colnames(out) <- c("num.ev","den.ev","num.df","den.df","power")
	out
}
