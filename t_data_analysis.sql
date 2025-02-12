-- ==============================
--  E-Commerce (Target) Sales
-- ==============================


-- ==============================
-- Objective: Increase Revenue (T)
-- ==============================


-- a. Total Revenue between 2017 and 2018 -- t
SELECT FORMAT(SUM(p.payment_value), 2) AS TotalRevenue
FROM payments AS p
JOIN orders o ON p.order_id = o.order_id
WHERE YEAR(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i')) Between 2017 AND 2018;


-- b. Total Sales by Product Category
SELECT pd.product_category, 
       ROUND(SUM(p.payment_value), 2) AS total_sales
FROM products AS pd
JOIN order_items AS ot ON pd.product_id = ot.product_id
JOIN payments AS p ON ot.order_id = p.order_id
JOIN orders as o ON p.order_id = o.order_id
WHERE YEAR(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i')) Between 2017 AND 2018
GROUP BY pd.product_category
ORDER BY total_sales DESC;


-- c. Total Sales by Year and Month (for Growth Rate Calculation) -- t
SELECT DATE_FORMAT(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i'), '%Y-%m') AS month,
       ROUND(SUM(p.payment_value), 2) AS total_sales
FROM orders AS o
JOIN payments AS p ON o.order_id = p.order_id
    WHERE YEAR(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i')) Between 2017 AND 2018
GROUP BY month
ORDER BY month;


-- d. Average Order Value (AOV) --
SELECT ROUND(SUM(p.payment_value) / COUNT(DISTINCT o.order_id), 2) AS average_order_value
FROM orders AS o
JOIN payments AS p ON o.order_id = p.order_id
WHERE YEAR(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i')) Between 2017 AND 2018;


-- f. Sales Growth Rate -- T
WITH MonthlySales AS (
    SELECT 
        DATE_FORMAT(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i'), '%Y-%m') AS month,
        ROUND(SUM(p.payment_value), 2) AS total_sales
    FROM orders AS o
    JOIN payments AS p ON o.order_id = p.order_id
    WHERE YEAR(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i')) Between 2017 AND 2018
    GROUP BY month
    ORDER BY month
),
SalesGrowth AS (
    SELECT 
        month,
        total_sales,
        LAG(total_sales, 1) OVER (ORDER BY month) AS previous_month_sales,
        ROUND(((total_sales - LAG(total_sales, 1) OVER (ORDER BY month)) / LAG(total_sales, 1) OVER (ORDER BY month)) * 100, 2) AS growth_rate
    FROM MonthlySales
)
SELECT * 
FROM SalesGrowth
ORDER BY month;


-- ==============================
-- Objective: Optimize Product Performance (T)
-- ==============================


-- Top 5 High-Selling Categories T
WITH CategorySales AS (
    SELECT 
        pd.product_category, 
        ROUND(SUM(p.payment_value), 2) AS total_sales 
    FROM products AS pd
    JOIN order_items AS oi ON pd.product_id = oi.product_id
    JOIN payments AS p ON oi.order_id = p.order_id
    JOIN orders o ON p.order_id = o.order_id
    WHERE YEAR(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i')) Between 2017 AND 2018
    GROUP BY pd.product_category  
)

SELECT 
    product_category, 
    total_sales
FROM CategorySales
ORDER BY total_sales DESC  
LIMIT 5;


--  Top 5 Low-Selling Categories T
WITH CategorySales AS (
    SELECT 
        pd.product_category,  
        ROUND(SUM(p.payment_value), 2) AS total_sales  
    FROM products AS pd
    JOIN order_items AS oi ON pd.product_id = oi.product_id
    JOIN payments AS p ON oi.order_id = p.order_id
     JOIN orders o ON p.order_id = o.order_id
    WHERE YEAR(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i')) Between 2017 AND 2018
    GROUP BY pd.product_category 
)
SELECT 
    product_category, 
    total_sales
FROM CategorySales
ORDER BY total_sales ASC 
LIMIT 5;


-- d.  Product Sales Volume by Category
SELECT 
    pd.product_category,  
    COUNT(oi.order_item_id) AS product_sales_volume  
FROM products AS pd
JOIN order_items AS oi ON pd.product_id = oi.product_id  
JOIN orders o ON oi.order_id = o.order_id
WHERE YEAR(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i')) Between 2017 AND 2018
GROUP BY pd.product_category  
ORDER BY product_sales_volume DESC;  


-- Sales Trends
SELECT DATE_FORMAT(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i'), '%Y-%m') AS month,
    Round(SUM(p.payment_value), 2) AS total_revenue,            
    COUNT(DISTINCT o.order_id) AS total_orders,                 
    ROUND(SUM(p.payment_value) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value              
FROM orders o
JOIN payments p ON o.order_id = p.order_id
-- JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'delivered' AND
	YEAR(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i')) Between 2017 AND 2018
GROUP BY DATE_FORMAT(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i'), '%Y-%m')          
ORDER BY month;



-- ==============================
-- Objective: Enhance Operational Efficiency (T)
-- ==============================


-- a. Average Delivery Time -- t
SELECT ROUND(AVG(DATEDIFF(
    STR_TO_DATE(o.order_delivered_customer_date, '%m/%d/%y %H:%i'),
    STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i')
))) AS avg_delivery_time_in_days
FROM orders AS o
WHERE STR_TO_DATE(o.order_delivered_customer_date, '%m/%d/%y %H:%i') IS NOT NULL
  AND STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i') IS NOT NULL;


-- b. On-Time Delivery Rate -- 
SELECT 
    COUNT(CASE WHEN STR_TO_DATE(o.order_delivered_customer_date, '%m/%d/%y %H:%i') <= STR_TO_DATE(o.order_estimated_delivery_date, '%m/%d/%y %H:%i') THEN 1 END) AS on_time_deliveries,  -- Count on-time deliveries
    COUNT(CASE WHEN o.order_status = 'delivered' THEN 1 END) AS total_delivered_orders, 
    ROUND(
        (COUNT(CASE WHEN STR_TO_DATE(o.order_delivered_customer_date, '%m/%d/%y %H:%i') <= STR_TO_DATE(o.order_estimated_delivery_date, '%m/%d/%y %H:%i') THEN 1 END) / 
        COUNT(CASE WHEN o.order_status = 'delivered' THEN 1 END)) * 100, 2
    ) AS on_time_delivery_rate 
FROM orders AS o
WHERE o.order_status = 'delivered'; 


-- c. Calculate On-Time Delivery Rate by Month
SELECT 
    DATE_FORMAT(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i'), '%Y-%m') AS order_month,  
    COUNT(CASE WHEN STR_TO_DATE(o.order_delivered_customer_date, '%m/%d/%y %H:%i') <= STR_TO_DATE(o.order_estimated_delivery_date, '%m/%d/%y %H:%i') THEN 1 END) AS on_time_deliveries,  -- Count on-time deliveries
    COUNT(CASE WHEN o.order_status = 'delivered' THEN 1 END) AS total_delivered_orders,  
    ROUND(
        (COUNT(CASE WHEN STR_TO_DATE(o.order_delivered_customer_date, '%m/%d/%y %H:%i') <= STR_TO_DATE(o.order_estimated_delivery_date, '%m/%d/%y %H:%i') THEN 1 END) / 
        COUNT(CASE WHEN o.order_status = 'delivered' THEN 1 END)) * 100, 2
    ) AS on_time_delivery_rate  
FROM orders AS o
WHERE o.order_status = 'delivered'  
GROUP BY order_month 
ORDER BY order_month;


-- d. Overall Average Shipping Cost per Order
SELECT 
    ROUND(AVG(order_shipping_cost), 2) AS average_shipping_cost_per_order  
FROM (
    SELECT 
        oi.order_id, 
        SUM(oi.freight_value) AS order_shipping_cost  
    FROM order_items AS oi
    GROUP BY oi.order_id  
) AS order_totals;


-- e. Calculate Average Shipping Cost by Month
SELECT 
    DATE_FORMAT(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i'), '%Y-%m') AS order_month,  
    ROUND(AVG(oi.freight_value), 2) AS average_shipping_cost  
FROM orders AS o
JOIN order_items AS oi ON o.order_id = oi.order_id  
GROUP BY order_month  
ORDER BY order_month;  


-- f. Average Cancel Rate
SELECT 
    COUNT(CASE WHEN o.order_status = 'canceled' THEN 1 END) AS canceled_orders,  
    COUNT(*) AS total_orders,  
    ROUND(
        (COUNT(CASE WHEN o.order_status = 'canceled' THEN 1 END) / COUNT(*)) * 100, 
        2
    ) AS cancel_rate_percentage  
FROM orders AS o;



-- ==============================
-- Objective: Geographical and Market Segmentation (T)
-- ==============================


-- a. Total Sales by State --
SELECT c.customer_city,
       ROUND(SUM(p.payment_value), 2) AS total_sales
FROM customers AS c
JOIN orders AS o ON o.customer_id = c.customer_id
JOIN payments AS p ON o.order_id = p.order_id
WHERE YEAR(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i')) Between 2017 AND 2018
GROUP BY c.customer_city
ORDER BY total_sales DESC;


-- b. Customer Distribution by City
SELECT 
    customer_city, 
    COUNT(customer_id) AS customer_count  
FROM customers
GROUP BY customer_city 
ORDER BY customer_count DESC;  


SELECT
	DATE_FORMAT(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i'), '%Y-%m') AS order_month,   
	ROUND(SUM(p.payment_value) / COUNT(DISTINCT o.order_id), 2) AS aov,
    ROUND(AVG(oi.freight_value), 2) AS average_shipping_cost  
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN payments p ON o.order_id = p.order_id
WHERE o.order_status = 'delivered'  AND
	YEAR(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i')) Between 2017 AND 2018
GROUP BY order_month
ORDER BY order_month;



-- ==============================
-- 2017 Performance
-- ==============================




-- Total Revenve
SELECT FORMAT(SUM(p.payment_value), 2) AS TotalRevenue
FROM payments AS p
JOIN orders o ON p.order_id = o.order_id
WHERE STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i') 
        BETWEEN '2017-01-01 00:00:00' AND '2017-12-31 23:59:59';

-- Total Orders
SELECT FORMAT(COUNT(o.order_id), 0) AS TotalOrders
FROM orders AS o
WHERE STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i') 
        BETWEEN '2017-01-01 00:00:00' AND '2017-12-31 23:59:59';
        
-- Average Order Value (AOV)
SELECT ROUND(SUM(p.payment_value) / COUNT(DISTINCT o.order_id), 2) AS average_order_value
FROM orders AS o
JOIN payments AS p ON o.order_id = p.order_id
WHERE YEAR(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i')) Between '2017-01-01 00:00:00' AND '2017-12-31 23:59:59';



-- f. Sales Growth Rate
WITH MonthlySales AS (
    SELECT 
        DATE_FORMAT(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i'), '%Y-%m') AS month,
        ROUND(SUM(p.payment_value), 2) AS total_sales
    FROM orders AS o
    JOIN payments AS p ON o.order_id = p.order_id
    WHERE STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i') 
        BETWEEN '2017-01-01 00:00:00' AND '2017-12-31 23:59:59'
    GROUP BY month
    ORDER BY month
),
SalesGrowth AS (
    SELECT 
        month,
        total_sales,
        LAG(total_sales, 1) OVER (ORDER BY month) AS previous_month_sales,
        -- Format growth_rate to have no decimals
        ROUND(((total_sales - LAG(total_sales, 1) OVER (ORDER BY month)) / 
              LAG(total_sales, 1) OVER (ORDER BY month)) * 100, 0) AS growth_rate
    FROM MonthlySales
)
SELECT * 
FROM SalesGrowth
ORDER BY month;



-- Sales Trends
SELECT DATE_FORMAT(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i'), '%Y-%m') AS month,
    Round(SUM(p.payment_value), 2) AS total_revenue,            
    COUNT(DISTINCT o.order_id) AS total_orders,                 
    ROUND(SUM(p.payment_value) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value              
FROM orders o
JOIN payments p ON o.order_id = p.order_id
WHERE o.order_status = 'delivered' AND
	YEAR(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i')) Between '2017-01-01 00:00:00' AND '2017-12-31 23:59:59'
GROUP BY DATE_FORMAT(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i'), '%Y-%m')          
ORDER BY month;

WITH YearlySales AS (
    SELECT 
        DATE_FORMAT(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i'), '%Y-%m') AS month,
        SUM(p.payment_value) AS total_sales
    FROM 
        orders AS o
    JOIN 
        payments AS p ON o.order_id = p.order_id
    WHERE 
        STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i') 
        BETWEEN '2017-01-01 00:00:00' AND '2017-12-31 23:59:59'
    GROUP BY 
        month
    ORDER BY 
        month
)
SELECT 
    FORMAT(((MAX(total_sales) - MIN(total_sales)) / MIN(total_sales)) * 100, 2) AS total_growth_rate
FROM 
    YearlySales;

-- Top 5 High-Selling Categories T
WITH CategorySales AS (
    SELECT 
        pd.product_category, 
        ROUND(SUM(p.payment_value), 2) AS total_sales 
    FROM products AS pd
    JOIN order_items AS oi ON pd.product_id = oi.product_id
    JOIN payments AS p ON oi.order_id = p.order_id
    JOIN orders o ON p.order_id = o.order_id
    WHERE YEAR(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i')) Between '2017-01-01 00:00:00' AND '2017-12-31 23:59:59'
    GROUP BY pd.product_category  
)

SELECT 
    product_category, 
    total_sales
FROM CategorySales
ORDER BY total_sales DESC  
LIMIT 5;


--  Top 5 Low-Selling Categories T
WITH CategorySales AS (
    SELECT 
        pd.product_category,  
        ROUND(SUM(p.payment_value), 2) AS total_sales  
    FROM products AS pd
    JOIN order_items AS oi ON pd.product_id = oi.product_id
    JOIN payments AS p ON oi.order_id = p.order_id
     JOIN orders o ON p.order_id = o.order_id
    WHERE YEAR(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i')) Between '2017-01-01 00:00:00' AND '2017-12-31 23:59:59'
    GROUP BY pd.product_category 
)
SELECT 
    product_category, 
    total_sales
FROM CategorySales
ORDER BY total_sales ASC 
LIMIT 5;



Select * 
FROM performance_2017;
