import sqlite3

# Connecting to planner.db
connection = sqlite3.connect("planner.db")

#Creating cursor object to query data from sqlite.db
cursor = connection.cursor()

#Designing query to get the origin_airport_id, destination_airport_id, and the flight_time_hours
#|From_Airport_Code|To_Airport_Code|Time

#Cursor executes query
cursor.execute("""
    WITH mytable AS (
    SELECT code AS from_code, destination_airport_id, flight_time_hours 
    FROM airports
    JOIN routes
    ON airports.id = routes.origin_airport_id
)

SELECT from_code, airports.code AS to_code, flight_time_hours
FROM mytable
JOIN airports
ON mytable.destination_airport_id = airports.id;
""")

#Saving the queries results in flight_data (This contains FromAirportCode, ToAirportCode, and the time)
flight_data = cursor.fetchall()

result = ""

for row in flight_data:
    result += ", ".join(map(str, row)) + "\n"

print(result)

cursor.close()
connection.close()