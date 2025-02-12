-- ====================================================
--   Target Sales Data Analysis 
-- ====================================================


-- ==============================
-- SECTION 1: DATA VALIDATION and CLEANING
-- ==============================

-- Checking for Duplicate Records

Select customer_id, customer_unique_id, Count(*)
From customers
Group By customer_id, customer_unique_id
Having Count(*) > 1
;

-- Checking Foreign Keys
Select c.customer_id, o.order_id
From customers AS c
Left join orders AS o ON c.customer_id = o.customer_id
Where o.customer_id is NULL
;

Select  ot.order_id
From order_items AS ot
Left join orders AS o ON o.order_id = ot.order_id
Where o.order_id is NULL
;

Select  p.order_id
From payments AS p
Left join orders AS o ON o.order_id = p.order_id
Where o.order_id is NULL
;

-- Validate price

Select *
From order_items
Where price <= 0
;

Select *
From payments
Where payment_value <= 0
;

DELIMITER $$

CREATE PROCEDURE CapitalizeCustomerCity()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE city_id VARCHAR(35);
  DECLARE city_name VARCHAR(255);
  
  -- Cursor for selecting customer_id and customer_city
  DECLARE city_cursor CURSOR FOR SELECT customer_id, customer_city FROM customers;
  
  -- Handler to exit loop when no more rows are found
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  -- Open the cursor to start fetching data
  OPEN city_cursor;

  -- Loop through each row
  city_loop: LOOP
    FETCH city_cursor INTO city_id, city_name;
    IF done THEN
      LEAVE city_loop;
    END IF;

    -- Capitalize the first letter of each word in the city_name
    SET city_name = CONCAT(UCASE(LEFT(city_name, 1)), LCASE(SUBSTRING(city_name, 2)));
    
    -- Update the city name in the table
    UPDATE customers 
    SET customer_city = city_name 
    WHERE customer_id = city_id;
  END LOOP;

  -- Close the cursor after processing all rows
  CLOSE city_cursor;
END $$

DELIMITER ;

CALL CapitalizeCustomerCity();

ALTER TABLE products
RENAME COLUMN `product category`TO product_category;

-- Update `order_purchase_timestamp` to be in 'MM/DD/YY HH:MM' format
UPDATE orders
SET order_purchase_timestamp = DATE_FORMAT(order_purchase_timestamp, '%m/%d/%y %H:%i');

UPDATE orders
SET order_approved_at = DATE_FORMAT(order_approved_at, '%m/%d/%y %H:%i');


CREATE TABLE performance_2017 (
    month VARCHAR(7),               
    total_sales DOUBLE,             
    total_orders BIGINT,           
    avg_order_value DOUBLE,         
    product_category TEXT,          
    category_sales DOUBLE           
);


INSERT INTO performance_2017 (month, total_sales, total_orders, avg_order_value)
SELECT 
    DATE_FORMAT(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i'), '%Y-%m') AS month,
    ROUND(SUM(p.payment_value), 2) AS total_sales,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(p.payment_value) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM 
    orders AS o
JOIN 
    payments AS p ON o.order_id = p.order_id
WHERE 
    STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i') 
    BETWEEN '2017-01-01 00:00:00' AND '2017-12-31 23:59:59'
    AND o.order_status = 'delivered'
GROUP BY 
    DATE_FORMAT(STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i'), '%Y-%m');


INSERT INTO performance_2017 (product_category, category_sales)
SELECT 
    pd.product_category,
    ROUND(SUM(p.payment_value), 2) AS category_sales
FROM 
    orders AS o
JOIN 
    payments AS p ON o.order_id = p.order_id
JOIN 
    order_items AS oi ON o.order_id = oi.order_id
JOIN 
    products AS pd ON oi.product_id = pd.product_id
WHERE 
    STR_TO_DATE(o.order_purchase_timestamp, '%m/%d/%y %H:%i') 
    BETWEEN '2017-01-01 00:00:00' AND '2017-12-31 23:59:59'
    AND o.order_status = 'delivered'
GROUP BY 
    pd.product_category;

Select * 
FROM performance_2017;







