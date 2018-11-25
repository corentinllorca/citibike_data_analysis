# remove trips where the start station and the end station are the same
# and the trip duration is under 90 seconds

library(readr)

df <- read_csv('data/concise_trips.csv', 
               col_types = 'iTTiiici?')

library(dplyr)

df <- df %>% filter(`start station id` != `end station id` |
                    (`start station id` == `end station id` &
                    tripduration > 90))

## remove trips that last longer than 1 hour and 30 minutes

df <- df %>% filter(tripduration < 5400)

## write new cleaned data

write_csv(as.data.frame(df), 'concise_trips_cleaned.csv')
