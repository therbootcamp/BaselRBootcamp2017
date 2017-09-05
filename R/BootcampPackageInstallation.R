
# Script to install any packages missing from

Bootcamp_package_installation <- function() {

  installed.packages <- rownames(installed.packages())

  packages.to.install <- c("devtools", "tidyverse", "yarrr", "afex",
                           "car", "markdown", "rmarkdown", "FFTrees",
                           "rpart", "randomForest", "e1071", "speff2trial",
                           "shiny", "shinyjs", "caret", "mlr", "parallel", "Rcpp",
                           "BayesFactor", "parfm", "lava")

  for(package.i in packages.to.install) {

    if((package.i %in% installed.packages) == FALSE) {

      install.packages(package.i)
      message(paste("Installing", package.i, "..."))

    } else {message(paste(package.i, "already installed!"))}


  }

}

Bootcamp_package_installation()

source("https://raw.githubusercontent.com/therbootcamp/BaselRBootcamp2017/master/R/BootcampPackageInstallation.R")
