SELECT member_casual, AVG(trip_length_min) AS average_trip_length
FROM `graphic-parsec-421317.Divvy_tripdata.clean_trip_info` 
GROUP BY member_casual

# Average trip length is much higher among casual riders then members 

SELECT member_casual, rideable_type, COUNT(rideable_type) AS count
FROM `graphic-parsec-421317.Divvy_tripdata.clean_trip_info` 
GROUP BY member_casual, rideable_type

# Docked bikes are exclusively used by casual riders
# Classic and electric bikes used more by members than casual riders 

SELECT member_casual, COUNT(ride_id) AS total_trips
FROM `graphic-parsec-421317.Divvy_tripdata.clean_trip_info` 
GROUP BY member_casual

# Overall, there were more trips by members then casual riders 


SELECT member_casual, COUNT(ride_id) AS total_trips, day_of_week 
FROM `graphic-parsec-421317.Divvy_tripdata.clean_trip_info`
GROUP BY member_casual, day_of_week
ORDER BY day_of_week

# Members appear to have more total trips Monday to Friday
# Casual riders have more trips on the weekends

SELECT member_casual, COUNT(ride_id) AS total_trips, month  
FROM `graphic-parsec-421317.Divvy_tripdata.clean_trip_info`
GROUP BY month, member_casual
ORDER BY month, member_casual

# It appears trip counts are higher from April to October for both rider groups
# Overall, trip counts are higher per each month for member riders 

SELECT member_casual, AVG(trip_length_min) AS average_trip_length, day_of_week  
FROM `graphic-parsec-421317.Divvy_tripdata.clean_trip_info`
GROUP BY day_of_week, member_casual
ORDER BY day_of_week, member_casual

# Casual riders take longer rides across all days of the week versus members 

SELECT member_casual, AVG(trip_length_min) AS average_trip_length, month  
FROM `graphic-parsec-421317.Divvy_tripdata.clean_trip_info`
GROUP BY month, member_casual
ORDER BY month, member_casual

# This trend is apparent across all months of the year as well

SELECT member_casual, COUNT(ride_id) AS total_trips, EXTRACT(HOUR from started_at) AS hour_of_day
FROM graphic-parsec-421317.Divvy_tripdata.clean_trip_info
GROUP BY hour_of_day, member_casual
ORDER BY hour_of_day, member_casual

SELECT COUNT(ride_id) AS total_trips, EXTRACT(HOUR from started_at) AS hour_of_day
FROM graphic-parsec-421317.Divvy_tripdata.clean_trip_info
WHERE member_casual = 'member'
GROUP BY hour_of_day
ORDER BY total_trips DESC

SELECT COUNT(ride_id) AS total_trips, EXTRACT(HOUR from started_at) AS hour_of_day
FROM graphic-parsec-421317.Divvy_tripdata.clean_trip_info
WHERE member_casual = 'casual'
GROUP BY hour_of_day
ORDER BY total_trips DESC

# Trip totals are higher for members during all hours of the day
# Most popular hours for members are hours 17, 16, 18, 8 and 15 (5pm, 4pm, 6pm, 8am and 3pm)
# Most popular hours for casual riders are 17, 16, 18, 15, and 14 (5pm, 4pm, 6pm, 3pm and 2pm)

SELECT member_casual, AVG(trip_length_min) AS average_trip_length, EXTRACT(HOUR from started_at) AS hour_of_day
FROM graphic-parsec-421317.Divvy_tripdata.clean_trip_info
GROUP BY hour_of_day, member_casual
ORDER BY hour_of_day, member_casual

# Casual riders are taking longer rides through out all hours of the day

SELECT member_casual, COUNT(ride_id) AS total_trips, start_station_name
FROM graphic-parsec-421317.Divvy_tripdata.clean_trip_info
GROUP BY member_casual, start_station_name
ORDER BY total_trips DESC

# Popular start stations by member type

SELECT member_casual, COUNT(ride_id) AS total_trips, end_station_name
FROM graphic-parsec-421317.Divvy_tripdata.clean_trip_info
GROUP BY member_casual, end_station_name
ORDER BY total_trips DESC

# Popular end stations by member type



