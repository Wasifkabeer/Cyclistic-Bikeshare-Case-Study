SELECT 
  *, 
  CASE EXTRACT(DAYOFWEEK FROM started_at)
    WHEN 1 THEN "Sunday"
    WHEN 2 THEN "Monday" 
    WHEN 3 THEN "Tuesday"
    WHEN 4 THEN "Wednesday" 
    WHEN 5 THEN "Thursday"
    WHEN 6 THEN "Friday"
    WHEN 7 THEN "Saturday"
   END AS day_of_week,
  CASE EXTRACT(MONTH FROM started_at)
    WHEN 1 THEN "January"
    WHEN 2 THEN "February" 
    WHEN 3 THEN "March"
    WHEN 4 THEN "April" 
    WHEN 5 THEN "May"
    WHEN 6 THEN "June"
    WHEN 7 THEN "July"
    WHEN 8 THEN "August"
    WHEN 9 THEN "September"
    WHEN 10 THEN "October"
    WHEN 11 THEN "November"
    WHEN 12 THEN "December"
  END AS month,
  DATETIME_DIFF(ended_at, started_at, MINUTE) AS trip_length_min
FROM graphic-parsec-421317.Divvy_tripdata.clean_trip_data
WHERE 
  DATETIME_DIFF(ended_at, started_at, MINUTE) >= 1 AND
  DATETIME_DIFF(ended_at, started_at, MINUTE) < 1440

# Created three new columns that measure the ride length to the closest minute, as well as day of week and month
# Removed rows that contained trips less then a minute as well as extended over 24 hours (87,651 rows removed)
