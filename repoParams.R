# file sourced by setup()
library(here)

# Package parameters ----

repoParams <<- list() # params holder

# > Location of the repo ----
library(here)
repoParams$repoLoc <- here::here()

# Data ----
# attempt to guess the platform & user
info <- Sys.info()
sysname <- info[1]
nodename <- info[4]
login <- info[6]
user <- info[7]

# default data path for UoS
repoParams$GreenGridData <- path.expand("J://CivilEnvResearch/Public/SERG/data/NZ_GREENGrid/safe/")
repoParams$censusData <- path.expand("J://CivilEnvResearch/Public/SERG/data/NZ_Census/") # fix for your platform
repoParams$gxpData <- path.expand("J://CivilEnvResearch/Public/SERG/data/NZ_EA_EMI/gxp/") # fix for your platform

# > Data on HCS ----
if((user == "dataknut" | user == "carsten" ) & sysname == "Linux"){
  message("We're on the CS RStudio server as ", user, " using " , sysname)
  repoParams$GreenGridData <- "~/greenGridData/cleanData/safe/"
  repoParams$censusData <- path.expand("~/greenGridData/externalData/nzCensus/") # fix for your platform
  repoParams$gxpData <- path.expand("~/greenGridData/externalData/EA_GXP_Data/") # fix for your platform
}
if(user == "ben" & sysname == "Darwin"){
  message("We're on Ben's laptop as : ", user, " using " , sysname)
  repoParams$GreenGridData <- path.expand("~/Data/NZ_GREENGrid/safe/")
  repoParams$censusData <- path.expand("~/Data/NZ_Census/") # fix for your platform
  repoParams$gxpData <- path.expand("~/Data/NZ_EA_EMI/gxp/") # fix for your platform
}
if(user == "carsten.dortans" & sysname == "Darwin"){
  message("We're on Carsten's laptop as : ", user, " using " , sysname)
  # check this path is OK - HCS
  repoParams$GreenGridData <- path.expand("/Volumes/hum-csafe/Research Projects/GREEN Grid/cleanData/safe/")
}

# > Misc data ----
repoParams$dstNZDates <- paste0(repoParams$repoLoc, "/data/dstNZDates.csv")
repoParams$bytesToMb <- 0.000001

# For .Rmd ----
# > Default yaml for Rmd ----
repoParams$pubLoc <- "[Centre for Sustainability](http://www.otago.ac.nz/centre-sustainability/), University of Otago: Dunedin"
repoParams$Authors <- "Anderson, B., Dortans, C., and Jack, M."

# > Rmd includes ----
repoParams$licenseCCBY <- paste0(repoParams$repoLoc, "/includes/licenseCCBY.Rmd")
repoParams$support <- paste0(repoParams$repoLoc, "/includes/support.Rmd")
repoParams$data <- paste0(repoParams$repoLoc, "/includes/data.Rmd")
repoParams$history <- paste0(repoParams$repoLoc, "/includes/history.Rmd")
repoParams$citation <- paste0(repoParams$repoLoc, "/includes/citation.Rmd")

