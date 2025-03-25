/*

A detailed SQL analysis is performed to understand and solve the following questions regarding the Pizza sales. A subset of the questions where derived from externall
LLMs, while the rest of the questions were personally designed.

Objective - I work for the Pizza place as a Data Analyst and the goal is present actionable insights from the dataset. My focus are on insights related to a. Revenue
b. Menu Optimisation and c. Logistics Management

*/

--- Exploration to understand the demographics

-- PizzaTypes Table
SELECT COUNT(DISTINCT(pizza_name)) AS DistinctPizzaCount
FROM PizzaTypes;


SELECT DISTINCT(category) AS Categories
FROM PizzaTypes;

SELECT category, COUNT(DISTINCT pizza_name) AS category_wise_pizza_count
FROM PizzaTypes
GROUP BY category;


--- Pizza Table

SELECT DISTINCT(size) AS differentSizes
FROM Pizzas;


SELECT COUNT(DISTINCT price) AS distinct_prices, MIN(price) AS min_price, MAX(price) AS max_price
FROM Pizzas;

SELECT size, COUNT(DISTINCT price)AS distinct_price, MIN(price) AS min_price, MAX(price) AS max_price
FROM Pizzas
GROUP BY size;

-- Order Details Table

SELECT COUNT(DISTINCT order_id) AS total_orders,
        COUNT(DISTINCT order_detail_id) AS total_order_details,
        COUNT(DISTINCT pizza_id) AS total_pizza_variations,
        ROUND(COUNT(DISTINCT order_detail_id)/COUNT(DISTINCT order_id),2) AS avg_pizzas_per_order
FROM OrderDetails;

SELECT DISTINCT(quantity) AS quantity_range
FROM OrderDetails;

-- Orders Table

SELECT order_date, COUNT(order_id) AS max_orders_per_day
FROM Orders
GROUP BY Order_date
ORDER BY max_orders_per_day DESC
LIMIT 2;

SELECT order_date, COUNT(order_id) AS min_orders_per_day
FROM Orders
GROUP BY Order_date
ORDER BY min_orders_per_day
LIMIT 2;

SELECT ROUND(COUNT(order_id)/COUNT(DISTINCT order_date),1) AS avg_orders_per_day
FROM Orders;