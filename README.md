# task_09_DA
Sales Trend Analysis Using Aggregations 

# Sales Trend Analysis

## Objective
The objective of this project is to perform a detailed time-based analysis of sales data using SQL aggregation techniques. The goal is to identify trends in monthly revenue and order volume, uncover peak sales periods, and understand customer buying patterns over time.

## Dataset
The dataset used in this analysis contains online sales records with the following fields: https://www.kaggle.com/datasets/shreyanshverma27/online-sales-dataset-popular-marketplace-data
- Transaction ID
- Date
- Product Category
- Product Name
- Units Sold
- Unit Price
- Total Revenue
- Region
- Payment Method
The data covers the year 2024 and includes transactional details across multiple regions and product categories.

## Attached Results Table
As part of this submission, I have attached the **Month-by-Month Sales Trends table**, which is the output of one of the key queries. This table summarizes:
- The total revenue for each month.
- The total units sold for each month.

## Methodology
The analysis was performed using structured SQL queries that:
1. Created and imported the dataset into a MySQL database.
2. Converted the `Date` column from text to `DATE` format for proper time-based analysis.
3. Extracted year and month information using `EXTRACT()` and `DATE_FORMAT()` functions.
4. Aggregated data to calculate:
   - Monthly revenue (`SUM(Total_Revenue)`)
   - Monthly orders (`COUNT(DISTINCT Transaction_ID)`)
   - Month-over-month trends using window functions like `LAG()`
   - Top-performing months by revenue and units sold
   - Average revenue per order
   - Sales by region and product category

## SQL Queries Included
- Create the database and table.
- Import and format data properly.
- Analyze month-by-month trends.
- Perform month-over-month analysis.
- Identify top 3 months by revenue and by units sold.
- Calculate average revenue per order.
- Analyze sales distribution by region and product category.

## Key Insights
1. **Seasonal Trends**  
   Certain months show higher revenue and units sold, indicating seasonal demand and shopping behaviors.

2. **Top Performing Months**  
   The top 3 months by revenue and units sold were identified, providing actionable data for marketing and inventory planning.

3. **Customer Behavior**  
   Analysis of average revenue per order and trends over time gives insights into customer spending patterns.

4. **Regional & Product Trends**  
   Sales distribution by region and product category helps in identifying where and on what customers are spending the most.

## Tools Used
- MySQL for database creation, querying, and data aggregation.
- SQL functions such as `SUM()`, `COUNT()`, `EXTRACT()`, `DATE_FORMAT()`, and `LAG()` to perform advanced analysis.

## Conclusion
This analysis provides a comprehensive view of online sales trends, helping businesses make informed decisions based on customer behavior, seasonal demand, and product performance. The insights derived can support strategic planning and revenue optimization.
