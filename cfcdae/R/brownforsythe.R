#' Brown-Forsythe modified F-test
#'
#' Brown-Forsythe alternative to ANOVA with heteroskedastic errors
#'
#' @aliases brown.forsythe.test
#'
#' @param formula A two-sided model formula with a single (factor) predictor.
#' @param data An optional data frame.
#'
#' @return A list of class "htest" with components statistic (the modified F-test),
#'	parameter (the numerator and modified denominator degrees of freedom),
#'	p.value, method (a character string mentioning Brown-Forsythe),
#'	and data.name (a character string naming the response and predictor
#'	variables).
#'
#' @details The Brown-Forsythe test is a modified F-test for testing
#'	equality of means in a one-way classification when there may be
#'	unequal variances.  It takes the form of a modifed F-statistic,
#'	which is the usual sum of squares between treatments divided by
#'	a weighted linear combination of within group variances.  The
#'	degrees of freedom are the usual numerator degrees of freedom and
#'	a modified denominator degrees of freedom.
#'	
#'	\code{\link[stats:oneway.test]{oneway.test()}} serves a similar purpose,
#'	but uses a different adjustment for non-constant variance.
#'	
#' @seealso \code{\link[stats:oneway.test]{oneway.test()}}
#'
#' @examples
#' data(ResinLifetimes)
#' brown.forsythe.test(Time~temp,data=ResinLifetimes)
#' oneway.test(Time~temp,data=ResinLifetimes) # alternative in R base
#'
#' @export
brown.forsythe.test <-
function (formula, data) 
{
# this function is based on the oneway.test function in the stats library
# but uses a different adjustment for non-constant variance
    if (missing(formula) || !inherits(formula,"formula") )
        stop("'formula' missing or incorrect")
    dp <- as.character(formula)
    if (length(dp) != 3) 
        stop("a two-sided formula is required")
    DNAME <- paste(dp[[2L]], "and", dp[[3L]])
    m <- match.call(expand.dots = FALSE)
    if (is.matrix(eval(m$data, parent.frame()))) 
        m$data <- as.data.frame(data)
    m$var.equal <- NULL
    m[[1L]] <- as.name("model.frame")
    mf <- eval(m, parent.frame())
    response <- attr(attr(mf, "terms"), "response")
    y <- mf[[response]]
    if (length(mf[-response]) > 1) 
        g <- factor(do.call("interaction", mf[-response]))
    else g <- factor(mf[[-response]])
    k <- nlevels(g)
    if (k < 2) 
        stop("not enough groups")
    n.i <- tapply(y, g, length)
    if (any(n.i < 2)) 
        stop("not enough observations")
    m.i <- tapply(y, g, mean)
    v.i <- tapply(y, g, var)
    N <- sum(n.i)

    grand.mean <- sum(n.i*m.i)/N
    numSS <- sum(n.i*(m.i-grand.mean)^2)
    d.i <- v.i*(1-n.i/N)

    BFF <- numSS/sum(d.i)
    numdf <- k-1
    denomdf <- sum(d.i)^2/(sum(d.i^2/(n.i-1)))

    STATISTIC <- BFF
    PARAMETER <- c(numdf, denomdf)
    PVAL <- pf(STATISTIC,numdf,denomdf,lower.tail=FALSE)
    METHOD <- "One-way analysis of means, Brown-Forsythe (unequal variances)"

    names(STATISTIC) <- "F"
    names(PARAMETER) <- c("num df", "denom df")
    RVAL <- list(statistic = STATISTIC, parameter = PARAMETER, 
        p.value = PVAL, method = METHOD, data.name = DNAME)
    class(RVAL) <- "htest"
    RVAL
}
