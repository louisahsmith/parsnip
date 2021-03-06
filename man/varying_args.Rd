% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/varying.R
\name{varying_args}
\alias{varying_args}
\alias{varying_args.model_spec}
\alias{varying_args.recipe}
\alias{varying_args.step}
\title{Determine varying arguments}
\usage{
varying_args(x, id, ...)

\method{varying_args}{model_spec}(x, id = NULL, ...)

\method{varying_args}{recipe}(x, id = NULL, ...)

\method{varying_args}{step}(x, id = NULL, ...)
}
\arguments{
\item{x}{An object}

\item{id}{A string describing the object \code{x}.}

\item{...}{Not currently used.}
}
\value{
A tibble with columns for the parameter name (\code{name}), whether is
contains \emph{any} varying value (\code{varying}), the \code{id} for the object, and the
class that was used to call the method (\code{type}).
}
\description{
\code{varying_args} takes a model specification and lists all of the arguments
along with whether they are fully specified or not.
}
\examples{
library(dplyr)
library(rlang)

rand_forest() \%>\% varying_args(id = "plain")

rand_forest(mtry = varying()) \%>\% varying_args(id = "one arg")

rand_forest() \%>\%
  set_engine("ranger", sample.fraction = varying()) \%>\%
  varying_args(id = "only eng_args")

rand_forest() \%>\%
  set_engine(
    "ranger",
    strata = expr(Class),
     sampsize = c(varying(), varying())
  ) \%>\%
  varying_args(id = "add an expr")

 rand_forest() \%>\%
   set_engine("ranger", classwt = c(class1 = 1, class2 = varying())) \%>\%
   varying_args(id = "list of values")

}
