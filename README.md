# Retail-Sales-Sql-Analysis
End-to-end SQL Server project covering CSV ingestion with BULK INSERT, data quality audits (nulls, duplicates, outliers), and business-driven sales analysis using aggregations, window functions, CTEs, and time-based insights.

---

## 📌 Skills Demonstrated
- SQL Server (T-SQL)
- BULK INSERT (CSV ingestion)
- Data Cleaning & Data Quality Audits
- Aggregations, Group By, Sorting
- Window Functions (RANK)
- Date / Time functions (YEAR, MONTH, DATEPART)
- CTEs (Common Table Expressions)
- Business Analytics Thinking

---

## 📂 Dataset
**File:** `Retail Sales Analysis.csv`  
**Main Columns:**
- transactions_id
- sale_date
- sale_time
- customer_id
- gender
- age
- category
- quantiy
- price_per_unit
- cogs
- total_sale

⚠️ Some numeric columns may be stored as `NVARCHAR` when imported from CSV, so casting is applied in analysis.

---

## 🏗️ Project Workflow

### 1) Data Load (Bronze)
- Truncate old data
- Load data using `BULK INSERT`

➡️ Script: `sql/01_load_data_bulk_insert.sql`

---

### 2) Data Quality & Audit Checks
Checks performed:
- Remove rows where critical numeric values are NULL
- Negative / zero value detection
- Duplicate detection by `transactions_id`
- Outlier detection for `age` (< 10 or > 100)
- Dataset profiling (row count, distinct customers, categories)

➡️ Script: `sql/02_data_quality_checks.sql`

---

### 3) Business Analysis Queries
Business questions answered include:
1. Sales made on a specific date
2. Clothing transactions in Nov 2022 with high quantity
3. Total sales and orders per category
4. Average age of customers by category
5. Transactions with total_sale > 1000
6. Transactions by gender and category
7. Best selling month per year (average sales)
8. Top 5 customers by total sales
9. Unique customers per category
10. Order shifts (Morning/Afternoon/Evening) and order counts

➡️ Script: `sql/03_business_analysis_queries.sql`  
➡️ Shift analysis: `sql/04_shift_orders_analysis.sql`

---

## 🧠 Key Insights (Example)
- Identify top categories by revenue and order volume
- Detect data issues early (text-based numeric columns, missing values)
- Discover peak order shifts to support staffing decisions
- Find high-value customers for targeting/retention

(See: `docs/insights_summary.md`)

---

## ▶️ How to Run
1. Create a table named `retail_sales` in SQL Server (schema of your choice).
2. Update the CSV path inside the BULK INSERT script.
3. Run scripts in order:

```sql
sql/01_load_data_bulk_insert.sql
sql/02_data_quality_checks.sql
sql/03_business_analysis_queries.sql
sql/04_shift_orders_analysis.sql
