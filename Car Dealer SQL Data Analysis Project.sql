-- Create schema and import data
CREATE SCHEMA cars;
USE cars;

-- Read the data
SELECT * FROM car_dealer;

-- Total Car: Count total of record
SELECT COUNT(*) AS Total_Car
	FROM car_dealer;

-- Cars available with year is 2023
SELECT COUNT(*) AS Cars_Available_2023
	FROM car_dealer
    WHERE year = 2023;
    
-- Cars available with year is 2020, 2021, and 2023
SELECT
	year, COUNT(*) AS Total_Cars_Available
    FROM car_dealer
    WHERE year IN (2020,2021,2023)
    GROUP BY year;

-- Total Cars All Year
SELECT year, COUNT(*) AS Total_Cars_Available
	FROM car_dealer
    GROUP BY year;
    
-- Diesel car 2ith year is 2020
SELECT COUNT(*) AS Total_Diesel_2020
	FROM car_dealer
    WHERE fuel = 'Diesel' AND year = 2020;
    
-- Petrol car with year is 2020
SELECT COUNT(*) AS Petrol_Car_2020
	FROM car_dealer
    WHERE fuel = 'Petrol' AND year = 2020;
    
-- Petrol, Diesel, and CNG car in each year
SELECT 
	year, 
	fuel as fuel_type, 
    SUM(CASE WHEN fuel IN ('petrol', 'diesel', 'cng') THEN 1 ELSE 0 END) AS total_count
	FROM car_dealer
    WHERE fuel IN ('petrol', 'diesel', 'cng')
GROUP BY year, fuel
ORDER BY year, fuel;

-- Car year that had more than 100 units
SELECT year, COUNT(*) AS Total_unit
	FROM car_dealer
    GROUP BY year
    HAVING Total_unit > 100;
    
-- most high cars count between 2015 and 2020
SELECT year, COUNT(*) AS Total_car
	FROM car_dealer
    WHERE year BETWEEN 2015 AND 2020
    GROUP BY year
    ORDER BY Total_car DESC;
    
-- Cars details between 2020 and 2023
SELECT * FROM car_dealer
	WHERE year BETWEEN 2020 AND 2023;
    
-- Most expensive car on the list
SELECT Name AS car_name, year, selling_price AS price
	FROM car_dealer
    ORDER BY price DESC;
	
    
