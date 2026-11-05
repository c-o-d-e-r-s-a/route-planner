--Source URL: https://www.greatcirclemap.com/?routes=ATL-LAX%2C%20ATL-DFW%2C%20DFW-LAX%2C%20DFW-MSP%2C%20DFW-DEN%2C%20DEN-MSP%2C%20JFK-DEN%2C%20DEN-LAX%2C%20JFK-ABQ%2C%20ABQ-LAX%2C%20DFW-BHM%2C%20BHM-SDF%2C%20DFW-ORD%2C%20ORD-SDF%2C%20MCO-CHS%2C%20CHS-MSP%2C%20MCO-ICT%2C%20ICT-MSP%2C%20ICT-SDF%2C%20ICT-BNA%2C%20BNA-SDF%2C%20LAS-MSP%2C%20MSP-ORD%2C%20LAS-LIT%2C%20LIT-ORD%2C%20SEA-ICT%2C%20SEA-DEN%2C%20DEN-ICT%2C%20JFK-DCA%2C%20DCA-BNA%2C%20JFK-IND%2C%20IND-BNA
--Accessed On November 4th

-- 1. FORCE FOREIGN KEY ENFORCEMENT 
-- By default, SQLite turns foreign key constraints OFF for backwards compatibility.
-- This command MUST be run every time you connect to enforce relationships.
PRAGMA foreign_keys = ON;

-- Insert 20 major airports in alphabetical order by code
INSERT INTO airports (name, code, state, country) VALUES
('Albuquerque International Sunport', 'ABQ'),
('Hartsfield-Jackson Atlanta International Airport', 'ATL'),
('Birmingham-Shuttlesworth International Airport', 'BHM'),
('Nashville International Airport', 'BNA'),
('Charleston International Airport', 'CHS'),
('Ronald Reagan Washington National Airport', 'DCA'),
('Denver International Airport', 'DEN'),
('Dallas/Fort Worth International Airport'),
('Wichita Dwight D. Eisenhower National Airport', 'ICT'),
('Indianapolis International Airport', 'IND'),
('John F. Kennedy International Airport', 'JFK'),
('Harry Reid International Airport', 'LAS'),
('Los Angeles International Airport', 'LAX'),
('Bill and Hillary Clinton National Airport', 'LIT'),
('Orlando International Airport', 'MCO'),
('Minneapolis-Saint Paul International Airport', 'MSP'),
('O''Hare International Airport', 'ORD'),
('Louisville Muhammad Ali International Airport', 'SDF'),
('Seattle-Tacoma International Airport', 'SEA'),
('San Francisco International Airport', 'SFO');

-- Insert routes with the alphabetically earlier airport code first
INSERT INTO routes (origin_airport_id, destination_airport_id, distance_km) VALUES
(
(SELECT id FROM airports WHERE code = 'ATL'),
(SELECT id FROM airports WHERE code = 'LAX'),
3133
),
(
(SELECT id FROM airports WHERE code = 'ATL'),
(SELECT id FROM airports WHERE code = 'DFW'),
1177
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'LAX'),
1987
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'MSP'),
1371
),
(
(SELECT id FROM airports WHERE code = 'DEN'),
(SELECT id FROM airports WHERE code = 'DFW'),
1032
),
(
(SELECT id FROM airports WHERE code = 'DEN'),
(SELECT id FROM airports WHERE code = 'MSP'),
1094
),
(
(SELECT id FROM airports WHERE code = 'DEN'),
(SELECT id FROM airports WHERE code = 'JFK'),
2616
),
(
(SELECT id FROM airports WHERE code = 'DEN'),
(SELECT id FROM airports WHERE code = 'LAX'),
1387
),
(
(SELECT id FROM airports WHERE code = 'ABQ'),
(SELECT id FROM airports WHERE code = 'JFK'),
2938
),
(
(SELECT id FROM airports WHERE code = 'ABQ'),
(SELECT id FROM airports WHERE code = 'LAX'),
1090
),
(
(SELECT id FROM airports WHERE code = 'BHM'),
(SELECT id FROM airports WHERE code = 'DFW'),
961
),
(
(SELECT id FROM airports WHERE code = 'BHM'),
(SELECT id FROM airports WHERE code = 'SDF'),
520
),
(
(SELECT id FROM airports WHERE code = 'DFW'),
(SELECT id FROM airports WHERE code = 'ORD'),
1290
),
(
(SELECT id FROM airports WHERE code = 'ORD'),
(SELECT id FROM airports WHERE code = 'SDF'),
461
),
(
(SELECT id FROM airports WHERE code = 'CHS'),
(SELECT id FROM airports WHERE code = 'MCO'),
510
),
(
(SELECT id FROM airports WHERE code = 'CHS'),
(SELECT id FROM airports WHERE code = 'MSP'),
1750
),
(
(SELECT id FROM airports WHERE code = 'ICT'),
(SELECT id FROM airports WHERE code = 'MCO'),
1816
),
(
(SELECT id FROM airports WHERE code = 'ICT'),
(SELECT id FROM airports WHERE code = 'MSP'),
877
),
(
(SELECT id FROM airports WHERE code = 'ICT'),
(SELECT id FROM airports WHERE code = 'SDF'),
1030
),
(
(SELECT id FROM airports WHERE code = 'BNA'),
(SELECT id FROM airports WHERE code = 'ICT'),
973
),
(
(SELECT id FROM airports WHERE code = 'BNA'),
(SELECT id FROM airports WHERE code = 'SDF'),
242
),
(
(SELECT id FROM airports WHERE code = 'LAS'),
(SELECT id FROM airports WHERE code = 'MSP'),
2091
),
(
(SELECT id FROM airports WHERE code = 'MSP'),
(SELECT id FROM airports WHERE code = 'ORD'),
538
),
(
(SELECT id FROM airports WHERE code = 'LAS'),
(SELECT id FROM airports WHERE code = 'LIT'),
2083
),
(
(SELECT id FROM airports WHERE code = 'LIT'),
(SELECT id FROM airports WHERE code = 'ORD'),
889
),
(
(SELECT id FROM airports WHERE code = 'ICT'),
(SELECT id FROM airports WHERE code = 'SEA'),
2301
),
(
(SELECT id FROM airports WHERE code = 'DEN'),
(SELECT id FROM airports WHERE code = 'SEA'),
1648
),
(
(SELECT id FROM airports WHERE code = 'DEN'),
(SELECT id FROM airports WHERE code = 'ICT'),
675
),
(
(SELECT id FROM airports WHERE code = 'DCA'),
(SELECT id FROM airports WHERE code = 'JFK'),
343
),
(
(SELECT id FROM airports WHERE code = 'BNA'),
(SELECT id FROM airports WHERE code = 'DCA'),
904
),
(
(SELECT id FROM airports WHERE code = 'IND'),
(SELECT id FROM airports WHERE code = 'JFK'),
1070
),
(
(SELECT id FROM airports WHERE code = 'BNA'),
(SELECT id FROM airports WHERE code = 'IND'),
400
);