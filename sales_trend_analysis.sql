CREATE DATABASE Sales;
USE Sales;


-- Creating table and then importing the dataset into it with the help of Table Data Import Wizard
CREATE TABLE online_sales (
	Transaction_ID INT,
    Date TEXT,
    Product_Category TEXT,
    Product_Name TEXT,
    Units_Sold INT,
    Unit_Price DOUBLE,
    Total_Revenue DOUBLE,
    Region TEXT,
    Payment_Method TEXT
);


-- printing all columns
SELECT * FROM online_sales;


-- checking current type of columns
DESCRIBE online_sales;


-- changing the datatype of date column from text to DATE
ALTER TABLE online_sales
MODIFY COLUMN Date Date;


-- month-by-month performance.
SELECT
    EXTRACT(YEAR FROM Date) AS year_,
    EXTRACT(MONTH FROM Date) AS month_,
    SUM(Total_Revenue) AS total_revenue,
    COUNT(DISTINCT Transaction_ID) AS total_orders
FROM online_sales
GROUP BY year_, month_
ORDER BY year_, month_;


-- analysing month-over-month trends
WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(Date, '%Y-%m') AS year_month_,
        SUM(Total_Revenue) AS total_revenue,
        SUM(Units_Sold) AS total_units_sold
    FROM online_sales
    GROUP BY year_month_
)
SELECT
    year_month_,
    total_revenue,
    total_units_sold,
    LAG(total_revenue) OVER (ORDER BY year_month_) AS prev_month_revenue,
    LAG(total_units_sold) OVER (ORDER BY year_month_) AS prev_month_units
FROM monthly_sales
ORDER BY year_month_;


-- Top 3 months by revenue
SELECT
    DATE_FORMAT(Date, '%Y-%m') AS year_month_,
    SUM(Total_Revenue) AS total_revenue
FROM online_sales
GROUP BY year_month_
ORDER BY total_revenue DESC
LIMIT 3;


-- Top 3 months by units sold
SELECT
    DATE_FORMAT(Date, '%Y-%m') AS year_month_,
    SUM(Units_Sold) AS total_units_sold
FROM online_sales
GROUP BY year_month_
ORDER BY total_units_sold DESC
LIMIT 3;


-- Average revenue per order
SELECT
    DATE_FORMAT(Date, '%Y-%m') AS year_month_,
    SUM(Total_Revenue) / COUNT(DISTINCT Transaction_ID) AS avg_revenue_per_order
FROM online_sales
GROUP BY year_month_
ORDER BY year_month_;


-- Revenue by Region
SELECT
	Region,
    SUM(Units_Sold) AS total_units_sold,
    SUM(Total_Revenue) AS total_revenue
FROM online_sales
GROUP BY Region
ORDER BY total_revenue DESC;


-- sales according to product category in different region
SELECT
	Region, Product_Category,
    SUM(Units_Sold) AS total_units_sold,
    SUM(Total_Revenue) AS total_revenue
FROM online_sales
GROUP BY Product_Category, Region
ORDER BY total_revenue DESC;


-- Revenue by Product Category
SELECT
	Product_Category,
    SUM(Units_Sold) AS total_units_sold,
    SUM(Total_Revenue) AS total_revenue
FROM online_sales
GROUP BY Product_category
ORDER BY total_revenue DESC;
