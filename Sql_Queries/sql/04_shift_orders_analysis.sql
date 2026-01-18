/* -----------------------------------------------------------
   SHIFT-BASED SALES ANALYSIS
   ----------------------------------------------------------- */

WITH hourly_sale AS (
    SELECT *,
        CASE
            WHEN DATEPART(HOUR, sale_time) <= 12 THEN 'Morning'
            WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS order_shift
    FROM retail_sales
)

SELECT 
    order_shift,
    COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY order_shift
ORDER BY total_orders DESC;
