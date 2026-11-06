--This test should fail, trying to insert a duplicate pair
INSERT INTO routes (origin_airport_id, destination_airport_id, distance_km)
VALUES (13, 13, 1230);

--This test should fail, trying to insert distance as 0 km
INSERT INTO routes (origin_airport_id, destination_airport_id, distance_km)
VALUES (12,13,0);

--This test should fail because we have STRICT on both tables, trying to insert text into distance column
INSERT INTO routes (origin_airport_id, destination_airport_id, distance_km)
VALUES (12,13,'1230');

--This test should fail because we cannot delete an airport when a route is dependent on it
PRAGMA foreign_keys = ON
DELETE FROM airports WHERE airports.id = 5;