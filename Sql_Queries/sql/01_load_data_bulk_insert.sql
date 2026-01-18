/* -----------------------------------------------------------
   LOAD DATA USING BULK INSERT (SQL Server)
   ----------------------------------------------------------- */

-- Clear existing data
TRUNCATE TABLE retail_sales;

-- Load CSV file into SQL Server
BULK INSERT retail_sales
FROM 'C:\Users\muhib\OneDrive\Desktop\Datasets\Retail Sales Analysis.csv'
WITH (
    FIRSTROW = 2,             -- Skip header
    FIELDTERMINATOR = ',',    -- CSV delimiter
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- Check the total rows inserted
SELECT COUNT(*) AS total_rows
FROM retail_sales;

-- Preview sample data
SELECT TOP 50 *
FROM retail_sales;
