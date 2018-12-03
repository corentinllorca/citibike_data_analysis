# remove trips where the start station and the end station are the same
# and the trip duration is under 90 seconds

library(readr)

df <- read_csv('data/concise_trips.csv', 
               col_types = 'iTTiiici?')

library(dplyr)

df <- df %>% filter(`start station id` != `end station id` |
                    (`start station id` == `end station id` &
                    tripduration > 90))


# turning usertype into a factor
df$usertype <- factor(df$usertype)

# removing absurdly long trips, threshold can be changed 
trip_duration_limit = 7200  #in seconds
df <- df %>% filter(tripduration < trip_duration_limit)

# remove data from dockless bikes
df <- df %>% filter(!is.na(`start station id`))

# turn gender to factor and change levels
df$gender <- factor(df$gender)
levels(df$gender) <- c("Missing", "Male", "Female")

# turning birth date into age
df$age <- 2018 - df$'birth year'
df <- select(df, -'birth year')


# write new cleaned data

write_csv(as.data.frame(df), 'data/concise_trips_cleaned.csv')



