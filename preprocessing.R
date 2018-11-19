
library(readr)

## ------------------------------------------------------------------------
df <- read_csv('data/raw_summary_stats/2014-4.csv', 
               col_types = '?i_i_i_i_')
df$Date <- as.Date(df$Date , "%m/%d/%Y")
colnames(df) = c("Date", "Trips", "Miles", "Cumulative Memberships",
                 "24 Hour Passes")

## ------------------------------------------------------------------------
df2 <- read_csv('data/raw_summary_stats/2015-1.csv', 
                col_types = '?i_i_ii_')
df2$Date <- as.Date(df2$Date , "%m/%d/%Y")
colnames(df2) = c("Date", "Trips", "Miles", "Cumulative Memberships",
                  "24 Hour Passes")

## ------------------------------------------------------------------------
df <- rbind(df,df2)

## ------------------------------------------------------------------------
df2 <- read_csv('data/raw_summary_stats/2015-2.csv', 
                col_types = '?i_i_ii_')
df2$Date <- as.Date(df2$Date , "%m/%d/%Y")
colnames(df2) = c("Date", "Trips", "Miles", "Cumulative Memberships",
                  "24 Hour Passes")

## ------------------------------------------------------------------------
df <- rbind(df,df2)

## ------------------------------------------------------------------------
df2 <- read_csv('data/raw_summary_stats/2015-3.csv', 
                col_types = '?i_i_ii_')
df2$Date <- as.Date(df2$Date , "%m/%d/%Y")
colnames(df2) = c("Date", "Trips", "Miles", "Cumulative Memberships",
                  "24 Hour Passes")

## ------------------------------------------------------------------------
df <- rbind(df,df2)

## ------------------------------------------------------------------------
df2 <- read_csv('data/raw_summary_stats/2015-4.csv', 
                col_types = '?i_i_ii_')
df2$Date <- as.Date(df2$Date , "%m/%d/%Y")
colnames(df2) = c("Date", "Trips", "Miles", "Cumulative Memberships",
                  "24 Hour Passes")

## ------------------------------------------------------------------------
df <- rbind(df,df2)

## ------------------------------------------------------------------------
df2 <- read_csv('data/raw_summary_stats/2016-1.csv', 
                col_types = '?i_i_ii_')
df2$Date <- as.Date(df2$Date , "%m/%d/%Y")
colnames(df2) = c("Date", "Trips", "Miles", "Cumulative Memberships",
                  "24 Hour Passes")

## ------------------------------------------------------------------------
df <- rbind(df,df2)

## ------------------------------------------------------------------------
df2 <- read_csv('data/raw_summary_stats/2016-2.csv', 
                col_types = '?i_i_ii__')
df2$Date <- as.Date(df2$Date , "%m/%d/%Y")
colnames(df2) = c("Date", "Trips", "Miles", "Cumulative Memberships",
                  "24 Hour Passes")

## ------------------------------------------------------------------------
df <- rbind(df,df2)

## ------------------------------------------------------------------------
df2 <- read_csv('data/raw_summary_stats/2016-3.csv', 
                col_types = '?i_i_ii_')
df2$Date <- as.Date(df2$Date , "%m/%d/%y")
colnames(df2) = c("Date", "Trips", "Miles", "Cumulative Memberships",
                  "24 Hour Passes")

## ------------------------------------------------------------------------
df <- rbind(df,df2)

## ------------------------------------------------------------------------
df2 <- read_csv('data/raw_summary_stats/2016-4.csv', 
                col_types = '?i_i_ii_')
colnames(df2) = c("Date", "Trips", "Miles", "Cumulative Memberships",
                  "24 Hour Passes")
f <- function(date) {
  if (nchar(date) < 9) {
    temp = paste(substring(date,1,6), "20", substring(date, 7, 2), sep = "")
    return(paste(temp, "16", sep = ""))
  } else {
    return(date)
  }
}
df2$Date <- sapply(df2$Date, f)
df2$Date <- as.Date(df2$Date , "%m/%d/%Y")

## ------------------------------------------------------------------------
df <- rbind(df,df2)

## ------------------------------------------------------------------------
df2 <- read_csv('data/raw_summary_stats/2017-1.csv', 
                col_types = '?iiii_')
df2$Date <- as.Date(df2$Date , "%m/%d/%y")
colnames(df2) = c("Date", "Trips", "Miles", "Cumulative Memberships",
                  "24 Hour Passes")

## ------------------------------------------------------------------------
df <- rbind(df,df2)

## ------------------------------------------------------------------------
df2 <- read_csv('data/raw_summary_stats/2017-2.csv', 
                col_types = '?iiii_')
df2$Date <- as.Date(df2$Date , "%m/%d/%y")
colnames(df2) = c("Date", "Trips", "Miles", "Cumulative Memberships",
                  "24 Hour Passes")

## ------------------------------------------------------------------------
df <- rbind(df,df2)

## ------------------------------------------------------------------------
df2 <- read_csv('data/raw_summary_stats/2017-3.csv', 
                col_types = '?iiii_')
df2$Date <- as.Date(df2$Date , "%m/%d/%y")
colnames(df2) = c("Date", "Trips", "Miles", "Cumulative Memberships", "24 Hour Passes")

## ------------------------------------------------------------------------
df <- rbind(df,df2)

## ------------------------------------------------------------------------
df2 <- read_csv('data/raw_summary_stats/2017-4.csv', 
                col_types = '?iiii_')
df2$Date <- as.Date(df2$Date , "%m/%d/%y")
colnames(df2) = c("Date", "Trips", "Miles", "Cumulative Memberships",
                  "24 Hour Passes")

## ------------------------------------------------------------------------
df <- rbind(df,df2)

## ------------------------------------------------------------------------
df2 <- read_csv('data/raw_summary_stats/2018-1.csv', 
                col_types = '?iiii_')
df2$Date <- as.Date(df2$Date , "%m/%d/%Y")
colnames(df2) = c("Date", "Trips", "Miles", "Cumulative Memberships",
                  "24 Hour Passes")

## ------------------------------------------------------------------------
df <- rbind(df,df2)

## ------------------------------------------------------------------------
df2 <- read_csv('data/raw_summary_stats/2018-2.csv', 
                col_types = '?iiii_')
df2$Date <- as.Date(df2$Date , "%m/%d/%y")
colnames(df2) = c("Date", "Trips", "Miles", "Cumulative Memberships",
                  "24 Hour Passes")

## ------------------------------------------------------------------------
df <- rbind(df,df2)

## ------------------------------------------------------------------------
df2 <- read_csv('data/raw_summary_stats/2018-3.csv', 
                col_types = '?iiii_')
df2$Date <- as.Date(df2$Date , "%m/%d/%y")
colnames(df2) = c("Date", "Trips", "Miles", "Cumulative Memberships",
                  "24 Hour Passes")

## ------------------------------------------------------------------------
df <- rbind(df,df2)

## ------------------------------------------------------------------------
write_csv(as.data.frame(df), "summary_stats_per_day.csv")

## ------------------------------------------------------------------------
df <- read_csv('data/2018-02-citibike-trips.csv')
df2 <- read_csv('data/2018-07-citibike-trips.csv')
df3 <- read_csv('data/2018-10-citibike-trips.csv')
df <- rbind(df, df2, df3)
write_csv(as.data.frame(df), "2018-feb-jul-oct-citibike-trips.csv")

## ------------------------------------------------------------------------
# Script to create a station dictionary and remove superfluous duplicates 
# from the original dataframe and write two new csvs to store the 
# information

library(readr)

df <- read_csv('data/2018-feb-jul-oct-citibike-trips.csv', 
               col_types = 'iTTicnnicnnici?')

library(dplyr)

stations <- df %>% select(c("start station id",
                            "start station name",
                            "start station latitude",
                            "start station longitude"))
stations <- stations %>% group_by("start station id")
stations <- stations[!duplicated(stations["start station id"]),]
stations <- stations[,-c(5)]
colnames(stations) <- c("id", "name", "latitude", "longitude")

df <- df %>% select(-c("start station name",
                       "start station latitude",
                       "start station longitude",
                       "end station name",
                       "end station latitude",
                       "end station longitude"))

write_csv(as.data.frame(df), "concise_trips.csv")
write_csv(as.data.frame(stations), "stations_info.csv")