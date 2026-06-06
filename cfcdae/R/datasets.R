#' Bacterial counts in abused milk
#'
#' @description Eight 1-gallon containers of raw milk are obtained from a dairy
#'	and are assigned at random to four abuse treatments, two containers
#'	per treatment.  Abuse consists of keeping the milk at 25C for
#'	a period of time; the four abuse treatments are
#'	four randomly selected durations between 1 and 18 hours.
#'	After abuse, each gallon is split into five equal portions and frozen.
#'
#'	We have selected five contract laboratories at random from those
#'	available in the state.  For each gallon, the five portions are
#'	randomly assigned to the five laboratories.  The eight portions
#'	for a given laboratory are then placed in an insulated shipping
#'	container cooled with dry ice and shipped.  Each
#'	laboratory is asked to provide duplicate counts of bacteria in
#'	each milk portion.  Response is bacteria counts per ul
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe of 80 observations on four variables.
#'	\describe{
#'	\item{\code{sample}}{A factor indicating the sample used.}
#'	\item{\code{abuse}}{A factor indicating the abuse level (time) used.}
#'	\item{\code{lab}}{A factor indicating the lab making the count.}
#'	\item{\code{count}}{The count of bacteria per ul.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"AbusedMilk"

#' Area of air cells in expanded/extruded wheat
#'
#' @description Expanded/extruded wheat flours (think breakfast cereals or
#' cheese puffs) have air cells that vary
#' in size, and the size may depend on the variety of wheat
#' used to make the flour, the location where the wheat was
#' grown, and the temperature at which the flour was extruded.
#' An experiment has been conducted to assess these
#' factors.  The first factor is the variety of wheat used
#' (Butte 86, 2371,  or Grandin).  The second factor is the
#' growth location (MN or ND).  The third factor is the
#' temperature of the extrusion (120 C or 180 C).  The response
#' is the area in mm^2 of the air cells
#'
#'	Source: Oehlert (2022), originally from Sutheerawattananonda (1994).
#'
#' @format A dataframe of 30 observations on five variables.
#'	\describe{
#'	\item{\code{var}}{Factor indicating the variety of wheat.}
#'	\item{\code{loc}}{Factor indicating the location where the wheat was grown.}
#'	\item{\code{temp.z}}{The temperature of the extrusion.}
#'	\item{\code{temp}}{A factor version of the temperature.}
#'	\item{\code{area}}{The area of the air cells.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Sutheerawattananonda, M. (1994) "Variation in physical properties and
#'	microstructure of extruded wheat flours," Master's thesis, University of
#'	Minnesota, St. Paul, MN.
"AirCells"

#' Leaf bending angles
#'
#' @description Leaves of plants in the genus Albizia will fold and unfold
#'	depending on light conditions. Fifteen different leaves were exposed to
#'	red light for three minutes. The leaves were randomly assigned to one of
#'	three delays (30, 45, or 60 minutes). After the delay, the angle of the
#'	leaves was measured (in degrees).
#'
#'	Source: Oehlert (2022), originally from W. Hughes (pers com).
#'
#' @format A dataframe of 15 observations on three variables.
#'	\describe{
#'	\item{\code{delay.z}}{Delay before measuring, in minutes.}
#'	\item{\code{angle}}{Angle of the leaves, in degrees.}
#'	\item{\code{delay}}{A factor version of \code{delay.z}.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Albizia"

#' Amylase in sprouting maize
#'
#' @description Two varieties of sprouting maize (B73 or Oh43) are grown under one of two
#' different temperature (25 or 13 degrees C) and are analyzed for
#'	amylase activity under one of eight different temperatures
#'	(40, 35, 30, 25, 20, 15, 13, and 10 degrees C). Ninety-six
#'	different runs are randomized to these 32 combinations, three runs
#'	per combination. The response is the amylase activity in
#'	International Units.
#'
#'	Source: Oehlert (2022), originally from Orman (1986).
#'
#' @format A dataframe of 96 observations on six variables.
#'	\describe{
#'	\item{\code{aTemp.z}}{The analysis temperature.}
#'	\item{\code{aTemp}}{A factor version of the analysis temperature.}
#'	\item{\code{gTemp.z}}{The growth temperature.}
#'	\item{\code{gTemp}}{A factor version of the growth temperature.}
#'	\item{\code{variety}}{The variety of the maize.}
#'	\item{\code{amylase}}{The amylase activity.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Orman, B. A. (1986) "Maize germination and seedling growth at suboptimal temperatures,"
#'	Master's Thesis, University of Minnesota, St. Paul.
"AmylaseActivity"

#' Cells Surviving after Antibiotics
#'
#' @description Nine wells on a plate are seeded with HEK293 cells
#'	and then randomly assigned to the factor/level combinations of puromycin at 
#' 	0, 2, and 4 ug/mL (suggested concentration is 2) and hygromycin at 0, 150,
#'	and 300 ug/mL (suggested concentration is 200). The plate is incubated and
#'	the surviving cells are counted. This is repeated two more times on
#'	two more plates.
#'
#'	Source: Oehlert (2022), from Min Lu, pers. comm.
#'
#' @format A data frame for 27 observations on six variables.
#'	\describe{
#'	\item{\code{plate}}{A factor indicating the plate (replication).}
#'	\item{\code{Hygro}}{A factor indicating the level of Hygromycin.}
#'	\item{\code{Hygro.z}}{A numeric variable indicating the level of Hygromycin (ug/mL).}
#'	\item{\code{Puro}}{A factor indicating the level of Puromycin.}
#'	\item{\code{Puro.z}}{A numeric variable indicating the level of Puroomycin (ug/mL).}
#'	\item{\code{Density}}{The number of live cells (cells/mL).}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Antibiotics"

#' Memory errors under anxiety and tension
#'
#' @description Twelve subjects are assigned to one of four anxiety-tension combinations
#' at random.  The low-anxiety group is told that they will be awarded $5 for
#' participation and $10 if they remember sufficiently accurately, and the
#' high-anxiety group is told that they will be awarded $5 for participation
#' and $100 if they remember sufficiently accurately.  Everyone must squeeze
#' a spring-loaded grip to keep a buzzer from sounding during the testing
#' period.  The high-tension group
#' must squeeze against a stronger spring than the low-tension group.  All
#' subjects then perform four memory trials in random order,
#' testing four different types of memory.
#' The response is the number of errors on each memory trial.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe of 48 observations on five variables.
#'	\describe{
#'	\item{\code{anxiety}}{A factor indicating the anxiety level.}
#'	\item{\code{tension}}{A factor indicating the tension level.}
#'	\item{\code{type}}{A factor indicating the memory type.}
#'	\item{\code{subject}}{A factor indicating the subject (labelled 1-12).}
#'	\item{\code{errors}}{The number of memory errors.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Anxiety"


#' Elastic modulus of latex tubing after autoclaving
#'
#' @description This experiment examines the effects of autoclaving
#' on the elastic modulus (in kPa) of the latex.  The adjustable
#' factors for the autoclave are the temperature (121 C or 135 C)
#' and the time (10 minutes or 20 minutes).  We look at five
#' treatments:
#' Control (no autoclaving), low temperature/low time, low temperature/high time,
#'	high temperature/low time, and high temperature/high time. The
#'	response is the modulus of elasticity.
#'
#'	Source: Oehlert (2022), data from Z. Syedain (pers. comm.).
#'
#' @format A dataframe of 15 observations on two variables.
#'	\describe{
#'	\item{\code{treatment}}{A factor indicating the treatment used.}
#'	\item{\code{modulus}}{The modulus of elasticity (kPa).}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Autoclaving"

#' Scores on bank examiner exams.
#'
#' @description Part of the
#' certification process for bank examiners involves a "work basket" of
#' tasks that the examinee must complete in a satisfactory fashion in a
#' fixed time period.  New work baskets must be constructed for each round
#' of examinations, and much effort is expended to make the workbaskets
#' comparable (in terms of average score) from exam to exam.  This year,
#' two new work baskets (A and B) are being evaluated.  We have three old
#' work baskets (C, D, and E) to form a basis for comparison.  We have ten
#' paid examinees (1 through 6 are certified bank examiners, 7 through 9
#' are noncertified bank examiners nearing the end of their training, and 10
#' is a public accountant with no bank examining experience or training) who
#' will each take all five tests.
#' There are five graders who will each grade ten exams.
#' Randomization was done so that each
#' examinee took each exam and each grader grades two of each exam.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe of 50 observations on four variables.
#'	\describe{
#'	\item{\code{student}}{Factor indicating the student taking the exam.}
#'	\item{\code{grader}}{Factor indicating the grader of the exam.}
#'	\item{\code{exam}}{Factor indicating the exam form (the workbasket).}
#'	\item{\code{score}}{The grade the student was awarded for the exam.}
#'	}
#'
#' @references
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"BankExaminers"

#' Grading the writing basic skills test.
#'
#' @description The State Board of Education has adopted basic skills tests
#' for high school graduation; one of these is a writing test.
#' The student writing samples are graded by professional graders,
#' and the board is taking some care to be sure that the graders
#' are grading to the same standard.  We examine grader differences
#' with the following experiment.  There are 25 graders.  We
#' select 30 writing samples at random; each writing sample will be
#' graded by five graders.  Thus each grader will grade six samples,
#' and each pair of graders will have a test in common. The response
#' is the grade, or score, given each exam by each grader.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe of 150 observations on three variables.
#'	\describe{
#'	\item{\code{exam}}{Factor indicating the exam being graded.}
#'	\item{\code{grader}}{Factor indicating the grader of the exam.}
#'	\item{\code{score}}{The grade the student was awarded for the exam.}
#'	}
#'
#' @references
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"BasicSkills"

#' Beer retained in mouth after expectoration.
#'
#' @description As part of a larger experiment, researchers are looking
#'	at the amount of beer that remains in the mouth after expectoration.
#'	Ten subjects will repeat the experiment on two separate days.
#'	Each subject will place 10 ml or 20 ml of beer in his or her mouth
#'	for five seconds, and then expectorate the beer.  The beer has
#'	a dye, so the amount of expectorated beer can be determined,
#'	and thus the amount of beer retained in the mouth (in ml).
#'
#'	Source: Oehlert (2022), originally from Brefort, Buinard, and Lewis (1989).
#'
#' @format A dataframe of 40 observations on five variables.
#'	\describe{
#'	\item{\code{ml.z}}{The ml of the sample.}
#'	\item{\code{ml}}{A factor version of ml.z.}
#'	\item{\code{subject}}{A factor indicating the subject.}
#'	\item{\code{day}}{A factor indicating the day.}
#'	\item{\code{retained}}{The amount of beer retained in the mouth (in ml).}
#'	}
#'
#' @references
#' Brefort, H., Guinard, J. X., and Lewis, M. J. (1989). "The contribution of dextrins
#'	of beer sensory properties, part II Aftertaste." \emph{Journal of the
#'	Institute of Brewing} \strong{95}, 431-435.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Beer"


#' Viability of big sagebrush seeds
#'
#' @description Big sagebrush is often planted in range restoration
#' projects.  An experiment is performed to determine
#' the effects of storage length and relative humidity
#' on the viability of seeds.  Sixty-three batches of
#' 300 seeds each are randomly divided into 21 groups
#' of three.  These 21 groups each receive a different
#' treatment, namely the combinations of storage
#' length (0, 60, 120, 180, 240, 300, or 360 days) and
#' storage relative humidity (0, 32, or 45\%).  After
#' the storage time, the seeds are planted, and the
#' response is the percentage of seeds that sprout
#'
#'	Source: Oehlert (2022), originally from Welch (1996).
#'
#' @format A dataframe of 63 observations on six variables.
#'	\describe{
#'	\item{\code{storage.z}}{The days of storage.}
#'	\item{\code{storage}}{A factor version of storage.}
#'	\item{\code{humidity.z}}{The relative humidity of the storage.}
#'	\item{\code{humidity}}{A factor version of humidity.}
#'	\item{\code{viability}}{The percentage of viable seeds.}
#'	\item{\code{viable}}{The number of viable seeds (out of 300).}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Welch, B. (1996) "Effects of humidity on storing big sagebrush seed." Research Paper
#'	INT-RP-493, USDA Forest Service, Intermountain Research Station.
"BigSagebrush"

#' Bioequivalence of drugs
#'
#' @description Bioequivalence studies
#' seek to determine if
#' different drug delivery systems have similar biological
#' effects.  One variable to compare is the area under
#' the time-concentration curve.  This area is proportional to
#' the average concentration of the drug over time.
#'
#' This experiment compares three methods for delivering a drug:
#' a solution, a tablet, and a capsule.  The response is
#' the area under the time-concentration curve.  We anticipate
#' Large subject to subject differences were expected, so subject
#' was used as a block.
#' Each subject will be given the drug
#' three times, once with each of the three methods.  Because
#' the body may adapt to the drug in some way, each drug will
#' be used once in the first period, once in the second
#' period, and once in the third period.
#'
#'	Source: Oehlert (2022), originally from Selwyn and Hall (1984).
#'
#' @format A dataframe of 9 observations on four variables.
#'	\describe{
#'	\item{\code{period}}{A factor giving the time period for the observation.}
#'	\item{\code{subject}}{A factor giving the subject for the observation.}
#'	\item{\code{treatment}}{A factor giving the treatment for the observation.}
#'  \item{\code{area}}{The area under the time-concentration curve.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Selwyn, M. R. and N. R. Hall (1984). "On Bayesian methods for bioequivalence."
#' \emph{Biometrics} \strong{40}, 1103-1108.
#'
"Bioequivalence"

#' Bioequivalence of drugs (complete data set)
#'
#' @description Bioequivalence studies
#' seek to determine if
#' different drug delivery systems have similar biological
#' effects.  One variable to compare is the area under
#' the time-concentration curve.  This area is proportional to
#' the average concentration of the drug over time.
#'
#' This experiment compares three methods for delivering a drug:
#' a solution, a tablet, and a capsule.  The response is
#' the area under the time-concentration curve.  We anticipate
#' Large subject to subject differences were expected, so subject
#' was used as a block.
#' Each subject will be given the drug
#' three times, once with each of the three methods.  Because
#' the body may adapt to the drug in some way, each drug will
#' be used once in the first period, once in the second
#' period, and once in the third period.
#'
#'	Source: Oehlert (2022), originally from Selwyn and Hall (1984).
#'
#' @format A dataframe of 36 observations on four variables.
#'	\describe{
#'	\item{\code{period}}{A factor giving the time period for the observation.}
#'	\item{\code{subject}}{A factor giving the subject for the observation.}
#'	\item{\code{treatment}}{A factor giving the treatment for the observation.}
#'  \item{\code{area}}{The area under the time-concentration curve.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Selwyn, M. R. and N. R. Hall (1984). "On Bayesian methods for bioequivalence."
#' \emph{Biometrics} \strong{40}, 1103-1108.
#'
"BioequivalenceFull"

#' Weights of birch seedlings exposed to acid rain
#'
#' @description Wood and Bormann (1974) studied the effect of acid rain 
#' on trees. "Clean" precipitation has a pH in the 5.0 to 5.5 range, 
#' but observed precipitation pH in northern New Hampshire is often 
#' in the 3.0 to 4.0 range. 
#' 
#' One of their experiments used 240 six-week-old yellow birch seedlings. 
#' These seedlings were divided into five groups of 48 at random, 
#' and the seedlings within each group received an acid mist 
#' treatment 6 hours a week for 17 weeks. The five treatments 
#' differed by mist pH: 4.7, 4.0, 3.3, 3.0, and 2.3; otherwise, the 
#' seedlings were treated identically. After the 17 weeks, the 
#' seedlings were weighed, and total plant (dry) weight in grams was 
#' taken as response.  
#'
#' This data set is computer generated to match the treatment
#' means and mean square for error reported by Wood and Bormann (1974).
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe of 235 observations on three variables.
#'	\describe{
#'	\item{\code{weight}}{Weight of the seedling.}
#'	\item{\code{pH.z}}{The pH treatment (as numerical).}
#'	\item{\code{pH}}{The pH treatment (as a factor).}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Wood, T. and F. H. Bormann (1974). Effects of an artificial acid 
#' mist upon the growth of Betula alleghaninsis britt. 
#' \emph{Environmental Pollution} 7, 259–268.
#'
"BirchSeedlings"


#' Calcium in bird bones.
#'
#' @description Pollutants may reduce the strength of bird bones.  We believe
#' that the strength reduction, if present, is due to a change in the
#' bone itself, and not a change in the size of the bone.  One measure of
#' bone strength is calcium content.  We have an instrument which can
#' measure the total amount of calcium in a 1cm length of bone.  Bird
#' bones are essentially thin tubes in shape, so the total amount of
#' calcium will also depend on the diameter of the bone.
#'
#' Thirty-two chicks are divided at random into four groups.  Group 1
#' is a control group and receives a normal diet.  Each other group receives
#' a diet including a different toxin  (pesticides related to DDT).  At
#' 6 weeks, the chicks are sacrificed and the calcium content (in mg)
#' and diameter (in mm) of the right femur is measured for each chick.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe of 32 observations on three variables.
#'	\describe{
#'	\item{\code{treatment}}{A factor indicating the treatment group.}
#'	\item{\code{diameter}}{The diameter of the chick bone.}
#'	\item{\code{calcium}}{The calcium the chick bone.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"BirdBones"

#' Net weights of filled bottles.
#'
#' @description A 24-head machine fills bottles with vegetable oil.
#'	Five of the heads are chosen at random, and several consecutive
#'	bottles from these heads were taken from the line.  The data values are the actual net
#'	weight of oil in these selected bottles (in ounces).
#'
#'	Source: Oehlert (2022), originally from Swallow and Searle (1978).
#'
#' @format A dataframe of 16 observations on two variables.
#'	\describe{
#'	\item{\code{head}}{A factor indicating the filling head.}
#'	\item{\code{weight}}{The weight of oil in the bottle.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Swallow, William H. and Searle, S. R. (1978) "Minimum Variance Quadratic Unbiased Estimation (MIVQUE)
#'	of variance components." \emph{Technometrics} \strong{20}, 265-272.
"Bottles"

#' Breakage rates during shipping
#'
#' @description Synthetic data. Twenty batches of fragile items are randomly assigned to one of
#'	four shipping companies, five batches per company. The response is the percentage of items
#'	broken in each shipment.
#'
#'	Source: Oehlert (2022); synthetic data.
#'
#' @format A dataframe of 20 observations on two variables.
#'	\describe{
#'	\item{\code{company}}{A factor indicating the company used.}
#'	\item{\code{breakage}}{The percentage of broken items.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Breakage"

#' Adenine brain concentrations post caffeine treatment
#'
#' @description Caffeine may affect the ability of other compounds to cross the blood
#'	brain barrier. Forty-three rats are randomly assigned to one of eight different
#'	treatments. Each treatment consists of an arterial injection of C^14-labeled
#'	adenine together with one of eight different concentrations of caffeine (0, .1,
#'	.5, 1, 5, 10, 25, 50 mM). The response is concentration of labeled adenine in
#'	the rats' brain post injection.
#'
#'	Source: Oehlert (2022), originally from McCall, Millington, and Wurtman (1982)
#'
#' @format A dataframe of 43 observations on three variables:
#'	\describe{
#'	\item{\code{caffeine.z}}{Caffeine concentration.}
#'	\item{\code{caffeine}}{A factor version of \code{caffeine.z}, for convenience.}
#'	\item{\code{adenine}}{Adenine concentration.}
#'	}
#'
#' @references
#' Mccall, A. L, Millington, W. R., and Wurtman, R. J. (1982) "Blood-brain
#' barrier transport of caffeine: dose-related restriction of adenine transport."
#' \emph{Life Sciences} \strong{31}, 2709-2715.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"CaffeineAdenine"

#' Cake baking (first order).
#'
#' @description This is a first-order design in baking time and temperature,
#' using a 2^2 factorial with three center points.
#' The coded values -1, 0, 1 represent 33, 35, and 37 minutes for time,
#' and the coded values -1, 0, 1 for 340, 350, and 360 degrees
#' for temperature.  The response is an average palatability score,
#' with higher values being desirable.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A data frame of seven observations on three variables.
#'	\describe{
#'	\item{\code{time}}{Coded level of time treatment.}
#'	\item{\code{temp}}{Coded level of temperature treatment.}
#'	\item{\code{appeal}}{The palatability of the cake.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"CakeBaking1"

#' Cake baking (second order).
#'
#' @description This is a second-order design in baking time and temperature,
#' run in two blocks.
#' The coded values -1, 0, 1 represent 33, 35, and 37 minutes for time,
#' and the coded values -1, 0, 1 for 340, 350, and 360 degrees
#' for temperature.  The response is an average palatability score,
#' with higher values being desirable. Block 1 is the same data
#' as the CakeBaking1 data set.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A data frame of 14 observations on our variables.
#'	\describe{
#'	\item{\code{block}}{Factor indicating first or second block.}
#'	\item{\code{time}}{Coded level of time treatment.}
#'	\item{\code{temp}}{Coded level of temperature treatment.}
#'	\item{\code{appeal}}{The palatability of the cake.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"CakeBaking2"

#' Cake heights and oven positions.
#'
#' @description Cakes can be baked either one at a time on the top or bottom oven rack,
#' or two at a time, with one on the top rack and one on the bottom rack.
#' We bake eight cakes, with two cake mix boxes randomly assigned to each of
#' the four treatments: top rack single, bottom rack single, top rack double,
#' bottom rack double. After the cake is baked and allowed to cool for 1 hour,
#' its height (mm) is measured at five locations, with the average of the five
#' measurements taken as the height for the cake.
#'
#'	Source: Oehlert (2022), originally from D. Schendel (pers. comm.).
#'
#' @format A data frame of eight observations on two variables.
#'	\describe{
#'	\item{\code{trt}}{Factor indicating the four treatments.}
#'	\item{\code{height}}{Height of cakes in mm.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"CakeHeights"


#' Consistency of calculus exams.
#'
#' @description Most universities teach many sections of introductory calculus,
#' and faculty are constantly looking for a method to evaluate
#' students consistently across sections.
#' Generally, all sections of intro-calculus take the final
#' exam at the same time, so a single exam is used for all sections.  An
#' exam service claims that it can supply different exams that consistently
#' evaluate students.  Some faculty doubt this claim, in part because they
#' believe that there may be an interaction between the text used and the exam used.
#'
#' Three math departments (one each at Minnesota, Washington, and Berkeley)
#' propose the following experiment.  Three random final exams are obtained
#' from the service: E1, E2, and E3.  At Minnesota, the three exams will be
#' used in random order in the fall, winter, and spring quarters.  Randomization
#' will also be done at Washington and Berkeley.  The three schools all use
#' the same two intro calculus texts.  Sections of intro calculus at each
#' school will be divided at random into two groups, with half of the sections
#' using text A and the other half using text B.  The
#' mean test scores are tallied as a response.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A data frame of 18 observations on four variables.
#'	\describe{
#'	\item{\code{school}}{A factor indicating where the observation was taken.}
#'	\item{\code{exam}}{A factor indicating where the exam form.}
#'	\item{\code{text}}{A factor indicating which textbook was used.}
#'	\item{\code{score}}{Average test score.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"CalcExams"

#' Calf count differences under control and medicated conditions
#'
#' @description Seven bulls are each bred to two herds of cows (14 total herds).
#'	For one randomly chosen herd per bull, the bull is given a drug that is supposed
#' 	to increase fertility. The response is the number of pregnant cows under the treatment
#'	condition minus the number of pregnant cows under the control condition.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A data frame of seven observations on one variable.
#'	\describe{
#'	\item{\code{differences}}{The differences in the number of pregnant cows.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"CalfCounts"

#' Pediatricians maintaining confidentiality.
#'
#' @description In a study of patient confidentiality, a large number of
#' pediatricians was surveyed.  Each pediatrician was given a "fable"
#' about a female patient less than 18 years old.  There
#' were sixteen different fables, the combinations of the factors complaint
#' (drug problem or sexually transmitted disease),
#' age (14 years or 17 years), the length of
#' time the pediatrician had known the family (less than 1 year
#' or more than 5 years), and the maturity of patient (immature for
#' age, 2 or mature for age).  The response at each combination of factor
#' levels is the fraction of doctors who would keep confidentiality
#' and not inform the patient's parents.
#'
#'	Source: Oehlert (2022), modeled on Moses (1987).
#'
#' @format A data frame of 16 observations on five variables.
#'	\describe{
#'	\item{\code{complaint}}{The complaint in the fable.}
#'	\item{\code{age}}{The age of the patient.}
#'	\item{\code{time.known}}{How long the doctor has known the family.}
#'	\item{\code{maturity}}{Maturity of the patient.}
#'	\item{\code{fraction}}{The fraction of doctors maintaining confidentiality.}
#'	}
#'
#' @references
#' Moses, L. E. (1987). "Analysis of Bernoulli data from a 2^5 design done in blocks
#'	of size four. In C. Mallows (Ed.), \emph{Design, Data, and Analysis},
#'	pp. 275-290. New York: Wiley.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"CALM"



#' Free amino acids in cheese after 168 days ripening.
#'
#' @description Nonstarter bacteria in cheese come from the environment of the
#'	cheese factory and are not added by the maker (who adds the starter bacteria).
#'	These nonstarter bacteria are throught to be crucial to cheese flavor. Nonstarter
#'	bacterial can be isolated and added under laboratory conditions. Eight cheeses
#'	will be made, and these are randomly assigned to four different nonstarter treatments:
#'	none, strain A, strain B, strains A and B. The response is the total free amino
#'	acids in the cheeese after 168 days of ripening.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A data frame of eight observations on two variables.
#'	\describe{
#'	\item{\code{strain}}{The strain(s) of nonstarter bacteria added.}
#'	\item{\code{freeAminoAcid}}{The amino acids measured after ripening.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"CheeseAminoAcid"

#' Free amino acids in cheese after 56 days ripening
#'
#' @description Nonstarter bacteria in cheese come from the environment of the
#'	cheese factory and are not added by the maker (who adds the starter bacteria).
#'	These nonstarter bacteria are throught to be crucial to cheese flavor. Nonstarter
#'	bacterial can be isolated and added under laboratory conditions. Twelve cheeses
#'	will be made, and these are randomly assigned to four different nonstarter treatments:
#'	none, R50, R21, strains R50 and R21. The response is the total free amino
#'	acids in the cheeese after 56 days of ripening.
#'
#'	Source: Oehlert (2022), data from P. Swearingen (pers. comm.).
#'
#' @format A data frame of twelve observations on three variables.
#'	\describe{
#'	\item{\code{r50}}{Factor indicating presence or absence of strain r50.}
#'	\item{\code{r21}}{Factor indicating presence or absence of strain r21.}
#'	\item{\code{freeAminoAcid}}{The amino acids measured after ripening.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"CheeseAminoAcid56"


#' Body weight of chicks taking mineral supplements
#'
#' @description Twenty-four pens of broiler chicks are randomly
#'	assigned to six treatments, the factorial combinations of
#'	calcium supplement (.5, .9, or 1.2\%) and phosphorus supplement
#'	(.25 or .5\%). The response is average body weight of chicks in a
#'	pen in grams. This data set only contains treatment means.
#'
#'	Source: Oehlert (2022), originally from Nelson et al. (1990).
#'
#' @format A dataframe of 6 observations on three variables.
#'	\describe{
#'	\item{\code{weight}}{The mean weight of chicks in grams.}
#'	\item{\code{P}}{The level of phosphorus supplement.}
#'	\item{\code{Ca}}{The level of calcium supplement.}
#'	}
#'
#' @references
#'Nelson, T. S., L. K. Kirby, and Z. B. Johnson (1990). "Effect of minerals
#' on the incidence of leg abnormalities in growing broiler chicks." \emph{Nutrition
#' Research} \strong{10}, 525-533.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"ChickBodyWeight"

#' Effect of freezing on potency of chicken semen.
#'
#' @description Artificial insemination is an important tool in agriculture,
#' but freezing semen for later use can reduce its potency
#' (ability to produce offspring).
#' Here we are trying to understand the effect of freezing
#' on the potency of chicken semen.
#' Four semen mixtures are prepared, consisting of equal
#' parts of either
#' fresh or frozen Rhode Island Red semen, and either fresh or
#' frozen White Leghorn semen.  Sixteen batches of Rhode Island Red hens
#' are assigned at random, four to each of the four treatments.
#' Each batch of hens is
#' inseminated with the appropriate mixture,
#' and the response measured is the fraction of
#' the hatching eggs that have white feathers and thus
#' White Leghorn fathers.
#'
#'	Source: Oehlert (2022), originally from Tajima (1987).
#'
#' @format A data frame of 16 observations on three variables.
#'	\describe{
#'	\item{\code{RIR}}{A factor indicating the Rhode Island Red semen is fresh or frozen.}
#'	\item{\code{WL}}{A factor indicating the White Leghorn semen is fresh or frozen.}
#'	\item{\code{fraction}}{The fraction of offspring with white feathers.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Tajima, A. (1987) \emph{Some Aspects of Preserving Checken Semen: Glycerol Effect,
#'	Assay Method, and Application} Ph. D. thesis, University of Minnesota, St. Paul, MN.
"ChickenSemen"

#' Viable cancer cells after treatment with Cisplatin.
#'
#' @description One measure of the effectiveness of cancer drugs is their
#' ability to reduce the number of viable cancer cells in
#' laboratory settings.  In this experiment, the A549 line of
#' malignant cells is plated onto petri dishes with various
#' concentrations of the drug cisplatin.  After 7 days of incubation,
#' half the petri dishes at each dose are treated with a dye, and
#' the number of viable cell colonies per 500 mm^2 is determined
#' as a response for all petri dishes.
#' The dye is supposed to make the counting machinery more specific
#' to the cancer cells.
#'
#'	Source: Oehlert (2022), after Figure 1 of Alley, et al. (1982).
#'
#' @format A data frame of 12 observations on four variables.
#'	\describe{
#'	\item{\code{Cisplatin.z}}{The concentration of Cisplatin.}
#'	\item{\code{Cisplatin}}{A factor version of \code{Cisplatin.z}.}
#'	\item{\code{type}}{A factor indicating whether dye was added.}
#'	\item{\code{count}}{The count of cells.}
#'	}
#'
#' @references
#' Alley, M. C., C. B. Uhl, and M. N. Lieber (1982). "Improved detection of drug
#'	cytotoxicity in the soft agar colony formation assay through use of a
#'	metabolizable tetrazolium salt," \emph{Life Sciences} \strong{31}, 3071-3078.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Cisplatin"



#' Save/restore time for cloud file backup
#'
#' @description A synthetic dataset giving the time in seconds to
#'	save a file to an online backup service and then recover it.
#'	There are three cloud backup services tested.
#'
#'	The data are listed in temporal order.
#'
#'	Source: Oehlert (2022)
#'
#' @format A dataframe of 30 observations on two variables.
#'	\describe{
#'	\item{\code{service}}{A factor with levels 1, 2, and 3 indicating the
#'	backup service tested.}
#'	\item{\code{updowntime}}{The time in seconds to upload a 100MB file to
#'	a remote backup server and then download it back again.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"CloudBackup"


#' Rainfall in cloud seeding experiment
#'
#' @description Rainfall in acre-feet from 52 clouds, 26 of which
#'	were seeded with silver oxide.
#'
#'	Source: Oehlert (2022), originally from Simpson, Olsen, and Eden (1975).
#'
#' @format A dataframe of 52 observations on two variables.
#'	\describe{
#'	\item{\code{seeding}}{A factor with two levels: nonseeded and seeded.}
#'	\item{\code{rainfall}}{Rainfall amounts in acre feet.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Simpson, J. A., A. Olsen, and J. C. Eden (1975). "A Bayesian analysis of a multiplicative
#'	treatment effect in weather modification." \emph{Technometrics} \strong{17}, 161-166.
#'
"CloudSeeding"

#' ATPase activity in chlordane-treated cockroaches
#'
#' @description The coxal muscles from
#' one meso- and one metathoracic leg on opposite sides were
#' surgically extracted from each of six roaches. The roaches were
#' then treated with 50 micrograms of alpha-chlordane,
#' and coxal muscles from the two remaining meso- and metathoracic legs
#' were removed about two hours after treatment.
#' The response is the percentage change in the Na-K-ATPase activity in the muscles.
#'
#'	Source: Oehlert (2022), originally from Chu (1970).
#'
#' @format A dataframe of 6 observations on one variable.
#'	\describe{
#'	\item{\code{pctchange}}{Change in activity.}
#'	}
#'
#' @references
#' Chu, Y. C. (1970). "Comparison of \emph{in vivo} and \emph{in vitro} inhibition
#' of ATPases by the insecticide Chlordane. Master's thesis, University of Minnesota,
#' St. Paul, MN.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Cockroaches"

#' CO Emissions of a gasoline engine under various conditions
#'
#' @description An experiment is performed to determine how a gasoline
#' engine responds to various factors.  The response of interest
#' is CO emissions in grams per hour.  The design factors are
#' engine load, in Newton meters, range (30,70);
#' engine speed, in rpm, range (1000, 4000);
#' spark advance, in degrees, range (10, 30);
#' air-to-fuel ratio, dimensionless, range (13, 16.4);
#' and exhaust gas recycle, in percent, range (0, 10).
#' The experimental design has 46 observations in two blocks
#' of 23 each.
#' The design factors have been coded to the range (-1, 1).
#'
#'	Source: Oehlert (2022), originally from Chu (1970).
#'
#' @format A dataframe of 46 observations on seven variables.
#'	\describe{
#'	\item{\code{load}}{Coded value of engine load.}
#'	\item{\code{speed}}{Coded value of engine speed.}
#'	\item{\code{advance}}{Coded value of spark advance.}
#'	\item{\code{ratio}}{Coded value of air/fuel ratio.}
#'	\item{\code{recycle}}{Coded value of exhaust gas recycle.}
#'	\item{\code{block}}{The block of the observatoin.}
#'	\item{\code{emissions}}{CO emissions.}
#'	}
#'
#' @references
#' Draper, N. R., T. P. Davis, L. Pozueta, and D. M. Grove (1994). "Isolation
#' of degrees of freedom for Box-Behnken designs," \emph{Technometrics} \strong{36}, 283-291.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"COEmissions"

#' Faulting in jointed concrete pavements
#'
#' @description Faulting is a difference in height on two sides of a concrete
#' pavement joint. Many factors can influence the amount of faulting
#' as the pavement ages. This study examines four factors: the
#' thickness of the base layer (5, 10, or 15 inches), the resilience
#' of the subgrade layer (5,000, 10,000, or 20,000 psi), the ratio
#' of water to cement in the mix (.33, .42, .55), and the presence
#' of dowel pins between successive pavement slabs (yes or no).
#' The response is faulting (in inches) after a 20 year life. There
#' are two runs for each factor-level combination, resulting
#' in 108 observations.
#'
#'	These data are based on a software package that simulates the behavior
#'	of concrete (AASHTP 2002 Design Guide). In that sense, the "experiment"
#'	merely recapitulates the assumptions and equations of the model.
#'
#'	Source: Oehlert (2022), originally from N. Funk (pers. comm.).
#'
#' @format A dataframe with 108 observations on eight variables.
#'	\describe{
#'	\item{\code{base.z}}{The thickness of the base in inches.}
#'	\item{\code{base}}{A factor version of the thickness.}
#'	\item{\code{subgrade.z}}{The resilience of the subgrade layer.}
#'	\item{\code{subgrade}}{A factor version of the subgrade resilience.}
#'	\item{\code{wcratio.z}}{The water to concrete ratio in the mix.}
#'	\item{\code{wcratio}}{A factor version of the water to concrete ratio.}
#'	\item{\code{dowels}}{The presence or absence of dowels.}
#'	\item{\code{faulting}}{The faulting.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"ConcreteFaulting"

#' Strength of concrete with embedded fibers
#'
#' @description Fifteen concrete cubes are produced, each with one of five levels of
#'	polypropylene fibers added to the mix. Fiber levels are randomly assigned to
#'	concrete batches, and the strength of the concrete (in ksi, kilopound/sq in) is
#'	measured as the response.
#'
#'	Source: Oehlert (2022), originally from Paskova and Meyer (1997).
#'
#' @format A dataframe with 15 observations on three variables.
#'	\describe{
#'	\item{\code{fiberPct.z}}{The percent fiber content.}
#'	\item{\code{fiberPct}}{The percent fiber content as a factor.}
#'	\item{\code{strength}}{Strength of the concrete cube in ksi.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Paskova, T. and C. Meyer (1997). "Low-cycle fatigue of plain and fiber-reinforced
#'	concrete. \emph{ACI Materials Journal} \strong{94}, 273-285.
"ConcreteStrength"

#' Cookie texture over time
#'
#' @description Two-hundred twenty cookies are baked.  Half of them are
#' made with a control recipe, while the other half include some
#' raffinose.  The 110 cookies of each recipe are then
#' randomly divided into 11 groups of ten each.  Each group of
#' 10 is put in a plastic bag.  On the next day, one bag is
#' chosen at random from each recipe, and the 10 cookies in that
#' bag are measured for texture.  The texture measurement is
#' the force required to push a 1.27 cm diameter probe into the
#' cookie.  This is repeated on each successive day until the last
#' bag of cookies has been measured on day 11.
#'
#'	Source: Oehlert (2022) synthetic data.
#'
#' @format A dataframe of 220 observations on four variables.
#'	\describe{
#'	\item{\code{day.z}}{The day the cookie was measured.}
#'	\item{\code{day}}{A factor version of \code{day.z}.}
#'	\item{\code{recipe}}{A factor variable giving the recipe used for this cookie.}
#'	\item{\code{texture}}{The texture of the cookie, as measured by force.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"CookieTexture"

#' Copepoda counts after simulated snowmelt
#'
#' @description Copepoda are small crustaceans, some of which live in fresh water.
#'	Six samples of wetland soil were subjected to an artificial snowmelt, with three
#'	randomly chosen for neutral pH snowmelt and the other three receiving a reduced pH.
#'	The response is the number of Copepoda removed from each microcosm in the 14 days
#'	post snow melt.
#'
#'	Source: Oehlert (2022), originally from Dale (1992).
#'
#' @format A data frame of six observations on two variables.
#'	\describe{
#'	\item{\code{pH}}{A factor indicating reduced or neutral pH.}
#'	\item{\code{count}}{The count of Copepoda.}
#'	}
#'
#' @references
#' Dale, T. B. (1992) "Bilogical and chemical effects of acidified snowmelt on
#' seasonal wetlands in Minnesota. Master's Thesis, University of Minnesota, St. Paul, MN.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Copepoda"


#' Removal of copper and zinc from waste water
#'
#' @description Heavy metals should be removed from the waste water
#' stream before it is released into the environment. This
#' experiment examines how five factors affect the removal
#' of zinc and copper from water via liquid-liquid extraction.
#' There are five factors under consideration:
#' pH of initial solution (4.5 or 6.5), 
#' initial concentration of the metal (25 or 75 mg/l),
#' concentration of the extractant (5 or 10 \% by volume),
#' medium of the solution (sulfate or chloride),
#' and stirring rate (400 or 500 rpm). The 32 factor/level
#' combinations were assigned to 32 independent runs,
#' and two responses were measured: percent removal of zinc
#' and percent removal of copper.
#'
#'	Source: Oehlert (2022), originally from Berrama et al (2013) via
#'	Lye (2019).
#'
#' @format A data frame of 32 observations on seven variables.
#'	\describe{
#'	\item{\code{pH}}{A factor indicating the pH of the reaction.}
#'	\item{\code{initial}}{A factor the initial concentration of metal (mg/l).}
#'	\item{\code{extract}}{A factor indicating the concentration of the extractant (percent by volume).}
#'	\item{\code{medium}}{A factor indicating the medium of the solution.}
#'	\item{\code{stirring}}{A factor indicating the stirring rate of the solution (rpm).}
#'	\item{\code{zinc}}{Percent removal of zinc.}
#'	\item{\code{copper}}{Percent removal of copper.}
#'	}
#'
#'
#' @references
#' Berrama, T., N. Benaouag, F. Kaouah, and Z. Bendjama (2013) "Application of full
#'  factorial design to study the simultaneous removal of copper and zinc from aqueous 
#' solution by liquid-liquid extraction," \emph{Desalination and Water Treatment} \strong{51} 2135-2145.
#'
#' Lye, Leonard M. (2019) \emph{Applications of DEO in Engineering and Science:
#'	A Collection of 2^6 Case Studies}, Leonard Lye, St. John's, Newfoundland.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"CopperZinc"


#' Anti-corrosion coatings for aluminum.
#'
#' @description Aluminum corrosion is a major issue in the aerospace industry, and
#' a great deal of work has gone into finding coatings that will prevent, or at least delay,
#' corrosion. Electrochemistry states that only the more
#' reactive of two metals will react when two joined metals are in a corrosive environment.
#' For this reason, coatings that are magnesium rich continue to be developed
#' for aluminum. These are called "sacrificial coatings," because they are
#' literally consumed while protecting the aluminum underneath.

#' This experiment compares a commercially available
#' coating to three experimental  coatings, when weathered according to two different
#' protocols for corrosive conditions (B117 or D5894),
#' maintained for four different lengths of time (0, 1, 2, or 3 weeks).
#' The three
#' experimental coatings differ in the concentration of magnesium
#' pigment: 30\%, 40\%, or 45\%. (Too high a Mg concentration can
#' degrade other desirable properties such as adhesion or durability.)

#' Sixty-four aluminum samples are randomly assigned
#' to the thirty-two combinations of coating, weathering, and time. After treatment,
#' each sample is tested for its
#' "open circuit potential" (OCP, in volts) as measured by electrochemical impedance. Lower (more negative)
#' values are better.
#'
#'	Source: Oehlert (2022), data from T. Chen (pers. comm.).
#'
#' @format A dataframe of 64 observations on five variables.
#'	\describe{
#'	\item{\code{weeks.z}}{The number of weeks of weathering.}
#'	\item{\code{weeks}}{A factor versioin of weeks.z.}
#'	\item{\code{coating}}{A factor indicating the coating used.}
#'	\item{\code{weathering}}{A factor indicating the weathering protocol.}
#'	\item{\code{ocp}}{The open circuit potential (volts).}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Corrosion"

#' Cracks in pavement.
#'
#' @description Winter road treatments to clear snow and ice can lead to cracking in
#' the pavement.
#' This experiment was conducted to compare four treatments:
#' sodium chloride, calcium chloride, a proprietary organic compound, and sand.
#' Traffic level was used as a blocking factor and a randomized complete block
#' experiment was conducted.  One observation is missing, because the
#' spreader in that district was not operating properly.  The response is new
#' cracks per mile of treated roadway
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe with 11 observations on three variables.
#'	\describe{
#'	\item{\code{block}}{Factor indicating the level of traffic.}
#'	\item{\code{treatment}}{Factor indicating the treatment applied.}
#'	\item{\code{cracks}}{The number of cracks per mile.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Cracks"

#' Comparison of dish detergent solutions.
#'
#' @description Nine different dishwashing solutions are compared.
#' The first four consist of base detergent I and 3, 2,
#' 1, and 0 parts of an additive; solutions five through
#' eight consist of base detergent II and 3, 2,
#' 1, and 0 parts of an additive; the last solution is
#' a control.  There are three washing basins and one
#' operator for each basin.  The three operators wash
#' at the same speed during each test, and the response
#' is the number of plates washed when the foam disappears.
#' The speed of washing is the same
#' for all three detergents used at any one session,
#' but could differ from session to session.
#'
#'	Source: Oehlert (2022), originally from John (1961).
#'
#' @format A dataframe with 36 observations on three variables.
#'	\describe{
#'	\item{\code{session}}{Factor indicating the washing session.}
#'	\item{\code{treat}}{Factor indicating the detergent treatment.}
#'	\item{\code{plates}}{The number of plates washed.}
#'	}
#'
#' @references
#' John, P. W. M. (1961) "An application of a balanced incomplete block
#' design," \emph{Technometrics} \strong{3}, 51-54.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"DirtyDishes"

#' Access time of disk drives.
#'
#' @description An experiment to compare the average access times of
#' five brands of half-height computer disk drives
#' (denoted A through E).  There is a block on computer
#' holding the drive, but each computer can only hold four drives.
#' The response is verage access time.
#'
#'	Source: Oehlert (2022), originally from Nelson (1993).
#'
#' @format A dataframe with 20 observations on three variables.
#'	\describe{
#'	\item{\code{computer}}{Factor indicating the computer used in the test.}
#'	\item{\code{brand}}{Factor indicating the brand of disk drive used in the test.}
#'	\item{\code{time}}{Average access time.}
#'	}
#'
#' @references
#' Nelson, P. R. (1993). "Additional uses for the analysis of means and extended
#' tables of critical values," \emph{Technometrics} \strong{35}, 61-71.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"DiskSpeed"

#' Optical density of DNA solutions.
#'
#' @description One of the steps in a molecular biological analysis is
#'	the quantification of DNA.  This can be done by measuring the
#'	absorbance of ultra-violet light at 260 nm (called the optical
#'	density).  The absorption
#'	of light in the spectrophotometer
#'	should be proportional to concentration of DNA, but
#'	should not depend on the volume of sample used.  However, there
#'	is a general belief that small samples, say less than 40 micro l,
#'	lead to erroneous results.  In addition, the proportionality cited above
#'	only holds over a range of concentrations; outside that range
#'	nonlinear effects come into play. In theory, the optical density at 260 nm
#'	should be 0.02 C,
#'	where C is the concentration in ng/micro l.
#'
#'	This experiment measures the optical density at five concentrations
#'	(10, 30, 60, 120, 480 ng/ul) and six volumes (15, 20, 30, 40, 50,
#'	100 ul).  Three analysts are chosen at random from the 16 in the
#'	lab.  Each of the analysts prepares two samples at each volume/concentration
#'	combination and measures the optical density.
#'
#'	Source: Oehlert (2022), data from S. Charaniya (pers. comm.).
#'
#' @format A dataframe of 180 observations on six variables.
#'	\describe{
#'	\item{\code{vol.z}}{The volume of the sample.}
#'	\item{\code{vol}}{A factor versioin of vol.z.}
#'	\item{\code{conc.z}}{The concentration of the sample.}
#'	\item{\code{conc}}{A factor versioin of conc.z.}
#'	\item{\code{user}}{A factor indicating the user.}
#'	\item{\code{od260}}{The measured optical density of the sample.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"DNA"

#' Dye Adsorption on Carbon
#'
#' @description The effect of initial dye concentration, temperature,
#'	and pH on the absorption of the dye Rhodamine 6G by activated
#'	carbon beads incorporated with calcium alginate. The response
#'	is the percentation of adsoprtion for 1 g/L of beads.
#'
#'	The treatments are the factor/level combinations of initial
#'	concentration at three levels (100, 200, 300 Mg/l), pH
#'	(7, 8, 9) and temperature (30 or 30 degrees C).
#'
#'	Source: Oehlert (2022), originally from Annadurai et al (2002) via
#'	Lye (2019).
#'
#' @format A data frame of 18 observations on seven variables.
#'	\describe{
#'	\item{\code{dye.z}}{The initial concentration of dye (Mg/l).}
#'	\item{\code{dye}}{A factor version of the initial concentration of dye.}
#'	\item{\code{pH.z}}{The pH of the reaction.}
#'	\item{\code{pH}}{A factor version of the pH of the reaction.}
#'	\item{\code{temperature.z}}{The temperature of the reaction (C).}
#'	\item{\code{temperature}}{A factor version of the temperature of the reaction (C).}
#'	\item{\code{adsorbed}}{The percentage of dye adsorption.}
#'	}
#'
#'
#' @references
#' Annadurai, G., Ruey-Shin Juang, and Duu-Jong Lee (2002) "Factorial design
#'	 analysis for adsorption of dye on activated carbon beads incorporated with 
#'	calcium alginate," \emph{Advances in Environmental Research}, \strong{6},  191-198.
#'
#' Lye, Leonard M. (2019) \emph{Applications of DEO in Engineering and Science:
#'	A Collection of 2^6 Case Studies}, Leonard Lye, St. John's, Newfoundland.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"DyeAdsorption"


#' Dye Removal via Oxidation
#'
#' @description The dye methylene blue may be removed from aqueous solution via
#'	an oxidation reaction with persulfate. This experiment studies how the
#'	percentage of dye removed varies with reaction time (5, 10, 15, 20, or 25
#'	minutes), persulfate concentration (355, 710, or 1065 mg/l),
#'	the initial dye concentration (10, 15, or 20 mg/l), and the
#'	process temperature (60 or 70 degrees C). The response is the color
#'	removal efficiency (CRE in precentage).  There are 90 factor/level
#'	combinations, each observed once.
#'
#'	Source: Oehlert (2022), originally from Kordkandi and Forouzesh (2014) via
#'	Lye (2019).
#'
#' @format A data frame of 90 observations on nine variables.
#'	\describe{
#'	\item{\code{time.z}}{The length of the reaction (minutes).} 
#'	\item{\code{time}}{A factor version of the length of the reaction.}
#'	\item{\code{oxidant.z}}{The presulfate concentration (mg/l).}
#'	\item{\code{oxidant}}{A factor version of the persulfate concentration.}
#'	\item{\code{initial.z}}{The initial dye concentration (mg/l).}
#'	\item{\code{initial}}{A factor version of the initial dye concentration.}
#'	\item{\code{temp.z}}{The temperature of the reaction (C).}
#'	\item{\code{temp}}{A factor version of the temperature.}
#'	\item{\code{CRE}}{The color removal efficiency (percent).}
#'	}
#'
#'
#' @references
#' Kordkandi, S. A. and Mojtaba Forouzesh (2014) "Application of full factorial
#' design for methylene blue dye removal using heat-activated persulfate oxidation,"
#' \emph{Journal of the Taiwan Institute of Chemical Engineers} \strong{45} 2597-2604.
#'
#' Lye, Leonard M. (2019) \emph{Applications of DEO in Engineering and Science:
#'	A Collection of 2^6 Case Studies}, Leonard Lye, St. John's, Newfoundland.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"DyeRemoval"

#' Fat acidity in flour.
#'
#' @description Fat acidity is a measure of flour quality that depends
#' on the kind of flour, how  the flour has been treated, and
#' how long the flour is stored.  In this experiment there
#' are two types of flour (Patent or First Clear);
#' the flour treatment factor (extraction)
#' has eleven levels, and the flour has been stored for one of
#' six periods (0, 3, 6, 9, 15, or 21 weeks).
#' We observe only one unit for each factor-level combination.
#' The response is fat acidity in mg KOH/100 g flour.
#'
#'	Source: Oehlert (2022), originally from Nelson (1961).
#'
#' @format A dataframe with 132 observations on five variables.
#'	\describe{
#'	\item{\code{weeks.z}}{The number of weeks the flour was stored.}
#'	\item{\code{weeks}}{A factor version of \code{weeks.z}.}
#'	\item{\code{extraction}}{The type of extraction.}
#'	\item{\code{strength}}{The type of flour.}
#'	\item{\code{strength}}{The fat acidity.}
#'	}
#'
#' @references
#'	Nelson, J. W. (1961) \emph{The Nature of Wheat Lipids and Their Role in Flour
#'	Deterioration.} Ph. D. thesis, Univeristy of Minnesota, St. Paul, MN.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"FatAcidity"



#' Hardness of dental fillings.
#'
#' @description Dental fillings made with gold can vary in hardness depending
#' on how the metal is treated prior to its placement in the tooth.
#' Two factors are thought to influence the hardness:  the gold alloy and
#' the condensation method.  In addition, some dentists doing the work
#' are better at some types of fillings than others.
#'
#'	Five dentists were selected at random.
#'	Each dentist prepares 24 fillings (in random order), one for each of
#'	the combinations of method (three levels) and
#'	alloy (eight levels).  The fillings were then
#'	measured for hardness using the Diamond Pyramid Hardness Number
#'	(big scores are better).
#'
#'	Source: Oehlert (2022), originally from Brown (1975).
#'
#' @format A dataframe of 120 observations on four variables.
#'	\describe{
#'	\item{\code{allow}}{A factor indicating the allow used.}
#'	\item{\code{method}}{A factor indicating the method used.}
#'	\item{\code{dentist}}{A factor indicating the dentist preparing the filling.}
#'	\item{\code{hardness}}{The hardness (diamond pyramid number) of the filling.}
#'	}
#'
#' @references
#' Brown, M. B. (1975) "Exploring interactions effects in the ANOVA." \emph{Applied Statistics}
#'	\strong{ 24}, 288-298.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"Fillings"

#' Fruit fly lifespans under reproductive stress
#'
#' @description One hundred twenty five male fruit flies were randomly divided into
#'	five groups of 25 and individually housed. In one group, males were kept by themselves.
#'	In two groups, males were supplied with either one or eight receptive, virgin females
#'	per day. In the final two groups, males were supplied with either one or eight
#'	unreceptive (pregnant) femals per day. The response is the longevity (in days)
#'	of the males.
#'
#'	Source: Oehlert (2022), originally from Hanley and Shapiro (1994).
#'
#' @format A dataframe of 125 observations on two variables.
#'	\describe{
#'	\item{\code{companions}}{A factor giving the number and type of femal companions.}
#'	\item{\code{longevity}}{The lifespan of the male fruit fly, in days.}
#'	}
#'
#' @references
#' Hanley, J. A. and S. H. Shapiro (1994). "Sexual activity and the lifespan of
#'	male fruitflies: a dataset that gets attention." \emph{Journal of Statistics Education}
#'	\strong{2}.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"FruitFlyLifespan"

#' Appeal of fruit punch.
#'
#' @description A three-component fruit punch
#' mixture experiment, where the goal is to find
#' the most appealing mixture of watermelon juice,
#' pineapple juice, and orange juice.
#' Six different punches are produced, and eighteen judges are
#' assigned at random to the punches, three to a punch.
#'
#'	Source: Oehlert (2022), originally from Cornell (1985).
#'
#' @format A dataframe of 18 observations on four variables.
#'	\describe{
#'	\item{\code{wm}}{The fraction of watermelon juice.}
#'	\item{\code{pa}}{The fraction of pineapple juice.}
#'	\item{\code{oj}}{The fraction of orange juice.}
#'	\item{\code{appeal}}{The rating for the punch.}
#'	}
#'
#' @references
#' Cornell, J. A. (1985). Mixture experiments. In S. Kotz and N. Johnson (Eds.),
#' \emph{Encyclopedia of Statistical Sciences}, Volume 5, pp. 569-579. New York: Wiley.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"FruitPunch"

#' GABA release under anti-convulsant treatemant.
#'
#' @description Anticonvulsant drugs may be effective because
#' they encourage the effect of the neurotransmitter
#' GABA (gamma-aminobutyric acid).  Calcium transport
#' may also be involved.  The present experiment randomly
#' assigned 48 rats to eight experimental conditions.  These
#' eight conditions are the factor-level combinations of three
#' factors, each at two levels.  The factors are the
#' anticonvulsant Trifluoperazine (brand name Stelazine)
#' present or absent,
#' the anticonvulsant Diazepam (brand name Valium)
#' present or absent,
#' and the calcium-binding protein calmodulin present
#' or absent.  The response is the amount of GABA released
#' when brain tissues are treated with 33 mM K+.
#'
#'	Source: Oehlert (2022), originally from de Belleroche, et al. (1982).
#'
#' @format A dataframe of 48 observations on four variables.
#'	\describe{
#'	\item{\code{Tri}}{Factor indicating presence or absence of Trifluoperazine.}
#'	\item{\code{Dia}}{Factor indicating presence of absence of Diazepam.}
#'	\item{\code{Cal}}{Factor indicating presence or absence of calmodulin.}
#'	\item{\code{GABA}}{The amount of GABA released.}
#'	}
#'
#' @references
#' de Belleroche, J., A. Dick, and A. Wyrley-Birch (1982). "Anticonvulsants and
#'	trifluoperazine inhibit the evoked release of GABA from cerebral cortex of
#'	rat at different sites," \emph{Life Sciences} \strong{31}, 2875-2882.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"GABA"


#' GABA release under anti-convulsant treatemant.
#'
#' @description An experiment studied the effects of starch source,
#' starch concentration, and temperature on the strength of
#' gels.  This experiment was completely randomized with
#' sixteen units.  There are four starch sources (adzuki
#' bean, corn, wheat, and potato), two starch
#' percentages (5\% and 7\%), and two temperatures
#' (22 C and 4 C).  The response is gel strength
#' in grams.
#'
#'	Source: Oehlert (2022), originally from Tjahjadi (1983).
#'
#' @format A dataframe of 16 observations on six variables.
#'	\describe{
#'	\item{\code{percent.z}}{The percent of starch.}
#'	\item{\code{percent}}{A factor version of \code{percent.z}.}
#'	\item{\code{temp.z}}{The temperature of the gel.}
#'	\item{\code{temp}}{A factor version of \code{temp.z}.}
#'	\item{\code{starch}}{The source of the starch.}
#'	\item{\code{strength}}{The strength of the gel.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Tjahjadi, C. (1983). \emph{Isolation and Characterization of Adzuki Bean
#'	(Vigna angularis) Protein and Starch} Ph. D. thesis, University of Minnesota,
#'	St. Paul, MN.
"GelStrength"

#' Microwave extration of essential oil from ginger
#'
#' @description Ginger contains an essential oil that we would like
#' to extract without using a solvent, in this case
#' by using a microwave. This experiment
#' considers eight different treatments for extracting
#' this oil. These treatments are the factor/level combinations
#' of duration (10 or 30 minutes), wattage (288 or 640), and
#' preparation (crushed or sliced). The response
#' is the oil yield (in \%). Sixteen samples of
#' ginger are randomly assigned to the eight factor/level
#' combinations, two per combination. 
#' 
#'	Source: Oehlert (2022), originally from Shah and Garg (2014) via
#'	Lye (2019).
#'
#' @format A data frame of 16 observations on five variables.
#'	\describe{
#'	\item{\code{duration}}{A factor giving the duration of the experiment.}
#'	\item{\code{wattage}}{A factor giving the wattage of the microwave.}
#'	\item{\code{Type}}{A factor giving the preparation of the ginger.}
#'	\item{\code{yield}}{The amount of wax oil extracted.}
#'	}
#'
#'
#' @references
#' Lye, Leonard M. (2019) \emph{Applications of DEO in Engineering and Science:
#'	A Collection of 2^6 Case Studies}, Leonard Lye, St. John's, Newfoundland.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Shah, Mumtaj and S. K. Garg (2014) :Application of 2^k full factorial design in
#' optimization of solvent-free microwave extraction of ginger essential oil,"
#' \emph{Journal of Engineering}, Article ID 828606, 5 pages.
"GingerOil"


#' Graininess of dried fruit pulp.
#'
#' @description Grains or crystals adversely affect the sensory qualities of foods
#' using dried fruit pulp.  A factorial experiment was conducted to determine
#' which factors affect graininess.  The factors were drying temperature
#' (three levels), acidity (pH) of pulp (two levels), and sugar content (two levels).
#' The experiment has two replications, with each replication using
#' a different batch of pulp.
#' Response is a measure of graininess
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe of 24 observations on five variables.
#'	\describe{
#'	\item{\code{batch}}{Factor indicating the batch of fruit pulp.}
#'	\item{\code{temp}}{Factor indicating the temperature treatment.}
#'	\item{\code{pH}}{Factor indicating the pH treatment.}
#'	\item{\code{sugar}}{Factor indicating the sugar treatment.}
#'	\item{\code{graininess}}{The graininess of the resulting product.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Graininess"

#' Whiteness of washed handerkerchiefs.
#'
#' @description A consumer testing agency wishes to test the ability of
#' laundry detergents, bleaches, and prewash treatments to remove
#' soils and stains from fabric.  Three detergents are selected
#' (a liquid, an all-temperature powder, and a hot-water powder).  The two
#' bleach treatments are no bleach or chlorine bleach.  The three prewash
#' treatments are none, brand A, and brand B.  The  three stain treatments
#' are mud, grass, and gravy.  There are thus 54 factor-level combinations.
#'
#' Each of 108 white-cotton handkerchiefs is numbered with a random code.
#' Nine are selected at random, and these nine are assigned at random to the
#' nine factor-level combinations of stain and prewash.  These nine handkerchiefs
#' along with four single sheets make a "tub" of wash.  This is repeated twelve
#' times to get twelve tubs.  Each tub of wash is assigned at random to one of
#' the six factor-level combinations of detergent and bleach.  After washing
#' and drying, the handkerchiefs are graded (in random order) for whiteness
#' by a single evaluator using a 1 to 100 scale, with 1 being whitest (cleanest).
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe of 108 observations on six variables.
#'	\describe{
#'	\item{\code{tub}}{Factor indicating the tub of laundry.}
#'	\item{\code{detergent}}{Factor indicating the detergent used.}
#'	\item{\code{bleach}}{Factor indicating the bleach used.}
#'	\item{\code{stain}}{Factor indicating the stain used.}
#'	\item{\code{prewash}}{Factor indicating the prewash used.}
#'	\item{\code{whiteness}}{The whiteness score of the washed handerchief.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Handkerchiefs"

#' Weed growth in soybeans with herbicides.
#'
#' @description An experiment to determine how different soybean
#' varieties compete against weeds.  There were sixteen varieties of soybeans
#' and three
#' weed treatments: no herbicide, apply herbicide 2 weeks after
#' planting the soybeans, and apply herbicide 4 weeks after planting
#' the soybeans.  The measured response is weed biomass in kg/ha.
#' There were two replications of the experiment, one in St. Paul, MN,
#' and one in Rosemount, MN, for a total of 96 observations.
#'
#'	Source: Oehlert (2022), originally from Bussan (1995).
#'
#' @format A dataframe of 96 observations on four variables.
#'	\describe{
#'	\item{\code{location}}{Factor indicating location of the observation.}
#'	\item{\code{treatment}}{Factor indicating the herbicide treatment.}
#'	\item{\code{variety}}{Factor indicating the variety of soybeans.}
#'	\item{\code{biomass}}{Biomass of weeds in kg/ha.}
#'	}
#'
#' @references
#' Bussan, A. J. (1995). \emph{Selectino for weed competitiveness among soybean
#' genotypes}. Master's thesis, University of Minnesota, St. Paul, MN.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Herbicides"


#' A synthetic example of an unbalanced 2x2 factorial.
#'
#' @description Synthetic data for a 2x2 factorial with cell counts
#' 10, 1, 1, 5.
#'
#'	Source: Oehlert (2022).
#'
#' @format A dataframe of 17 observations on three variables.
#'	\describe{
#'	\item{\code{A}}{Factor 1.}
#'	\item{\code{B}}{Factor 2.}
#'	\item{\code{y}}{A response.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"HighlyUnbalanced"

#' An incomplete block design
#'
#' @description Nine treatments in nine blocks of size three.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe of 27 observations on three variables.
#'	\describe{
#'	\item{\code{block}}{Factor indicating the block.}
#'	\item{\code{treatment}}{Factor indicating the treatment.}
#'	\item{\code{resp}}{The response.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"IBD"


#' Defective integrated circuits on a wafer
#'
#' @description The locations of integrated circuits on a silicon wafer, along
#'	with the IC's status as good or bad.
#'
#'	Source: Oehlert (2022), origially from Taam and Hamada (1993).
#'
#' @format A dataframe of 54 observations on three variables.
#'	\describe{
#'	\item{\code{x}}{The horizontal position of the IC on the wafer.}
#'	\item{\code{y}}{The vertical position of the IC on the wafer.}
#'	\item{\code{good}}{A binary indicator for the status of the chip; 1=good, 0=bad.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Taam, W. and M. Hamada (1993). "Detecting spatial effects from factorial experiments:
#' An application from integrated-circuit manfacturing." \emph{Technometrics} \strong{35}, 149-160.
#'
"ICDefects"

#' Consumer rating of ice cream
#'
#' @description Modern ice creams are not simple recipes.  Many use some
#' type of gum to enhance texture, and a non-cream protein source
#' (for example, whey protein solids).  A food scientist is trying to determine
#' how types of gum and protein added change a
#' sensory rating of the ice cream.  She runs a five by five factorial with two
#' replications using five gum types and five protein sources.  Unfortunately, six
#' of the units did not freeze properly, and these units were not rated.
#' Ice creams are rated by a trained panel, with higher ratings being better.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe with 44 observations on three variables.
#'	\describe{
#'	\item{\code{gum}}{A factor indicating the type of gum in the recipe.}
#'	\item{\code{protein}}{A factor indicating the type of non-cream protein.}
#'	\item{\code{rating}}{The average rating for the batch of ice cream.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"IceCream"

#' Viscoscity of icings.
#'
#' @description We wish to determine the tolerance of icings to
#' ingredient changes and variation in the preparation.
#' Ingredient changes are represented by factors C, D,
#' E, F, G, and H.  All are at two levels.  C and D
#' are two types of sugars; E, F, and G are three stabilizers;
#' and H is a setting agent.  The levels of these
#' factors represent changes in the amounts of these constituents
#' in the mix.  Variation in preparation
#' is modeled as the amount of water added to the product.
#' This has four levels and is represented as the
#' combinations of factors A and B.  The response we
#' measure is (coded) viscosity of the icing.
#' A quarter-fraction with 64 observations was run.
#'
#'	Source: Oehlert (2022), originally from Carroll and Dykstra (1958).
#'
#' @format A dataframe with 64 observations on nine variables.
#'	\describe{
#'	\item{\code{A}}{Level of first water pseudofactor.}
#'	\item{\code{B}}{Level of second water pseudofactor.}
#'	\item{\code{C}}{Level of sugar type 1.}
#'	\item{\code{D}}{Level of sugar type 2.}
#'	\item{\code{E}}{Level of stabilizer type 1.}
#'	\item{\code{F}}{Level of stabilizer type 2.}
#'	\item{\code{G}}{Level of stabilizer type 3.}
#'	\item{\code{H}}{Level of setting agent.}
#'	\item{\code{vicoscity}}{Coded viscoscity of the icing.}
#'	}
#'
#' @references
#' Carroll, M. B. and O. Dykstra (1958). Application of fractional factorials in a
#' food research laboratory. In V. Chew (Ed.), \emph{Experimental Designs in Industry},
#' pp. 224-234. New York: Wiley.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Icings"


#' Identification of flashed video images.
#'
#' @description This experiment studies how image properties affect visual perception.
#' Each subject looks at a white computer
#' screen.  At random intervals averaging about 5 seconds,
#' we will put a small image on the screen for a very short time.
#' The subject is supposed to click the
#' mouse button when she sees an image on the screen.  The experiment
#' takes place
#' in sixteen ten-minute sessions to prevent fatigue;
#' during each session we present
#' 120 images.  In fact, these are eight images repeated fifteen times
#' each and presented in random order.
#' We record
#' as the response the fraction of times that the mouse is clicked
#' for a given image type.
#'
#' We wish to study 128 different images, the factorial combinations
#' of seven factors each at two levels: size of image, shape of
#' image, color of image, orientation of image, duration of image,
#' vertical location of image, and horizontal location of image.
#' We anticipate session to session variability, and we run a confounded factorial
#' with sixteen blocks of size eight using defining contrasts ABG, ACF, BCE, and ABCD.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe with 128 observations on nine variables.
#'	\describe{
#'	\item{\code{block}}{A factor indicating the block.}
#'	\item{\code{A}}{Experimental factor A,  size, as -1 and 1.}
#'	\item{\code{B}}{Experimental factor B,  shape, as -1 and 1.}
#'	\item{\code{C}}{Experimental factor C,  color., as -1 and 1}
#'	\item{\code{D}}{Experimental factor D,  orientation, as -1 and 1.}
#'	\item{\code{E}}{Experimental factor E, duration, as -1 and 1.}
#'	\item{\code{F}}{Experimental factor F, vertical, as -1 and 1.}
#'	\item{\code{G}}{Experimental factor G, horizontal, as -1 and 1.}
#'	\item{\code{fracID}}{The fraction (out of 15) of images identified (noticed).}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"ImageID"

#' Soil Mercury from an incinerator.
#'
#' @description A study has been conducted on the environmental impact of
#' an industrial incinerator.  One of the concerns is the emission
#' of heavy metals from the stack, and one way to measure the impact
#' is by looking at metal accumulations in soil and seeing if
#' nearby sites have more metals than distant sites (presumably
#' due to deposition of metals from the incinerator).
#'
#' Eleven sites of one hectare each (100 m by 100 m)
#' were selected around the incinerator.  Five sites
#' are on agricultural soils, while the other six
#' are on forested soils.  Five of the sites
#' were located near the incinerator (on their
#' respective soil types), while
#' the other sites were located far from the
#' incinerator.  At each site,
#' nine locations are randomly selected within the
#' site and mineral soil sampled at each location.  We then
#' measure the mercury content in each sample (mg/kg).
#'
#' Complicating any comparison is the fact that heavy metals are
#' generally held in the organic portion of the soil, so that
#' a soil sample with more carbon will tend to have more heavy
#' metals than a sample with less carbon, regardless of the deposition
#' histories of the samples, soil type, etc.
#' For this reason, we also measure the
#' carbon fraction of each sample (literally the fraction of the soil sample
#' that was carbon).
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe with 11 observations on four variables.
#'	\describe{
#'	\item{\code{soil}}{A factor indicating the type of soil.}
#'	\item{\code{distance}}{A factor indicting distance from the incinerator.}
#'	\item{\code{carbon}}{The concentration of carbon.}
#'	\item{\code{mercury}}{The concentration of mercury.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Incinerator"

#' Speed at interchanges.
#'
#' @description Traffic engineers are experimenting with two ideas.  The first is
#' that erecting signs that say "Accident Reduction Project Area" along freeways
#' will raise awareness and thus reduce accidents.  Such signs may have an effect
#' on traffic speed.  The second idea is that metering the flow of vehicles onto
#' on-ramps will spread out the entering traffic and lead to an average increase
#' in speed on the freeway.  The engineers conduct an experiment to determine how
#' these two ideas affect average traffic speed.
#'
#' First, twenty more-or-less equivalent
#' freeway interchanges
#' are chosen, spread well around a single metropolitan area and not too close to
#' each other.  Ten of these interchanges are chosen at random to get "Accident
#' Reduction Project Area" signs (in both directions); the other ten receive no
#' signs.  Traffic lights are installed on all on-ramps to meter traffic.  The
#' traffic lights can be turned off (that is, no minimum spacing between entering
#' vehicles) or be adjusted to require 3 or 6 seconds between entering vehicles.
#' Average traffic speed 6:30-8:30 AM and 4:30-6:30 PM will be measured at each
#' interchange on three consecutive Tuesdays, with our response
#' being the average of morning and evening speeds.
#' At each interchange, the three settings of the traffic
#' lights are assigned at random to the three Tuesdays.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe with 60 observations on five variables.
#'	\describe{
#'	\item{\code{sign}}{A factor indicating whether the interchange received the sign.}
#'	\item{\code{timing.z}}{The timing interval for the on-ramp.}
#'	\item{\code{timing}}{A factor version of \code{timing.z}}
#'	\item{\code{interchange}}{A factor indicating which interchange is in use.}
#'	\item{\code{speed}}{The average speed of cars.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Interchanges"

#' Insect catch in traps
#'
#' @description Average catch of insects in three different
#'	kinds of traps across five periods.
#'
#'	Source: Snedecor and Cochran (1967).
#'
#' @format A dataframe with 15 observations on three variables.
#'	\describe{
#'	\item{\code{trap}}{A factor indicating the trap.}
#'	\item{\code{period}}{A factor indicating the period the insects were collected.}
#'	\item{\code{catch}}{The average catch for the trap type in the period.}
#'	}
#'
#' @references
#' Snedecor, G. W. and Cochran, W. G. (1967) \emph{Statistical Methods},
#' Iowa State University Press: Ames, Iowa.
"InsectCatch"

#' Interlaboratory comparison of bacteria in milk.
#'
#' @description Milk is tested after Pasteurization to assure that
#'	Pasteurization was effective.  This experiment was conducted
#'	to determine variability in test results between laboratories,
#'	and to determine if the interlaboratory differences depend
#'	on the concentration of bacteria.
#'
#'	Five contract laboratories are selected at random from
#'	those available in a large metropolitan area.  Four levels
#'	of contamination are chosen at random by choosing four samples
#'	of milk from a collection of samples at various stages of
#'	spoilage.
#'	A batch of fresh milk from a dairy was obtained and split
#'	into 40 units.  These 40 units are assigned at random to
#'	the twenty combinations of laboratory and contamination sample.
#'	Each unit is contaminated with 5 ml from its selected sample,
#'	marked with a numeric code, and sent to the selected laboratory.
#'	The laboratories count the bacteria in each sample by
#'	serial dilution plate counts without knowing that they
#'	received four pairs, rather than eight separate samples.
#'	The response is colony forming units per ul.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe with 40 observations on three variables.
#'	\describe{
#'	\item{\code{sample}}{A factor indicating the contaminating sample.}
#'	\item{\code{lab}}{A factor indicating the laboratory making the count.}
#'	\item{\code{count}}{The number of colony forming units per ul.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Interlaboratory"

#' Irrigation, variety, and pesticide effects on yield.
#'
#' @description An experiment was conducted to study the effects of irrigation,
#' crop variety, and aerially sprayed pesticide on grain yield.  There were
#' two replicates.  Within each replicate, three fields were chosen and randomly
#' assigned to be sprayed with one of the pesticides.  Each field was then
#' divided into two east-west strips; one of these strips was chosen at
#' random to be irrigated, and the other was left unirrigated.  Each east-west
#' strip was split into north-south plots, and the two varieties were
#' randomly assigned to plots.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe with 24 observations on five variables.
#'	\describe{
#'	\item{\code{rep}}{A factor indicating the replication.}
#'	\item{\code{pesticide}}{A factor indicating the pesticide being used.}
#'	\item{\code{irrig}}{A factor indicating the irrigation being used.}
#'	\item{\code{variety}}{A factor indicating the variety being used.}
#'	\item{\code{yield}}{The crop yield.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"IVP"

#' Japanese beetles in the garden.
#'
#' @description An experiment to determine the best pesticide for Japanese Beetles.
#' We have six garden beds with beans, and the garden store has three different
#' sprays that claim to keep the beetles off the beans.
#' Sprays drift on the wind, so we cannot spray
#' very small areas. We divide each garden bed into two plots
#' and use a different spray on each plot.
#' The response is the number of Japanese beetles we find in each plot.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe with 12 observations on three variables.
#'	\describe{
#'	\item{\code{bed}}{A factor indicating the garden bed.}
#'	\item{\code{spray}}{A factor indicating the spray being used.}
#'	\item{\code{bugs}}{The count of Japanese beetles.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"JapaneseBeetles"

#' Hours of pain after keyboarding.
#'
#' @description A company wishes to choose
#' an ergonomic keyboard for its computers to reduce
#' the severity of repetitive motion disorders (RMD) among
#' its staff.  Twelve staff known to have
#' mild RMD problems are randomly assigned to three keyboard
#' types.  The staff keep daily logs of the amount of
#' time spent keyboarding and their subjective assessment
#' of the RMD pain.  After 2 weeks, we get the total number
#' of hours spent keyboarding and the total number of hours
#' in RMD pain.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe with 12 observations on three variables.
#'	\describe{
#'	\item{\code{type}}{A factor indicating the type of keyboard.}
#'	\item{\code{KbdHours}}{The hours spent keyboarding.}
#'	\item{\code{PainHours}}{The the subjective hours of pain.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"KeyboardingPain"

#' Laminate lengths.
#'
#' @description Implantable pacemakers contain a small circuit board called
#' a substrate.  Multiple substrates are made as part of a single
#' "laminate."  In this experiment, seven laminates are
#' chosen at random. We choose eight substrate locations and
#' measure the length of the substrates at those eight locations
#' on the seven substrates.  The response is a coded length
#' (10,000 x [response - 1.45]).
#'
#'	Source: Oehlert (2022),  data  from Todd Kerkow (pers. comm.).
#'
#' @format A dataframe of 56 observations on three variables.
#'	\describe{
#'	\item{\code{laminate}}{A factor indicating the laminate.}
#'	\item{\code{location}}{A factor indicating the location on the laminate.}
#'	\item{\code{length}}{The coded length of the substrate.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"Laminates"

#' Percent laser transmission through PVC
#'
#' @description Ninety pieces of clear PVC are assigned at random to one of
#'	18 treatments, five pieces per treatment. A low power laser is aimed
#'	at the PVC, and the response is the percentage of light that is transmitted
#'	through the PVC to a receptor on the other side. The 18 treatments are
#'	the combinations of thickness (1.57, 3.18, 4.78, 6.35, 9.53, or 12.7 mm) and
#'	surface treatment (none, front sanded, front and back sanded). We expect
#'	that greater thickness and more sanding (roughness in this case) will lead
#'	to reduced light transmission.
#'
#'	Source: Oehlert (2022),  data  from J. Van de Ven (pers. comm.).
#'
#' @format A dataframe of 90 observations on four variables.
#'	\describe{
#'	\item{\code{thickness.z}}{The thickness of the PVC in mm.}
#'	\item{\code{thickness}}{A factor version of \code{thickness.z}.}
#'	\item{\code{sanding}}{A factor indicating the sanding treatment.}
#'	\item{\code{transmission}}{The percentage of light transmitted through the PVC.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"LaserTransmission"


#' Free height of leaf springs.
#'
#' @description  Data
#' from a quality experiment on the manufacture of leaf springs
#' for trucks.  The free height should be as close to 8 inches
#' as possible, with minimum variation.   There are four
#' inner noise factors, each at two levels: furnace temperature (B),
#' heating time (C), transfer time (D), and hold-down time (E).
#' There was one outer noise factor: quench oil temperature (O).
#' The design is a 2^(5-1) with three replications.  Analyze
#' as a 2^(4-1) design in the inner
#' noise factors with six replications, because quench-oil temperature
#' is not easily controlled in factory conditions.
#'
#'	Source: Oehlert (2022), originally from Pignatiello and Ramberg (1985).
#'
#' @format A dataframe of 48 observations on six variables.
#'	\describe{
#'	\item{\code{B}}{A variable indicating furnace temperature (-1,1).}
#'	\item{\code{C}}{A variable indicating heating time (-1,1).}
#'	\item{\code{D}}{A variable indicating transfer time (-1,1).}
#'	\item{\code{E}}{A variable indicating hold-down time (-1,1).}
#'	\item{\code{O}}{A variable indicating quench temperature (-1,1).}
#'	\item{\code{height}}{The free height.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Pignatiello, J. J. and J. S. Ramberg (1991). "Top ten triumphs and tragedies
#' of Genichi Taguchi," \emph{Quality Engineering} \strong{4}, 211-225.
"LeafSprings"

#' Guinea pig cardiac relaxant lethal dosages
#'
#' @description Forty guinea pigs are randomly assigned to four different cardiac
#'	relaxants, ten animals per drug.  Anesthetized animals are infused with the drug
#'	until death occurs, with response being the total lethal dose. Small dosages are
#'	more effective.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe of 40 observations on two variables.
#'	\describe{
#'	\item{\code{drug}}{A factor indicating the drug used.}
#'	\item{\code{dosage}}{The lethal dosage.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"LethalDosage"

#' Serum lithium concentrations
#'
#' @description We study the blood concentrations of lithium
#' 12 hours after administering lithium carbonate,
#' using either a 300 mg capsule, 250 mg capsule,
#' 450 mg time delay capsule, or 300 mg solution.  There are
#' twelve subjects, each of whom will be used twice, 1 week apart.  We
#' anticipate that the responses will be different in the
#' second week, so we block on subject and week.
#' The response is the serum lithium level (micro equivalents per liter).
#'
#'	Source: Oehlert (2022), originally from Westlake (1974).
#'
#' @format A dataframe of 24 observations on four variables.
#'	\describe{
#'	\item{\code{treatment}}{A factor indicating level of treatment.}
#'	\item{\code{period}}{A factor indicating the time period.}
#'	\item{\code{subject}}{A factor indicating the subject.}
#'	\item{\code{concentration}}{The serum lithium concentration.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Westlake, W. J. (1974). "The use of balanced incomplete block designs in
#' comparative bioavailability trials." \emph{Biometrics} \strong{30}, 319-327.
"Lithium"

#' Volume of loaves as a function of flours used.
#'
#' @description Millers want to make bread flours that bake into large loaves.
#' They need to mix flours from four varieties of wheat, so
#' they run an experiment with different mixtures and measure
#' the volume of the resulting loaves (ml/100 g dough).  The
#' experiment was performed on 2 separate days.
#'
#'      Source: Oehlert (2022), originally from Draper, et al. (1993).
#'
#' @format A dataframe of 18 observations on six variables.
#'      \describe{
#'      \item{\code{day}}{A factor giving the day for the loaf.}
#'      \item{\code{x1}}{The fraction of flour 1 used.}
#'      \item{\code{x2}}{The fraction of flour 2 used.}
#'      \item{\code{x3}}{The fraction of flour 3 used.}
#'      \item{\code{x4}}{The fraction of flour 4 used.}
#'      \item{\code{volume}}{The volume of the loaf.}
#'      }
#'
#' @references
#' Draper, N. R., S. M. Lewis, P. W. M. John, P. Prescott, A. M. Dean, and
#' M. G. Tuck (1993). "Mixture designs for four components in orthogonal blocks,"
#' \emph{Technometrics} \strong{35}, 268-276.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"LoafVolume"


#' Changes in Mealy Bug counts on cycads after treatment  
#'
#' @description Cycads (plants that look vaguely like palms)
#' can be infested with mealybug, and we test
#' three treatments to control the bugs: water (a control), horticultural
#' oil (a standard no-mammalian-toxicity pesticide), and
#' fungal spores in water (\emph{Beauveria bassiana\/}, a fungus that
#' grows exclusively on insects).  Five infested cycads are removed
#' to a testing area.  Three branches are randomly chosen on each cycad,
#' and two 3 cm by 3 cm patches are marked on each branch;
#' the number of mealybugs in these patches is noted.
#' The three branches on each cycad are randomly assigned to the three treatments.
#' After three days, the patches are counted again, and the response
#' is the change in the number of mealybugs (before - after).
#' Data here are the average responses on each branch.
#'
#'      Source: Oehlert (2022), originally from Scott Smith (pers. comm.).
#'
#' @format A dataframe of 30 observations on four variables.
#'      \describe{
#'      \item{\code{treatment}}{The treatment used on the branch.}
#'      \item{\code{plant}}{A factor indicating the plant from which each branch was taken.}
#'      \item{\code{change}}{The change (before-after) for the patch. }
#'	\item{\code{branch}}{A factor indicating the branch (plant by treatment).}
#'      }
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"MealyBugs"

#' Hamster testes weight after melatonin treatment
#'
#' @description Thirty-two male hamsters were randomly assigned to one of four
#'	doses of melatonin daily 1 hour prior to lights out for 12 weeks. Response is the
#'	paired testes weight in mg. Data are summaries (mean and standard deviation) of the
#'	responses for the 8 animals in each treatment group.
#'
#'	Source: Oehlert (2022), originally from Rollag (1982).
#'
#' @format A dataframe of 4 observations on three variables.
#'	\describe{
#'	\item{\code{dose}}{The dose of melatonin used in each treatment group.}
#'	\item{\code{ave.weight}}{Average testes weight in each treatment group.}
#'	\item{\code{sd.weight}}{Standard devaition of testes weight in each treatment group.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#'	Rollag, M. D. (1982) "Ability of tryptophan derivatives to mimic melatonin's
#'	action upon the Syrian hamster reproductive system," \emph{Life Sciences}
#'	\strong{31}, 2699-2707.
"Melatonin"

#' Soda remaining after adding Mentos(R)
#'
#' @description
#' This experiment explores the effects of elapsed time
#' after opening a soft drink and number of Mentos(R)
#' added on the volume of soft drink remaining in the bottle.
#' There are 36 .5L bottles of soft drink; 12 each of
#' Diet Sunkist(R),
#' Diet 7up(R),
#' and 7up(R).
#' The 12 bottles of each
#' type are randomly assigned to the six factor/level
#' combinations of time (0 or 20 minutes after opening) and number of tablets
#' (1, 4 or 7 Mentos(R)), two bottles to each combination. 
#' In random order, each bottle was given its assigned
#' treatment, and the amount (mL) of beverage remaining 30
#' seconds after the tablet drop was measured as response.
#'
#' Source Oehlert (2022), originally from T. Steichen (pers. comm.)
#'
#' @format A data frame with 36 observations on six variables.
#'	\describe{
#'	\item{\code{type}}{The type of soft drink (DS, D7, or 7).}
#'	\item{\code{elapsed}}{A factor indicating the time elapsed (minutes) since opening the bottle.}
#'	\item{\code{elapsed.z}}{A numeric variable indicating the time elapsed (minutes) since opening the bottle.}
#'	\item{\code{tablets}}{A factor indicating the number of Mentos(R) added.} 
#'	\item{\code{tablets.z}}{A numeric variable indicating the number of Mentos(R) added.} 
#'	\item{\code{remaining}}{The volume of soft drink remaining (mL).}
#'	}
"MentosGeyser"


#' Milfoil biomass under weevil treatments.
#'
#' @description Eurasian water milfoil is a nonnative plant that is
#' taking over many lakes in Minnesota and driving out the native
#' northern milfoil.  However, there is a
#' native weevil (an insect) that eats milfoil and may be
#' useful as a control.  We wish to investigate how eight
#' treatments affect the damage the weevils do to Eurasian milfoil.
#' The treatments are the
#' combinations of whether a weevil's parents were raised
#' on Eurasian or northern, whether the weevil was hatched
#' on Eurasian or northern, and whether the weevil
#' grew to maturity on Eurasian  or northern.
#'
#' We have eight tanks (big aquariums), each of which is
#' subdivided into four sections.  The subdivision is accomplished
#' with a fine mesh that lets water through, but not weevils.
#' The tanks are planted with equal amounts of Eurasian milfoil.
#' We try to maintain uniformity between tanks, but there will
#' be some tank to tank variation due to differences in light
#' and temperature.  The tanks are planted in May, then
#' weevils are introduced. In September, milfoil
#' biomass is measured as response.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe of 32 observations on five variables.
#'	\describe{
#'	\item{\code{tank}}{Factor denoting the tank for the current observation.}
#'	\item{\code{A}}{Factor indicating the parental diet (Eurasion or northern).}
#'	\item{\code{B}}{Factor indicating the hatched diet (Eurasion or northern).}
#'	\item{\code{C}}{Factor indicating the raised diet (Eurasion or northern).}
#'	\item{\code{biomass}}{Biomass of Eurasion milfoil after four months.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Milfoil"

#' Sensory ratings of milk using different chilling post-Pasteurization.
#'
#' @description Milk is chilled immediately after Pasteurization.
#' The goal in chiller design is to get high flow at low
#' capital and operating costs while still chilling the milk quickly
#' enough to maintain sensory qualities.
#' Basic chiller design is a set of refrigerated plates
#' over which the hot milk is pumped.  We are investigating
#' the effect of the spacing between the plates (two levels),
#' the temperature of the plates (two levels), and the flow rate
#' of the milk (two levels) on the perceived quality of the resulting
#' milk.  There is a fresh batch of raw milk each day, and we expect
#' batch to batch differences in quality.  Because of the time involved in
#' modifying the chiller, we can use at most four factor-level
#' combinations in a day.
#'
#' This experiment uses two replicates, confounding ABC and
#' BC in the two replicates.
#' The processed milk is judged daily by a trained expert who
#' is blinded to the treatments used.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe of 16 observations on five variables.
#'	\describe{
#'	\item{\code{block}}{Factor denoting the block for the current observation.}
#'	\item{\code{A}}{Factor indicating spacing.}
#'	\item{\code{B}}{Factor indicating temperature.}
#'	\item{\code{C}}{Factor indicating flow rate.}
#'	\item{\code{response}}{Sensory score for the milk.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"MilkChiller"

#' Filtration times for raw milk.
#'
#' @description Milk can be strained through filter disks to remove dirt and debris.
#' Filters are made by surface-bonding fiber webs to both sides
#' of a disk.  This experiment is concerned with how the construction
#' of the filter affects the speed of milk flow through the filter.
#'
#' We have a 2^4 factorial structure for the filters.  The factors
#' are fiber weight (normal or heavy), loft (thickness of the filter,
#' normal or low), bonding solution on bottom surface (A or B),
#' and bonding solution on top surface (A or B).
#'
#' We pour a measured amount of milk through
#' the disk and record the filtration time as the response.  We
#' expect considerable variation from farm to farm, so we block on
#' farm.  We also expect variation from milking to milking, so
#' we want all measurements at one farm to be done at a single milking.
#' However, only three filters can be satisfactorily used at a single milking.
#'
#' Sixteen farms were selected.  At each farm there will be three
#' strainings at one milking, with the milk strained first with
#' one filter, then a second, then a third.  Each treatment will
#' be used three times in the design: once as a first filter, once
#' as second, and once as third. Response is filtration time in seconds.
#'
#'	Source: Oehlert (2022), originally from Connor (1958).
#'
#' @format A dataframe of 48 observations on seven variables.
#'	\describe{
#'	\item{\code{farm}}{Factor denoting the farm for the current observation.}
#'	\item{\code{order}}{Factor indicating whether this is a first, second, or third filtration.}
#'	\item{\code{weight}}{Factor giving the filter weight for the current observation.}
#'	\item{\code{loft}}{Factor giving the loft height for the current observation.}
#'	\item{\code{bot.bond}}{Factor giving the bonding solution for the bottom suface.}
#'	\item{\code{top.bond}}{Factor giving the bonding solution for the top suface.}
#'	\item{\code{filt.time}}{Filtration time.}
#'	}
#'
#' @references
#' Connor, W. S. (1958). "Experiences with incomplete block designs." In V. Chew (Ed.),
#' \emph{Experimental Designs in Industry}, pp. 193-206. New York: Wiley.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"MilkFiltration"

#' Milk production of cows under different feed regimes.
#'
#' @description This experiment studies the effect of feed type on
#' milk production in cows.  There is
#' large cow to cow variation in production, so each cow receives all
#' treatments.
#' Milk production for a given cow also tends to decrease during
#' any given lactation, so time period is also blocked.    The treatments
#' are roughage, limited grain, and full grain.
#' The response is the milk production during the
#' six week period the cow is on a given feed.
#'
#'	Source: Oehlert (2022), originally from Cochran, Autrey, and Cannon (1941),
#' via Bellavance and Tardif (1995).
#'
#' @format A dataframe of 54 observations on five variables.
#'	\describe{
#'	\item{\code{cow}}{Factor giving the cow for the current observation.}
#'	\item{\code{period}}{Factor giving the time period for the current observation.}
#'	\item{\code{treatment}}{Factor giving the treatment for the current observation.}
#'	\item{\code{previous}}{Factor giving the treatment for the previous time period for this cow.}
#'	\item{\code{milk}}{Milk production in pounds per six weeks.}
#'	}
#'
#' @references
#' Bellavance, F. and S. Tardif (1995). "A nonparametric approach to the analysis of
#' three-treatment three-period crossover designs," \emph{Biometrika} \strong{82},
#' 865-875.
#'
#' Cochran, W. G, K. M. Autrey, and C. Y. Autrey (1941). "A double change-over design
#' for dairy cattle feeding experiments," \emph{Journal of Dairy Science} \strong{24}, 937-951.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"MilkProduction"

#' Free amino acids in cheese with nonstarter bacteria.
#'
#' @description Cheese is made by bacterial fermentation of Pasteurized
#'	milk.  Most of the bacteria are purposefully added to
#'	do the fermentation; these are the starter cultures.  Some
#'	"wild" bacteria are also present in cheese; these are
#'	the nonstarter bacteria.  One hypothesis is that nonstarter
#'	bacteria may affect the quality of a cheese, so that
#'	otherwise identical cheese making facilities produce
#'	different cheeses due to their different indigenous
#'	nonstarter bacteria.
#'
#'	Two strains of nonstarter bacteria were isolated at
#'	a premium cheese facility: R50-10 and R21-2.  We will
#'	add these nonstarter bacteria to cheese to see if they
#'	affect quality.  Our four treatments will be control,
#'	addition of R50, addition of R21, and addition of a
#'	blend of R50 and R21. Twelve cheeses are made, three
#'	for each of the four treatments, with the treatments
#'	being randomized to the cheeses.  Each cheese is then
#'	divided into four portions, and the four portions for
#'	each cheese are randomly assigned to one of four aging
#'	times: 1 day, 28 days, 56 days, and 84 days.  Each portion
#'	is measured for total free amino acids (a measure of
#'	bacterial activity) after it has aged for its specified
#'	number of days.
#'
#'	Source: Oehlert (2022), data from P. Swearingen (pers. comm.).
#'
#' @format A data frame of twelve observations on three variables.
#'	\describe{
#'	\item{\code{r50}}{Factor indicating presence or absence of strain r50.}
#'	\item{\code{r21}}{Factor indicating presence or absence of strain r21.}
#'	\item{\code{days.z}}{The number of days of aging.}
#'	\item{\code{days}}{A factor version of \code{days.z}.}
#'	\item{\code{cheese}}{A factor indicating the cheese being studied (replication).}
#'	\item{\code{freeAA}}{The amino acids measured after ripening.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Nonstarters"

#' Strength of notched and un-notched boards
#'
#' @description Twenty-six boards are cut to dimension 26 inches, by 2.5 inches
#'	by .75 inches. Thirteen of the boards are randomly selected, and these boards
#'	are planed to a uniform thickness of .625 inches. The remaining thirteen
#'	boards have a notch cut in the center that is 1 inch wide and
#'	.125 inch deep (that is, .625 inch of wood remains under the notch). Each
#'	board is then supported at the ends and pressure is applied in the center
#'	until the board fails (center-point loading at .1 in/minute across a span
#'	of 24 inches). The response is the breaking strength of the boards, in pounds.
#'
#'	Source: Oehlert (2022),  data  from D. Shmulsky (pers. comm.).
#'
#' @format A dataframe of 91 observations on two variables.
#'	\describe{
#'	\item{\code{shape}}{A factor indicating the treatment applied to the board (notched or uniform).}
#'	\item{\code{power}}{The breaking strength in pounds.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"NotchedBoards"

#' Odor intensities of various formulations.
#'
#' @description Individuals perceive odors at different intensities.
#' We have a procedure that allows us to determine the concentration
#' of a solution at which an individual first senses the odor (the
#' threshold concentration).  We would like to determine how
#' the threshold concentrations vary over sixteen solutions.
#' However, the threshold-determining
#' procedure is time consuming and any individual judge can
#' only be used to find threshold concentrations for four solutions.
#'
#' Each solution is a combination of five compounds in various ratios.
#' The sixteen solutions are formed by manipulating four factors, each at
#' two levels.  Factor 1 is the ratio of the concentration
#' of compound 1 to the concentration of compound 5.  Factors
#' 2 through 4 are are similar.
#'
#' We have eight judges.  Two judges are assigned at random to each
#' of the solution sets [(1), bc, abd, acd],
#' [a, abc, bd, cd],
#' [ab, ac, d, bcd], and
#' [b, c, ad,abcd].  We then determine the threshold
#' concentration for the solutions for each judge.
#' The threshold concentrations are normalized by dividing
#' by a reference concentration.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe of 32 observations on six variables.
#'	\describe{
#'	\item{\code{block}}{Factor denoting the block for the current observation.}
#'	\item{\code{A}}{Factor indicating the ratio of component 1 to component 5.}
#'	\item{\code{B}}{Factor indicating the ratio of component 2 to component 5.}
#'	\item{\code{C}}{Factor indicating the ratio of component 3 to component 5.}
#'	\item{\code{D}}{Factor indicating the ratio of component 4 to component 5.}
#'	\item{\code{concentration}}{Threshold concentration (scaled).}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"OdorIntensity"

#' Oleoresin collected under acid treatments.
#'
#' @description The oleoresin of trees is obtained by cutting a tapping
#' gash in the bark and removing the resin that collects
#' there.  Acid treatments can also improve collection.
#' In this experiment, four trees (\emph{Dipterocarpus kerrii})
#' will be tapped seven times each.  Each of the tappings
#' will be treated with a different strength of
#' sulfuric acid (0, 2.5, 5, 10, 15, 25, and 50\% strength),
#' and the resin collected from each tapping is
#' the response (in grams).
#'
#'	Source: Oehlert (2022), originally from Bin Jantan, Bin Ahmad,
#' and Bin Ahmad (1987).
#'
#' @format A dataframe of 28 observations on four variables.
#'	\describe{
#'	\item{\code{acid.z}}{A numerical variable giving the acid percent strength.}
#'	\item{\code{acid}}{A factor version of \code{acid.z}.}
#'	\item{\code{tree}}{A factor indicating the tree used.}
#'	\item{\code{yield}}{The amount of resin collected (grams).}
#'	}
#'
#' @references
#' Bin Jantan, I., A. S. Bin Ahmad, and A. R. Bin Ahmad (1987)
#' "Tapping of oleo-resin from \emph{Dipterocarpus kerrii},
#' \emph{The Malaysian Forester} \strong{50}, 343-353.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Oleoresin"

#' A synthetic example of a one-cell interaction.
#'
#' @description Synthetic data for a 2x2x2x2 factorial with a one-cell interaction.
#'
#'	Source: Oehlert (2022), originally from Oehlert (1994).
#'
#' @format A dataframe of 32 observations on five variables.
#'	\describe{
#'	\item{\code{A}}{Factor 1.}
#'	\item{\code{B}}{Factor 2.}
#'	\item{\code{C}}{Factor 3.}
#'	\item{\code{D}}{Factor 4.}
#'	\item{\code{y}}{A response.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (1994) "Isolating one-cell interactions," \emph{Technometrics}
#'	\strong{36}, 403-408.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"OneCell"


#' Moisture content of orange pulp silage
#'
#' @description Twelve orange pulp silage samples were randomly divided into four
#'	groups of three, each group receiving its own treatment. Each group received a
#'	different treatment (control, salt (NaCl), formic acid, beet pulp). The response
#'	is the moisture content of the silage.
#'
#'	Source: Oehlert (2022), originally from Caro, et al. (1990).
#'
#' @format A data frame of 12 observations on two variables.
#'	\describe{
#'	\item{\code{treatment}}{A factor denoting the treatment for each observation.}
#'	\item{\code{moisture}}{The moisture content of the silage (percent).}
#'	}
#'
#' @references
#' Caro, M. R., E. Zamora, L. Leon, F. Cuello, J. Salinas, D. Megias, M. J. Cubero,
#' and Z. Contreras (1990). "Isolation and identification of \emph{Listeria monocytogenes}
#' in vegetable byproduct silages containing preservative additives and destined for animal
#' feeding. \emph{Animal Feed Science and Technology} \strong{31}, 285=291.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"OrangePulpSilage"

#' Delamination of pacemaker substrates
#'
#' @description Implantable heart pacemakers contain small circuit boards called substrates.
#' These substrates are assembled, cut to shape, and fired. Some of the substrates will separate,
#' or delaminate, making them useless. The purpose of this experiment was to study the effects
#' of three factors on the rate of delamination. The factors were A: firing profile time,
#' 8 versus 13 hours with the theory suggesting 13 hours is better; B: furnace airflow, low versus
#' high, with theory suggesting high is better; and C: laser, old versus new, with theory suggesting
#' new cutting lasers are better.
#'
#' A large number of raw, assembled substrates are divided into sixteen groups. These
#' sixteen groups are assigned at random to the eight factor-level combinations of the three
#' factors, two groups per combination. The substrates are then processed, and the response
#' is the fraction of substrates that delaminate.
#'
#'	Source: Oehlert (2022), originally from T. Kerkow (pers. comm.).
#'
#' @format A dataframe with 16 observations on four variables.
#'	\describe{
#'	\item{\code{flow}}{A factor indicating the airflow rate.}
#'	\item{\code{time.z}}{Firing profile time.}
#'	\item{\code{time}}{A factor version of firing profile time.}
#'	\item{\code{fraction}}{The fraction of substrates delaminating.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"PacemakerDelamination"

#' Strength of pacemaker solder joints
#'
#' @description Twelve "substrates" are randomly assigned to four operators,
#'	three substrates per operator. Each operator solders four pins on each substrate.
#'	Finally, each solder joint is assessed by measuring its shear strength.
#'
#'	Source: Oehlert (2022), originally from T. Kerkow (pers. comm.).
#'
#' @format A dataframe with 48 observations on three variables.
#'	\describe{
#'	\item{\code{operator}}{A factor indicating which operator did the soldering.}
#'	\item{\code{substrate}}{A factor indicating the substrate number.}
#'	\item{\code{strength}}{Strength of the solder joint in pounds.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"PacemakerPins"

#' Page faults in computers.
#'
#' @description Some computers divide memory into pages.  A page fault
#'	occurs when a needed page of memory is not actually in RAM and needs
#'	to be loaded. Doing this entails removing one of the RAM-resident
#'	memory pages, and this experiment studies algorithms for choosing the page.
#'
#' The experiment consists of running different programs on a
#' computer under different configurations and counting the number
#' of page faults.
#' There were two paging algorithms to study, and this is
#' the factor of primary interest.  The other factors are the
#' sequence in which the system was initialized (three levels),
#' the size of the program (three levels), and the memory allocation
#' for the program (three levels). We run these 54 combinations in random
#' order and get the count of page faults as response.
#'
#' We expect all three of the
#' non-algorithm factors to be important and interact. The issue
#' is what does algoritm do and whether/how it interacts with the others.
#'
#'	Source: Oehlert (2022), originally from ... I think these data are
#'	from Barry Margolin back in 1977, but I'm not certain.
#'
#' @format A dataframe of 54 observations on five variables.
#'	\describe{
#'	\item{\code{alg}}{A factor indicating the paging algorithm used.}
#'	\item{\code{init}}{A factor indicating the initialization sequence.}
#'	\item{\code{size}}{A factor indicating the size of the program.}
#'	\item{\code{ram}}{A factor indicating the RAM allocation for the program.}
#'	\item{\code{faults}}{The number of page faults observed.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"PageFaults"


#' Density of particle board
#'
#' @description Eighteen samples of particle board are created (in random order) by
#'	varying the target density (42 or 48 lb/ft^3), the fraction of resin used
#'	(6, 9, or 12\%), and the fraction of slash (waste wood chips) used (0, 25 or 50\%).
#'	The response is the achieved density of the particle board.
#'
#'	Source: Oehlert (2022), originally from Boehner (1975).
#'
#' @format A dataframe of 18 observations on six variables.
#'	\describe{
#'	\item{\code{slash.z}}{The percentage of slash chips used.}
#'	\item{\code{slash}}{A factor versio of the percentage of slash chips used.}
#'	\item{\code{resin.z}}{The percentage of resin used.}
#'	\item{\code{resin}}{A factor version of the percentage of resin used.}
#'	\item{\code{target.z}}{The target density.}
#'	\item{\code{target}}{A factor version of the target density.}
#'	\item{\code{density}}{The achieved density.}
#'	}
#'
#' @references
#' Boehner, A. W. (1975) \emph{The Effect of Three Species of Logging Slash on the
#' Properties of Aspen Planer Shavings Particleboard}. Ph. D. Thesis, University
#' of Minnesota, St. Paul, MN.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"ParticleBoard"

#' Bacteria counts in milk after Pasteurization
#'
#' @description Bacterial counts (via serial dilution) for 15 samples of milk randomly
#'	assigned to three different Pasteurization methods.
#'
#'	Source: Oehlert (2022)
#'
#' @format A dataframe of 15 observations on two variables.
#'	\describe{
#'	\item{\code{treatment}}{A factor indicating the treatment used.}
#'	\item{\code{count}}{The bacterial count.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"Pasteurization"


#' Germinating pea seeds
#'
#' @description Results of an experiment looking at the effects of pre-soaking pea seeds
#'	either 12 or 24 hours and placing them on a substrate of either potting soil or paper
#'	towel. Each experimental unit used 20 seeds, and the response is the number of seeds
#'	that germinated after five days.
#'
#'	Source: Oehlert (2022), modeled on original data from K. Becklund (pers. comm.).
#'
#' @format A dataframe of 8 observations on three variables.
#'	\describe{
#'	\item{\code{germinated}}{The number of germinated seeds in the experimental unit.}
#'	\item{\code{nongerminated}}{The number of non-germinated seeds, simply 20-germinated.}
#'	\item{\code{treatment}}{A factor with four levels showing the treatment given to the
#'	experimental unit. Levels are: towel_12, soil_12, towel_24, soil_24.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"PeaGermination"

#' Oleoresin tapped from pine trees
#'
#' @description Pine oleoresin is obtained by tapping the trunks of pine trees.
#' Tapping is done by cutting a hole in the bark and collecting the
#' resin that oozes out.  This experiment compares four shapes for
#' the holes and the efficacy of acid treating the holes.  Twenty-four
#' pine trees are selected at random from a plantation, and the
#' 24 trees are assigned at random to the eight combinations of
#' hole shape (circular, diagonal slash, check, rectangular)
#' and acid treatment (yes or no).  The response is total grams of
#' resin collected from the hole.
#'
#'	Source: Oehlert (2022),  originally from Low and Bin Mohd.Ali (1985).
#'
#' @format A dataframe of 24 observations on three variables.
#'	\describe{
#'	\item{\code{shape}}{A factor indicating the shape of the cut.}
#'	\item{\code{treatment}}{A factor indicating acid treatment or control.}
#'	\item{\code{resin}}{The collected resin.}
#'	}
#'
#' @references
#' Low, C. K. and A. R. Bin Mohd. Ali (1985) "Experimental tapping of pine
#' oleoresin." \emph{The Malaysian Forester} \strong{48} 248-253.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"PineOleoresin"

#' Plasma leucine concentration in pigs
#'
#' @description Plant shoots can be encouraged in tissue culture by exposing
#' the cotyledons of plant embryos to cytokinin, a plant
#' growth hormone.  However, some shoots become watery, soft,
#' and unviable; this is vitrification.  An experiment was
#' performed to study how the orientation of
#' the embryo during exposure to cytokinin and the type of growth
#' medium after exposure to cytokinin affect the
#' rate of vitrification.
#' There are six treatments, which are the
#' factorial combinations of orientation (standard and experimental)
#' and medium (three kinds).  On a given day, the experimenters
#' extract embryos from white pine seeds and randomize them
#' to the six treatments.  The embryos are exposed using
#' the selected orientation for 1 week, and then go onto
#' the selected medium.
#' The experiment was repeated 22 times on different starting days.
#' The response is the fraction of shoots that are normal
#'
#'	Source: Oehlert (2022), originally from David Zlesak (pers. comm.).
#'
#' @format A data frame of 132 observations on four variables.
#'	\describe{
#'	\item{\code{orient}}{A factor indicating the orientation of the seeds.}
#'	\item{\code{medium}}{A factor indicating the medium in which the seeds were soaked.}
#'	\item{\code{day}}{A factor indicating the day on which these seeds were started.}
#'	\item{\code{fracNormal}}{The fraction of shoots that are normal.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"PlantShoots"

#' Plasma leucine concentration in pigs
#'
#' @description An animal nutrition experiment was conducted to study
#' the effects of protein in the diet on the level of
#' leucine in the plasma of pigs.  Pigs were randomly assigned
#' to one of twelve treatments.  These treatments are
#' the combinations of protein source (fish meal, soybean meal,
#' and dried skim milk) and protein concentration in the
#' diet (9, 12, 15, or 18 percent).  The response is the
#' free plasma leucine level in mcg/ml.
#'
#'	Source: Oehlert (2022), originally from Windels (1964).
#'
#' @format A data frame of 35 observations on four variables.
#'	\describe{
#'	\item{\code{source}}{A factor indicating the source of protein in the diet.}
#'	\item{\code{percent.z}}{The protein concentration in the diet.}
#'	\item{\code{percent}}{A factor version of \code{percent.z}.}
#'	\item{\code{leucine}}{The free plasma leucine level.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Windels, H. F. (1964). \emph{The Influence of Diet and Duration of Fast upon
#'	Plasma Levels of Free Leucine, Isoleucine, and Valine in the Growing Pig},
#'	Ph. D. thesis, University of Minnesota, St. Paul, MN.
"PlasmaLeucine"

#' Perception of political campaigns
#'
#' @description One-hundred thirteen people were randomly assigned into five groups.
#' Each group will receive some information about a political campaign,
#'	and then make a determination about whether the campaign has been
#'	using positive or negative advertising.  They make that rating on a
#'	1 to 7 scale, with 1 being most positive and 7 being most negative.
#'	Group one receives the transcript of a television ad that attacks
#'	an opposing candidate.  Group two receives the transcript of the ad
#'	plus an editorial describing the campaign as generally positive.
#'	Group three receives the transcript of the ad
#'	plus an editorial describing the campaign as generally negative.
#'	Groups four and five receive only the positive and negative
#'	editorials, respectively.
#'
#'	Source: Oehlert (2022), synthetic data adapted from A. Bos (pers. comm.).
#'
#' @format A dataframe of 113 observations on two variables.
#'	\describe{
#'	\item{\code{condition}}{The treatment applied to the subject.}
#'	\item{\code{response}}{The perception of the campaign on a 1 (positive) to 7 (negative) scale.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"PoliticalAds"

#' Volume ratio of popped to unpopped popcorn.
#'
#' @description Thirty-two batches of popcorn are produced, two each for the combinations
#' of popcorn kernel amount (1/8 or 1/4 cup), popcorn type (generic or
#' gourmet), oil type (canola or "popcorn" oil), and oil amount (1 or 2 tablespoons).
#' The response is the ratio of the volumes of the popped and unpopped popcorn.
#'
#'	Source: Oehlert (2022), data from J. McLaren (pers. comm.).
#'
#' @format A dataframe of 32 observations on five variables.
#'	\describe{
#'	\item{\code{pType}}{A factor indicating the type of popcorn used.}
#'	\item{\code{pAmt}}{A factor indicating the amount of popcorn used (in cups).}
#'	\item{\code{oType}}{A factor indicating the type of oil used.}
#'	\item{\code{oAmt}}{A factor indicating the volume of oil used (in tablespoons).}
#'	\item{\code{ratio}}{The popped to unpoped volume ratio.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"PopcornRatios"

#' Sensory aspects of regular and reduced fat potato chips.
#'
#' @description A sensory experiment was conducted to determine if consumers
#' have a preference between regular potato chips (A) and reduced-fat
#' potato chips (B).  Twenty-four judges will rate both types of
#' chips; twelve judges will rate the chips in the order regular fat, then
#' reduced fat; and the other twelve will have the order
#' reduced fat, then regular fat.  We anticipate judge to judge
#' differences and possible differences between the first and
#' second chips tasted.  The response is a liking scale, with
#' higher scores indicating greater liking
#'
#'	Source: Oehlert (2022),  data  from Monica Coulter (pers. comm.).
#'
#' @format A dataframe of 48 observations on four variables.
#'	\describe{
#'	\item{\code{judge}}{A factor indicating the judge rating the chips.}
#'	\item{\code{period}}{A factor indicating first or second tasting period.}
#'	\item{\code{fat}}{A factor indicating regular or reduced fat.}
#'	\item{\code{score}}{The sensory score of the chips.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"PotatoChips"

#' Perception of interpersonal power
#'
#' @description Ninety-three student volunteers are told that they will be having
#'	a conversation with a member of their same gender. The students are
#'	randomly assigned to three treatments, 31 students per treatment.
#'	One group of students will be told that their conversation partner is
#'	is an extravert, a second group is told that their partner is an
#'	introvert, and the third group is given no information. Prior to
#'	beginning the conversations, subjects fill out a questionaire.
#'
#'	In fact, there is no conversation; the quantities derived from the pre-conversation
#'	questionaire are the responses. The response shown here is "perception of
#'	power" in the upcoming conversation, a scale derived from 18 items in the
#'	questionaire. Higher responses on this scale indicate perceptions of greater power.
#'
#'	Source: Oehlert (2022), synthetic data adapted from A. Baldwin (pers. comm.).
#'
#' @format A dataframe of 91 observations on two variables.
#'	\describe{
#'	\item{\code{expectation}}{The treatment applied to the subject.}
#'	\item{\code{power}}{The perception of power.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"PowerPerception"

#' Product score.
#'
#' @description A product is produced that should have a score as close to
#' 2 as possible.  Eight factors are believed to influence the score, and a
#' completely randomized experiment is conducted using 64 units and sixteen
#' treatments in a 2_IV^(8-4) fractional-factorial treatment structure.
#' Factors are named in order of increasing expense.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe with 64 observations on nine variables.
#'	\describe{
#'	\item{\code{A}}{Level of factor 1.}
#'	\item{\code{B}}{Level of factor 2.}
#'	\item{\code{C}}{Level of factor 3.}
#'	\item{\code{D}}{Level of factor 4.}
#'	\item{\code{E}}{Level of factor 5.}
#'	\item{\code{F}}{Level of factor 6.}
#'	\item{\code{G}}{Level of factor 7.}
#'	\item{\code{H}}{Level of factor 8.}
#'	\item{\code{y}}{The produce score.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"ProductScore"


#' Quackgrass invasion of big bluestem
#'
#' @description Twenty four plots are randomly assigned to six different combinations of
#'	nitrogen addition (200, 400, 600, or 800 mg N/Kg soil) and irrigation (non or 1 cm/week).
#'	Big bluestem is planted and allowed to establish itself.
#'	After one year, quackgrass is seeded. After another year, biomass is harvested, and
#'	the response is the percentage of biomass that is big bluestem.
#'
#'	Source: Oehlert (2022), based on Wedin (1990).
#'
#' @format A dataframe of 24 observations on four variables.
#'	\describe{
#'	\item{\code{pct.Bluestem}}{A numeric variable giving the percentage of biomass that is bluestem.}
#'	\item{\code{treatment}}{A factor with six levels indicating the treatment the plot received.}
#'	\item{\code{water}}{A factor with two levels indicating the water treatment the plot received.}
#'	\item{\code{N}}{The nitrogen dose each plot received.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Wedin, E. (1990) \emph{Nitrogen Cycling and Competition and Grass Species,}
#' Ph. Thesis, University of Minnesota, Minneapolis, MN.
"Quackgrass"

#' Quartz Crystal Microbalance.
#'
#' @description A quartz crystal will oscillate when an alternating current is applied.
#' However, the frequency of the oscillation will change
#' if some material is adsorbed to the surface of the crystal. This is the
#' basis of the quartz crystal microbalance (QCM), which can measure in nanogram
#' quantities. In a QCM, the crystal will typically be coated with some
#' material and placed in some gaseous or liquid environment. The
#' substance to be measured is introduced to the environment, and the
#' concentration is inferred from the change in frequency of the crystal.
#'
#' In this experiment, we have two types of crystals: those coated with
#' gold and those coated with titanium dioxide. We have three random crystals
#' from each type of coating. The environments we will use are air and water.
#' The main purpose of this experiment is to investigate the change in
#' frequency when a third factor called intensity is varied across eight levels.
#' For each individual crystal, we make 16 observations on frequency change,
#' one for each of the combinations of environment and intensity. These 96
#' observations are done in random order. Note, there is not actually anything
#' being "weighed."
#'
#'	Source: Oehlert (2022),  data  from K. Greden (pers. comm.).
#'
#' @format A dataframe of 96 observations on six variables.
#'	\describe{
#'	\item{\code{type}}{The type of coating.}
#'	\item{\code{crystal}}{A factor indicating the crystal (nested in type, so 1,2,3,1,2,3 not 1,2,3,4,5,6).}
#'	\item{\code{env}}{The environment.}
#'	\item{\code{intensity}}{A factor indicating the intensity.}
#'	\item{\code{y}}{The frequency change.}
#'	\item{\code{int.z}}{A centered, quantitative variable indicating intensity based on
#'	the assumption that intensity is equally spaced.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"QCM"


#' Performance of ramp meters.
#'
#' @description Ramp meters are stop lights on the entrance ramps to freeways in urban settings. They
#' are used to control the number of cars trying to merge onto the freeway
#' at any given time. Proper use of a ramp meter can lead to shorter
#' overall waiting times and fewer accidents. This experiment considers the
#' effects of four factors on a performance index for the ramp.
#' The experimental factors are minimum release rate (150 or 350 vehicles per hour),
#' maximum allowed waiting time (3.5 or 6 minutes), maximum release rate
#' on the ramp (1650 or 1800 vehicles per hour), and an increment in demand
#' above normal traffic (125 or 250 vehicles/hour).
#' The performance
#' index is a combination of the number of vehicles that need to wait longer
#' than the desired maximum, the total time waited above the desired maximum,
#' and the total distance the queue on the ramp extends beyond the beginning of the ramp.
#'
#' This experiment is not performed on the driving public, but rather is performed
#' using a  traffic simulator for the entire transportation system in
#' a region. The simulator is extremely complex and includes many random inputs, so the response
#' to adjusting parameters like the ramp meter parameters can only be determined by
#' experiment.
#'
#'	Source: Oehlert (2022),  data adapted from A. Beegala (pers. comm.).
#'
#' @format A dataframe of 16 observations on ten variables.
#'	\describe{
#'	\item{\code{minRel.z}}{The minimum release rate.}
#'	\item{\code{minRel}}{A factor version of the minimum release rate.}
#'	\item{\code{maxWait.z}}{The maximum wait time.}
#'	\item{\code{maxWait}}{A factor version of the maximum wait time.}
#'	\item{\code{maxRel.z}}{The maximum release rate.}
#'	\item{\code{maxRel}}{A factor version of the maximum release rate.}
#'	\item{\code{Incr.z}}{The demand increment.}
#'	\item{\code{Incr}}{A factor version of the demand increment.}
#'	\item{\code{PI}}{The performance index for the freeway.}
#'	\item{\code{PI2}}{A version of PI with the fourth entry of 69 replaced by 690.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"RampMeters"



#' Rat liver weight
#'
#' @description Twenty-nine rats were randomly assigned to one of four diet treatments.
#'	Response is rate liver weight as a percentage of body weight. Synthetic data.
#
#'	Source: Oehlert (2022).
#'
#' @format A dataframe of 29 observations on two variables.
#'	\describe{
#'	\item{\code{weight}}{The liver weight, as a percentage of body weight.}
#'	\item{\code{diet}}{A factor indicating the assigned diet.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"RatLiverWeight"


#' Resin lifetimes
#'
#' @description Lifetime in hours of an encapsulating resin for gold-aluminum bonds in
#'	integrated circuits mean to operate at 120 degrees C. These samples were stressed at
#'	higher temperatures to shorten the lifetime, which would then be extrapolated back to
#'	120 C.
#'
#'	Source: Oehlert (2022), originally from Nelson (1990).
#'
#' @format A dataframe of 37 observations on four variables.
#'	\describe{
#'	\item{\code{temp.z}}{A numeric variable giving the temperature (in degrees C) at which
#'	the unit was stressed.}
#'	\item{\code{logTime}}{The log_10 lifetime of the resin before failure.}
#'	\item{\code{temp}}{A factor version of \code{temp.z}, included for convenience.}
#'	\item{\code{Time}}{The lifetime in hours (as \code{10^Time}), included for convenience.}
#'	}
#'
#' @references
#' Nelson, W. (1990). \emph{Accelerated Testing}. New York: Wiley.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"ResinLifetimes"

#' Reaction Times while on Cell Phone
#'
#' @description Using a cell phone while driving affects reaction time, but is it
#' just using a cell phone, or do other factors affect reaction time?
#' In this study, 54 male adults aged 22--24 years were asked to drive in a simulator under
#' various conditions, and their reaction times would be measured. At some
#' point during the simulation, the drivers begin talking on the cell phone.
#' After a certain time on the phone has elapsed, the ``car" ahead of the
#' driver hits the brakes, and the time between the leading car hitting
#' the brakes and the driver in the simulator hitting the brakes is the
#' measured response.
#' 
#' The 54 individuals were randomized to 18 conditions, which are 
#' the factor/level combinations of: meters (10, 15, or 20; the trailing
#' distance behind the leading car), conditions (day or night driving), and
#' duration (30, 60, or 90 seconds of cell phone conversation before the leading
#' car hits the brakes). The response is the reaction time (in milli seconds).
#'
#'	Source: Oehlert (2022), originally from Al-Darrab, et al (2009) via
#'	Lye (2019).
#'
#' Note: the original experiment procedure was more complex and on
#' actual roads. It also used each of 27 drivers twice, although details
#' were not given.
#'
#' @format A data frame of 54 observations on six variables.
#'	\describe{
#'	\item{\code{meters.z}}{The following distance in meters.}
#'	\item{\code{meters}}{A factor version of the following distance.}
#'	\item{\code{duration.z}}{The duration of the call before braking (s).}
#'	\item{\code{duration}}{A factor version of the duration.}
#'	\item{\code{conditions}}{The time of day for the experiment.}
#'	\item{\code{reactionTime}}{The reaction time of the driver (ms).}
#'	}
#'
#'
#' @references
#' Al-Darrab, I. A., Zahid A. Khan, and Shiekh I. Ishrat (2009) ``An experimental
#' study on the effect of mobile phone conversation on drivers’ reaction time in braking response,"
#' \emph{Journal of Safety Research}, \strong{40} 185-189.
#'
#' Lye, Leonard M. (2019) \emph{Applications of DEO in Engineering and Science:
#'	A Collection of 2^6 Case Studies}, Leonard Lye, St. John's, Newfoundland.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"ReactionTimes"


#' Free alpha amino acid in rice malt
#'
#' @description Free alpha amino acid was measured in twenty-four batches of rice malt that
#'	had been assigned randomly to 12 treatments, the factorial combinations of three levels
#'	of germination time (in days) and four levels of temperature (in degrees C). Data here
#'	are the twelve treatment means. The (corrected) total sum of squares in the full data set
#'	was 8097.
#'
#'	Source: Oehlert (2022), originally from Aniche and Okafor (1989).
#'
#' @format A dataframe of 12 observations on five variables.
#'	\describe{
#'	\item{\code{day.z}}{The number of days for germination.}
#'	\item{\code{day}}{A factor version of the number of days for germination.}
#'	\item{\code{temperature.z}}{The temperature in degrees C.}
#'	\item{\code{temperature}}{A factor version of the temperature.}
#'	\item{\code{FAN}}{The average free alpha amino acid for this treatment.}
#'	}
#'
#' @references
#' Aniche, N. G. and N. Okafor (1989) "Studies on the effect of germination time and
#'	temperature on the malting of rice." \emph{Journal of the Institute of Brewing}
#'	\strong{95}, 165-167.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"RiceMalt"

#' Replicated Latin Square
#'
#' @description A 4x4 Latin Square with two replications.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe of 32 observations on four variables.
#'	\describe{
#'	\item{\code{row}}{A factor indicating the row of the square (1-4).}
#'	\item{\code{column}}{A factor indicating the column of the squares (1-8).}
#'	\item{\code{treatment}}{A factor indicating the treatment.}
#'	\item{\code{response}}{The experimental response.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"RLS"

#' Elasticity of rocket fuel mixtures
#'
#' @description Three components of a rocket propellant are the binder, the
#' oxidizer, and the fuel. We want to find the mixtures that yield coefficients
#' of elasticity less than 3000.
#' All components must be present and there are minimum proportions,
#' so the investigators used a pseudocomponents design.
#'
#'	Source: Oehlert (2022), originally from Kurotori (1966).
#'
#' @format A dataframe of 10 observations on four variables.
#'	\describe{
#'	\item{\code{binder}}{The pseudo-component for the binder.}
#'	\item{\code{oxidizer}}{The pseudo-component for the oxidizer.}
#'	\item{\code{fuel}}{The pseudo-component for the fuel.}
#'	\item{\code{elasticity}}{The elasticity of the fuel mixture.}
#'	}
#'
#' @references
#' Kurotori, I. S. (1966). "Experiments with mixtures of components having lower bounds."
#' \emph{Industrial Quality Control}, May, 592-596
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"RocketFuel"


#' Azimuth errors of rockets
#'
#' @description An army rocket development
#' program was investigating the effects of slant range and
#' propellant temperature on the accuracy of rockets.  The
#' overall objective of this phase of the program was to determine
#' how these variables affect azimuth error (that is, side to side as
#' opposed to distance) in the rocket impacts.
#'
#' Three levels
#' were chosen for each of slant range and temperature.
#' The following
#' procedure was repeated on 3 days.  Twenty-seven rockets are
#' grouped into nine sets of three, which are then assigned to
#' the nine factor-level combinations in random order.  The
#' three rockets in a group are fired all at once in a single
#' volley, and the azimuth error recorded. (Note that meteorological
#' conditions may change from volley to volley.)
#'
#'	Source: Oehlert (2022), originally from Bicking (1958).
#'
#' @format A dataframe of 81 observations on four variables.
#'	\describe{
#'	\item{\code{day}}{A factor indicating the day of the launch.}
#'	\item{\code{slantRng}}{A factor indicating the slant range of the launch.}
#'	\item{\code{temp}}{A factor indicating the propellant temperture of the launch.}
#'	\item{\code{asError}}{The azimuth error of the launch.}
#'	}
#'
#' @references
#' Bicking, C. A. (1958) "Experiences and needs for design in ordnance
#' experimentation. In V. Chow (Ed.), \emph{Experimental Designs in Industry},
#' pp. 247-252. New York, Wiley.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"Rockets"

#' Soybean weight under crop rotation.
#'
#' @description An experiment to see how variety of soybean
#' and crop rotation practices affect soybean productivity.
#' There are two varieties used, Hodgson 78 and BSR191.
#' These varieties are each used
#' in four different 5-year rotation patterns with corn.
#' The rotation
#' patterns are (1) four years of corn and then soybeans (C-C-C-C-S),
#' (2) three years of corn and then two years of soybeans (C-C-C-S-S),
#' (3) soybean and corn alternation (S-C-S-C-S), and (4) five years of
#' soybeans (S-S-S-S-S).
#' Here we only have data from the fifth year.
#'
#' This experiment was conducted twice in Waseca, MN, and twice in
#' Lamberton, MN. Two groups of eight plots were chosen at each location.  The first
#' group of eight plots at each location was randomly assigned to the variety-rotation
#' treatments in 1983.  The second group was then assigned
#' in 1984.  Responses were measured in 1987 and 1988 (the fifth
#' years) for the two groups.
#'
#' The response of interest is the weight (g) of 100 random seeds from
#' soybean plants
#'
#'	Source: Oehlert (2022), originally from Whiting (1990).
#'
#' @format A dataframe of 32 observations on four variables.
#'	\describe{
#'	\item{\code{weight}}{The weight of 100 randomly chosen seeds.}
#'	\item{\code{locYr}}{A factor indicating the location/year combination for the plot.}
#'	\item{\code{rotation}}{A factor indicating the rotation used for the plot.}
#'	\item{\code{variety}}{A factor indicating the variety used for the plot.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Whiting, K. R. (1990) \emph{Host-Specific Pathogens and the Corn/Soybean Rotation
#' Effect}. Ph. D. thesis, University of Minnesota, St. Paul, MN.
"Rotations"

#' Weight change of yellow perch under competition from ruffe.
#'
#' @description Yellow perch and ruffe are two fish species that compete.
#' An experiment is run to determine the effects of fish density
#' and competition with ruffe on the weight change in yellow perch.
#' There are two
#' levels of fish density (low and high) and two levels of
#' competition (ruffe absent and ruffe present). Sixteen
#' tanks are arranged in four enclosures of four tanks each.
#' Within each enclosure, the four tanks are randomly assigned to
#' the four factor-level combinations of density and competition.
#' The response is the change in the weight of perch after 5 weeks
#' (in grams).
#'
#'	Source: Oehlert (2022), originally from Julia Frost (pers. comm.).
#'
#' @format A dataframe of 16 observations on four variables.
#'	\describe{
#'	\item{\code{encl}}{A factor indicating the enclosure.}
#'	\item{\code{density}}{A factor indicating the density of fish.}
#'	\item{\code{ruffe}}{A factor indicating the addition of ruffe.}
#'	\item{\code{wtChange}}{The weight change (grams).}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Ruffe"

#' Average time to runstitch a collar in standard and ergonomic conditions.
#'
#' @description Thirty employees will runstitch collars using a standard
#'	workspace set up and an ergonomic workspace setup. The response
#'	is the average time to runstich collars (in seconds). For each
#'	employee a coin is tossed; heads means that the employee will
#'	use the standard first, and tails indicates that the employee
#' 	will use ergonomic first.
#'
#'	Source: Oehlert (2022), originally from Bezjak and Knez (1995).
#'
#' @format A dataframe of 30 observations on two variables.
#'	\describe{
#'	\item{\code{Standard}}{Runstitch time under standard conditions.}
#'	\item{\code{Ergonomic}}{Runstitch time under ergonomic conditions.}
#'	}
#'
#' @references
#' Bezjak, Z. and B. Knez (1995)  "Workplace design and loadings in the
#' process of sewing garments," \emph{International Journal of Clothing Science
#' and Technology} 7, 89-101.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"RunStitch"

#' Willingness to buy after viewing a video.
#'
#' @description Advertisers wish to determine if program content affects
#' the success of their ads on those programs.  They produce
#' two videos, one containing  a depressing drama and some ads,
#' the second containing an upbeat comedy and the same ads.  Twenty-two
#' subjects are split at random into two groups of eleven, with
#' the first group watching the drama and the second group watching
#' the comedy.  After the videos, the subjects are asked several questions,
#' including "How do you feel?" and "How likely are you to buy?"
#' one of the products mentioned in the ads.  "How do you feel" was on a
#' 1 to 6 scale, with 1 being happy and 6 being sad.
#' "How likely are you to buy?" was also on a 1 to 6 scale, with 6
#' being most likely.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe of 22 observations on three variables.
#'	\describe{
#'	\item{\code{show}}{A factor indicating the category of program.}
#'	\item{\code{feel}}{How the subject feels after the video.}
#'	\item{\code{buy}}{How likely the subject is to purchase after the video.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"SadAds"

#' Softness of cold-foamed car seats.
#'
#' @description Seven factors are believed to control the softness of
#' cold-foamed car seats, and an experiment was conducted
#' to determine how these factors influence the softness.
#' A 2_III^(7-4) design was run with generators
#' I = ABD = ACE = BCF = ABCG.  The
#' response is the average softness of the seats
#'
#'	Source: Oehlert (2022), originally from Bergman and Hynen (1997)
#'
#' @format A dataframe with 8 observations on eight variables.
#'	\describe{
#'	\item{\code{A}}{Level of factor 1.}
#'	\item{\code{B}}{Level of factor 2.}
#'	\item{\code{C}}{Level of factor 3.}
#'	\item{\code{D}}{Level of factor 4.}
#'	\item{\code{E}}{Level of factor 5.}
#'	\item{\code{F}}{Level of factor 6.}
#'	\item{\code{G}}{Level of factor 7.}
#'	\item{\code{softness}}{The observed softness.}
#'	}
#'
#' @references
#' Bergman, B. and A. Hynen (1997) "Dispersion effects from unreplicated designs
#' in the 2^k-p series," \emph{Technometrics} \strong{39}, 191-198.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"SeatSoftness"


#' Antibiotic resistant bacteria in sewage.
#'
#' @description Bacteria may be adapting to non-zero levels of antibiotics in sewage.
#'	We will take some sewage, treat it with some kind of antibiotic,
#'	grow it on a plate, and then count the bacteria that survive.
#'	Forty-eight preparations were made, three each for the combinations
#'	of origin of sample (activated sludge or effluent), growth medium
#'	(LB or CAGY), and antibiotic (Amoxicillin, Tetracycline, Tylosin,
#'	or none). Bacterial counts (per uL of sample) were determined by serial plate counting.
#'
#'	Source: Oehlert (2022), data adapted from S. Ghosh (pers. comm.).
#'
#' @format A dataframe of 48 observations on four variables.
#'	\describe{
#'	\item{\code{medium}}{A factor indicating LB or CAGY.}
#'	\item{\code{origin}}{A factor indicating sludge or effluent.}
#'	\item{\code{antibiotic}}{A factor indicating which antibiotic was added.}
#'	\item{\code{count}}{The bacterial count (per uL of sample).}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"SewageBacteria"

#' Coffee yield under shade trees.
#'
#' @description Shade trees in coffee plantations may increase or decrease
#' the yield of coffee, depending on several environmental and
#' ecological factors.  Robusta coffee was planted at three
#' locations in Ghana.  Each location was divided into four plots,
#' and trees were planted at densities of 185, 90, 70,
#' and 0 trees per hectare.  Data are the yields of coffee
#' (kg of fresh berries per hectare) for the 1994-95 cropping season.
#'
#'	Source: Oehlert (2022), originally from Amoah, et al. (1997).
#'
#' @format A dataframe of 12 observations on four variables.
#'	\describe{
#'	\item{\code{density.z}}{The planting density (per hectare) of the shade trees.}
#'	\item{\code{density}}{A factor version of \code{density.z}.}
#'	\item{\code{location}}{A factor giving the location.}
#'	\item{\code{yield}}{The yield of coffee.}
#'	}
#'
#' @references
#' Amoah, F. M., K. Osei-Bonsu, and F. K. Oppong (1997). "Response of
#' improved robusta coffee to location and management practices in Ghana."
#' \emph{Experimental Agriculture} \strong{cc}, 103-111.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"ShadedCoffee"

#' Shrinkage of speedometer cable casings.
#'
#' @description An experiment was conducted to determine the factors that affect
#' the amount of shrinkage in speedometer cable casings.  There were
#' fifteen factors, each at two levels, but the design used only sixteen factor-level
#' combinations (2_III^(15-11)).  The generators were
#' I = -DHM = -BHK = BDF = BDHO = -AHJ = -ADE = ADHN
#' = -ABC = ABHL = ABDG = -ABDHP, and the factors were:
#' liner OD (A); liner die (B); liner material (C);
#' liner line speed (D); wire braid type (E); braiding
#' tension (F); wire diameter (G); liner tension (H);
#' liner temperature (J); coating material (K);
#' coating die type (L);  melt temperature (M);
#' screen pack (N); cooling method (O); and line speed (P).
#' The response is the average of four shrinkage
#' measurements.
#'
#'	Source: Oehlert (2022), originally from Quinlan (1985)
#'
#' @format A dataframe with 16 observations on ten variables.
#'	\describe{
#'	\item{\code{A}}{Level of liner OD.}
#'	\item{\code{B}}{Level of liner die.}
#'	\item{\code{C}}{Level of liner material.}
#'	\item{\code{D}}{Level of liner line speed.}
#'	\item{\code{E}}{Level of wire braid type.}
#'	\item{\code{F}}{Level of braiding tension.}
#'	\item{\code{G}}{Level of wire diameter.}
#'	\item{\code{H}}{Level of liner tension.}
#'	\item{\code{J}}{Level of liner temperature.}
#'	\item{\code{K}}{Level of coating material.}
#'	\item{\code{L}}{Level of coating die type.}
#'	\item{\code{M}}{Level of melt temperature.}
#'	\item{\code{N}}{Level of screen pack.}
#'	\item{\code{O}}{Level of cooling method.}
#'	\item{\code{P}}{Level of line speed.}
#'	\item{\code{strength}}{The observed shrinkage.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Quinlan, J. (1985). Product improvement by application of Taguchi meth- ods. In
#' \emph{American Supplier Institute News} (special symposium ed.), pp. 11-16,
#' Dearborn, MI: American Supplier Institute.
"Shrinkage"

#' Thickness of silicon wafers.
#'
#' @description Silicon wafers for integrated circuits are grown in
#' a device called a susceptor, and a response of interest
#' is the thickness of the silicon.  Eight factors, each at two levels,
#' were believed to contribute: rotation method (A),
#' wafer code (B), deposition temperature (C), deposition
#' time (D), arsenic flow rate (E), HCl etch temperature (F),
#' HCl flow rate (G), and nozzle position (H).
#' A 2_IV^(8-4) design was run with generators
#' I = ABCD = BCEF = ACEG = BCEH.  The average
#' thickness of the silicon is the response.
#'
#'	Source: Oehlert (2022), originally from Shoemaker, Tsui, and Wu (1991)
#'
#' @format A dataframe with 16 observations on nine variables.
#'	\describe{
#'	\item{\code{A}}{Level of rotation method.}
#'	\item{\code{B}}{Level of wafer code.}
#'	\item{\code{C}}{Level of deposition temperature.}
#'	\item{\code{D}}{Level of deposition time.}
#'	\item{\code{E}}{Level of arsenic flow rate.}
#'	\item{\code{F}}{Level of HCl etch temperature.}
#'	\item{\code{G}}{Level of HCl flow rate.}
#'	\item{\code{H}}{Level of nozzle position.}
#'	\item{\code{thickness}}{The observed thickness of the silicon.}
#'	}
#'
#' @references
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Shoemaker, A. C., K.-L. Tsui, and C. F. J. Wu (1991) "Economical experimentation
#' methods for robust design," \emph{Technometrics} \strong{33}, 415-427.
"SiliconThickness"


#' Average daily weight gain by calves.
#'
#' @description Four bulls are selected at random, and each bull is bred to
#'	multiple randomly selected cows. The response is average daily weight gain
#'	of the calves.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe of 24 observations on two variables.
#'	\describe{
#'	\item{\code{bull}}{A factor indicating the bull.}
#'	\item{\code{gain}}{The average daily weight gain.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"Sires"

#' Softness of clothes under different detergents
#'
#' @description Thirty consumers are asked to rate the softness of clothes washed
#' by ten different detergents, but  each consumer rates only four different
#' detergents.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe of 120 observations on three variables.
#'	\describe{
#'	\item{\code{judge}}{The consumer doing the rating.}
#'	\item{\code{treat}}{The detergent in which the clothes were washed.}
#'	\item{\code{softness}}{The softness rating.}
#'	}
#'
#' @references
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"Softness"

#' Absorbance of soup on crackers
#'
#'	Many people enjoy dipping crackers in their soup. This experiment
#'	explores the amount of soup that is absorbed by, or adhered to, dipping
#'	crackers. We consider three different types of soup: a condensed, cream-based
#'	soup (Cream of Mushroom, need to add water); a condensed water-based soup (Tomato,
#'	need to add water);
#'	and a ready-to-eat pre-made soup (Steak and Potatoes, no additional water needed).
#'	We also consider three serving temperatures: 100, 110, and 120 degrees F.
#'	
#'	In this experiment, nine bowls of soup will be prepared in random order,
#'	one each for the combinations of soup type and serving temperature.
#'	For each bowl, 200g (approximately) of the soup is added and the
#'	combination of soup and bowl is weighed. Then five unbroken
#'	saltine crackers are placed in the soup. After two minutes, the crackers
#'	are removed (along with any soup that clings to them). The soup 
#'	and bowl are again weighed, the decrease in weight (in g) is 
#'	response. The experiment is then repeated the next day.
#'
#'	Source: Oehlert (2022), originally S. Kleba (pers. comm.)
#'
#' @format A data frame of 18 observations on five variables.
#'	\describe{
#'	\item{\code{replication}}{The day the observations were made.}
#'	\item{\code{type}}{A factor giving the kind of soup.}
#'	\item{\code{temp}}{A factor giving the temperature treatment of the soup.}
#'	\item{\code{temp.z}}{The temperature of the soup.}
#'	\item{\code{absorbed}}{The amount of soup absorbed onto the cracker (g).}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"SoupCrackers"

#' Number of barley seeds sprouting
#'
#' @description Barley seeds are divided into 30 lots of 100 seeds each.  The 30 lots are divided at
#' random into ten groups of three lots each, with each group receiving
#' a different treatment.  The ten treatments are the factorial
#' combinations of amount of water used for sprouting with two levels (4 or 8 ml)
#' and age of the seeds with five levels (1, 3, 6, 9, or 12 weeks).
#' The response measured is the number of seeds sprouting.
#'
#'	Source: Oehlert (2022), originally from Hareland and Madson (1989).
#'
#' @format A dataframe of 30 observations on five variables.
#'	\describe{
#'	\item{\code{weeks.z}}{The age of the seeds.}
#'	\item{\code{weeks}}{A factor version of age.}
#'	\item{\code{water.z}}{The amount of water used in germination.}
#'	\item{\code{water}}{A factor version of water.}
#'	\item{\code{sprouting}}{The number of seeds sprouting.}
#'	}
#'
#' @references
#' Hareland, G. A. and M. A. Madson (1989) "Barley dormancy and fatty acid composition
#' of lipids isolated from freshly harvested and stored kernels" \emph{Journal of the
#' Institute of Brewing} \strong{95}, 437-442.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"SproutingBarley"

#' Adhesive strength between steel bars.
#'
#' @description Curing time and temperature affect the shear strength of
#' an adhesive that bonds galvanized steel bars.  This
#' experiment was repeated on 2 separate days.  Twenty-four
#' pieces of steel are obtained by random sampling from
#' warehouse stock.  These are grouped into twelve pairs;
#' the twelve pairs are glued and then cured with one of
#' nine curing treatments assigned at random.  The treatments
#' are the three by three factorial combinations of
#' temperature (375, 400, and 450 degrees F, coded -1, 0, 2)
#' and time (30, 35, or 40 seconds, coded -1, 0, 1).  Four
#' pairs were assigned to the center point, and one pair to
#' all other conditions.  The response is
#' shear strength (in psi).
#'
#'	Source: Oehlert (2022),  originally from Khuri (1992).
#'
#' @format A dataframe of 24 observations on four variables.
#'	\describe{
#'	\item{\code{day}}{Factor indicating the day.}
#'	\item{\code{time}}{Coded level of curing time.}
#'	\item{\code{temp}}{coded level of curing temperature.}
#'	\item{\code{strength}}{Shear strength of the bond.}
#'	}
#'
#' @references
#' Khuri, A. I. (1992). "Response surface models with random block effects,"
#' \emph{Technometrics} \strong{34}, 26-37.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"SteelBars"


#' Percent retention of guitar string coating
#'
#' @description Many guitar strings are made (at least partially) of steel. Perspiration
#'	and oils from the body can corrode the steel, so manufacturers use coatings
#'	to prevent corrosion. This experiment studies how the manufacturing process
#'	affects the durability of these coatings. Coatings are applied by dipping the
#'	specimen in the coating, extracting it from the coating, and then curing the coating.
#'	Forty-eight steel samples are randomly
#'	assigned to the 16 factor/level combinations of rate (the speed at which the
#'	steel is extracted from the dip coater, 6 or 12 inches per minute), the curing
#'	temperature (20, 60, 90, or 120 degrees C), and the curing time (30 or 60 minutes).
#'	After curing, the the coated steel samples are swirled for two minutes in a .9\% NaCl in water
#'	solution to simulate exposure to perspiration.
#'
#'	The steel samples are weighed three times: before coating, after curing, and after
#'	the NaCl treatment. From these, you can determine the weight of coating added and
#'	the weight of coating remaining after the NaCl treatment. The response is the
#'	percentage of coating retained after the salt treatment.
#'
#'	Source: Oehlert (2022),  data  from N. Ellering (pers. comm.).
#'
#' @format A dataframe of 48 observations on seven variables.
#'	\describe{
#'	\item{\code{time.z}}{The curing time in minutes.}
#'	\item{\code{time}}{A factor version of the curing time.}
#'	\item{\code{temp.z}}{The curing temperature, in degrees C.}
#'	\item{\code{temp}}{A factor version of the curing temperature.}
#'	\item{\code{rate.z}}{The rate at which the sample is extracted from the dipping coater, in inches/minute.}
#'	\item{\code{rate}}{A factor version of the rate.}
#'	\item{\code{ptc.retained}}{The percentage of coating remaining after the salt treatment.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"StringCoating"

#' Disk Drive Substrate Voltages
#'
#' @description Disk drive substrates may affect the amplitude of the
#' signal obtained during read back.  A manufacturer compares
#' four substrates: aluminum (A), nickel-plated aluminum (B), and two
#' types of glass (C and D).  Sixteen disk drives will be made,
#' four using each of the substrates.  It is felt that the machine used in manufacturing,
#' the operator of the machine,
#' and day of production may have an effect on the drives,
#' so these three effects were blocked.  The design and
#' The response is in microvolts/100.
#'
#'	Source: Oehlert (2022), originally from Nelson (1993).
#'
#' @format A dataframe of 16 observations on five variables.
#'	\describe{
#'	\item{\code{operator}}{A factor indicating the operator for the observation.}
#'	\item{\code{machine}}{A factor indicating the machine for the observation.}
#'	\item{\code{day}}{A factor indicating the day for the observation.}
#'	\item{\code{substrate}}{A factor indicating the substrate for the observation.}
#'	\item{\code{amplitude}}{The response (in microvolts/100).}
#'	}
#'
#' @references
#' Nelson, P. R. (1993). "Additional uses for the analysis of means and extended
#' tables of critical values," \emph{Technometrics} \strong{35}, 61-71.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Substrates"


#' Sulfur removal from high-sulfur coal
#'
#' @description Burning coal containing sulfur produces acid rain, so 
#' this experiment studies a process to remove sulfur from coal.
#' There are five factors, each at two levels: pH (1.5 or 2.5),
#' particle size (180 or 500 um), Fe^2+ (0 or 60 mmol),
#' pulp density (2 or 10\%), and leaching time (6 or 14 days).
#' The response of interest is percentage of sulfur removed.
#' 
#'	Source: Oehlert (2022), originally from Golshani, et al (2013) via
#'	Lye (2019).
#'
#' @format A data frame of 32 observations on six variables.
#'	\describe{
#'	\item{\code{pH}}{A factor giving the pH of the reaction.}
#'	\item{\code{size}}{A factor giving the particle size (um).}
#'	\item{\code{iron}}{A factor giving the concentration of iron (mmol).}
#'	\item{\code{density}}{A factor giving the density of the pulp (percent).}
#'	\item{\code{time}}{A factor giving the leaching time (days).}
#'	\item{\code{removed}}{The percentage of sulfur removed.}
#'	}
#'
#'
#' @references
#' Golshani, T., Jorjani, E., Chelgani S. Chehreh, Shafaei, S. Z., and Nafechi Y. Heidari (2013)
#' "Modeling and process optimization for microbial desulfurization of coal by using a 
#' two-level full factorial design," \emph{International Journal of Mining Science and Technology}
#' \strong{23} 261-265.
#'
#' Lye, Leonard M. (2019) \emph{Applications of DEO in Engineering and Science:
#'	A Collection of 2^6 Case Studies}, Leonard Lye, St. John's, Newfoundland.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"SulfurRemoval"


#' Tensile strength of composite materials
#'
#' @description Composite materials used in the manufacture of aircraft components must be
#'	tested to determine tensile strength. A manufacturer tests five random specimens
#'	from five randomly selected batches. Results are "coded".
#'
#'	Source: Oehlert (2022), originally from Vangel (1992).
#'
#' @format A dataframe of 25 observations on two variables.
#'	\describe{
#'	\item{\code{batch}}{A factor indicating the batch of material.}
#'	\item{\code{strength}}{The tensile strength (in coded units) of the sample.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Vangel, Mark G. (1992) "New Methods for One-Sided Tolerance Limits for a One-Way Balanced
#'	Random-Effects ANOVA Model." \emph{Technometrics} \strong{34}, 176-185.
"Tensile"



#' Ratings of statistics textbooks.
#'
#' @description Seven sections of a statistics class are randomly assigned to two
#'	potential textbooks, one the current text (Old) and the other a potential replacement (New).
#'	The randomization will select four sections for the new text, with the other three getting
#'	the old text.
#'	At the end of the semester, students evaluate their text, and the response recorded here is
#'	the percentage of the students who rate the text as "very good" or "excellent".
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe with 7 observations on two variables.
#'	\describe{
#'	\item{\code{text}}{A factor with two levels giving the text used.}
#'	\item{\code{pct.vge}}{The percentage of students giving very good or excellent ratings.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"TextBooks"

#' Thermocouple temperature differences
#'
#' @description Five thermocouples were placed in a furnace to measure relative temperature
#'	at different locations in the furnace. This data set consists of the temperature difference
#'	between thermocouples 3 and 5 for 64 consecutive readings.
#'
#'	Source: Oehlert (2022), originally from Christensen and Blackwood (1993).
#'
#' @format A dataframe of 64 observations on one variable.
#'	\describe{
#'	\item{\code{temp.diff}}{The temperature difference in degrees C.}
#'	}
#'
#' @references
#' Christensen, R. and L. G. Blackwood (1993). "Tests for precision and accuracy of multiple measuring
#'	devices." \emph{Technometrics} \strong{35}, 411-420.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"Thermocouples"

#' Durability of tires.
#'
#' @description Five tire types (brand/model combinations like Goodyear/Arriva)
#'	in the size 175/80R-13 are chosen at random from those available in a metropolitan
#'	area, and six tires of each type are taken at random from warehouses.
#'	The tires are placed (in random order) on a machine thaT will test tread
#' durability and report a response in thousands of miles.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe with 30 observations on two variables.
#'	\describe{
#'	\item{\code{brand}}{A factor indicating the brand of tire.}
#'	\item{\code{durability}}{The treadlife of the tire (in thousands of miles).}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"Tires"


#' Weight needed to tear a tissue
#'
#' @description Weight is added to a facial tissue stretched across an open jar top until the tissue tears.
#'	There were 96 experimental runs with four conditions randomly assigned to the runs. The conditions are
#'	brand A dry, brand A wet, brand B dry, and brand B wet.
#'
#'	Source: Oehlert (2022), originally from Joel Rumsch (pers. comm.).
#'
#' @format A dataframe with 96 observations on two variables.
#'	\describe{
#'	\item{\code{treatment}}{A factor with four levels giving the treatment used in the run. Levels are
#'	A_dry, A_wet, B_dry, B_wet.}
#'	\item{\code{tear.wt}}{The tearing weight in grams.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"TissueTearing"


#' Width of tissue vaporization under a laser scalpel
#'
#' @description A laser scalpel will be drawn across rat liver at a rate of .01 inches/second.
#'	Interesting responses include the width and depth of the tissue vaporized by the laser, as
#'	well as the width and depth of the non-vaporized tissue that was damaged. This data set
#'	includes the width of the vaporized tissue at four differ power levels of the laser.
#'
#'	Source: Oehlert (2022), adapted from original data from D. Deepa (pers. comm.).
#'
#' @format A dataframe with 12 observations on three variables.
#'	\describe{
#'	\item{\code{width}}{The width in mm of the vaporized tissue.}
#'	\item{\code{power.z}}{The power of the laser scalpel, in Watts.}
#'	\item{\code{power}}{A factor version of the power of the laser scalpel, in Watts.
#'	Included for convenience.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"TissueVaporization"

#' Strength of wet paper towels
#'
#' @description Everyone likes a strong, durable paper towel (absorbency is another desirable
#' property, but this experiment is about durability). Five rolls of paper towels
#' are purchased, one each from five brands (B, V, S, S2, and T). The first
#' three brands are name brands, and the last two are store brands. From each
#' roll, we randomly select three towels. In random order, each towel is
#' dipped in water until wet, gently squeezed by hand to remove absorbed water,
#' then spread across the top of a bowl and held in place by clothespins. Then,
#' pennies are gently placed on the suspended towel until the towel breaks.
#' The number of pennies until the towel is the measure of strength.
#'
#'	Source: Oehlert (2022), original data from A. Frosch (pers. comm.).
#'
#' @format A dataframe with 15 observations on two variables.
#'	\describe{
#'	\item{\code{brand}}{Factor indicating the brand of paper towel.}
#'	\item{\code{pennies}}{The number of pennies when the towel breaks.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"TowelStrength"

#' Grass recovery after trampling
#'
#' @description Twenty "lanes" in an alpine meadow will be trampled by having someone in
#'	lug soled boots walk repeatedly over them in a natural gait.  The lanes were randomly assigned to
#'	one of five different treatments: 0, 25, 75, 200, or 500 passes by the trampler.
#' 	The response is the height (in cm)
#'	of the vegetation one year after trampling.
#'
#'	Source: Oehlert (2022), originally from Cole (1993).
#'
#' @format A dataframe with 20 observations on three variables.
#'	\describe{
#'	\item{\code{passes.z}}{The number of passes for this lane.}
#'	\item{\code{passes}}{A factor version of the number of passes.}
#'	\item{\code{height}}{The height of the vegetation one year later.}
#'	}
#'
#' @references
#' Cole, D. N. (1993). "Trampling effects on mountain vegetation in Washington, Colorado,
#' New Hampshire, and North Carolina." Research Paper INT-464, U.S. Forest Service,
#' Intermountain Research Station.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"TrampledPlants"

#' Tropical grass production
#'
#' @description A study looked into the management of various tropical grasses
#' for improved production, measured as dry matter yield in hundreds of pounds
#' per acre over a 54-week study period.  The management variables were height
#' of cut (1, 3, or 6 inches), the cutting interval (1, 3, 6, or 9 weeks), and
#' amount of nitrogen fertilizer (0, 8, 16, or 32 hundred pounds of ammonium
#' sulfate per acre per year).   Forty-eight plots were assigned in completely
#' randomized fashion to the 48 factor-level combinations.
#'
#'	Source: Oehlert (2022), originally from Richards (1965).
#'
#' @format A dataframe with 48 observations on seven variables.
#'	\describe{
#'	\item{\code{height.z}}{The height in inches.}
#'	\item{\code{height}}{A factor version of the height.}
#'	\item{\code{fert.z}}{Fertilizer in cwt/acre/year.}
#'	\item{\code{fert}}{A factor version of fertilizer.}
#'	\item{\code{interval.z}}{Cutting interval in weeks.}
#'	\item{\code{interval}}{A factor version of interval.}
#'	\item{\code{yield}}{The yield as cwt/acre.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Richards, J. A. (1965) "Effects of fertilizers and management on the three
#'	promising tropical grasses in Jamaica" \emph{Experimental Agriculture} \strong{1}, 281-288.
"TropicalGrasses"

#' Hormones affecting seminiferous tubules
#'
#' @description Hormones can alter the sexual development of animals.
#' This experiment studies the effects of growth hormone
#' (GH) and follicle-stimulating hormone (FSH) on the
#' length of the seminiferous tubules in pigs.  The treatments
#' are control, daily injection of GH, daily injection of
#' FSH, and daily injection of GH and FSH.  Twenty-four
#' weanling boars are used, four from each of six litters.
#' The four boars in each litter are randomized to the
#' four treatments.  The boars are castrated at 100 days
#' of age, and the length (in meters!) of the seminiferous tubules
#' determined as response
#'
#'	Source: Oehlert (2022), originally from Swanlund, et al. (1995).
#'
#' @format A dataframe of 24 observations on four variables.
#'	\describe{
#'	\item{\code{litter}}{A factor indicating the litter of the boar.}
#'	\item{\code{GH}}{A factor indicating whether growth hormone was used.}
#'	\item{\code{FSH}}{A factor indicating whether follicle stimulating hormone was applied.}
#'	\item{\code{length}}{The length of the seminiferous tubules, in meters.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Swanlund, D. J., M. R. N'Diaye, K. L. Loseth, J. L. Pryor, and B. G. Crabo (1995)
#' "Diverse testicular responses to exogenous growth hormone and follicle-stimulating
#' hormone in prepubertal boars," \emph{Biology of Reproduction} \strong{53}, 749-757.
#'
"Tubules"

#' Turkey poult weight gain
#'
#' @description Seventy-two pens of eight male turkey poults (chicks) each were set out.
#'	Pens 1-9 were randomly assigned to nine treatments. Treatment 1 is
#'	a control treatment; treatments 2 through 9 contain alfalfa meal.
#'	Treatments 2 through 5 contain alfalfa meal type 22; treatments
#'	6 through 9 contain alfalfa meal type 27.  Treatments 2 and 6 are
#'	2.5\% alfalfa, treatments 3 and 7 are 5\% alfalfa, treatments 4
#'	and 8 are 7.5\% alfalfa.  Treatments 5 and 9 are also 7.5\%
#'	alfalfa, but they have been modified to have the same calories
#'	as the control treatment. After this, pens 10-18 were randomly assigned,
#'	19-27 were randomly assigned, and so on.
#'
#'	The response for each pen is the average weight gain (g/day) for the poults
#'	in the pen over ages 7-14 days. The response for pen 66 was not observed.
#'
#'	Source: Oehlert (2022), data from T. Ergul (pers. comm.).
#'
#' @format A dataframe of 71 observations on three variables.
#'	\describe{
#'	\item{\code{group}}{A factor indicating the group of pens (1-9, or 10-18, etc.).}
#'	\item{\code{treatment}}{A factor indicating (as 1-9) the treatment given to the pen.}
#'	\item{\code{gain}}{Average weight gain for poults in the pen, g/day.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"TurkeyPoults"

#' Synthetic single replication of a 2^4 experiment
#'
#' @description Synthetic data representing the results of a single replication of a
#'	2^4 experiment.
#'
#'	Source: Oehlert (2022).
#'
#' @format A dataframe of 16 observations on five variables.
#'	\describe{
#'	\item{\code{A}}{Factor 1.}
#'	\item{\code{B}}{Factor 2.}
#'	\item{\code{C}}{Factor 3.}
#'	\item{\code{D}}{Factor 4.}
#'	\item{\code{y}}{The response.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"TwoSeriesDataA"


#' Unpopped popcorn kernels
#'
#' @description Thirty-six 3 oz. bags of microwave popcorn are popped, and the number
#'	of unpopped kernels in each bag is recorded. The 36 runs are randomly assigned to
#'	the twelve combinations of microwave wattage (500, 700, or 1000) and
#'	brand ("P", "A", "J", or "O"). Ovens are allowed to cool for 10 minutes with
#'	the door open between runs, and popping continues until there is a three
#'	second gap between consecutive pops.
#'
#'	Source: Oehlert (2022), data from P. Stenberg (pers. comm.).
#'
#' @format A dataframe of 36 observations on four variables.
#'	\describe{
#'	\item{\code{brand}}{A factor indicating the brand of popcorn used.).}
#'	\item{\code{watts.z}}{The wattage of the oven used.}
#'	\item{\code{watts}}{A factor version of watts.}
#'	\item{\code{unpopped}}{The count of unpopped kernels.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"UnpoppedKernels"

#' ACTH release under Verapamil treatment
#'
#' @description An experiment investigated the release of the hormone ACTH from
#' rat pituitary glands under eight treatments:  the
#' factorial combinations of CRF (0 or 100 nM; CRF is believed to increase
#' ACTH release), calcium (0 or 2 mM of CaCl2), and Verapamil (0 or 50 uM;
#' Verapamil is thought to block the effect of calcium).  Thirty-six rat
#' pituitary cell cultures are assigned at random to the factor-level combinations,
#' with control (all treatments 0) getting 8 units, and other combinations
#' getting 4.
#'
#'	Source: Oehlert (2022), originally from Giguere, Lefevre, and Labrie (1982).
#'
#' @format A dataframe of 36 observations on seven variables.
#'	\describe{
#'	\item{\code{verapamil.z}}{The amount of Verapamil in the treatment.}
#'	\item{\code{verapamil}}{A factor version of \code{verapamil.z}.}
#'	\item{\code{crf.z}}{The amount of CRF in the treatment.}
#'	\item{\code{crf}}{A factor version of \code{crf.z}.}
#'	\item{\code{calcium.z}}{The amount of calcium in the treatment.}
#'	\item{\code{calcium}}{A factor version of \code{calcium.z}.}
#'	\item{\code{ACTH}}{The amount of ACTH released under treatment.}
#'	}
#'
#' @references
#' Giguere, V., G. Lefevre, and F. Labrie (1982) "Site of calcium requirement
#' for stimulation of ACTH release in rat anterior pituitary cells in culture by
#' synthetic ovine corticotropin-releasing factor," \emph{Life Sciences} \strong{31},
#' 3057-3062.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Verapamil"


#' Ratio of Visiplume readings to standard method
#'
#' @description A "Visiplume" is a remote sensing instrument that measures SO2 concentration
#' 	by comparing ultraviolet absorption in clear air and polluted air. This data set reports
#'	the ratio of the Visiplume reading to an EPA standard method. Measurements are taken on
#'	multiple samples on four different sources: bag (SO2 in inflated bag), smoke (spiked
#'	smoke from a smoke generator, two coal-burning power plants (plant1 and plant2).
#'
#'	Source: Oehlert (2022), originally from McElhoe and Conner (1986).
#'
#' @format A dataframe of 31 observations on two variables.
#'	\describe{
#'	\item{\code{source}}{A factor indicating the source of the measured gas.}
#'	\item{\code{ratio}}{The ratio of the Visiplume reading to the standard measurement.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' McElhoe, H. B. and Conner, W. D. (1986) "Remote measurement of sulfur dioxide emissions
#'	using an ultraviolet light sensitive video system," \emph{Journal of the Air Pollution
#'	Control Association} \strong{36}, 42-47.
#'
"Visiplume"

#' Ratio of Visiplume readings to standard method
#'
#' @description A "Visiplume" is a remote sensing instrument that measures SO2 concentration
#' 	by comparing ultraviolet absorption in clear air and polluted air. This data set reports
#'	the ratio of the Visiplume reading to an EPA standard method. Measurements are taken on
#'	multiple samples on four different sources: bag (SO2 in inflated bag), smoke (spiked
#'	smoke from a smoke generator, two coal-burning power plants (plant1 and plant2). This
#'	data frame contains data only on plant 2. Data set "Visiplume" contains the full data.
#'
#'	Source: Oehlert (2022), originally from McElhoe and Conner (1986).
#'
#' @format A dataframe of 6 observations on one variable.
#'	\describe{
#'	\item{\code{ratio}}{The ratio of the Visiplume reading to the standard measurement.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' McElhoe, H. B. and Conner, W. D. (1986) "Remote measurement of sulfur dioxide emissions
#'	using an ultraviolet light sensitive video system," \emph{Journal of the Air Pollution
#'	Control Association} \strong{36}, 42-47.
#'
"VisiplumePlant2"

#' Rating of Harvey Wallbanger recipes.
#'
#' @description An experiment to find the best proportions for orange juice (O),
#' vodka (V), and Galliano (G) in a mixed drink called a Harvey Wallbanger.  This
#' is a factorial ratios model, with three levels of the
#' ratio V/G (1.2, 2.0, and 2.8) and two levels of the ratio O/G (4 and
#' 9).  There is also  a center point at V/G = 2 and O/G = 6.5.  The actual
#' design included incomplete blocks (so that no evaluator
#' consumed more than a small number of drinks). However, there were no apparent
#' evaluator differences, so the average score was used as
#' response for each mixture, and blocks were ignored.
#' Evaluators rated the drinks on a 1 to 7 scale.
#'
#'	Source: Oehlert (2022), originally from Sahrmann, Peipel, and Cornell (1987).
#'
#' @format A dataframe of seven observations on four variables.
#'	\describe{
#'	\item{\code{G}}{The fraction of Galliano.}
#'	\item{\code{V}}{The fraction of vodka.}
#'	\item{\code{O}}{The fraction of orange juice.}
#'	\item{\code{appeal}}{The rating for the drink.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Sahrmann, H. F., G. F. Piepel, and J. A. Cornell (1987). "In search of the optimum Harvey
#' Wallbanger recipe via mixture experiment techniques," \emph{The American Statistician} \strong{41}, 190-194.
"Wallbangers"

#' Gums and water binding in gels
#'
#' @description Gums are used to alter the texture and other properties
#' of foods, in part by binding water.  An experiment studied the
#' water-binding of various carrageenan gums in gel systems
#' under various conditions.  The experiment had factorial
#' treatment structure with four factors.  Factor 1 was the
#' type of gum (kappa, mostly kappa with some lambda, and
#' iota).  Factor 2 was the concentration of the gum in the
#' gel in g/100g water (level 1 is .1; level 2 is .5; and level 3
#' is 2 for gums 1 and 2, and 1 for gum 3).
#' The third factor was type of solute (NaCl,
#' Na2SO4, sucrose).
#' The fourth factor was solute concentration (ku/kg water).
#' For sucrose, the three levels were .05, .1, and .25; for
#' NaCl and Na2SO4, the levels were .1, .25, and 1.
#' The response is the water-binding for the gel in mOsm.
#' This experiment was completely randomized.  There were
#' two units at each factor-level combination except
#' solute concentration 3, where
#' all but one combination had four units.
#'
#'	Source: Oehlert (2022), originally from Rey (1981).
#'
#' @format A dataframe of 214 observations on seven variables.
#'	\describe{
#'	\item{\code{solute}}{The solute in the gel.}
#'	\item{\code{sol.conc}}{A factor giving the concentration of the solute as "low", "mid", "high".}
#'	\item{\code{sol.conc.z}}{The concentration of the solute.}
#'	\item{\code{gum}}{The gum in the gel.}
#'	\item{\code{gum.conc}}{A factor giving the concentration of the gum as "low", "mid", "high".}
#'	\item{\code{gum.conc.z}}{The concentration of the solute.}
#'	\item{\code{binding}}{The water binding of the experimental run.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Rey, D. K. (1981) \emph{Characterization of the Effect of Solutes on the Water-Binding
#'	and Gel Strength Properties of Carrageenan.} Ph. D. Thesis, University of Minnesota,
#'	St. Paul, MN.
#'
"WaterBinding"

#' Distance of ejection stream.
#'
#' @description We puncture a hole in the side of a (empty) 2 liter plastic soda bottle. An
#' experimental run will consist of filling the bottle with the hole covered and then uncovering
#' the hole to measure how far the water is ejected (in cm). We fill the bottle 30 times,
#' randomizing the runs 10 depths of water above the hole (6, 7, 8, ... 15 cm).
#'
#'	Source: Oehlert (2022), data from X. Meng (pers. comm.).
#'
#' @format A dataframe of 30 observations on three variables.
#'	\describe{
#'	\item{\code{depth.z}}{The depth of the water above the hole in cm.}
#'	\item{\code{depth}}{A factor version of depth.}
#'	\item{\code{distance}}{The distance the water is ejected in cm.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
"WaterEjection"


#' Wax deposited from Malaysian crude oil
#'
#' @description This experiment considers how four factors affect
#' the deposition of wax from Malaysian crude oil. The factors are
#' speed of rotation (0 or 600 rpm), cold finger temperature (5 or 15 C),
#' duration (2 or 24 h), and inhibitor concentration (200 or 5000 ppm).
#' The 16 factor/level combinations are run in random order, and the
#' response is the amount of wax deposited (in g).
#'
#' Note: the original data set included three center points with responses
#' 1.40, 1.50, 1.45.
#' 
#'	Source: Oehlert (2022), originally from Ridzuan et al. (2016) via
#'	Lye (2019).
#'
#' @format A data frame of 16 observations on five variables.
#'	\describe{
#'	\item{\code{speed}}{A factor giving the speed of rotation.}
#'	\item{\code{temp}}{A factor giving the cold finger temperature.}
#'	\item{\code{duration}}{A factor giving the duration of the run.}
#'	\item{\code{inhibitor}}{A factor giving the concentration of inhibitor.}
#'	\item{\code{wax}}{The amount of wax deposited.}
#'	}
#'
#'
#' @references
#' Lye, Leonard M. (2019) \emph{Applications of DEO in Engineering and Science:
#'	A Collection of 2^6 Case Studies}, Leonard Lye, St. John's, Newfoundland.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Ridzuan, N., F. Adam, and Z. Yaacob (2016) "Screening of factor influencing wax
#' deposition using full factorial experimental design," \emph{Petroleum Science and Technology}
#' \strong{34} 84-90.
"WaxDeposit"

#' Weed biomass
#'
#' @description This experiment studies the effect of nitrogen and weed addition on
#' plant growth in wetlands.  We investigate four levels of
#' nitrogen, three weed treatments (no additional weeds,
#' addition of weed species 1, addition of weed species 2),
#' and two herbivory treatments (clipping and no clipping).
#' We have eight trays; each tray holds three artificial
#' wetlands consisting of rectangular wire baskets
#' containing wetland soil.
#' The trays are full of water, so the artificial wetlands stay wet.
#' All of the artificial wetlands receive a standard set of
#' seeds to start growth.
#'
#' Four of the trays are placed on a table near the door of the
#' greenhouse, and the other four trays are placed on a table
#' in the center of the greenhouse.  On each table, we randomly
#' assign one of the trays to each of the four nitrogen
#' treatments.  Within
#' each tray, we randomly assign the wetlands to the three weed
#' treatments.  Each wetland is split in half.  One half is
#' chosen at random and will be clipped after 4 weeks,
#' with the clippings removed; the other half is not
#' clipped.   After 8 weeks, we measure the fraction of
#' biomass in each wetland that is nonweed as our response.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe with 48 observations on seven variables.
#'	\describe{
#'	\item{\code{table}}{A factor indicating the table (1-2).}
#'	\item{\code{tray}}{A factor indicating the tray (1-8).}
#'	\item{\code{wetland}}{A factor indicating the wetland (1-24).}
#'	\item{\code{nitrogen}}{A factor indicating the level of nitrogen.}
#'	\item{\code{weed}}{A factor indicating the weed species addition.}
#'	\item{\code{clip}}{A factor indicating the clipping treatment.}
#'	\item{\code{biomass}}{The percentage of the biomass that is not weeds.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"WeedBiomass"

#' Weed control
#'
#' @description Fourteen weed control treatments were randomly applied to 56 plots, four
#'	plots per treatment. The plots are later assessed visually for weeds, with the response
#'	being the percent of the plot that is non-weeds.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe with 56 observations on two variables.
#'	\describe{
#'	\item{\code{treatment}}{A factor indicating the weed treatment (1-14).}
#'	\item{\code{pct.control}}{The percentage of the plot that is not weeds.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"WeedControl"

#' Weight gain of test animals under different diets
#'
#' @description Eighteen test animals were randomlly assigned to nine diets, two animals per diet.
#'	The diets are the combinations of protein source (beef, pork, grain) and calories (low, medium,
#'	high). The error mean square for these data was 8.75.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe with 9 observations on three variables.
#'	\describe{
#'	\item{\code{source}}{A factor indicating the protein source.}
#'	\item{\code{calories}}{A factor indicating the level of calories.}
#'	\item{\code{gain}}{Average weight gain for the two animals in the treatment group.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"WeightGain"

#' Strength of welds
#'
#' @description An experiment to determine factors affecting the strength of welds.
#' There were nine factors at two levels each to be explored.
#' The full experiment was much too large, so a 2^(9-5) fractional
#' factorial with sixteen units was used.  The factors are coded A though J (skipping I);
#' the generators are -ACE, -ADF, -ACDG, BCDH, ABCDJ.
#'
#'	Source: Oehlert (2022), originally from Taguchi and Wu (1980)
#'
#' @format A dataframe with 16 observations on ten variables.
#'	\describe{
#'	\item{\code{A}}{Treatment factor 1.}
#'	\item{\code{B}}{Treatment factor 2.}
#'	\item{\code{C}}{Treatment factor 3.}
#'	\item{\code{D}}{Treatment factor 4.}
#'	\item{\code{E}}{Treatment factor 5.}
#'	\item{\code{F}}{Treatment factor 6.}
#'	\item{\code{G}}{Treatment factor 7.}
#'	\item{\code{H}}{Treatment factor 8.}
#'	\item{\code{J}}{Treatment factor 9.}
#'	\item{\code{strength}}{The strength of the weld.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
#'
#' Taguchi, G. and Y. Wu (1980). \emph{Introduction to Off-Line Quality Engineering}. Nagoya, Japan:
#' Central Japan Quality Control Association.
"Welding"

#' Consumer scoring of yogurts
#'
#' @description Consumers who do not regularly eat yogurt are polled
#' and asked to rate on a 1 to 9 scale the likelihood that they would
#' buy a certain yogurt product at least once a month;  1 means very
#' unlikely, 9 means very likely.  The product is hypothetical and
#' described by three factors:  cost ("C" - low, medium, and high), sensory
#' quality ("S" - low, medium, and high), and nutritional value ("N" -low and high).
#' The plan was to poll three consumers for each product type, but it
#' became clear early in the experiment that people were unlikely to buy
#' a high-cost, low-nutrition, low-quality product, so only one consumer
#' was polled for that combination.  Each consumer received one of the
#' eighteen product descriptions chosen at random.
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe with 52 observations on four variables.
#'	\describe{
#'	\item{\code{C}}{A factor indicating cost.}
#'	\item{\code{S}}{A factor indicating the sensory quality.}
#'	\item{\code{N}}{A factor indicating the nutritional value.}
#'	\item{\code{gain}}{Score for likelihood to buy.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"Yogurt"

#' Shelf life of yogurts
#'
#' @description Scientists wish to understand how
#' the amount of sugar (two levels), culture strain (two levels),
#' type of fruit (blueberry or strawberry), and pH (two levels)
#' influence shelf life of refrigerated yogurt.
#' In a preliminary experiment, they produce one batch
#' of each of the sixteen kinds of yogurt.  The yogurt is then
#' placed in two coolers, eight batches in each cooler.
#' The response is the number of days till
#' an off odor is detected from the batch
#'
#'	Source: Oehlert (2022), synthetic data.
#'
#' @format A dataframe with 52 observations on four variables.
#'	\describe{
#'	\item{\code{cooler}}{A factor indicating the cooler in use.}
#'	\item{\code{A}}{A factor indicating the level of sugar.}
#'	\item{\code{B}}{A factor indicating the culture strain.}
#'	\item{\code{C}}{A factor indicating the type of fruit.}
#'	\item{\code{D}}{A factor indicating the pH.}
#'	\item{\code{days}}{Days until off odor is noticed.}
#'	}
#'
#' @references
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"YogurtCooler"

#' Zinc retention in rats
#'
#' @description The treatments were the combinations of two levels
#' of zinc in the usual diet, two levels of zinc in the final meal
#' (before the rats are sacrificed), and four levels of protein in the final meal.
#'
#'	Source: Oehlert (2022), originally from Hunt and Larson (1990).
#'
#' @format A dataframe with 16 observations on four variables.
#'	\describe{
#'	\item{\code{m.zinc}}{A factor indicating the level of zinc in the final meal.}
#'	\item{\code{d.zinc}}{A factor indicating the level of zinc in the usual diet.}
#'	\item{\code{m.protein}}{A factor indicating the level of protein in the usual diet.}
#'	\item{\code{retention}}{Zinc retained in the rat.}
#'	}
#'
#' @references
#' Hunt, J. R. and B. J. Larson (1990). "Meal protein and zinc levels interact to
#' influence zinc retention by the rat," \emph{Nutrition Research} \strong{10}, 697-705.
#'
#' Oehlert, Gary W. (2022) \emph{A First Course in Design and Analysis of Experiments,
#' Second Edition}, \url{http://users.stat.umn.edu/~gary/Book.html}
"ZincRetention"







