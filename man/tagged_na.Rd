% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tagged_na.R
\name{tagged_na}
\alias{tagged_na}
\alias{na_tag}
\alias{is_tagged_na}
\alias{format_tagged_na}
\alias{print_tagged_na}
\title{"Tagged" missing values}
\usage{
tagged_na(...)

na_tag(x)

is_tagged_na(x, tag = NULL)

format_tagged_na(x, digits = getOption("digits"))

print_tagged_na(x, digits = getOption("digits"))
}
\arguments{
\item{...}{Vectors containing single character. The letter will be used to
"tag" the missing value.}

\item{x}{A numeric vector}

\item{tag}{If \code{NULL}, will only return true if the tag has this value.}

\item{digits}{Number of digits to use in string representation}
}
\description{
"Tagged" missing values work exactly like regular R missing values except
that they store one additional byte of information a tag, which is usually
a letter ("a" to "z"). When by loading a SAS and Stata file, the tagged
missing values always use lower case values.
}
\details{
\code{format_tagged_na()} and \code{print_tagged_na()} format tagged
NA's as NA(a), NA(b), etc.
}
\examples{
x <- c(1:5, tagged_na("a"), tagged_na("z"), NA)

# Tagged NA's work identically to regular NAs
x
is.na(x)

# To see that they're special, you need to use na_tag(),
# is_tagged_na(), or print_tagged_na():
is_tagged_na(x)
na_tag(x)
print_tagged_na(x)

# You can test for specific tagged NAs with the second argument
is_tagged_na(x, "a")

# Because the support for tagged's NAs is somewhat tagged on to R,
# the left-most NA will tend to be preserved in arithmetic operations.
na_tag(tagged_na("a") + tagged_na("z"))
}
