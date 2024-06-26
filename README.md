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

In order to visualize key findings, I used Tableau to illustrate trends that will help us visually differentiate the characteristics between member and casual riders. 


![Dashboard 1](https://github.com/Wasifkabeer/Cyclistic-Bikeshare-Case-Study/assets/169206006/d220eae4-2313-4e2a-83ac-a602031f5770)

The visual above shows that the total amount of rides completed was much higher among members, yet the average trip length was higher among casual riders. This shows members tend to have a higher trip frequency while casual riders are completing longer trips. 

![Sheet 3](https://github.com/Wasifkabeer/Cyclistic-Bikeshare-Case-Study/assets/169206006/b1dc300c-cacf-48e1-bfec-dfba0b5dcd6c)

The visual above indicates the bike type distribution among riders. According to the data, the Classic bike is the most popular rideable type in both member and casual rider groups. It should be noted that the docked bike was exclusively used by casual riders. 

![Dashboard 2](https://github.com/Wasifkabeer/Cyclistic-Bikeshare-Case-Study/assets/169206006/aa82f20f-0df0-4096-90e4-2fc6789aabe9)

This particular visual above showcases the total amount rides distributed across day of the week, month of the year and hour of the day. It is apparent that casual riders are taking more trips during the weekend while the opposite is true for members. We can also see that the number of trips are much higher during the warmer months of the year for both casual riders as well as members. If we examine the visual in which showcases the distribution by the hour, we can see member usage peaks during commuting hours while the usage of casual riders remains fairly consistent. 

![Dashboard 3](https://github.com/Wasifkabeer/Cyclistic-Bikeshare-Case-Study/assets/169206006/3eb37d19-806b-4ccc-a975-b733cd8c0671)

This visual is similar to previous one except this one examines the average trip length in minutes. We can see that the average trip length is consistently higher among casual riders then members across every time scale distribution. However, we can see longer trip lengths taken by casual riders during the warmer months of the year as well as on weekends, supporting the notion in which casual riders are mainly using the service for leisure purposes. 

## Act 

After analysis, I was able to determine that member riders and casual riders are vastly different from one another, as each type of rider is using the Cyclistic service for a different purpose. Members use the service for convenience as they are more active during weekedays and particuarly during commuting hours. The opposite can be said about casual riders, as they are completing much longer rides throughout the day as well as much more active during weekends and summer months. Knowing this, this is the following recommendations I have for Cyclistic; 

* Converting casual riders to full time members will likely be difficult due to the vastly different riding patterns, however, Cyclistic can consider offering either a monthly or seasonal membership to these casual riders who prefer to ride during the warmer months of the year.
* In addition, Cyclistic can also offer a weekend pass that allows riders to use the service all year long but only on Saturday and Sundays. Offering this will help convert casual riders who ride for leisure purposes on the weekend.  




