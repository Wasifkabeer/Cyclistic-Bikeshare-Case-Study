# Cyclistic-Bikeshare-Case-Study

## Introduction 
I will be analyzing a fictional company called Cyclistic, a bike sharing company from Chicago, in order to answer some business questions. In particular, the company has requested me to determine the key differences between casual bike riders versus member riders in order to increase the purchase of memberships among said casual riders. The director of marketing believes that by maximizing the number of annual memberships will lead to higher profit margins for the company. In order to complete this task, I will be analyzing Cyclistic trip data from the year 2023 in the following steps; Ask, Prepare, Process, Analyze, Share and Act. 

### More About Cyclistic 

Cyclistic is a bike-share program that features more than 5,800 bicycles and 600
docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand
tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities
and riders who can’t use a standard two-wheeled bike. The majority of riders opt for
traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more
likely to ride for leisure, but about 30% use the bikes to commute to work each day.

## Ask 

There is only one key question I was assigned to answer during this phase of the analysis; How do annual members and casual riders use Cyclistic bikes differently? 

## Prepare 

For my data source, I was able to obtain trip data from the year 2023 by downloading 12 datasets containing trip data for each month from [Divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). Each dataset contained various information about each single trip during the month, including; ride id, bike type, start and end stations, start and end latitude as well as longtitude, times started at and ended at, and membership type. 

It should be noted as Cyclistic is a fictional company, however, for the purposes of this case study, these datasets were deemed appropriate and was made available by Motivate International Inc. It should also be noted that these datasets contain public data that can be used to explore how different customer types are using the Cyclistic service. Due to data privacy, I was unable to use any personal information about any rider. This would mean I cannot connect pass purchases to credit card numbers in order to determine if casual riders live within the local area or if they purchased multiple single passes. 

## Process 

During the process phase, I used BigQuery Studio as there was over 5 million rows of uncleaned data that simply cannot be processed by applications like Google Sheets or Microsoft Excel. Using BigQuery, I was able to combine the 12 datasets into one larger dataset labelled [combined_data](https://github.com/Wasifkabeer/Cyclistic-Bikeshare-Case-Study/blob/main/Combined_data_query.sql) that contained information about every ride provided by Cyclistic in the year 2023.  

Following the creation of the combined_data table, I used another [query](https://github.com/Wasifkabeer/Cyclistic-Bikeshare-Case-Study/blob/main/Clean_trip_data_query.sql) to create another table titled "clean_trip_data" in which excluded rows containing null data. Before I created this table, I completed a number of exploratory queries on this table to determine which rows needed to be excluded from the final analysis. These queries can be found [here](https://github.com/Wasifkabeer/Cyclistic-Bikeshare-Case-Study/blob/main/Data_cleaning_exploration.sql). As a result, approximately 1,388,170 rows of data was removed during this step. 

After removing rows containing null data, I created a table with additional columns including a day of the week, a month of the year and trip length in minutes. After creating these columns, I removed rows that represented trips in which were shorter then one minute in length as well as trips that were longer then 24 hours as these trips were most likely erroneous. Therefore, approximately another 87,651 rows of data was removed from this [query](https://github.com/Wasifkabeer/Cyclistic-Bikeshare-Case-Study/blob/main/Clean_trip_info_query.sql). As a result, the final table "clean_trip_info" was created containing all rides for the year excluding any rows that contained missing or duplicate data, as well as any outliers. This table also contains additional columns such as day of the week, month of the year and trip length. There was a total of 4,244,056 rows of data in this table. 

## Analyze 

With the final table created, I was able to analyze the data to determine any existing trends and patterns within the dataset. After running multiple [queries](https://github.com/Wasifkabeer/Cyclistic-Bikeshare-Case-Study/blob/main/Data_analysis.sql) on the dataset, I was able to find the following; 

* There were more total rides overall by members as opposed to casual riders. However, casual riders on average are completing longer trips as opposed to their member counterparts 
* Members are more active during the week while casual riders complete more rides during the weekend. In addition, casual riders are completing longer rides during the weekend on average. 
* Both members and casual riders increase their riding frequency during the summer months, but casual riders increase their average ride length during this time. 
* Rides completed by members peak during commuting hours while casual riders have a more consistent riding pattern through out the day

This would indicate that on average, members complete more frequent but shorter rides as opposed to casual riders, who ride less frequently but ride for a longer period of time. Based on their riding patterns throughout the year, we find casual riders are more active during weekends and during the summer months, as well as completing longer rides during these times. In contrast, members also increase their riding frequency overall during the summer, but are less active during the weekend. Furthermore, their riding frequency is much higher during commuting hours while keeping a consistent ride length throughout. These findings lead me to believe that member riders are using the Cyclistic service for commuting and convenience purposes, while casual riders are using the service for leisure. 

## Share 

In order to visualize key findings, I used Tableau to illustrate trends that will help us differentiate member and casual riders. 


![Dashboard 1](https://github.com/Wasifkabeer/Cyclistic-Bikeshare-Case-Study/assets/169206006/d220eae4-2313-4e2a-83ac-a602031f5770)












