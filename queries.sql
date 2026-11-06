--Query to see which city has no destinations or origins
SELECT airports.code
FROM airports
LEFT JOIN routes AS orig ON airports.id = orig.origin_airport_id
LEFT JOIN routes AS dest ON airports.id = dest.destination_airport_id
WHERE orig.origin_airport_id IS NULL
AND dest.destination_airport_id IS NULL;

--Query to display the routes with city names. Each route with both airport codes and the distance.
SELECT 
  origin.code,
  destination.code,
  routes.distance_km
FROM routes
JOIN airports origin ON origin.id = routes.origin_airport_id
JOIN airports destination ON destination.id = routes.destination_airport_id;

--Query to get connection count per city. How many routes each airport has
SELECT 
    airports.code, 
    COUNT(all_endpoints.airport_id) AS total_connections
FROM airports
LEFT JOIN (
    SELECT origin_airport_id AS airport_id FROM routes
    UNION ALL
    SELECT destination_airport_id AS airport_id FROM routes
) AS all_endpoints 
ON airports.id = all_endpoints.airport_id
GROUP BY airports.code;

--Query to get neighbors of every airport (To which ones it connects)
WITH all_connections AS (
    SELECT origin.code AS airport_code, destination.code AS neighbor_code
    FROM routes
    JOIN airports origin ON origin.id = routes.origin_airport_id
    JOIN airports destination ON destination.id = routes.destination_airport_id
    
    UNION
    
    SELECT destination.code AS airport_code, origin.code AS neighbor_code
    FROM routes
    JOIN airports origin ON origin.id = routes.origin_airport_id
    JOIN airports destination ON destination.id = routes.destination_airport_id
)
SELECT 
    airport_code,
    GROUP_CONCAT(DISTINCT CAST(neighbor_code AS TEXT)) AS neighbor_airport_codes
FROM all_connections
GROUP BY airport_code;

--Query to get routes longer than 800 kilometers
SELECT
    origin.code,
    destination.code
    FROM routes
    JOIN airports origin on origin.id = routes.origin_airport_id
    JOIN airports destination on destination.id = routes.destination_airport_id
    WHERE routes.distance_km > 800;