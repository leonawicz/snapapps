
<!-- README.md is generated from README.Rmd. Please edit that file -->
snapapps
========

[![Travis-CI Build Status](https://travis-ci.org/leonawicz/snapapps.svg?branch=master)](https://travis-ci.org/leonawicz/snapapps) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/leonawicz/snapapps?branch=master&svg=true)](https://ci.appveyor.com/project/leonawicz/snapapps) [![Coverage Status](https://img.shields.io/codecov/c/github/leonawicz/snapapps/master.svg)](https://codecov.io/github/leonawicz/snapapps?branch=master)

The `snapapps` package contains a collection of open source Shiny apps by Matthew Leonawicz at the Scenarios Network for Alaska and Arctic Planning, University of Alaska Fairbanks. It is a member package in the apps and docs sector of the SNAPverse collection of R packages. Many of the apps in this package originate from the SNAP open source Shiny apps [GitHub repository](https://github.com/ua-snap/shiny-apps). Additional apps can be found in other related packages including `snapdash`, `snapflex` and `snapdocs`.

Installation
------------

You can install snapapps from github with:

``` r
# install.packages('devtools')
devtools::install_github("leonawicz/snapapps")
```

Running apps locally
--------------------

The purpose of `snapapps` is to give you easy access to local instances of SNAP Shiny apps that you can run in your browser. By installing `snapapps` you have local access to a number of Shiny apps. You can launch apps by passing their respective IDs to `snapp`. For example, version four of the Distributions of Random Variables app:

``` r
library(snapapps)
snapp("rv4")
```

The package also gives you access to app source code if you are an R user who learns by digging and is comfortable going through package source files. An easy way to view the source code is side by side or directly below the app content in your browser by running the app in showcase mode. Showcase mode will also present additional, concise app metadata and description.

``` r
snapp("rv4", local_mode = "showcase")
```

However, you may still find it much more convenient in this regard to simply fork the GitHub repository where most of the apps in `snapapps` originate. Showcase mode will also not display equally well for all apps, depending on how they are organized and presented in the browser.

App information
---------------

The list of app IDs can be obtained with `snapps`, which provides information about all of the apps in the collection. This function returns a data frame with columns that include app ID and short descriptions as well as a number of other pieces of relevant metadata.

``` r
snapps()
#> # A tibble: 6 x 8
#>          id                         name
#>       <chr>                        <chr>
#> 1        rv  RV distributions (official)
#> 2       rv1 RV distributions (legacy) v1
#> 3       rv2 RV distributions (legacy) v2
#> 4       rv3 RV distributions (legacy) v3
#> 5       rv4 RV distributions (legacy) v4
#> 6 treerings                   Tree rings
#> # ... with 6 more variables: description <chr>, published <dbl>,
#> #   revised <dbl>, status <chr>, url <chr>, redirect <chr>
```

Accessing live versions online
------------------------------

One piece of information that is particularly useful is the canonical live link for an app. Currently, most SNAP Shiny apps are hosted on RStudio's `shinyapps.io` platform. While these URLs appear in the metadata table, they can also be launched directly by passing `source = "remote"` to `snapp`.

``` r
snapp("rv4", source = "remote")
```

This will again launch the app in your browser, but this time via the canonical URL. Apps hosted remotely on `shinyapps.io` generally take notably longer to load than local apps. This is another convenience of `snapapps`.

One drawback is that some apps are too large to include in official form in `snapapps` as a consequence of the amount of data they use, or more likely, the amount of data they require access to. For example, an app may access data from a large data repository on Amazon Web Services using private keys that are not included in this package. For such an app to run locally, it must have a copy of the data stored with it. In order to include these apps in the package, the data is cut drastically down to almost nothing. The app will be the same, but the data it offers is a shell in comparison to the canonical version hosted online.
