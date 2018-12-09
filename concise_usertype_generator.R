library(readr)
library(sp)
library(plyr)
library(dplyr)
library(ggmap)
library(ggplot2)
concise_trips <- read_csv("data/concise_trips.csv")
colnames(concise_trips)[4] <- 'start_station_id'
colnames(concise_trips)[5] <- 'end_station_id'
concise_trips <- subset(concise_trips, select=-c(starttime,stoptime,bikeid,gender))

#<------ CHOOSE EITHER SUBSCRIBER OR CUSTOMER HERE ------------->
concise_trips <- concise_trips[concise_trips$usertype=='Subscriber',]
stations_info <- read_csv("data/stations_info.csv")
colnames(stations_info)[1] = 'start_station_id'
concise_trips_merged <- merge(x = concise_trips, y = stations_info, by = 'start_station_id')

colnames(stations_info)[1] = 'end_station_id'
concise_trips_merged <- merge(x = concise_trips_merged, y = stations_info, by = 'end_station_id')



#COMPUTING THE MOST STARTED STATIONS
colnames(stations_info)[1] = 'start_station_id'
most_started <- count(concise_trips_merged, c(concise_trips_merged$start_station_id))
colnames(most_started)[1] = 'start_station_id'
most_started_merged <- merge(x = most_started, y = stations_info, by = 'start_station_id')
most_started_merged <- most_started_merged[order(-most_started_merged$n),]

#COMPUTING THE MOST ENDED STATIONS
colnames(stations_info)[1] = 'end_station_id'
most_ended <- count(concise_trips_merged, c(concise_trips_merged$end_station_id))
colnames(most_ended)[1] = 'end_station_id'
most_ended_merged <- merge(x = most_ended, y = stations_info, by = 'end_station_id')
most_ended_merged  <- most_ended_merged[order(-most_ended_merged$n),]



#AGGREGATING THE TWO TO SEE THE MOST ACTIVE STATIONS
colnames(most_started_merged)[1] = 'station_id'
colnames(most_started_merged)[2] = 'n_s'
colnames(most_ended_merged)[1] = 'station_id'
colnames(most_ended_merged)[2] = 'n_e'
most_active <- merge(x = most_started_merged, y = most_ended_merged, by = 'station_id')
most_active$n <- most_active$n_e + most_active$n_s
most_active <- subset(most_active, select=-c(n_s,n_e,longitude.y,latitude.y,name.y))
most_active <- most_active[order(-most_active$n),]
colnames(most_active)[2] <- 'names'
colnames(most_active)[3] <- 'latitude'
colnames(most_active)[4] <- 'longitude'




apiKey <- 'AIzaSyBlArTIZYpahLCoMaIdV4pQn1GxCHk9XR8'
register_google(apiKey, account_type = "premium", day_limit = 100000)

concise_trips_merged_shorted <- count_(concise_trips_merged, 
                                       vars=c('start_station_id','end_station_id'))
concise_trips_merged_shorted <- concise_trips_merged_shorted[order(-concise_trips_merged_shorted$n),]
concise_trips_merged_shorted <- concise_trips_merged_shorted[1:1000,]

colnames(stations_info)[1] = 'start_station_id'
concise_trips_merged_shorted <- merge(x = concise_trips_merged_shorted, 
                                      y = stations_info, by = 'start_station_id')


colnames(stations_info)[1] = 'end_station_id'
concise_trips_merged_shorted <- merge(x =concise_trips_merged_shorted, 
                                      y = stations_info, by = 'end_station_id')
concise_trips_merged_shorted <- concise_trips_merged_shorted[order(-concise_trips_merged_shorted$n),]

concise_trips_merged_shorted['from'] <- paste(concise_trips_merged_shorted$latitude.x,',',
                                              concise_trips_merged_shorted$longitude.x)
concise_trips_merged_shorted['to'] <- paste(concise_trips_merged_shorted$latitude.y,',',
                                            concise_trips_merged_shorted$longitude.y)

#AGAIN : CHOOSE EITHER SUBSCRIBER OR CUSTOMER IN THE FILE NAME

write.csv(concise_trips_merged_shorted, file = "data/concise_trips_merged_shorted_subscriber.csv")
