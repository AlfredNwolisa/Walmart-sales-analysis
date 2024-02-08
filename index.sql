---DATA WRANGLING: Data Manipulation USING SQL

--Creating the DATABASE and table in postgreDB
-- CREATE DATABASE walmartsales;

-- CREATE TABLE wsales(
-- 	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
--     branch VARCHAR(5) NOT NULL,
--     city VARCHAR(30) NOT NULL,
--     customer_type VARCHAR(30) NOT NULL,
--     gender VARCHAR(30) NOT NULL,
--     product_line VARCHAR(100) NOT NULL,
--     unit_price DECIMAL(10,2) NOT NULL,
--     quantity INT NOT NULL,
--     tax_pct FLOAT NOT NULL,
--     total DECIMAL(12, 4) NOT NULL,
--     date DATETIME NOT NULL,
--     time TIME NOT NULL,
--     payment VARCHAR(15) NOT NULL,
--     cogs DECIMAL(10,2) NOT NULL,
--     gross_margin_pct FLOAT,
--     gross_income DECIMAL(12, 4),
--     rating FLOAT);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------FEATURE ENGINEERING-------------------------------------------------------------------

-- adding time_of_day column

-- ALTER TABLE wsales
-- ADD COLUMN time_of_day VARCHAR(20);

-- updating time_of_day column 
-- UPDATE wsales
-- SET time_of_day = CASE
-- WHEN time >= '00:00:00' AND time < '12:00:00' THEN 'Morning'
-- WHEN time >= '12:00:00' AND time < '18:00:00' THEN 'Afternoon'
-- WHEN time >= '18:00:00' AND time < '24:00:00' THEN 'Evening'
-- END;

                                                   ------------------------------------------

-- Adding a new column to wsales table for tracking day of week

-- ALTER TABLE wsales
-- ADD COLUMN day_of_week VARCHAR(25);

-- UPDATE wsales
-- SET day_of_week =  
-- case when EXTRACT(isodow from date) = 1 then 'Monday' 
-- when EXTRACT(isodow from date) = 2 then 'Tuesday' 
-- when EXTRACT(isodow from date) = 3 then 'Wednesday' 
-- when EXTRACT(isodow from date) = 4 then 'Thursday' 
-- when EXTRACT(isodow from date) = 5 then 'Friday' 
-- when EXTRACT(isodow from date) = 6 then 'Saturday' 
-- when EXTRACT(isodow from date) = 7 then 'Sunday' end;

                                                   ------------------------------------------

-- Adding a new column to wsales table for tracking day of week

-- ALTER TABLE wsales
-- ADD COLUMN month_name VARCHAR(25);

-- UPDATE wsales
-- SET month_name =  
-- CASE WHEN EXTRACT(MONTH from date) = 1 THEN 'January'
-- WHEN EXTRACT(MONTH from date) = 2 THEN 'February'
-- WHEN EXTRACT(MONTH from date) = 3 THEN 'March'
-- WHEN EXTRACT(MONTH from date) = 4 THEN 'April'
-- WHEN EXTRACT(MONTH from date) = 5 THEN 'May'
-- WHEN EXTRACT(MONTH from date) = 6 THEN 'June'
-- WHEN EXTRACT(MONTH from date) = 7 THEN 'July'
-- WHEN EXTRACT(MONTH from date) = 8 THEN 'August'
-- WHEN EXTRACT(MONTH from date) = 9 THEN 'September'
-- WHEN EXTRACT(MONTH from date) = 10 THEN 'October'
-- WHEN EXTRACT(MONTH from date) = 11 THEN 'November'
-- WHEN EXTRACT(MONTH from date) = 12 THEN 'December' end;

                                                   ------------------------------------------

-- SELECT *  FROM wsales;
-- Business Questions To Answer

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------Exploratory Data Analysis (EDA)-------------------------------------------------------------------

--Generic Question

-- How many unique cities does the data have?
-- SELECT COUNT(DISTINCT(city)) AS unique_cities FROM wsales;

-- In which city is each branch?
-- SELECT DISTINCT(city), branch from wsales;

--What is the average cost of goods sold?
SELECT ROUND(AVG(cogs),2) from wsales;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------PRODUCT ANALYTICS (EDA)-------------------------------------------------------------------

-- How many unique product lines does the data have?

-- What is the most common payment method?
SELECT MAX(payment) FROM wsales

                                                  ------------------------------------------

-- What is the most selling product line?
SELECT product_line, sum(quantity) quantity from wsales
GROUP BY product_line order by sum(quantity) DESC LIMIT 1

                                                  ------------------------------------------

-- What is the total revenue by month?
-- What month had the largest COGS?
-- What product line had the largest revenue?
-- What is the city with the largest revenue?
-- What product line had the largest VAT?
-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
-- Which branch sold more products than average product sold?
-- What is the most common product line by gender?
-- What is the average rating of each product line?

