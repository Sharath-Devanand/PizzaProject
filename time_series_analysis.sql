/*

Time series analysis

*/

CREATE VIEW IF NOT EXISTS PizzaTime AS
SELECT t1.order_id,
        t1.order_date,
        t1.order_time,
        t2.order_detail_id,
        t2.pizza_id,
        t2.quantity,
        t3.size,
        t3.price,
        t4.pizza_name,
        t4.category
FROM Orders t1
LEFT JOIN OrderDetails t2
ON t1.order_id = t2.order_id
LEFT JOIN Pizzas t3
ON t2.pizza_id = t3.pizza_id
LEFT JOIN PizzaTypes t4
ON t3.pizza_type_id = t4.pizza_type_id;

-- Dates with the most sales in comparison with the average orders per day
SELECT order_date,
        COUNT(DISTINCT order_id) AS order_count,
        SUM(quantity) AS pizza_count,
        SUM(quantity*price) AS sales,
        ROUND((SELECT COUNT(DISTINCT order_id) FROM PizzaTime)/(SELECT COUNT(DISTINCT order_date) FROM PizzaTime),1) AS averageOrders
FROM PizzaTime
GROUP BY order_date
ORDER BY order_count DESC
LIMIT 5;

-- Month - Wise orders

SELECT STRFTIME('%m', order_date) AS months,
        COUNT(DISTINCT order_id) as monthwise_orders,
        ROUND(COUNT(DISTINCT order_id)*1.0/(SELECT COUNT(DISTINCT order_id) FROM PizzaTime),2)*100 as avg_month_orders,
        SUM(price*quantity) AS month_sales
FROM PizzaTime
GROUP BY STRFTIME('%m', order_date);

-- Quarter -wise Orders

SELECT 
    CASE 
        WHEN STRFTIME('%m', order_date) IN ('01', '02', '03') THEN 'Q1'
        WHEN STRFTIME('%m', order_date) IN ('04', '05', '06') THEN 'Q2'
        WHEN STRFTIME('%m', order_date) IN ('07', '08', '09') THEN 'Q3'
        WHEN STRFTIME('%m', order_date) IN ('10', '11', '12') THEN 'Q4'
    END AS quarter_order,
    COUNT(DISTINCT order_id) AS quarter_orders,
    SUM(price*quantity) AS quarter_sales
FROM PizzaTime
GROUP BY quarter_order;


-- Hour wise sales

SELECT STRFTIME('%H', order_time) AS hour_sales,
        COUNT(DISTINCT order_id) as hourwise_orders,
        SUM(price*quantity) AS hourwise_sales
FROM PizzaTime
GROUP BY hour_sales;


-- Weekday sales VS Weekend sales

SELECT 
    CASE 
        WHEN STRFTIME('%w', order_date) IN ('1', '2', '3', '4', '5') THEN 'Weekday'
        ELSE 'Weekend'
    END AS day_type,
    COUNT(order_id) AS order_count,
    SUM(price*quantity) AS week_sales,
    ROUND(SUM(price*quantity)/ (SELECT SUM(price*quantity) FROM PizzaTime)*100,2) AS percentage_sales
FROM PizzaTime
GROUP BY day_type;


-- Peak hours vs Off-peak hours comparison
SELECT 
    CASE 
        WHEN STRFTIME('%H', order_time) IN ('16', '17', '18', '19', '20') THEN 'Peak-hours'
        ELSE 'Off-peak hours'
    END AS day_type,
    COUNT(order_id) AS order_count,
    SUM(price*quantity) AS time_sales,
    ROUND(SUM(price*quantity)/ (SELECT SUM(price*quantity) FROM PizzaTime)*100,2) AS percentage_sales
FROM PizzaTime
GROUP BY day_type;