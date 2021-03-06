cat("\014") # Clear your console
rm(list = ls()) #clear your environment

########################## Load in header file ######################## #
setwd("~/git/of_dollars_and_data")
source(file.path(paste0(getwd(),"/header.R")))

########################## Load in Libraries ########################## #


########################## Start Program Here ######################### #

# Read in productivity data from tab-delimited text file on the web
# Use function to make this dynamic
read_in_bls <- function(string){
  name      <- gsub(" ", "", string)
  if (name != "area"){
  temp_name <- read.csv(paste0("https://download.bls.gov/pub/time.series/la/la.", name), 
                             header = TRUE, 
                             sep = "\t")
  } else {
    temp_name <- read.csv(paste0("https://download.bls.gov/pub/time.series/la/la.", name), 
                          header = TRUE, 
                          sep = "\t", row.names = NULL)  
  }
  
  saveRDS(temp_name, paste0(importdir, "0012_bls_unemployment/bls_unemployment_", name, ".Rds"))
}

read_in_bls("area")
read_in_bls("area_type")
read_in_bls("measure")
read_in_bls("data.0.CurrentU90-94")
read_in_bls("data.0.CurrentU95-99")
read_in_bls("data.0.CurrentU00-04")
read_in_bls("data.0.CurrentU05-09")
read_in_bls("data.0.CurrentU10-14")
read_in_bls("data.0.CurrentU15-19")









# ############################  End  ################################## #