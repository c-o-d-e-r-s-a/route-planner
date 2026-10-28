--We are going to make 2 tables, one for the names of the cities and one for the routes between them.
--For the airport table, we need id, airport_name, airport_code, state, country
--For the routes table we need id, origin_airport_id, destination_airport_id, distance_miles, distance_km, flight_time_hours

-- 1. FORCE FOREIGN KEY ENFORCEMENT 
-- By default, SQLite turns foreign key constraints OFF for backwards compatibility.
-- This command MUST be run every time you connect to enforce relationships.
PRAGMA foreign_keys = ON;

-- 2. AIRPORTS TABLE (Independent)
CREATE TABLE IF NOT EXISTS airports (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    code TEXT NOT NULL UNIQUE,
    state TEXT NOT NULL,
    country TEXT NOT NULL
);

-- 3. ROUTES TABLE (Dependent)
CREATE TABLE IF NOT EXISTS routes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    origin_airport_id INTEGER NOT NULL,
    destination_airport_id INTEGER NOT NULL,
    distance_miles DECIMAL(9,1) NOT NULL,
    distance_km DECIMAL (9,1) NOT NULL,
    flight_time_hours DECIMAL(3,1) NOT NULL,

    CONSTRAINT chk_different_airports CHECK (origin_airport_id <> destination_airport_id),

    -- Foreign Key Relationship Rule
    FOREIGN KEY (origin_airport_id) REFERENCES airports(id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,

    FOREIGN KEY (destination_airport_id) REFERENCES airports(id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);

--Inserting 20 airports into the "airports" table
INSERT INTO airports (name, code, state, country) VALUES
('Hartsfield-Jackson Atlanta International Airport', 'ATL', 'Georgia', 'USA'),
('Indira Gandhi International Airport', 'DEL', 'Delhi', 'India'),
('John F. Kennedy International Airport', 'JFK', 'New York', 'USA'),
('London Heathrow Airport', 'LHR', 'England', 'UK'),
('Paris Charles de Gaulle Airport', 'CDG', 'Île-de-France', 'France'),
('Tokyo Haneda Airport', 'HND', 'Tokyo', 'Japan'),
('Dubai International Airport', 'DXB', 'Dubai', 'UAE'),
('Singapore Changi Airport', 'SIN', 'Singapore', 'Singapore'),
('Sydney Kingsford Smith Airport', 'SYD', 'New South Wales', 'Australia'),
('Frankfurt Airport', 'FRA', 'Hesse', 'Germany'),
('Amsterdam Airport Schiphol', 'AMS', 'North Holland', 'Netherlands'),
('Incheon International Airport','ICN', 'Incheon', 'South Korea'),
('Hong Kong International Airport', 'HKG', 'Hong Kong', 'China'),
('Istanbul Airport', 'IST', 'Istanbul', 'Turkey'),
('Toronto Pearson International Airport', 'YYZ', 'Ontario', 'Canada'),
('O''Hare International Airport', 'ORD', 'Illinois', 'USA'),
('Dallas/Fort Worth International Airport', 'DFW', 'Texas', 'USA'),
('Hamad International Airport', 'DOH', 'Doha', 'Qatar'),
('Suvarnabhumi Airport', 'BKK', 'Bangkok', 'Thailand'),
('Leonardo da Vinci–Fiumicino Airport', 'FCO', 'Lazio', 'Italy');

--Inserting routes using subqueried so no need to guess the airport ID's
INSERT INTO routes (origin_airport_id, destination_airport_id, distance_miles, distance_km, flight_time_hours) VALUES

(
    (SELECT id FROM airports WHERE code = 'ATL'),
    (SELECT id FROM airports WHERE code = 'DEL'),
    7972.7, 12830.6, 16.5
),
(
    (SELECT id FROM airports WHERE code = 'ATL'),
    (SELECT id FROM airports WHERE code = 'JFK'),
    759.3, 1221.9, 2.0
),
(
    (SELECT id FROM airports WHERE code = 'ATL'),
    (SELECT id FROM airports WHERE code = 'LHR'),
    4201.1, 6760.9, 9.0
),
(
    (SELECT id FROM airports WHERE code = 'ATL'),
    (SELECT id FROM airports WHERE code = 'CDG'),
    4384.1, 7055.4, 9.3
),
(
    (SELECT id FROM airports WHERE code = 'ATL'),
    (SELECT id FROM airports WHERE code = 'HND'),
    6868.5, 11053.6, 14.3
),
(
    (SELECT id FROM airports WHERE code = 'ATL'),
    (SELECT id FROM airports WHERE code = 'DXB'),
    7586.4, 12209.1, 15.8
),
(
    (SELECT id FROM airports WHERE code = 'ATL'),
    (SELECT id FROM airports WHERE code = 'SIN'),
    9958.0, 16025.6, 20.5
),
(
    (SELECT id FROM airports WHERE code = 'ATL'),
    (SELECT id FROM airports WHERE code = 'SYD'),
    9285.3, 14943.0, 19.2
),
(
    (SELECT id FROM airports WHERE code = 'ATL'),
    (SELECT id FROM airports WHERE code = 'FRA'),
    4603.5, 7408.5, 9.8
),
(
    (SELECT id FROM airports WHERE code = 'ATL'),
    (SELECT id FROM airports WHERE code = 'AMS'),
    4390.4, 7065.6, 9.3
),
(
    (SELECT id FROM airports WHERE code = 'ATL'),
    (SELECT id FROM airports WHERE code = 'ICN'),
    7138.4, 11488.0, 14.9
),
(
    (SELECT id FROM airports WHERE code = 'ATL'),
    (SELECT id FROM airports WHERE code = 'HKG'),
    8387.0, 13497.4, 17.4
),
(
    (SELECT id FROM airports WHERE code = 'ATL'),
    (SELECT id FROM airports WHERE code = 'IST'),
    5745.6, 9246.5, 12.1
),
(
    (SELECT id FROM airports WHERE code = 'ATL'),
    (SELECT id FROM airports WHERE code = 'YYZ'),
    740.0, 1190.9, 2.0
),
(
    (SELECT id FROM airports WHERE code = 'ATL'),
    (SELECT id FROM airports WHERE code = 'ORD'),
    606.2, 975.5, 1.7
),
(
    (SELECT id FROM airports WHERE code = 'ATL'),
    (SELECT id FROM airports WHERE code = 'DFW'),
    730.0, 1174.7, 2.0
),
(
    (SELECT id FROM airports WHERE code = 'ATL'),
    (SELECT id FROM airports WHERE code = 'DOH'),
    7446.0, 11983.0, 15.5
),
(
    (SELECT id FROM airports WHERE code = 'ATL'),
    (SELECT id FROM airports WHERE code = 'BKK'),
    9148.9, 14723.6, 18.9
),
(
    (SELECT id FROM airports WHERE code = 'ATL'),
    (SELECT id FROM airports WHERE code = 'FCO'),
    5023.9, 8085.0, 10.6
),

-- DEL
(
    (SELECT id FROM airports WHERE code = 'DEL'),
    (SELECT id FROM airports WHERE code = 'ATL'),
    7972.7, 12830.6, 16.5
),
(
    (SELECT id FROM airports WHERE code = 'DEL'),
    (SELECT id FROM airports WHERE code = 'JFK'),
    7304.5, 11755.2, 15.2
),
(
    (SELECT id FROM airports WHERE code = 'DEL'),
    (SELECT id FROM airports WHERE code = 'LHR'),
    4182.7, 6731.4, 8.9
),
(
    (SELECT id FROM airports WHERE code = 'DEL'),
    (SELECT id FROM airports WHERE code = 'CDG'),
    4080.0, 6566.1, 8.7
),
(
    (SELECT id FROM airports WHERE code = 'DEL'),
    (SELECT id FROM airports WHERE code = 'HND'),
    3641.6, 5860.6, 7.8
),
(
    (SELECT id FROM airports WHERE code = 'DEL'),
    (SELECT id FROM airports WHERE code = 'DXB'),
    1356.5, 2183.1, 3.2
),
(
    (SELECT id FROM airports WHERE code = 'DEL'),
    (SELECT id FROM airports WHERE code = 'SIN'),
    2584.3, 4158.9, 5.7
),
(
    (SELECT id FROM airports WHERE code = 'DEL'),
    (SELECT id FROM airports WHERE code = 'SYD'),
    6484.0, 10434.9, 13.5
),
(
    (SELECT id FROM airports WHERE code = 'DEL'),
    (SELECT id FROM airports WHERE code = 'FRA'),
    3803.9, 6121.7, 8.2
),
(
    (SELECT id FROM airports WHERE code = 'DEL'),
    (SELECT id FROM airports WHERE code = 'AMS'),
    3954.3, 6363.8, 8.5
),
(
    (SELECT id FROM airports WHERE code = 'DEL'),
    (SELECT id FROM airports WHERE code = 'ICN'),
    2890.9, 4652.4, 6.3
),
(
    (SELECT id FROM airports WHERE code = 'DEL'),
    (SELECT id FROM airports WHERE code = 'HKG'),
    2328.3, 3747.0, 5.2
),
(
    (SELECT id FROM airports WHERE code = 'DEL'),
    (SELECT id FROM airports WHERE code = 'IST'),
    2836.8, 4565.3, 6.2
),
(
    (SELECT id FROM airports WHERE code = 'DEL'),
    (SELECT id FROM airports WHERE code = 'YYZ'),
    7232.8, 11640.0, 15.0
),
(
    (SELECT id FROM airports WHERE code = 'DEL'),
    (SELECT id FROM airports WHERE code = 'ORD'),
    7470.7, 12022.9, 15.5
),
(
    (SELECT id FROM airports WHERE code = 'DEL'),
    (SELECT id FROM airports WHERE code = 'DFW'),
    8173.3, 13153.6, 16.9
),
(
    (SELECT id FROM airports WHERE code = 'DEL'),
    (SELECT id FROM airports WHERE code = 'DOH'),
    1586.6, 2553.4, 3.7
),
(
    (SELECT id FROM airports WHERE code = 'DEL'),
    (SELECT id FROM airports WHERE code = 'BKK'),
    1831.7, 2947.8, 4.2
),
(
    (SELECT id FROM airports WHERE code = 'DEL'),
    (SELECT id FROM airports WHERE code = 'FCO'),
    3686.9, 5933.4, 7.9
),

-- JFK
(
    (SELECT id FROM airports WHERE code = 'JFK'),
    (SELECT id FROM airports WHERE code = 'ATL'),
    759.3, 1221.9, 2.0
),
(
    (SELECT id FROM airports WHERE code = 'JFK'),
    (SELECT id FROM airports WHERE code = 'DEL'),
    7304.5, 11755.2, 15.2
),
(
    (SELECT id FROM airports WHERE code = 'JFK'),
    (SELECT id FROM airports WHERE code = 'LHR'),
    3442.4, 5540.0, 7.4
),
(
    (SELECT id FROM airports WHERE code = 'JFK'),
    (SELECT id FROM airports WHERE code = 'CDG'),
    3624.8, 5833.5, 7.8
),
(
    (SELECT id FROM airports WHERE code = 'JFK'),
    (SELECT id FROM airports WHERE code = 'HND'),
    6757.7, 10875.4, 14.1
),
(
    (SELECT id FROM airports WHERE code = 'JFK'),
    (SELECT id FROM airports WHERE code = 'DXB'),
    6836.0, 11001.4, 14.3
),
(
    (SELECT id FROM airports WHERE code = 'JFK'),
    (SELECT id FROM airports WHERE code = 'SIN'),
    9532.2, 15340.4, 19.7
),
(
    (SELECT id FROM airports WHERE code = 'JFK'),
    (SELECT id FROM airports WHERE code = 'SYD'),
    9950.5, 16013.6, 20.5
),
(
    (SELECT id FROM airports WHERE code = 'JFK'),
    (SELECT id FROM airports WHERE code = 'FRA'),
    3845.4, 6188.5, 8.2
),
(
    (SELECT id FROM airports WHERE code = 'JFK'),
    (SELECT id FROM airports WHERE code = 'AMS'),
    3633.6, 5847.6, 7.8
),
(
    (SELECT id FROM airports WHERE code = 'JFK'),
    (SELECT id FROM airports WHERE code = 'ICN'),
    6891.0, 11089.8, 14.4
),
(
    (SELECT id FROM airports WHERE code = 'JFK'),
    (SELECT id FROM airports WHERE code = 'HKG'),
    8059.5, 12970.3, 16.7
),
(
    (SELECT id FROM airports WHERE code = 'JFK'),
    (SELECT id FROM airports WHERE code = 'IST'),
    4987.6, 8026.6, 10.5
),
(
    (SELECT id FROM airports WHERE code = 'JFK'),
    (SELECT id FROM airports WHERE code = 'YYZ'),
    365.5, 588.2, 1.2
),
(
    (SELECT id FROM airports WHERE code = 'JFK'),
    (SELECT id FROM airports WHERE code = 'ORD'),
    738.2, 1188.1, 2.0
),
(
    (SELECT id FROM airports WHERE code = 'JFK'),
    (SELECT id FROM airports WHERE code = 'DFW'),
    1388.8, 2235.0, 3.3
),
(
    (SELECT id FROM airports WHERE code = 'JFK'),
    (SELECT id FROM airports WHERE code = 'DOH'),
    6690.8, 10767.6, 14.0
),
(
    (SELECT id FROM airports WHERE code = 'JFK'),
    (SELECT id FROM airports WHERE code = 'BKK'),
    8666.6, 13947.4, 17.9
),
(
    (SELECT id FROM airports WHERE code = 'JFK'),
    (SELECT id FROM airports WHERE code = 'FCO'),
    4266.1, 6865.6, 9.1
),

-- LHR
(
    (SELECT id FROM airports WHERE code = 'LHR'),
    (SELECT id FROM airports WHERE code = 'ATL'),
    4201.1, 6760.9, 9.0
),
(
    (SELECT id FROM airports WHERE code = 'LHR'),
    (SELECT id FROM airports WHERE code = 'DEL'),
    4182.7, 6731.4, 8.9
),
(
    (SELECT id FROM airports WHERE code = 'LHR'),
    (SELECT id FROM airports WHERE code = 'JFK'),
    3442.4, 5540.0, 7.4
),
(
    (SELECT id FROM airports WHERE code = 'LHR'),
    (SELECT id FROM airports WHERE code = 'CDG'),
    215.6, 347.0, 0.9
),
(
    (SELECT id FROM airports WHERE code = 'LHR'),
    (SELECT id FROM airports WHERE code = 'HND'),
    5960.0, 9591.6, 12.5
),
(
    (SELECT id FROM airports WHERE code = 'LHR'),
    (SELECT id FROM airports WHERE code = 'DXB'),
    3416.0, 5497.4, 7.4
),
(
    (SELECT id FROM airports WHERE code = 'LHR'),
    (SELECT id FROM airports WHERE code = 'SIN'),
    6762.3, 10882.8, 14.1
),
(
    (SELECT id FROM airports WHERE code = 'LHR'),
    (SELECT id FROM airports WHERE code = 'SYD'),
    10576.0, 17020.2, 21.8
),
(
    (SELECT id FROM airports WHERE code = 'LHR'),
    (SELECT id FROM airports WHERE code = 'FRA'),
    406.1, 653.5, 1.3
),
(
    (SELECT id FROM airports WHERE code = 'LHR'),
    (SELECT id FROM airports WHERE code = 'AMS'),
    230.1, 370.3, 1.0
),
(
    (SELECT id FROM airports WHERE code = 'LHR'),
    (SELECT id FROM airports WHERE code = 'ICN'),
    5506.2, 8861.3, 11.6
),
(
    (SELECT id FROM airports WHERE code = 'LHR'),
    (SELECT id FROM airports WHERE code = 'HKG'),
    5984.3, 9630.7, 12.5
),
(
    (SELECT id FROM airports WHERE code = 'LHR'),
    (SELECT id FROM airports WHERE code = 'IST'),
    1546.2, 2488.3, 3.6
),
(
    (SELECT id FROM airports WHERE code = 'LHR'),
    (SELECT id FROM airports WHERE code = 'YYZ'),
    3546.3, 5707.2, 7.6
),
(
    (SELECT id FROM airports WHERE code = 'LHR'),
    (SELECT id FROM airports WHERE code = 'ORD'),
    3942.5, 6344.7, 8.4
),
(
    (SELECT id FROM airports WHERE code = 'LHR'),
    (SELECT id FROM airports WHERE code = 'DFW'),
    4739.6, 7627.6, 10.0
),
(
    (SELECT id FROM airports WHERE code = 'LHR'),
    (SELECT id FROM airports WHERE code = 'DOH'),
    3255.4, 5239.0, 7.0
),
(
    (SELECT id FROM airports WHERE code = 'LHR'),
    (SELECT id FROM airports WHERE code = 'BKK'),
    5950.9, 9576.9, 12.5
),
(
    (SELECT id FROM airports WHERE code = 'LHR'),
    (SELECT id FROM airports WHERE code = 'FCO'),
    896.9, 1443.5, 2.3
),

-- CDG
(
    (SELECT id FROM airports WHERE code = 'CDG'),
    (SELECT id FROM airports WHERE code = 'ATL'),
    4384.1, 7055.4, 9.3
),
(
(SELECT id FROM airports WHERE code = 'CDG'),
(SELECT id FROM airports WHERE code = 'DEL'),
4080.0, 6566.1, 8.7
),
(
(SELECT id FROM airports WHERE code = 'CDG'),
(SELECT id FROM airports WHERE code = 'JFK'),
3624.8, 5833.5, 7.8
),
(
(SELECT id FROM airports WHERE code = 'CDG'),
(SELECT id FROM airports WHERE code = 'LHR'),
215.6, 347.0, 0.9
),
(
(SELECT id FROM airports WHERE code = 'CDG'),
(SELECT id FROM airports WHERE code = 'HND'),
6032.0, 9707.5, 12.6
),
(
(SELECT id FROM airports WHERE code = 'CDG'),
(SELECT id FROM airports WHERE code = 'DXB'),
3255.3, 5238.8, 7.0
),
(
(SELECT id FROM airports WHERE code = 'CDG'),
(SELECT id FROM airports WHERE code = 'SIN'),
6664.2, 10724.8, 13.9
),
(
(SELECT id FROM airports WHERE code = 'CDG'),
(SELECT id FROM airports WHERE code = 'SYD'),
10529.0, 16944.6, 21.7
),
(
(SELECT id FROM airports WHERE code = 'CDG'),
(SELECT id FROM airports WHERE code = 'FRA'),
278.9, 448.8, 1.1
),
(
(SELECT id FROM airports WHERE code = 'CDG'),
(SELECT id FROM airports WHERE code = 'AMS'),
247.9, 399.0, 1.0
),
(
(SELECT id FROM airports WHERE code = 'CDG'),
(SELECT id FROM airports WHERE code = 'ICN'),
5547.2, 8827.3, 11.7
),
(
(SELECT id FROM airports WHERE code = 'CDG'),
(SELECT id FROM airports WHERE code = 'HKG'),
5959.4, 9590.7, 12.5
),
(
(SELECT id FROM airports WHERE code = 'CDG'),
(SELECT id FROM airports WHERE code = 'IST'),
1375.5, 2213.7, 3.3
),
(
(SELECT id FROM airports WHERE code = 'CDG'),
(SELECT id FROM airports WHERE code = 'YYZ'),
3740.4, 6019.5, 8.0
),
(
(SELECT id FROM airports WHERE code = 'CDG'),
(SELECT id FROM airports WHERE code = 'ORD'),
4141.3, 6664.7, 8.8
),
(
(SELECT id FROM airports WHERE code = 'CDG'),
(SELECT id FROM airports WHERE code = 'DFW'),
4936.2, 7944.0, 10.4
),
(
(SELECT id FROM airports WHERE code = 'CDG'),
(SELECT id FROM airports WHERE code = 'DOH'),
3086.5, 4967.1, 6.7
),
(
(SELECT id FROM airports WHERE code = 'CDG'),
(SELECT id FROM airports WHERE code = 'BKK'),
5870.8, 9448.0, 12.3
),
(
(SELECT id FROM airports WHERE code = 'CDG'),
(SELECT id FROM airports WHERE code = 'FCO'),
683.9, 1100.6, 1.9
),
-- HND
(
(SELECT id FROM airports WHERE code = 'HND'),
(SELECT id FROM airports WHERE code = 'ATL'),
6868.5, 11053.6, 14.3
),
(
(SELECT id FROM airports WHERE code = 'HND'),
(SELECT id FROM airports WHERE code = 'DEL'),
3641.6, 5860.6, 7.8
),
(
(SELECT id FROM airports WHERE code = 'HND'),
(SELECT id FROM airports WHERE code = 'JFK'),
6757.7, 10875.4, 14.1
),
(
(SELECT id FROM airports WHERE code = 'HND'),
(SELECT id FROM airports WHERE code = 'LHR'),
5960.0, 9591.6, 12.5
),
(
(SELECT id FROM airports WHERE code = 'HND'),
(SELECT id FROM airports WHERE code = 'CDG'),
6032.0, 9707.5, 12.6
),
(
(SELECT id FROM airports WHERE code = 'HND'),
(SELECT id FROM airports WHERE code = 'DXB'),
4930.4, 7934.6, 10.4
),
(
(SELECT id FROM airports WHERE code = 'HND'),
(SELECT id FROM airports WHERE code = 'SIN'),
3293.0, 5299.5, 7.1
),
(
(SELECT id FROM airports WHERE code = 'HND'),
(SELECT id FROM airports WHERE code = 'SYD'),
4857.8, 7817.8, 10.3
),
(
(SELECT id FROM airports WHERE code = 'HND'),
(SELECT id FROM airports WHERE code = 'FRA'),
5816.8, 9361.1, 12.2
),
(
(SELECT id FROM airports WHERE code = 'HND'),
(SELECT id FROM airports WHERE code = 'AMS'),
5789.0, 9316.3, 12.1
),
(
(SELECT id FROM airports WHERE code = 'HND'),
(SELECT id FROM airports WHERE code = 'ICN'),
751.8, 1209.9, 2.0
),
(
(SELECT id FROM airports WHERE code = 'HND'),
(SELECT id FROM airports WHERE code = 'HKG'),
1803.3, 2902.1, 4.1
),
(
(SELECT id FROM airports WHERE code = 'HND'),
(SELECT id FROM airports WHERE code = 'IST'),
5565.8, 8957.1, 11.7
),
(
(SELECT id FROM airports WHERE code = 'HND'),
(SELECT id FROM airports WHERE code = 'YYZ'),
6429.0, 10346.4, 13.4
),
(
(SELECT id FROM airports WHERE code = 'HND'),
(SELECT id FROM airports WHERE code = 'ORD'),
6291.1, 10124.5, 13.2
),
(
(SELECT id FROM airports WHERE code = 'HND'),
(SELECT id FROM airports WHERE code = 'DFW'),
6448.4, 10377.6, 13.5
),
(
(SELECT id FROM airports WHERE code = 'HND'),
(SELECT id FROM airports WHERE code = 'DOH'),
5131.9, 8258.9, 10.8
),
(
(SELECT id FROM airports WHERE code = 'HND'),
(SELECT id FROM airports WHERE code = 'BKK'),
2851.1, 4588.4, 6.2
),
(
(SELECT id FROM airports WHERE code = 'HND'),
(SELECT id FROM airports WHERE code = 'FCO'),
6147.4, 9893.2, 12.9
),
-- DXB
(
(SELECT id FROM airports WHERE code = 'DXB'),
(SELECT id FROM airports WHERE code = 'ATL'),
7586.4, 12209.1, 15.8
),
(
(SELECT id FROM airports WHERE code = 'DXB'),
(SELECT id FROM airports WHERE code = 'DEL'),
1356.5, 2183.1, 3.2
),
(
(SELECT id FROM airports WHERE code = 'DXB'),
(SELECT id FROM airports WHERE code = 'JFK'),
6836.0, 11001.4, 14.3
),
(
(SELECT id FROM airports WHERE code = 'DXB'),
(SELECT id FROM airports WHERE code = 'LHR'),
3416.0, 5497.4, 7.4
),
(
(SELECT id FROM airports WHERE code = 'DXB'),
(SELECT id FROM airports WHERE code = 'CDG'),
3255.3, 5238.8, 7.0
),
(
(SELECT id FROM airports WHERE code = 'DXB'),
(SELECT id FROM airports WHERE code = 'HND'),
4930.4, 7934.6, 10.4
),
(
(SELECT id FROM airports WHERE code = 'DXB'),
(SELECT id FROM airports WHERE code = 'SIN'),
3632.9, 5846.6, 7.8
),
(
(SELECT id FROM airports WHERE code = 'DXB'),
(SELECT id FROM airports WHERE code = 'SYD'),
7483.8, 12043.8, 15.6
),
(
(SELECT id FROM airports WHERE code = 'DXB'),
(SELECT id FROM airports WHERE code = 'FRA'),
3009.9, 4844.0, 6.6
),
(
(SELECT id FROM airports WHERE code = 'DXB'),
(SELECT id FROM airports WHERE code = 'AMS'),
3211.6, 5168.5, 7.0
),
(
(SELECT id FROM airports WHERE code = 'DXB'),
(SELECT id FROM airports WHERE code = 'ICN'),
4180.7, 6728.1, 8.9
),
(
(SELECT id FROM airports WHERE code = 'DXB'),
(SELECT id FROM airports WHERE code = 'HKG'),
3678.5, 5919.9, 7.9
),
(
(SELECT id FROM airports WHERE code = 'DXB'),
(SELECT id FROM airports WHERE code = 'IST'),
1881.8, 3028.4, 4.3
),
(
(SELECT id FROM airports WHERE code = 'DXB'),
(SELECT id FROM airports WHERE code = 'YYZ'),
6886.0, 11081.9, 14.4
),
(
(SELECT id FROM airports WHERE code = 'DXB'),
(SELECT id FROM airports WHERE code = 'ORD'),
7233.5, 11641.1, 15.1
),
(
(SELECT id FROM airports WHERE code = 'DXB'),
(SELECT id FROM airports WHERE code = 'DFW'),
8027.7, 12919.2, 16.6
),
(
(SELECT id FROM airports WHERE code = 'DXB'),
(SELECT id FROM airports WHERE code = 'DOH'),
237.5, 382.2, 1.0
),
(
(SELECT id FROM airports WHERE code = 'DXB'),
(SELECT id FROM airports WHERE code = 'BKK'),
3046.9, 4903.5, 6.6
),
(
(SELECT id FROM airports WHERE code = 'DXB'),
(SELECT id FROM airports WHERE code = 'FCO'),
2699.1, 4343.8, 5.9
),
-- SIN
(
(SELECT id FROM airports WHERE code = 'SIN'),
(SELECT id FROM airports WHERE code = 'ATL'),
9958.0, 16025.6, 20.5
),
(
(SELECT id FROM airports WHERE code = 'SIN'),
(SELECT id FROM airports WHERE code = 'DEL'),
2584.3, 4158.9, 5.7
),
(
(SELECT id FROM airports WHERE code = 'SIN'),
(SELECT id FROM airports WHERE code = 'JFK'),
9532.2, 15340.4, 19.7
),
(
(SELECT id FROM airports WHERE code = 'SIN'),
(SELECT id FROM airports WHERE code = 'LHR'),
6762.3, 10882.8, 14.1
),
(
(SELECT id FROM airports WHERE code = 'SIN'),
(SELECT id FROM airports WHERE code = 'CDG'),
6664.2, 10724.8, 13.9
),
(
(SELECT id FROM airports WHERE code = 'SIN'),
(SELECT id FROM airports WHERE code = 'HND'),
3293.0, 5299.5, 7.1
),
(
(SELECT id FROM airports WHERE code = 'SIN'),
(SELECT id FROM airports WHERE code = 'DXB'),
3632.9, 5846.6, 7.8
),
(
(SELECT id FROM airports WHERE code = 'SIN'),
(SELECT id FROM airports WHERE code = 'SYD'),
3910.6, 6293.4, 8.4
),
(
(SELECT id FROM airports WHERE code = 'SIN'),
(SELECT id FROM airports WHERE code = 'FRA'),
6387.7, 10279.8, 13.3
),
(
(SELECT id FROM airports WHERE code = 'SIN'),
(SELECT id FROM airports WHERE code = 'AMS'),
6532.9, 10513.6, 13.6
),
(
(SELECT id FROM airports WHERE code = 'SIN'),
(SELECT id FROM airports WHERE code = 'ICN'),
2874.5, 4626.0, 6.3
),
(
(SELECT id FROM airports WHERE code = 'SIN'),
(SELECT id FROM airports WHERE code = 'HKG'),
1594.2, 2565.6, 3.7
),
(
(SELECT id FROM airports WHERE code = 'SIN'),
(SELECT id FROM airports WHERE code = 'IST'),
5393.3, 8679.6, 11.3
),
(
(SELECT id FROM airports WHERE code = 'SIN'),
(SELECT id FROM airports WHERE code = 'YYZ'),
9317.7, 14995.2, 19.2
),
(
(SELECT id FROM airports WHERE code = 'SIN'),
(SELECT id FROM airports WHERE code = 'ORD'),
9352.4, 15051.0, 19.3
),
(
(SELECT id FROM airports WHERE code = 'SIN'),
(SELECT id FROM airports WHERE code = 'DFW'),
9701.7, 15613.2, 20.0
),
(
(SELECT id FROM airports WHERE code = 'SIN'),
(SELECT id FROM airports WHERE code = 'DOH'),
3859.0, 6210.5, 8.3
),
(
(SELECT id FROM airports WHERE code = 'SIN'),
(SELECT id FROM airports WHERE code = 'BKK'),
881.0, 1417.8, 2.3
),
(
(SELECT id FROM airports WHERE code = 'SIN'),
(SELECT id FROM airports WHERE code = 'FCO'),
6246.7, 10052.9, 13.1
),
-- SYD
(
(SELECT id FROM airports WHERE code = 'SYD'),
(SELECT id FROM airports WHERE code = 'ATL'),
9285.3, 14943.0, 19.2
),
(
(SELECT id FROM airports WHERE code = 'SYD'),
(SELECT id FROM airports WHERE code = 'DEL'),
6484.0, 10434.9, 13.5
),
(
(SELECT id FROM airports WHERE code = 'SYD'),
(SELECT id FROM airports WHERE code = 'JFK'),
9950.5, 16013.6, 20.5
),
(
(SELECT id FROM airports WHERE code = 'SYD'),
(SELECT id FROM airports WHERE code = 'LHR'),
10576.0, 17020.2, 21.8
),
(
(SELECT id FROM airports WHERE code = 'SYD'),
(SELECT id FROM airports WHERE code = 'CDG'),
10529.0, 16944.6, 21.7
),
(
(SELECT id FROM airports WHERE code = 'SYD'),
(SELECT id FROM airports WHERE code = 'HND'),
4857.8, 7817.8, 10.3
),
(
(SELECT id FROM airports WHERE code = 'SYD'),
(SELECT id FROM airports WHERE code = 'DXB'),
7483.8, 12043.8, 15.6
),
(
(SELECT id FROM airports WHERE code = 'SYD'),
(SELECT id FROM airports WHERE code = 'SIN'),
3910.6, 6293.4, 8.4
),
(
(SELECT id FROM airports WHERE code = 'SYD'),
(SELECT id FROM airports WHERE code = 'FRA'),
10250.8, 16496.9, 21.1
),
(
(SELECT id FROM airports WHERE code = 'SYD'),
(SELECT id FROM airports WHERE code = 'AMS'),
10351.1, 16658.3, 21.3
),
(
(SELECT id FROM airports WHERE code = 'SYD'),
(SELECT id FROM airports WHERE code = 'ICN'),
5183.6, 8342.2, 10.9
),
(
(SELECT id FROM airports WHERE code = 'SYD'),
(SELECT id FROM airports WHERE code = 'HKG'),
4594.2, 7393.6, 9.7
),
(
(SELECT id FROM airports WHERE code = 'SYD'),
(SELECT id FROM airports WHERE code = 'IST'),
9302.9, 14971.5, 19.2
),
(
(SELECT id FROM airports WHERE code = 'SYD'),
(SELECT id FROM airports WHERE code = 'YYZ'),
9665.7, 15555.2, 19.9
),
(
(SELECT id FROM airports WHERE code = 'SYD'),
(SELECT id FROM airports WHERE code = 'ORD'),
9234.8, 14861.9, 19.1
),
(
(SELECT id FROM airports WHERE code = 'SYD'),
(SELECT id FROM airports WHERE code = 'DFW'),
8580.0, 13808.1, 17.8
),
(
(SELECT id FROM airports WHERE code = 'SYD'),
(SELECT id FROM airports WHERE code = 'DOH'),
7691.5, 12378.2, 16.0
),
(
(SELECT id FROM airports WHERE code = 'SYD'),
(SELECT id FROM airports WHERE code = 'BKK'),
4669.7, 7515.1, 9.9
),
(
(SELECT id FROM airports WHERE code = 'SYD'),
(SELECT id FROM airports WHERE code = 'FCO'),
10155.5, 16343.5, 20.9
),
-- FRA
(
(SELECT id FROM airports WHERE code = 'FRA'),
(SELECT id FROM airports WHERE code = 'ATL'),
4603.5, 7408.5, 9.8
),
(
(SELECT id FROM airports WHERE code = 'FRA'),
(SELECT id FROM airports WHERE code = 'DEL'),
3803.9, 6121.7, 8.2
),
(
(SELECT id FROM airports WHERE code = 'FRA'),
(SELECT id FROM airports WHERE code = 'JFK'),
3845.4, 6188.5, 8.2
),
(
(SELECT id FROM airports WHERE code = 'FRA'),
(SELECT id FROM airports WHERE code = 'LHR'),
406.1, 653.5, 1.3
),
(
(SELECT id FROM airports WHERE code = 'FRA'),
(SELECT id FROM airports WHERE code = 'CDG'),
278.9, 448.8, 1.1
),
(
(SELECT id FROM airports WHERE code = 'FRA'),
(SELECT id FROM airports WHERE code = 'HND'),
5816.8, 9361.1, 12.2
),
(
(SELECT id FROM airports WHERE code = 'FRA'),
(SELECT id FROM airports WHERE code = 'DXB'),
3009.9, 4844.0, 6.6
),
(
(SELECT id FROM airports WHERE code = 'FRA'),
(SELECT id FROM airports WHERE code = 'SIN'),
6387.7, 10279.8, 13.3
),
(
(SELECT id FROM airports WHERE code = 'FRA'),
(SELECT id FROM airports WHERE code = 'SYD'),
10250.8, 16496.9, 21.1
),
(
(SELECT id FROM airports WHERE code = 'FRA'),
(SELECT id FROM airports WHERE code = 'AMS'),
227.2, 365.7, 1.0
),
(
(SELECT id FROM airports WHERE code = 'FRA'),
(SELECT id FROM airports WHERE code = 'ICN'),
5308.7, 8543.5, 11.2
),
(
(SELECT id FROM airports WHERE code = 'FRA'),
(SELECT id FROM airports WHERE code = 'HKG'),
5688.1, 9153.9, 11.9
),
(
(SELECT id FROM airports WHERE code = 'FRA'),
(SELECT id FROM airports WHERE code = 'IST'),
1142.2, 1838.1, 2.8
),
(
(SELECT id FROM airports WHERE code = 'FRA'),
(SELECT id FROM airports WHERE code = 'YYZ'),
3941.3, 6342.8, 8.4
),
(
(SELECT id FROM airports WHERE code = 'FRA'),
(SELECT id FROM airports WHERE code = 'ORD'),
4331.5, 6970.8, 9.2
),
(
(SELECT id FROM airports WHERE code = 'FRA'),
(SELECT id FROM airports WHERE code = 'DFW'),
5130.9, 8257.3, 10.8
),
(
(SELECT id FROM airports WHERE code = 'FRA'),
(SELECT id FROM airports WHERE code = 'DOH'),
2849.9, 4586.4, 6.2
),
(
(SELECT id FROM airports WHERE code = 'FRA'),
(SELECT id FROM airports WHERE code = 'BKK'),
5592.0, 8999.4, 11.7
),
(
(SELECT id FROM airports WHERE code = 'FRA'),
(SELECT id FROM airports WHERE code = 'FCO'),
595.8, 958.8, 1.7
),
-- AMS
(
(SELECT id FROM airports WHERE code = 'AMS'),
(SELECT id FROM airports WHERE code = 'ATL'),
4390.4, 7065.6, 9.3
),
(
(SELECT id FROM airports WHERE code = 'AMS'),
(SELECT id FROM airports WHERE code = 'DEL'),
3954.3, 6363.8, 8.5
),
(
(SELECT id FROM airports WHERE code = 'AMS'),
(SELECT id FROM airports WHERE code = 'JFK'),
3633.6, 5847.6, 7.8
),
(
(SELECT id FROM airports WHERE code = 'AMS'),
(SELECT id FROM airports WHERE code = 'LHR'),
230.1, 370.3, 1.0
),
(
(SELECT id FROM airports WHERE code = 'AMS'),
(SELECT id FROM airports WHERE code = 'CDG'),
247.9, 399.0, 1.0
),
(
(SELECT id FROM airports WHERE code = 'AMS'),
(SELECT id FROM airports WHERE code = 'HND'),
5789.0, 9316.3, 12.1
),
(
(SELECT id FROM airports WHERE code = 'AMS'),
(SELECT id FROM airports WHERE code = 'DXB'),
3211.6, 5168.5, 7.0
),
(
(SELECT id FROM airports WHERE code = 'AMS'),
(SELECT id FROM airports WHERE code = 'SIN'),
6532.9, 10513.6, 13.6
),
(
(SELECT id FROM airports WHERE code = 'AMS'),
(SELECT id FROM airports WHERE code = 'SYD'),
10351.1, 16658.3, 21.3
),
(
(SELECT id FROM airports WHERE code = 'AMS'),
(SELECT id FROM airports WHERE code = 'FRA'),
227.2, 365.7, 1.0
),
(
(SELECT id FROM airports WHERE code = 'AMS'),
(SELECT id FROM airports WHERE code = 'ICN'),
5314.0, 8552.0, 11.2
),
(
(SELECT id FROM airports WHERE code = 'AMS'),
(SELECT id FROM airports WHERE code = 'HKG'),
5762.9, 9274.4, 12.1
),
(
(SELECT id FROM airports WHERE code = 'AMS'),
(SELECT id FROM airports WHERE code = 'IST'),
1356.8, 2183.6, 3.2
),
(
(SELECT id FROM airports WHERE code = 'AMS'),
(SELECT id FROM airports WHERE code = 'YYZ'),
3721.7, 5989.4, 8.0
),
(
(SELECT id FROM airports WHERE code = 'AMS'),
(SELECT id FROM airports WHERE code = 'ORD'),
4108.9, 6612.5, 8.8
),
(
(SELECT id FROM airports WHERE code = 'AMS'),
(SELECT id FROM airports WHERE code = 'DFW'),
4909.0, 7900.1, 10.4
),
(
(SELECT id FROM airports WHERE code = 'AMS'),
(SELECT id FROM airports WHERE code = 'DOH'),
3057.9, 4921.1, 6.7
),
(
(SELECT id FROM airports WHERE code = 'AMS'),
(SELECT id FROM airports WHERE code = 'BKK'),
5720.8, 9206.6, 12.0
),
(
(SELECT id FROM airports WHERE code = 'AMS'),
(SELECT id FROM airports WHERE code = 'FCO'),
805.8, 1296.9, 2.1
),
-- ICN
(
(SELECT id FROM airports WHERE code = 'ICN'),
(SELECT id FROM airports WHERE code = 'ATL'),
7138.4, 11488.0, 14.9
),
(
(SELECT id FROM airports WHERE code = 'ICN'),
(SELECT id FROM airports WHERE code = 'DEL'),
2890.9, 4652.4, 6.3
),
(
(SELECT id FROM airports WHERE code = 'ICN'),
(SELECT id FROM airports WHERE code = 'JFK'),
6891.0, 11089.8, 14.4
),
(
(SELECT id FROM airports WHERE code = 'ICN'),
(SELECT id FROM airports WHERE code = 'LHR'),
5506.2, 8861.3, 11.6
),
(
(SELECT id FROM airports WHERE code = 'ICN'),
(SELECT id FROM airports WHERE code = 'CDG'),
5547.2, 8827.3, 11.7
),
(
(SELECT id FROM airports WHERE code = 'ICN'),
(SELECT id FROM airports WHERE code = 'HND'),
751.8, 1209.9, 2.0
),
(
(SELECT id FROM airports WHERE code = 'ICN'),
(SELECT id FROM airports WHERE code = 'DXB'),
4180.7, 6728.1, 8.9
),
(
(SELECT id FROM airports WHERE code = 'ICN'),
(SELECT id FROM airports WHERE code = 'SIN'),
2874.5, 4626.0, 6.3
),
(
(SELECT id FROM airports WHERE code = 'ICN'),
(SELECT id FROM airports WHERE code = 'SYD'),
5183.6, 8342.2, 10.9
),
(
(SELECT id FROM airports WHERE code = 'ICN'),
(SELECT id FROM airports WHERE code = 'FRA'),
5308.7, 8543.5, 11.2
),
(
(SELECT id FROM airports WHERE code = 'ICN'),
(SELECT id FROM airports WHERE code = 'AMS'),
5314.0, 8552.0, 11.2
),
(
(SELECT id FROM airports WHERE code = 'ICN'),
(SELECT id FROM airports WHERE code = 'HKG'),
1285.2, 2068.3, 3.1
),
(
(SELECT id FROM airports WHERE code = 'ICN'),
(SELECT id FROM airports WHERE code = 'IST'),
4923.1, 7922.9, 10.4
),
(
(SELECT id FROM airports WHERE code = 'ICN'),
(SELECT id FROM airports WHERE code = 'YYZ'),
6597.8, 10618.0, 13.8
),
(
(SELECT id FROM airports WHERE code = 'ICN'),
(SELECT id FROM airports WHERE code = 'ORD'),
6537.3, 10520.7, 13.7
),
(
(SELECT id FROM airports WHERE code = 'ICN'),
(SELECT id FROM airports WHERE code = 'DFW'),
6827.5, 10987.6, 14.2
),
(
(SELECT id FROM airports WHERE code = 'ICN'),
(SELECT id FROM airports WHERE code = 'DOH'),
4384.6, 7056.2, 9.3
),
(
(SELECT id FROM airports WHERE code = 'ICN'),
(SELECT id FROM airports WHERE code = 'BKK'),
2278.2, 3666.4, 5.1
),
(
(SELECT id FROM airports WHERE code = 'ICN'),
(SELECT id FROM airports WHERE code = 'FCO'),
5571.1, 8965.6, 11.7
),
-- HKG
(
(SELECT id FROM airports WHERE code = 'HKG'),
(SELECT id FROM airports WHERE code = 'ATL'),
8387.0, 13497.4, 17.4
),
(
(SELECT id FROM airports WHERE code = 'HKG'),
(SELECT id FROM airports WHERE code = 'DEL'),
2328.3, 3747.0, 5.2
),
(
(SELECT id FROM airports WHERE code = 'HKG'),
(SELECT id FROM airports WHERE code = 'JFK'),
8059.5, 12970.3, 16.7
),
(
(SELECT id FROM airports WHERE code = 'HKG'),
(SELECT id FROM airports WHERE code = 'LHR'),
5984.3, 9630.7, 12.5
),
(
(SELECT id FROM airports WHERE code = 'HKG'),
(SELECT id FROM airports WHERE code = 'CDG'),
5959.4, 9590.7, 12.5
),
(
(SELECT id FROM airports WHERE code = 'HKG'),
(SELECT id FROM airports WHERE code = 'HND'),
1803.3, 2902.1, 4.1
),
(
(SELECT id FROM airports WHERE code = 'HKG'),
(SELECT id FROM airports WHERE code = 'DXB'),
3678.5, 5919.9, 7.9
),
(
(SELECT id FROM airports WHERE code = 'HKG'),
(SELECT id FROM airports WHERE code = 'SIN'),
1594.2, 2565.6, 3.7
),
(
(SELECT id FROM airports WHERE code = 'HKG'),
(SELECT id FROM airports WHERE code = 'SYD'),
4594.2, 7393.6, 9.7
),
(
(SELECT id FROM airports WHERE code = 'HKG'),
(SELECT id FROM airports WHERE code = 'FRA'),
5688.1, 9153.9, 11.9
),
(
(SELECT id FROM airports WHERE code = 'HKG'),
(SELECT id FROM airports WHERE code = 'AMS'),
5762.9, 9274.4, 12.1
),
(
(SELECT id FROM airports WHERE code = 'HKG'),
(SELECT id FROM airports WHERE code = 'ICN'),
1285.2, 2068.3, 3.1
),
(
(SELECT id FROM airports WHERE code = 'HKG'),
(SELECT id FROM airports WHERE code = 'IST'),
4974.9, 8006.2, 10.5
),
(
(SELECT id FROM airports WHERE code = 'HKG'),
(SELECT id FROM airports WHERE code = 'YYZ'),
7797.4, 12548.6, 16.2
),
(
(SELECT id FROM airports WHERE code = 'HKG'),
(SELECT id FROM airports WHERE code = 'ORD'),
7781.5, 12522.9, 16.2
),
(
(SELECT id FROM airports WHERE code = 'HKG'),
(SELECT id FROM airports WHERE code = 'DFW'),
8110.5, 13052.4, 16.8
),
(
(SELECT id FROM airports WHERE code = 'HKG'),
(SELECT id FROM airports WHERE code = 'DOH'),
3912.0, 6295.6, 8.4
),
(
(SELECT id FROM airports WHERE code = 'HKG'),
(SELECT id FROM airports WHERE code = 'BKK'),
1049.4, 1688.8, 2.6
),
(
(SELECT id FROM airports WHERE code = 'HKG'),
(SELECT id FROM airports WHERE code = 'FCO'),
5768.6, 9283.6, 12.1
),
-- IST
(
(SELECT id FROM airports WHERE code = 'IST'),
(SELECT id FROM airports WHERE code = 'ATL'),
5745.6, 9246.5, 12.1
),
(
(SELECT id FROM airports WHERE code = 'IST'),
(SELECT id FROM airports WHERE code = 'DEL'),
2836.8, 4565.3, 6.2
),
(
(SELECT id FROM airports WHERE code = 'IST'),
(SELECT id FROM airports WHERE code = 'JFK'),
4987.6, 8026.6, 10.5
),
(
(SELECT id FROM airports WHERE code = 'IST'),
(SELECT id FROM airports WHERE code = 'LHR'),
1546.2, 2488.3, 3.6
),
(
(SELECT id FROM airports WHERE code = 'IST'),
(SELECT id FROM airports WHERE code = 'CDG'),
1375.5, 2213.7, 3.3
),
(
(SELECT id FROM airports WHERE code = 'IST'),
(SELECT id FROM airports WHERE code = 'HND'),
5565.8, 8957.1, 11.7
),
(
(SELECT id FROM airports WHERE code = 'IST'),
(SELECT id FROM airports WHERE code = 'DXB'),
1881.8, 3028.4, 4.3
),
(
(SELECT id FROM airports WHERE code = 'IST'),
(SELECT id FROM airports WHERE code = 'SIN'),
5393.3, 8679.6, 11.3
),
(
(SELECT id FROM airports WHERE code = 'IST'),
(SELECT id FROM airports WHERE code = 'SYD'),
9302.9, 14971.5, 19.2
),
(
(SELECT id FROM airports WHERE code = 'IST'),
(SELECT id FROM airports WHERE code = 'FRA'),
1142.2, 1838.1, 2.8
),
(
(SELECT id FROM airports WHERE code = 'IST'),
(SELECT id FROM airports WHERE code = 'AMS'),
1356.8, 2183.6, 3.2
),
(
(SELECT id FROM airports WHERE code = 'IST'),
(SELECT id FROM airports WHERE code = 'ICN'),
4923.1, 7922.9, 10.4
),
(
(SELECT id FROM airports WHERE code = 'IST'),
(SELECT id FROM airports WHERE code = 'HKG'),
4974.9, 8006.2, 10.5
),
(
(SELECT id FROM airports WHERE code = 'IST'),
(SELECT id FROM airports WHERE code = 'YYZ'),
5077.6, 8171.5, 10.7
),
(
(SELECT id FROM airports WHERE code = 'IST'),
(SELECT id FROM airports WHERE code = 'ORD'),
5459.7, 8786.4, 11.5
),
(
(SELECT id FROM airports WHERE code = 'IST'),
(SELECT id FROM airports WHERE code = 'DFW'),
6260.9, 10075.9, 13.1
),
(
(SELECT id FROM airports WHERE code = 'IST'),
(SELECT id FROM airports WHERE code = 'DOH'),
1711.2, 2753.9, 3.9
),
(
(SELECT id FROM airports WHERE code = 'IST'),
(SELECT id FROM airports WHERE code = 'BKK'),
4667.7, 7511.8, 9.9
),
(
(SELECT id FROM airports WHERE code = 'IST'),
(SELECT id FROM airports WHERE code = 'FCO'),
853.5, 1373.5, 2.2
),
-- YYZ
(
(SELECT id FROM airports WHERE code = 'YYZ'),
(SELECT id FROM airports WHERE code = 'ATL'),
740.0, 1190.9, 2.0
),
(
(SELECT id FROM airports WHERE code = 'YYZ'),
(SELECT id FROM airports WHERE code = 'DEL'),
7232.8, 11640.0, 15.0
),
(
(SELECT id FROM airports WHERE code = 'YYZ'),
(SELECT id FROM airports WHERE code = 'JFK'),
365.5, 588.2, 1.2
),
(
(SELECT id FROM airports WHERE code = 'YYZ'),
(SELECT id FROM airports WHERE code = 'LHR'),
3546.3, 5707.2, 7.6
),
(
(SELECT id FROM airports WHERE code = 'YYZ'),
(SELECT id FROM airports WHERE code = 'CDG'),
3740.4, 6019.5, 8.0
),
(
(SELECT id FROM airports WHERE code = 'YYZ'),
(SELECT id FROM airports WHERE code = 'HND'),
6429.0, 10346.4, 13.4
),
(
(SELECT id FROM airports WHERE code = 'YYZ'),
(SELECT id FROM airports WHERE code = 'DXB'),
6886.0, 11081.9, 14.4
),
(
(SELECT id FROM airports WHERE code = 'YYZ'),
(SELECT id FROM airports WHERE code = 'SIN'),
9317.7, 14995.2, 19.2
),
(
(SELECT id FROM airports WHERE code = 'YYZ'),
(SELECT id FROM airports WHERE code = 'SYD'),
9665.7, 15555.2, 19.9
),
(
(SELECT id FROM airports WHERE code = 'YYZ'),
(SELECT id FROM airports WHERE code = 'FRA'),
3941.3, 6342.8, 8.4
),
(
(SELECT id FROM airports WHERE code = 'YYZ'),
(SELECT id FROM airports WHERE code = 'AMS'),
3721.7, 5989.4, 8.0
),
(
(SELECT id FROM airports WHERE code = 'YYZ'),
(SELECT id FROM airports WHERE code = 'ICN'),
6597.8, 10618.0, 13.8
),
(
(SELECT id FROM airports WHERE code = 'YYZ'),
(SELECT id FROM airports WHERE code = 'HKG'),
7797.4, 12548.6, 16.2
),
(
(SELECT id FROM airports WHERE code = 'YYZ'),
(SELECT id FROM airports WHERE code = 'IST'),
5077.6, 8171.5, 10.7
),
(
(SELECT id FROM airports WHERE code = 'YYZ'),
(SELECT id FROM airports WHERE code = 'ORD'),
435.7, 701.2, 1.4
),
(
(SELECT id FROM airports WHERE code = 'YYZ'),
(SELECT id FROM airports WHERE code = 'DFW'),
1198.5, 1928.8, 2.9
),
(
(SELECT id FROM airports WHERE code = 'YYZ'),
(SELECT id FROM airports WHERE code = 'DOH'),
6758.7, 10876.9, 14.1
),
(
(SELECT id FROM airports WHERE code = 'YYZ'),
(SELECT id FROM airports WHERE code = 'BKK'),
8473.1, 13636.0, 17.5
),
(
(SELECT id FROM airports WHERE code = 'YYZ'),
(SELECT id FROM airports WHERE code = 'FCO'),
4402.6, 7085.2, 9.4
),
-- ORD
(
(SELECT id FROM airports WHERE code = 'ORD'),
(SELECT id FROM airports WHERE code = 'ATL'),
606.2, 975.5, 1.7
),
(
(SELECT id FROM airports WHERE code = 'ORD'),
(SELECT id FROM airports WHERE code = 'DEL'),
7470.7, 12022.9, 15.5
),
(
(SELECT id FROM airports WHERE code = 'ORD'),
(SELECT id FROM airports WHERE code = 'JFK'),
738.2, 1188.1, 2.0
),
(
(SELECT id FROM airports WHERE code = 'ORD'),
(SELECT id FROM airports WHERE code = 'LHR'),
3942.5, 6344.7, 8.4
),
(
(SELECT id FROM airports WHERE code = 'ORD'),
(SELECT id FROM airports WHERE code = 'CDG'),
4141.3, 6664.7, 8.8
),
(
(SELECT id FROM airports WHERE code = 'ORD'),
(SELECT id FROM airports WHERE code = 'HND'),
6291.1, 10124.5, 13.2
),
(
(SELECT id FROM airports WHERE code = 'ORD'),
(SELECT id FROM airports WHERE code = 'DXB'),
7233.5, 11641.1, 15.1
),
(
(SELECT id FROM airports WHERE code = 'ORD'),
(SELECT id FROM airports WHERE code = 'SIN'),
9352.4, 15051.0, 19.3
),
(
(SELECT id FROM airports WHERE code = 'ORD'),
(SELECT id FROM airports WHERE code = 'SYD'),
9234.8, 14861.9, 19.1
),
(
(SELECT id FROM airports WHERE code = 'ORD'),
(SELECT id FROM airports WHERE code = 'FRA'),
4331.5, 6970.8, 9.2
),
(
(SELECT id FROM airports WHERE code = 'ORD'),
(SELECT id FROM airports WHERE code = 'AMS'),
4108.9, 6612.5, 8.8
),
(
(SELECT id FROM airports WHERE code = 'ORD'),
(SELECT id FROM airports WHERE code = 'ICN'),
6537.3, 10520.7, 13.7
),
(
(SELECT id FROM airports WHERE code = 'ORD'),
(SELECT id FROM airports WHERE code = 'HKG'),
7781.5, 12522.9, 16.2
),
(
(SELECT id FROM airports WHERE code = 'ORD'),
(SELECT id FROM airports WHERE code = 'IST'),
5459.7, 8786.4, 11.5
),
(
(SELECT id FROM airports WHERE code = 'ORD'),
(SELECT id FROM airports WHERE code = 'YYZ'),
435.7, 701.2, 1.4
),
(
(SELECT id FROM airports WHERE code = 'ORD'),
(SELECT id FROM airports WHERE code = 'DFW'),
801.6, 1290.0, 2.1
),
(
(SELECT id FROM airports WHERE code = 'ORD'),
(SELECT id FROM airports WHERE code = 'DOH'),
7119.5, 11457.6, 14.8
),
(
(SELECT id FROM airports WHERE code = 'ORD'),
(SELECT id FROM airports WHERE code = 'BKK'),
8551.5, 13762.2, 17.7
),
(
(SELECT id FROM airports WHERE code = 'ORD'),
(SELECT id FROM airports WHERE code = 'FCO'),
4810.8, 7742.1, 10.2
),
-- DFW
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'ATL'),
730.0, 1174.7, 2.0
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'DEL'),
8173.3, 13153.6, 16.9
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'JFK'),
1388.8, 2235.0, 3.3
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'LHR'),
4739.6, 7627.6, 10.0
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'CDG'),
4936.2, 7944.0, 10.4
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'HND'),
6448.4, 10377.6, 13.5
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'DXB'),
8027.7, 12919.2, 16.6
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'SIN'),
9701.7, 15613.2, 20.0
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'SYD'),
8580.0, 13808.1, 17.8
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'FRA'),
5130.9, 8257.3, 10.8
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'AMS'),
4909.0, 7900.1, 10.4
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'ICN'),
6827.5, 10987.6, 14.2
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'HKG'),
8110.5, 13052.4, 16.8
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'IST'),
6260.9, 10075.9, 13.1
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'YYZ'),
1198.5, 1928.8, 2.9
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'ORD'),
801.6, 1290.0, 2.1
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'DOH'),
7918.6, 12743.6, 16.4
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'BKK'),
9010.3, 14500.5, 18.6
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'FCO'),
5600.8, 9013.6, 11.8
),
-- DOH
(
(SELECT id FROM airports WHERE code = 'DOH'),
(SELECT id FROM airports WHERE code = 'ATL'),
7446.0, 11983.0, 15.5
),
(
(SELECT id FROM airports WHERE code = 'DOH'),
(SELECT id FROM airports WHERE code = 'DEL'),
1586.6, 2553.4, 3.7
),
(
(SELECT id FROM airports WHERE code = 'DOH'),
(SELECT id FROM airports WHERE code = 'JFK'),
6690.8, 10767.6, 14.0
),
(
(SELECT id FROM airports WHERE code = 'DOH'),
(SELECT id FROM airports WHERE code = 'LHR'),
3255.4, 5239.0, 7.0
),
(
(SELECT id FROM airports WHERE code = 'DOH'),
(SELECT id FROM airports WHERE code = 'CDG'),
3086.5, 4967.1, 6.7
),
(
(SELECT id FROM airports WHERE code = 'DOH'),
(SELECT id FROM airports WHERE code = 'HND'),
5131.9, 8258.9, 10.8
),
(
(SELECT id FROM airports WHERE code = 'DOH'),
(SELECT id FROM airports WHERE code = 'DXB'),
237.5, 382.2, 1.0
),
(
(SELECT id FROM airports WHERE code = 'DOH'),
(SELECT id FROM airports WHERE code = 'SIN'),
3859.0, 6210.5, 8.3
),
(
(SELECT id FROM airports WHERE code = 'DOH'),
(SELECT id FROM airports WHERE code = 'SYD'),
7691.5, 12378.2, 16.0
),
(
(SELECT id FROM airports WHERE code = 'DOH'),
(SELECT id FROM airports WHERE code = 'FRA'),
2849.9, 4586.4, 6.2
),
(
(SELECT id FROM airports WHERE code = 'DOH'),
(SELECT id FROM airports WHERE code = 'AMS'),
3057.9, 4921.1, 6.7
),
(
(SELECT id FROM airports WHERE code = 'DOH'),
(SELECT id FROM airports WHERE code = 'ICN'),
4384.6, 7056.2, 9.3
),
(
(SELECT id FROM airports WHERE code = 'DOH'),
(SELECT id FROM airports WHERE code = 'HKG'),
3912.0, 6295.6, 8.4
),
(
(SELECT id FROM airports WHERE code = 'DOH'),
(SELECT id FROM airports WHERE code = 'IST'),
1711.2, 2753.9, 3.9
),
(
(SELECT id FROM airports WHERE code = 'DOH'),
(SELECT id FROM airports WHERE code = 'YYZ'),
6758.7, 10876.9, 14.1
),
(
(SELECT id FROM airports WHERE code = 'DOH'),
(SELECT id FROM airports WHERE code = 'ORD'),
7119.5, 11457.6, 14.8
),
(
(SELECT id FROM airports WHERE code = 'DOH'),
(SELECT id FROM airports WHERE code = 'DFW'),
7918.6, 12743.6, 16.4
),
(
(SELECT id FROM airports WHERE code = 'DOH'),
(SELECT id FROM airports WHERE code = 'BKK'),
3283.4, 5284.1, 7.1
),
(
(SELECT id FROM airports WHERE code = 'DOH'),
(SELECT id FROM airports WHERE code = 'FCO'),
2507.9, 4036.1, 5.5
),
-- BKK
(
(SELECT id FROM airports WHERE code = 'BKK'),
(SELECT id FROM airports WHERE code = 'ATL'),
9148.9, 14723.6, 18.9
),
(
(SELECT id FROM airports WHERE code = 'BKK'),
(SELECT id FROM airports WHERE code = 'DEL'),
1831.7, 2947.8, 4.2
),
(
(SELECT id FROM airports WHERE code = 'BKK'),
(SELECT id FROM airports WHERE code = 'JFK'),
8666.6, 13947.4, 17.9
),
(
(SELECT id FROM airports WHERE code = 'BKK'),
(SELECT id FROM airports WHERE code = 'LHR'),
5950.9, 9576.9, 12.5
),
(
(SELECT id FROM airports WHERE code = 'BKK'),
(SELECT id FROM airports WHERE code = 'CDG'),
5870.8, 9448.0, 12.3
),
(
(SELECT id FROM airports WHERE code = 'BKK'),
(SELECT id FROM airports WHERE code = 'HND'),
2851.1, 4588.4, 6.2
),
(
(SELECT id FROM airports WHERE code = 'BKK'),
(SELECT id FROM airports WHERE code = 'DXB'),
3046.9, 4903.5, 6.6
),
(
(SELECT id FROM airports WHERE code = 'BKK'),
(SELECT id FROM airports WHERE code = 'SIN'),
881.0, 1417.8, 2.3
),
(
(SELECT id FROM airports WHERE code = 'BKK'),
(SELECT id FROM airports WHERE code = 'SYD'),
4669.7, 7515.1, 9.9
),
(
(SELECT id FROM airports WHERE code = 'BKK'),
(SELECT id FROM airports WHERE code = 'FRA'),
5592.0, 8999.4, 11.7
),
(
(SELECT id FROM airports WHERE code = 'BKK'),
(SELECT id FROM airports WHERE code = 'AMS'),
5720.8, 9206.6, 12.0
),
(
(SELECT id FROM airports WHERE code = 'BKK'),
(SELECT id FROM airports WHERE code = 'ICN'),
2278.2, 3666.4, 5.1
),
(
(SELECT id FROM airports WHERE code = 'BKK'),
(SELECT id FROM airports WHERE code = 'HKG'),
1049.4, 1688.8, 2.6
),
(
(SELECT id FROM airports WHERE code = 'BKK'),
(SELECT id FROM airports WHERE code = 'IST'),
4667.7, 7511.8, 9.9
),
(
(SELECT id FROM airports WHERE code = 'BKK'),
(SELECT id FROM airports WHERE code = 'YYZ'),
8473.1, 13636.0, 17.5
),
(
(SELECT id FROM airports WHERE code = 'BKK'),
(SELECT id FROM airports WHERE code = 'ORD'),
8551.5, 13762.2, 17.7
),
(
(SELECT id FROM airports WHERE code = 'BKK'),
(SELECT id FROM airports WHERE code = 'DFW'),
9010.3, 14500.5, 18.6
),
(
(SELECT id FROM airports WHERE code = 'BKK'),
(SELECT id FROM airports WHERE code = 'DOH'),
3283.4, 5284.1, 7.1
),
(
(SELECT id FROM airports WHERE code = 'BKK'),
(SELECT id FROM airports WHERE code = 'FCO'),
5515.8, 8876.7, 11.6
),
-- FCO
(
(SELECT id FROM airports WHERE code = 'FCO'),
(SELECT id FROM airports WHERE code = 'ATL'),
5023.9, 8085.0, 10.6
),
(
(SELECT id FROM airports WHERE code = 'FCO'),
(SELECT id FROM airports WHERE code = 'DEL'),
3686.9, 5933.4, 7.9
),
(
(SELECT id FROM airports WHERE code = 'FCO'),
(SELECT id FROM airports WHERE code = 'JFK'),
4266.1, 6865.6, 9.1
),
(
(SELECT id FROM airports WHERE code = 'FCO'),
(SELECT id FROM airports WHERE code = 'LHR'),
896.9, 1443.5, 2.3
),
(
(SELECT id FROM airports WHERE code = 'FCO'),
(SELECT id FROM airports WHERE code = 'CDG'),
683.9, 1100.6, 1.9
),
(
(SELECT id FROM airports WHERE code = 'FCO'),
(SELECT id FROM airports WHERE code = 'HND'),
6147.4, 9893.2, 12.9
),
(
(SELECT id FROM airports WHERE code = 'FCO'),
(SELECT id FROM airports WHERE code = 'DXB'),
2699.1, 4343.8, 5.9
),
(
(SELECT id FROM airports WHERE code = 'FCO'),
(SELECT id FROM airports WHERE code = 'SIN'),
6246.7, 10052.9, 13.1
),
(
(SELECT id FROM airports WHERE code = 'FCO'),
(SELECT id FROM airports WHERE code = 'SYD'),
10155.5, 16343.5, 20.9
),
(
(SELECT id FROM airports WHERE code = 'FCO'),
(SELECT id FROM airports WHERE code = 'FRA'),
595.8, 958.8, 1.7
),
(
(SELECT id FROM airports WHERE code = 'FCO'),
(SELECT id FROM airports WHERE code = 'AMS'),
805.8, 1296.9, 2.1
),
(
(SELECT id FROM airports WHERE code = 'FCO'),
(SELECT id FROM airports WHERE code = 'ICN'),
5571.1, 8965.6, 11.7
),
(
(SELECT id FROM airports WHERE code = 'FCO'),
(SELECT id FROM airports WHERE code = 'HKG'),
5768.6, 9283.6, 12.1
),
(
(SELECT id FROM airports WHERE code = 'FCO'),
(SELECT id FROM airports WHERE code = 'IST'),
853.5, 1373.5, 2.2
),
(
(SELECT id FROM airports WHERE code = 'FCO'),
(SELECT id FROM airports WHERE code = 'YYZ'),
4402.6, 7085.2, 9.4
),
(
(SELECT id FROM airports WHERE code = 'FCO'),
(SELECT id FROM airports WHERE code = 'ORD'),
4810.8, 7742.1, 10.2
),
(
(SELECT id FROM airports WHERE code = 'FCO'),
(SELECT id FROM airports WHERE code = 'DFW'),
5600.8, 9013.6, 11.8
),
(
(SELECT id FROM airports WHERE code = 'FCO'),
(SELECT id FROM airports WHERE code = 'DOH'),
2507.9, 4036.1, 5.5
),
(
(SELECT id FROM airports WHERE code = 'FCO'),
(SELECT id FROM airports WHERE code = 'BKK'),
5515.8, 8876.7, 11.6
);