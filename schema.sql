--We are going to make 2 tables, one for the names of the cities and one for the routes between them.
--For the airport table, we need id, name, code
--For the routes table we need id, origin_airport_id, destination_airport_id and distance_km

-- 1. FORCE FOREIGN KEY ENFORCEMENT 
-- By default, SQLite turns foreign key constraints OFF for backwards compatibility.
-- This command MUST be run every time you connect to enforce relationships.
PRAGMA foreign_keys = ON;

-- 2. AIRPORTS TABLE (Independent)
CREATE TABLE IF NOT EXISTS airports (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    code TEXT NOT NULL UNIQUE CHECK(LENGTH(code) = 3)
);

-- 3. ROUTES TABLE (Dependent)
CREATE TABLE IF NOT EXISTS routes (
    id INTEGER PRIMARY KEY,
    origin_airport_id INTEGER NOT NULL,
    destination_airport_id INTEGER NOT NULL,
    distance_km INTEGER NOT NULL CHECK (distance_km > 0),

    --Checking if the pair is unique
    CONSTRAINT chk_unique_pair UNIQUE (origin_airport_id, destination_airport_id),

    --Checking if no origin and destination are the same airports
    CONSTRAINT chk_different_airports CHECK (origin_airport_id <> destination_airport_id),

    -- Foreign Key Relationship Rule
    FOREIGN KEY (origin_airport_id) REFERENCES airports(id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,

    FOREIGN KEY (destination_airport_id) REFERENCES airports(id)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT
);