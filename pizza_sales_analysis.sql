-- ================================
--  PIZZA SALES ANALYSIS PROJECT
--  CLEAN SQL QUERIES (FULL SET)
--  Table: pizza_sales$
-- ================================



/*********************************
    KPI QUERIES
*********************************/


-- 1. Total Revenue
SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales$;


-- 2. Average Order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value
FROM pizza_sales$;


-- 3. Total Pizzas Sold
SELECT SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales$;


-- 4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales$;


-- 5. Average Pizzas Per Order
SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS Avg_Pizzas_Per_Order
FROM pizza_sales$;


-- 5B. Average Pizzas Per Order (2 decimals)
SELECT 
    CAST(
        CAST(SUM(quantity) AS DECIMAL(10,2)) 
        / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) 
    AS DECIMAL(10,2)) AS Avg_Pizzas_Per_Order
FROM pizza_sales$;



/*********************************
    DAILY & HOURLY TRENDS
*********************************/


-- 6. Daily Trend for Total Orders
SELECT 
    DATENAME(WEEKDAY, order_date) AS order_day,
    COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales$
GROUP BY DATENAME(WEEKDAY, order_date);



-- 7. Hourly Trend for Total Orders
SELECT 
    DATEPART(HOUR, order_time) AS order_hour,
    COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales$
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time);



/*********************************
    SALES BY CATEGORY
*********************************/


-- 8. Percentage of Sales by Pizza Category
SELECT 
    pizza_category,
    SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales$) AS pct_sales
FROM pizza_sales$
GROUP BY pizza_category;



-- 8B. Percentage + Total Sales
SELECT 
    pizza_category,
    SUM(total_price) AS Total_Sales,
    SUM(total_price) * 100.0 
        / (SELECT SUM(total_price) FROM pizza_sales$) AS pct_sales
FROM pizza_sales$
GROUP BY pizza_category;



-- 8C. Percentage + Total Sales (2 decimals)
SELECT 
    pizza_category,
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales,
    CAST(
        SUM(total_price) * 100.0 
        / (SELECT SUM(total_price) FROM pizza_sales$)
    AS DECIMAL(10,2)) AS pct_sales
FROM pizza_sales$
GROUP BY pizza_category;



/*********************************
    SALES BY SIZE
*********************************/


-- 9. Percentage of Sales by Pizza Size
SELECT 
    pizza_size,
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales,
    CAST(
        SUM(total_price) * 100.0 /
            (SELECT SUM(total_price) FROM pizza_sales$)
    AS DECIMAL(10,2)) AS pct_sales
FROM pizza_sales$
GROUP BY pizza_size;



-- 9B. Percentage by Size for Q1 Only (Descending)
SELECT 
    pizza_size,
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales,
    CAST(
        SUM(total_price) * 100.0 /
            (SELECT SUM(total_price) FROM pizza_sales$
             WHERE DATEPART(QUARTER, order_date) = 1)
    AS DECIMAL(10,2)) AS pct_sales
FROM pizza_sales$
WHERE DATEPART(QUARTER, order_date) = 1
GROUP BY pizza_size
ORDER BY pct_sales DESC;



/*********************************
    SALES BY CATEGORY (QUANTITY)
*********************************/


-- 10. Total Pizzas Sold by Pizza Category
SELECT 
    pizza_category,
    SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales$
GROUP BY pizza_category
ORDER BY Total_Pizzas_Sold DESC;



/*********************************
    BEST SELLERS
*********************************/


-- 11. Top 5 Best-Selling Pizzas (by quantity)
SELECT TOP 5 
    pizza_name,
    SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales$
GROUP BY pizza_name
ORDER BY SUM(quantity) DESC;



/*********************************
    WORST SELLERS
*********************************/


-- 12. Bottom 5 Worst-Selling Pizzas (by quantity)
SELECT TOP 5 
    pizza_name,
    SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales$
GROUP BY pizza_name
ORDER BY SUM(quantity) ASC;



/*********************************
    OPTIONAL FILTER EXAMPLES
*********************************/


-- Filter: Month = January
SELECT 
    DATENAME(WEEKDAY, order_date) AS order_day,
    COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales$
WHERE MONTH(order_date) = 1
GROUP BY DATENAME(WEEKDAY, order_date);



-- Filter: Quarter = Q1
SELECT 
    DATENAME(WEEKDAY, order_date) AS order_day,
    COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales$
WHERE DATEPART(QUARTER, order_date) = 1
GROUP BY DATENAME(WEEKDAY, order_date);
