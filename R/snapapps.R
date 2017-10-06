#' snapapps: Collection of SNAP Shiny apps.
#'
#' The \code{snapapps} package contains a collection of open source Shiny apps by Matthew Leonawicz at the
#' Scenarios Network for Alaska and Arctic Planning, University of Alaska Fairbanks.
#' It is a member package in the apps and docs sector of the SNAPverse collection of R packages.
#' Many of the apps in this package originate from \url{https://github.com/ua-snap/shiny-apps}.
#' Additional apps can be found in other SNAPverse apps and docs sector packages.
#' Related sector packages include \code{snapdash}, \code{snapflex} and \code{snapdocs}.
#'
#' @docType package
#' @name snapapps
NULL

#' Run SNAP Shiny app examples
#'
#' Launch a Shiny app in your browser.
#'
#' Available apps include:
#'
#' @param id character, the name of the application. See details.
#'
#' There are X appsavailable maps:
#' \describe{
#' \item{\code{rv1}}{Distributions of random variables v1}
#' \item{\code{rv2}}{Distributions of random variables v2}
#' \item{\code{rv3}}{Distributions of random variables v3}
#' \item{\code{rv4}}{Distributions of random variables v4}
#' }
#'
#' @export
#'
#' @examples
#' \dontrun{snapp("rv4")}
snapp <- function(id) {
  appDir <- system.file("shiny-examples", id, package = "snapapps")
  if (appDir == "")
    stop("Could not find apps directory. Try re-installing `snapapps`.", call. = FALSE)
  shiny::runApp(appDir, display.mode = "normal")
}
