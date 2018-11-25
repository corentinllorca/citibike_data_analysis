# remove trips where the start station and the end station are the same
# and the trip duration is under 90 seconds

library(readr)

df <- read_csv('data/concise_trips.csv', 
               col_types = 'iTTiiici?')

library(dplyr)

df <- df %>% filter(`start station id` != `end station id` |
                    (`start station id` == `end station id` &
                    tripduration > 90))


#Turning usertype into a factor
df$usertype <- factor(df$usertype)

#Removing absurdly long trips, threshold can be changed 
trip_duration_limit = 7200  #in seconds
df <- df %>% filter(tripduration < trip_duration_limit)

## write new cleaned data

write_csv(as.data.frame(df), 'concise_trips_cleaned.csv')
