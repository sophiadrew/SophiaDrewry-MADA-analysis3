###############################
# processing script
#
#this script loads the raw data, processes and cleans it 
#and saves it as Rds file in the processed_data folder

# load needed packages. make sure they are installed.
library(readr) #for loading Excel files
library(dplyr) #for data processing
library(here) #to set paths

# path to data
# note the use of the here() package and not absolute paths
dataSPOT <- here::here("data","raw_data","SympAct_Any_Pos.Rda")

# load data. 
rawdata <-readRDS(dataSPOT)

# take a look at the data
dplyr::glimpse(rawdata)


# Wrangling-------------------------------------------------------------------------------------

# Remove the following variables; 
# Anything with Score, Total, FluA, FluB, Dxname or Activity in the name
# Unique.Visit

# removing columns with Dxname, Unique.Visit & Activity
datarag <- rawdata %>% select(-c(1:8, 41:63))
dplyr::glimpse(datarag) # 32 variables

# Remove any NA observations
processeddta <- datarag %>% na.omit()
dplyr::glimpse(processeddta) # 730 observations


# location to save file
save_data_location <- here::here("data","processed_data","processeddta.rds")
saveRDS(processeddta, file = save_data_location)


