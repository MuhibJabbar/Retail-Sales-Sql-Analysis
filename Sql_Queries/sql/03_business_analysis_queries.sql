/* -----------------------------------------------------------
   BUSINESS ANALYSIS QUERIES
   ----------------------------------------------------------- */

--------------------------------------------------------------
-- 1. Retrieve all sales made on a specific date
--------------------------------------------------------------
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';

--------------------------------------------------------------
-- 2. Clothing transactions in Nov 2022 with quantity >= 4
--------------------------------------------------------------
SELECT *
FROM retail_sales
WHERE category = 'clothing'
  AND sale_date BETWEEN '2022-11-01' AND '2022-11-30'
  AND quantiy >= 4
ORDER BY transactions_id;

--------------------------------------------------------------
-- 3. Total Sales & Orders per Category
--------------------------------------------------------------
SELECT 
    category,
    SUM(CAST(total_sale AS INT)) AS category_sales,
    COUNT(*) AS category_orders
FROM retail_sales
GROUP BY category;

--------------------------------------------------------------
-- 4. Average Age of Customers per Category
--------------------------------------------------------------
SELECT 
    category,
    ROUND(AVG(CAST(age AS FLOAT)), 2) AS avg_age
FROM retail_sales
GROUP BY category;

--------------------------------------------------------------
-- 5. Transactions with Total Sale > 1000
--------------------------------------------------------------
SELECT *
FROM retail_sales
WHERE total_sale > 1000;

--------------------------------------------------------------
-- 6. Number of Transactions by Gender per Category
--------------------------------------------------------------
SELECT
    gender,
    category,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY gender, category
ORDER BY category;

--------------------------------------------------------------
-- 7. Best Selling Month (by avg_sales) Per Year
--------------------------------------------------------------
SELECT *
FROM (
    SELECT
        YEAR(sale_date) AS year,
        MONTH(sale_date) AS month,
        ROUND(AVG(CAST(total_sale AS FLOAT)), 2) AS avg_sales,
        RANK() OVER (
            PARTITION BY YEAR(sale_date)
            ORDER BY ROUND(AVG(CAST(total_sale AS FLOAT)), 2) DESC
        ) AS best_sales_month
    FROM retail_sales
    GROUP BY YEAR(sale_date), MONTH(sale_date)
) t
WHERE best_sales_month = 1;

--------------------------------------------------------------
-- 8. Top 5 Customers by Total Sales
--------------------------------------------------------------
SELECT *
FROM (
    SELECT
        customer_id,
        sales_by_customers,
        RANK() OVER (ORDER BY sales_by_customers DESC) AS sales_rank
    FROM (
        SELECT 
            customer_id,
            SUM(CAST(total_sale AS DECIMAL(18,2))) AS sales_by_customers
        FROM retail_sales
        GROUP BY customer_id
    ) s
) ranked
WHERE sales_rank <= 5;

--------------------------------------------------------------
-- 9. Unique Customers Per Category
--------------------------------------------------------------
SELECT
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;

