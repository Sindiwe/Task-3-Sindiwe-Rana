# Task 3

## Project Overview

This project was completed as part of a data analytics internship to demonstrate foundational SQL skills in querying, filtering, grouping, and analyzing data. The goal of the project was to extract meaningful business insights from a sales dataset using SQL queries.

The analysis focused on customer purchasing behavior, product performance, revenue generation, payment methods, referral sources, coupon usage, and sales trends over time.

## Project Goal
Use SQL queries to extract insights from a dataset and support business decision-making through data analysis.

### Key Requirements
Write SELECT queries
Use WHERE, ORDER BY, and GROUP BY
Perform aggregations using:
COUNT()
SUM()
AVG()

### Key Skills Demonstrated
SQL Fundamentals
Data Querying
Data Filtering
Data Grouping
Aggregation Functions
Business Data Analysis
Sales & Revenue Analysis

### The dataset contains transactional sales information including:

Order IDs
Customer IDs
Product names
Quantity sold
Unit price
Total price
Payment methods
Coupon codes
Referral sources
Order status
Sales dates

### SQL Queries & Analysis

1. Retrieve All Data
Used to display all records from the dataset.

SELECT *
FROM [Dataset for Data Analytics]
2. Filter High-Value Transactions
Retrieved records where total sales exceeded 1500.

SELECT *
FROM [Dataset for Data Analytics]
WHERE TotalPrice > 1500;

3. Top-Selling Product
Identified the product with the highest total units sold.

SELECT TOP 1
    product,
    COUNT(orderid) AS total_orders_placed,
    SUM(CAST(quantity AS INT)) AS total_units_sold
FROM [Dataset for Data Analytics]
GROUP BY product
ORDER BY total_units_sold DESC;

4. Payment Methods Used
Displayed all unique payment methods.

SELECT DISTINCT paymentmethod
FROM [Dataset for Data Analytics];

5. Most Popular Payment Method
Identified the payment method with the highest transaction volume.

SELECT TOP 1
    paymentmethod,
    COUNT(orderid) AS total_transactions
FROM [Dataset for Data Analytics]
GROUP BY paymentmethod
ORDER BY total_transactions DESC;

6. Total Revenue Generated
Calculated overall revenue from all sales.

SELECT 
    SUM(CAST(totalprice AS DECIMAL(18,2))) AS total_revenue
FROM [Dataset for Data Analytics];

7. Top 5 Customers by Spending
Ranked customers based on their total historical spending.

SELECT TOP 5
    customerid,
    COUNT(orderid) AS total_orders_placed,
    SUM(CAST(totalprice AS DECIMAL(18,2))) AS lifetime_value
FROM [Dataset for Data Analytics]
GROUP BY customerid
ORDER BY lifetime_value DESC;

8. Average Order Value
Calculated the average amount spent per order.

SELECT 
    AVG(CAST(totalprice AS DECIMAL(18,2))) AS average_order_value
FROM [Dataset for Data Analytics];

9. Average Product Price
Calculated the average unit price for each product.

SELECT 
    product,
    AVG(CAST(unitprice AS DECIMAL(18,2))) AS average_item_price,
    SUM(CAST(quantity AS INT)) AS total_units_sold
FROM [Dataset for Data Analytics]
GROUP BY product
ORDER BY average_item_price DESC;

10. Product Revenue Ranking
Ranked products based on total revenue contribution.

SELECT 
    product,
    SUM(CAST(totalprice AS DECIMAL(18,2))) AS total_product_revenue
FROM [Dataset for Data Analytics]
GROUP BY product
ORDER BY total_product_revenue DESC;

11. Referral Source Performance
Analyzed which marketing referral sources generated the most revenue.

SELECT 
    referralsource,
    COUNT(orderid) AS total_orders,
    SUM(CAST(totalprice AS DECIMAL(18,2))) AS total_revenue
FROM [Dataset for Data Analytics]
GROUP BY referralsource
ORDER BY total_revenue DESC;

12. Top Coupon Codes
Identified the most successful coupon codes by revenue generated.

SELECT TOP 5
    couponcode,
    COUNT(orderid) AS times_used,
    SUM(CAST(totalprice AS DECIMAL(18,2))) AS revenue_generated
FROM [Dataset for Data Analytics]
WHERE couponcode IS NOT NULL
GROUP BY couponcode
ORDER BY revenue_generated DESC;

13. Monthly Revenue Trends
Tracked sales performance by year and month.

SELECT 
    YEAR(date) AS sales_year,
    MONTH(date) AS sales_month,
    COUNT(orderid) AS total_orders,
    SUM(CAST(totalprice AS DECIMAL(18,2))) AS monthly_revenue
FROM [Dataset for Data Analytics]
GROUP BY YEAR(date), MONTH(date)
ORDER BY sales_year DESC, sales_month DESC;

14. Order Status Analysis
Analyzed total orders and revenue by operational status.

SELECT 
    orderstatus,
    COUNT(orderid) AS order_count,
    SUM(CAST(totalprice AS DECIMAL(18,2))) AS gross_amount
FROM [Dataset for Data Analytics]
GROUP BY orderstatus
ORDER BY order_count DESC;

### Key Insights
Identified the highest-performing products based on units sold and revenue.
Determined the most frequently used payment method.
Analyzed customer spending behavior and top customers.
Evaluated marketing channel performance through referral sources.
Monitored monthly sales trends and operational order statuses.
Assessed coupon effectiveness in driving revenue.

### Tool Used
SQL Server Management Studio (SSMS)

### Conclusion
This project demonstrates practical SQL skills used in real-world business analytics. Through data querying, filtering, grouping, and aggregation, valuable insights were extracted to support data-driven decision-making.
