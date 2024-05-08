SELECT * 
FROM graphic-parsec-421317.Divvy_tripdata.Combined_data
WHERE 
  start_station_name IS NOT NULL AND 
  start_station_id IS NOT NULL AND
  end_station_name IS NOT NULL AND
  end_station_id IS NOT NULL AND
  start_lat IS NOT NULL AND
  start_lng IS NOT NULL AND
  end_lat IS NOT NULL AND
  end_lng IS NOT NULL

# Creating a new table excluding rows filled with null data
