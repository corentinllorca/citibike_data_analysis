# edav_fall_2018
EDAV Project for Fall 2018 - Corentin Llorca, Redouane Dziri, Arnaud Stiegler

# Project progress tracking

### 11-19-2018, Redouane

Added preprocessing step in `preprocessing.R`. Separates the largest files by filtering out all the stations information. Outputs two files : `concise_trips.csv` with all the trips information and `stations_info.csv` containing the name and latitude, longitude of each station (removed in the former file).

Please run the last bit of `preprocessing.R` to generate those files in your local repositories.

Create R script `data_cleaning.R` with cleaning steps that can be applied before pretty much any exploration - removes noisy data and strong outliers that reflect unproper trip tracking, stolen bikes, malfunctioning bikes

Please run the script after `preprocessing.R` once all files have been placed in `data` folder

Explored seasonal patterns. Two different outputs: pdf (with static picture of map from screenshot placed in folder `figures` and html (with interactive map). The interactiveness of the map is not very useful, except to see the names of the stations by hovering over their markers. The screenshot will probably be better suited for reporting.

Please take a look at how seasons affected tourist and residents behaviour before conducting further analysis on differences between tourists and residents to avoid redundant story-telling

# How do people use Citibike?

## Are there any seasonal patterns (travel time, number of users?) ? Possible explanations

## Are citibikes used as an alternative for other means of transportation?
 (east - west travels) where metro seriously lacking

## Are citibikes more used for fun or work?
 (distinction between working and non-working people)

## Are citibikes used more by NY/NJ residents or visitors?

## Is there a difference of length of travel from day to night? travel themselves?

## Are some stations used more as starting or ending points?

## Are people using bikes more depending on the weather? temperature?


