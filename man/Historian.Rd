% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Historian.R
\docType{class}
\name{Historian}
\alias{Historian}
\title{Historian}
\format{An object of class \code{R6ClassGenerator} of length 24.}
\usage{
Historian
}
\arguments{
\item{dateFrom}{Character string containing a date in any ISO 8601 format, from which the history log should be returned.}

\item{dateTo}{Character string containing a date in any ISO 8601 format, from which the history log should be returned.}

\item{class}{Character string indicating the class for which log entries should be returned.}

\item{objectName}{Character string indicating the name of the objectName for which log entries should be returned.}

\item{Method}{Character string indicating the method for which log entries should be returned.}
}
\description{
\code{Historian} Class that maintains the log history of objectNames and their
events.
}
\section{Historian Methods}{

\describe{
 \item{\code{new()}}{Initializes a singleton objectName, noting the instantiation of the nlpStudio objectName.}
 \item{\code{addEvent(className, objectName, method, event)}}{Posts the event to history.}
 \item{\code{searchEvents(dateFrom, dateTo, class, objectName, method)}}{Returns the history of events according to the parameters provided,  in a data frame format.}
 \item{\code{purgeEvents()}}{Sets events to null.}
 \item{\code{restoreEvents()}}{Restores events from the history file.}
}
}

\author{
John James, \email{jjames@datasciencesalon.org}
}
\keyword{datasets}
