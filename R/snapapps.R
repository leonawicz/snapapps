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
#' The \code{source} defaults to \code{"local"} for package apps. If set to \code{"remote"},
#' \code{snapp} will launch the app in your browser using the canonical url rather than the package app.
#'
#' @param id character, the name of the application. See \link{snapps} for available IDs.
#' @param source character, source of app. See details.
#'
#' @export
#'
#' @examples
#' \dontrun{snapp("rv4")}
snapp <- function(id, source = "local") {
  x <- snapps()
  if(!id %in% x$id) stop("Invalid app `id`. See snapps() for available apps.")
  if(source == "remote"){
    url <- x$url[x$id == id]
    name <- x$name[x$id == id]
    utils::browseURL(url)
    cat(paste(name, "launched remotely.\n"))
    return(invisible())
  }
  appDir <- system.file("shiny-examples", id, package = "snapapps")
  if (appDir == "")
    stop("Could not find apps directory. Try re-installing `snapapps`.", call. = FALSE)
  shiny::runApp(appDir, display.mode = "normal")
}

#' Basic metadata for all apps in snapapps
#'
#' This function returns a data frame with basic meta data for all Shiny apps in \code{snapapps}.
#' This includes app ID, name, short description, canonical remote url, redirect url and an indication of whether the app
#' is complete or partial with respect to the canonical app.
#' For example, did the local app require available data sets to be reduced or removed for inclusion in \code{snapapps}?
#'
#' @return a data frame.
#' @export
#'
#' @examples
#' snapps()
snapps <- function(){
  id <- c("rv1", "rv2", "rv3", "rv4")
  name <- paste0("RV distributions v", 1:4)
  canonical <- "https://uasnap.shinyapps.io/"
  redirect <- "http://shiny.snap.uaf.edu/"
  url <- paste("RV_distributions", c("", "V2", "V3", "V4"))
  redirect <- paste0(redirect, url)
  url <- paste0(canonical, url)
  status <- rep("complete", 4)
  desc <- paste("RV distributions app version", 1:4)
  tibble::data_frame(id = id, name = name, description = desc, url = url,
                     redirect = redirect, status = status)
}
