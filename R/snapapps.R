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
#' Options for \code{local_mode} are \code{"normal"} (default) or \code{"showcase"}
#' for tandem reactive code highlighting, and metadata if applicable. \code{local_mode} applies to \code{source = "local"} package apps.
#'
#' @param id character, the name of the application. See \link{snapps} for available IDs.
#' @param source character, source of app. See details.
#' @param local_mode character, display mode.
#'
#' @export
#'
#' @examples
#' \dontrun{snapp("rv4")}
snapp <- function(id, source = "local", local_mode = "normal") {
  if(!local_mode %in% c("normal", "showcase"))
    stop("`local_mode` must be 'normal' or 'showcase'.")
  x <- snapps()
  if(!id %in% x$id) stop("Invalid app `id`. See `snapps` for available apps.")
  url <- x$url[x$id == id]
  id2 <- basename(url)
  if(source == "remote"){
    name <- x$name[x$id == id]
    utils::browseURL(url)
    cat(paste(name, "launched remotely.\n"))
    return(invisible())
  }
  appDir <- system.file("shiny", id2, package = "snapapps")
  if (appDir == "")
    stop("Could not find apps directory. Try re-installing `snapapps`.", call. = FALSE)
  shiny::runApp(appDir, display.mode = local_mode)
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
  id <- c("rv", "rv1", "rv2", "rv3", "rv4")
  name <- c("RV distributions", paste0("RV distributions v", 1:4))
  canonical <- "https://uasnap.shinyapps.io/"
  redirect <- "http://shiny.snap.uaf.edu/"
  url <- c("rvdist", paste("RV_distributions", c("", "_V2", "_V3", "_V4")))
  redirect <- paste0(redirect, url)
  url <- paste0(canonical, url)
  status <- rep("complete", 5)
  desc <- c("RV distributions app (official)", paste("RV distributions app version", 1:4))
  tibble::data_frame(id = id, name = name, description = desc, url = url,
                     redirect = redirect, status = status)
}

#' Get a snapapps resource path
#'
#' Get a resource path in an app to local package resources.
#'
#' This function is typically called in an app that has been imported into the \code{snapapps} package.
#' While external apps may not share all common resources, once they are moved into the package it can be more efficient to have
#' only a single copy of a resource such as an image file and alter the code of each relevant app to point to that package file.
#'
#' This function is only used during development to allow included apps to share common resources.
#' For applicable apps, you will find a call to this function near the top of \code{ui.R}, which would not be found in a
#' version of the app outside of this package.
#'
#' @param type character, resource type. \code{"images"} is the only currently available resource type.
#'
#' @export
#'
#' @examples
#' \dontrun{snapp_resources()}
snapp_resources <- function(type = "images"){
  system.file(file.path("res", type), package = "snapapps")
}
