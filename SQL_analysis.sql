/*

A detailed SQL analysis is performed to understand and solve the following questions regarding the Pizza sales. A subset of the questions where derived from externall
LLMs, while the rest of the questions were personally designed.

Objective - I work for the Pizza place as a Data Analyst and the goal is present actionable insights from the dataset. My focus are on insights related to a. Revenue
b. Menu Optimisation and c. Logistics Management

*/

--- Exploration to understand the demographics

-- PizzaTypes Table
SELECT COUNT(DISTINCT(pizza_name))
FROM PizzaTypes;


SELECT COUNT(DISTINCT(category))
FROM PizzaTypes;


SELECT DISTINCT(category)
FROM PizzaTypes;

SELECT category, COUNT(DISTINCT pizza_name)
FROM PizzaTypes
GROUP BY category;


SELECT COUNT(DISTINCT pizza_type_id)
FROM PizzaTypes;

--- Pizza Table

SELECT DISTINCT(size)
FROM Pizzas;


SELECT COUNT(DISTINCT price)
FROM Pizzas;

SELECT size, COUNT(DISTINCT price)
FROM Pizzas
GROUP BY size;

-- Order Details Table


SELECT order_id, COUNT(order_detail_id) AS uniqePizzaCount, COUNT(pizza_id) AS total_pizza
FROM OrderDetails
GROUP BY order_id
HAVING COUNT(order_detail_id) != COUNT(pizza_id);

SELECT COUNT(DISTINCT order_id) AS total_orders, COUNT(DISTINCT order_detail_id) AS total_order_details, COUNT(DISTINCT pizza_id) AS total_pizzas
FROM OrderDetails;

SELECT COUNT(pizza_id) AS total_pizzas_ordered
FROM OrderDetails;

SELECT DISTINCT(quantity) AS unique_quant
FROM OrderDetails;

-- Orders Table

SELECT order_date, COUNT(order_id) AS orderCount
FROM Orders
GROUP BY Order_date
ORDER BY orderCount ASC
LIMIT 5;


