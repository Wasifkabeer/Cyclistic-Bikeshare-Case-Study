SELECT COUNT(ride_id) AS total_rides, COUNT(DISTINCT(ride_id)) AS distinct_rides
FROM graphic-parsec-421317.Divvy_tripdata.Combined_data

# There are no duplicate rows of data as total_rides and distinct_rides are equal

SELECT COUNT(ride_id) AS null_rows
FROM `graphic-parsec-421317.Divvy_tripdata.Combined_data`
WHERE ride_id IS NULL or rideable_type IS NULL

# ride_id and rideable_type have no null rows 

SELECT COUNT(ride_id)
FROM graphic-parsec-421317.Divvy_tripdata.Combined_data
WHERE LENGTH(ride_id) != 16

# ride_id should be 16 characters long, we have no incomplete ride_ids 


SELECT COUNT(ride_id) AS null_rows
FROM `graphic-parsec-421317.Divvy_tripdata.Combined_data`
WHERE start_station_id IS NULL or start_station_name IS NULL
  or end_station_id IS NULL or end_station_name IS NULL

# 1388054 rows of data that contain NULL values for these columns

SELECT COUNT(ride_id) AS null_rows
FROM `graphic-parsec-421317.Divvy_tripdata.Combined_data`
WHERE start_lat IS NULL or start_lng IS NULL 
  or end_lat IS NULL or end_lng IS NULL

# 6990 rows of data that contain NULL values for these columns

SELECT COUNT(ride_id) AS null_rows
FROM `graphic-parsec-421317.Divvy_tripdata.Combined_data`
WHERE started_at IS NULL or ended_at IS NULL or member_casual IS NULL

# Contains no NULL data 
  
SELECT COUNT(ride_id) as null_rows
FROM graphic-parsec-421317.Divvy_tripdata.Combined_data
WHERE 
  start_station_name IS NULL OR
  start_station_id IS NULL OR
  end_station_name IS NULL OR
  end_station_id IS NULL OR
  start_lat IS NULL OR
  start_lng IS NULL OR
  end_lat IS NULL OR
  end_lng IS NULL

  # 1388170 total rows of null data