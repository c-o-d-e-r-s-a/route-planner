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
    origin_airport_id TEXT NOT NULL,
    destination_airport_id TEXT NOT NULL,
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

    
