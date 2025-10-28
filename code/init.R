here::i_am("code/init.R")
library(here)
library(RODBC)
library(magrittr)
library(dplyr)
library(EML)
library(ggplot2)
library(tidyr)
library(rstan)
options(mc.cores = parallel::detectCores())
rstan::rstan_options(auto_write = TRUE)

theme_set(theme_minimal())

## check that an ignore folder exists
if(!file.exists(here('ignore'))){
  print("Warning: The ignore folder does not exist.")
} 

# check that the Nearshore Survery database is present
if(!file.exists(here('ignore/Nearshore Survey.accdb'))){
  print("Warning: The database, Nearshore Survey.accdb, does not exist in the `ignore` folder.")
}

# check that the ignore folder is present in .gitignore

if(!any(grepl("ignore/",readLines(here(".gitignore"))))){
  print("Warning: `ignore` is not set to be ignored in .gitignore. Set this by adding 'ignore/' to the .gitignore file.")
}

conn <- odbcConnectAccess2007(here("ignore/Nearshore Survey.accdb"))
# sqlTables(db)
