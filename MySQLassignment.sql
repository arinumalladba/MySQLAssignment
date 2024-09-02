-- MySQL Assignment --
CREATE DATABASE Company;
USE Company;
CREATE TABLE Members (
Member_ID INT PRIMARY KEY,
First_Name VARCHAR(20),
Last_Name VARCHAR(20),
Member_Location VARCHAR(20),
Member_Age INT
);
INSERT INTO Members (Member_ID, First_Name, Last_name, Member_Location, Member_Age)
VALUES
(1, 'John', 'Rogers', 'Colchester', 45),
(2, 'Marie', 'Curie', 'London', 34),
(3, 'Alina', 'Baraz', 'Brighton', 28),
(4, 'Christine', 'Summers', 'Birmingham', 31),
(5, 'Mohammed', 'Fahim', 'Manchester', 50);

CREATE TABLE Vehicles (
Vehicle_Registration VARCHAR(20) PRIMARY KEY,
Vehicle_Make VARCHAR(20),
Vehicle_Model VARCHAR(20),
Member_ID INT
);
INSERT INTO Vehicles (Vehicle_Registration, Vehicle_Make, Vehicle_Model, Member_ID)
VALUES
('BCA321', 'Ford', 'Fiesta', 1),
('DEF456', 'Ford', 'Focus', 2),
('SHU289', 'Lambo', 'Aventador', 3),
('MUN109', 'Porsche', 'Cayenne', 3),
('IST025', 'Peugeot', '307', 4),
('RET161', 'Nissan', 'Patrol', 4),
('SUS103', 'Mini', 'Mini Cooper', 5),
('RUM264', 'Mercedes', 'S Class', 5);

CREATE TABLE Engineers (
Engineer_ID INT PRIMARY KEY,
First_Name VARCHAR(20),
Last_Name VARCHAR(20)
);
INSERT INTO Engineers(Engineer_ID, First_Name, Last_Name)
VALUES
(121, 'Richard', 'Johnson'),
(122, 'Brandon', 'Pope'),
(123, 'Ryan', 'Stuart');

CREATE TABLE Breakdown (
Breakdown_ID INT PRIMARY KEY,
Vehicle_Registration VARCHAR(20),
Engineer_ID INT,
Breakdown_Date DATE,
Breakdown_Time TIME,
Breakdown_Location VARCHAR(20)
);
INSERT INTO Breakdown(Breakdown_ID, Vehicle_Registration, Engineer_ID, Breakdown_Date, Breakdown_Time, Breakdown_Location)
VALUES
(1, 'BCA321', 122, '2022-10-04', '14:33', 'Colchester'),
(2, 'BCA321', 122, '2022-04-25', '19:54', 'Colchester'),
(3, 'DEF456', 123, '2023-01-25', '12:15', 'London'),
(4, 'DEF456', 123, '2023-05-02', '08:31', 'London'),
(5, 'SHU289', 121, '2023-05-17', '14:05', 'Brighton'),
(6, 'MUN109', 121, '2023-05-12', '17:45', 'Brighton'),
(7, 'IST025', 122, '2022-10-04', '19:25', 'Birmingham'),
(8, 'IST025', 121, '2024-02-13', '10:19', 'Birmingham'),
(9, 'RET161', 123, '2024-02-13', '07:36', 'Birmingham'),
(10, 'SUS103', 122, '2023-10-04', '05:44', 'Manchester'),
(11, 'SUS103', 123, '2023-12-24', '15:59', 'Manchester'),
(12, 'RUM264', 121, '2024-05-12', '12:28', 'Manchester');

ALTER TABLE Vehicles ADD FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID);
ALTER TABLE Breakdown ADD FOREIGN KEY (Vehicle_Registration) REFERENCES Vehicles(Vehicle_Registration);
DESCRIBE Vehicles;
DESCRIBE Breakdown;

-- Task 3 
-- Perform queries
SELECT * FROM Members LIMIT 3;
SELECT * FROM Members LIMIT 2,3;
SELECT * FROM Vehicles WHERE Vehicle_Make LIKE 'T%';
SELECT * FROM Breakdown WHERE Breakdown_Date BETWEEN '2023-01-01' AND '2023-06-30';
SELECT * FROM Vehicles WHERE Vehicle_Registration IN ('SHU289', 'RET161', 'MUN109');
SELECT Vehicle_Registration, COUNT(*) AS 'Breakdown Count' FROM Breakdown GROUP BY Vehicle_Registration;
SELECT * FROM Members ORDER BY Member_Age DESC;
SELECT * FROM Vehicles WHERE (Vehicle_Make = 'Toyota' OR Vehicle_Make = 'Honda') AND Vehicle_Model LIKE 'C%';
SELECT Engineers.* FROM Engineers LEFT JOIN Breakdown ON Engineers.Engineer_ID = Breakdown.Engineer_ID WHERE Breakdown.Engineer_ID IS NULL;
SELECT * FROM Members WHERE Member_Age BETWEEN 25 AND 40;
SELECT * FROM Members WHERE First_Name LIKE 'J%' AND Last_Name LIKE '%son%';
SELECT * FROM Members ORDER BY Member_Age DESC LIMIT 5;
SELECT UPPER(Vehicle_Registration) AS Vehicle_Registration FROM Vehicles;
SELECT Members.*, Vehicles.Vehicle_Registration, Vehicles.Vehicle_Make, Vehicles.Vehicle_Model FROM Members INNER JOIN Vehicles ON Members.Member_ID = Vehicles.Member_ID;
SELECT Members.*, Vehicles.Vehicle_Registration, Vehicles.Vehicle_Make, Vehicles.Vehicle_Model FROM Members LEFT JOIN Vehicles ON Members.Member_ID = Vehicles.Member_ID;
SELECT Members.Member_ID, Members.First_Name, Members.Last_Name, COUNT(Breakdown.Breakdown_ID) AS 'Breakdown Count' FROM Members LEFT JOIN Vehicles ON Members.Member_ID = Vehicles.Member_ID LEFT JOIN Breakdown ON Vehicles.Vehicle_Registration = Breakdown.Vehicle_Registration GROUP BY Members.Member_ID;
SELECT Breakdown.*, Members.First_Name, Members.Last_Name FROM Breakdown INNER JOIN Vehicles ON Breakdown.Vehicle_Registration = Vehicles.Vehicle_Registration INNER JOIN Members ON Vehicles.Member_ID = Members.Member_ID WHERE Members.Member_Age > 50;

-- Task 5
-- The 'AVG' function calculates the average value of a numeric column. The average is found by adding all the values and dividing by the total number of values
-- For example to calculate the average age of all members all the ages of the members would be added and divided by 5 as there are 5 memebers. This is done in MySQL as shown below.
SELECT AVG(Member_Age) AS 'Average Age' FROM Members;
-- The 'MAX' function returns the maximum value from a numeric column. This is done in MySQL as shown below.
SELECT MAX(Member_Age) AS 'Oldest Member' FROM Members;
-- The 'MIN' function returns the minimum value from a numeric column. This is done in MySQL as shown below.
SELECT MIN(Member_Age) AS 'Youngest Member' FROM Members;
-- The 'SUM' function calculates the total sum of a numeric column. The sum is found by adding all the values together. This is done in MySQL as shown below.
SELECT SUM(Member_Age) AS 'Total Age' FROM Members;

-- Task 6
-- Update Engineer names from Engineer table.
UPDATE Engineers SET First_Name = 'Michael', Last_Name = 'Smith' WHERE Engineer_ID = 121;
UPDATE Engineers SET First_Name = 'Emily', Last_Name = 'Davis' WHERE Engineer_ID = 122;
UPDATE Engineers SET First_Name = 'Christopher', Last_Name = 'Brown' WHERE Engineer_ID = 123;
-- Delete two records from Breakdown table.
DELETE FROM Breakdown WHERE Breakdown_ID = 1;
DELETE FROM Breakdown WHERE Breakdown_ID = 5;











