-- Retrieve all data
SELECT *
FROM [Dataset for Data Analytics]


-- Filter specific records
SELECT *
FROM [Dataset for Data Analytics]
WHERE TotalPrice> 1500;


-- Find the top-selling product based on total physical units sold
-- Note: CAST is used because the quantity column is formatted as text (nvarchar)
SELECT TOP 1
    product,
    COUNT(orderid) AS total_orders_placed,
    SUM(CAST(quantity AS INT)) AS total_units_sold
FROM 
    [Dataset for Data Analytics]
GROUP BY 
    product
ORDER BY 
    total_units_sold DESC;

--Payment methods
SELECT DISTINCT 
    paymentmethod
FROM 
    [Dataset for Data Analytics];


-- Identify the single most popular payment method by transaction volume
SELECT TOP 1
    paymentmethod,
    COUNT(orderid) AS total_transactions
FROM 
    [Dataset for Data Analytics]
GROUP BY 
    paymentmethod
ORDER BY 
    total_transactions DESC;


-- Calculate the total gross revenue across all historical sales
SELECT 
    SUM(totalprice) AS total_revenue
FROM 
    [Dataset for Data Analytics];

-- Calculate the total gross revenue across all historical sales
SELECT 
    SUM(CAST(totalprice AS DECIMAL(18,2))) AS total_revenue
FROM 
    [Dataset for Data Analytics];

-- Find the top 5 customers by total historical spend
SELECT TOP 5
    customerid,
    COUNT(orderid) AS total_orders_placed,
    SUM(CAST(totalprice AS DECIMAL(18,2))) AS lifetime_value
FROM 
    [Dataset for Data Analytics]
GROUP BY 
    customerid
ORDER BY 
    lifetime_value DESC;


-- Calculate the average amount spent per order across the whole store
SELECT 
    AVG(CAST(totalprice AS DECIMAL(18,2))) AS average_order_value
FROM 
    [Dataset for Data Analytics];


-- Find the average unit price for each product
SELECT 
    product,
    AVG(CAST(unitprice AS DECIMAL(18,2))) AS average_item_price,
    SUM(CAST(quantity AS INT)) AS total_units_sold
FROM 
    [Dataset for Data Analytics]
GROUP BY 
    product
ORDER BY 
    average_item_price DESC;


-- Rank all products by their total revenue contribution
SELECT 
    product,
    SUM(CAST(totalprice AS DECIMAL(18,2))) AS total_product_revenue
FROM 
    [Dataset for Data Analytics]
GROUP BY 
    product
ORDER BY 
    total_product_revenue DESC;


-- Rank marketing referral sources by the total revenue they generated
SELECT 
    referralsource,
    COUNT(orderid) AS total_orders,
    SUM(CAST(totalprice AS DECIMAL(18,2))) AS total_revenue
FROM 
    [Dataset for Data Analytics]
GROUP BY 
    referralsource
ORDER BY 
    total_revenue DESC;


-- Find the top 5 most successful coupon codes by total revenue
SELECT TOP 5
    couponcode,
    COUNT(orderid) AS times_used,
    SUM(CAST(totalprice AS DECIMAL(18,2))) AS revenue_generated
FROM 
    [Dataset for Data Analytics]
WHERE 
    couponcode IS NOT NULL
GROUP BY 
    couponcode
ORDER BY 
    revenue_generated DESC;


-- Track total sales revenue broken down by year and month
SELECT 
    YEAR(date) AS sales_year,
    MONTH(date) AS sales_month,
    COUNT(orderid) AS total_orders,
    SUM(CAST(totalprice AS DECIMAL(18,2))) AS monthly_revenue
FROM 
    [Dataset for Data Analytics]
GROUP BY 
    YEAR(date), 
    MONTH(date)
ORDER BY 
    sales_year DESC, 
    sales_month DESC;


-- Break down total orders and revenue by their current operational status
SELECT 
    orderstatus,
    COUNT(orderid) AS order_count,
    SUM(CAST(totalprice AS DECIMAL(18,2))) AS gross_amount
FROM 
    [Dataset for Data Analytics]
GROUP BY 
    orderstatus
ORDER BY 
    order_count DESC;




