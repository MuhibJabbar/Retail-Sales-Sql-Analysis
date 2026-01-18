/* -----------------------------------------------------------
   DATA QUALITY CHECKS & CLEANING
   ----------------------------------------------------------- */

--------------------------------------------------------------
-- Remove rows with NULL values in key numeric columns
--------------------------------------------------------------
DELETE FROM retail_sales
WHERE price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

--------------------------------------------------------------
-- Negative / Zero Value Checks
--------------------------------------------------------------
SELECT *
FROM retail_sales
WHERE price_per_unit < 0
   OR quantiy < 0
   OR total_sale < 0;

--------------------------------------------------------------
-- Duplicate Transaction ID Check
--------------------------------------------------------------
SELECT 
    transactions_id,
    COUNT(*) AS duplicate_count
FROM retail_sales
GROUP BY transactions_id
HAVING COUNT(*) > 1;

--------------------------------------------------------------
-- Outlier Age Detection (<10 or >100)
--------------------------------------------------------------
SELECT *
FROM retail_sales
WHERE age < 10 
   OR age > 100;

--------------------------------------------------------------
-- Total Unique Customers
--------------------------------------------------------------
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers
FROM retail_sales;

--------------------------------------------------------------
-- Distinct Categories
--------------------------------------------------------------
SELECT DISTINCT 
    category
FROM retail_sales;

