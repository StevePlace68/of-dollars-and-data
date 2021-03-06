cat("\014") # Clear your console
rm(list = ls()) #clear your environment

########################## Load in header file ######################## #
setwd("~/git/of_dollars_and_data")
source(file.path(paste0(getwd(),"/header.R")))

########################## Load in Libraries ########################## #

library(Quandl)
library(dplyr)

########################## Start Program Here ######################### #

# Import bitcoin price in USD (note that my API key is imported in the header.R file)
aaii       <- Quandl("AAII/AAII_SENTIMENT")  %>%
                  mutate(date = Date,
                         bullish = Bullish,
                         bearish = Bearish) %>%
                  arrange(date) %>%
                  select(date, bullish, bearish) 

saveRDS(aaii, paste0(localdir, "0039_quandl_aaii_sentiment.Rds"))

# ############################  End  ################################## #