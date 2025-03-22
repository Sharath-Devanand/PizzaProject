/*

Price Analysis

This analysis explores the pricing structure of pizzas, focusing on average prices across categories and sizes, identifying the most and least sold pizzas, and understanding price distribution patterns.

Key Insights:
1. The average price of pizzas across different categories and sizes.
2. Identifying the most and least sold pizzas based on price.
3. The most expensive and cheapest pizzas and their sales volume.
4. Price points with the highest number of orders and their associated categories and sizes.
5. The most frequently ordered pizzas and their price points.

*/


-- Creating a view to store price-related data for easy analysis
CREATE VIEW IF NOT EXISTS price AS
SELECT t1.order_detail_id,
        t1.order_id,
        t1.pizza_id,
        t1.quantity,
        t2.size,
        t2.price,
        t3.pizza_name,
        t3.category
FROM OrderDetails t1
LEFT JOIN Pizzas t2
ON t1.pizza_id = t2.pizza_id
LEFT JOIN PizzaTypes t3
ON t2.pizza_type_id = t3.pizza_type_id;



-- Question 1: What is the average price of pizzas across different categories
SELECT category, ROUND(AVG(price),2) as cat_price, SUM(quantity) as cat_count
FROM price
GROUP BY category;


-- Question 2: How do average prices vary across different pizza sizes?
SELECT size, ROUND(AVG(price),2) as avg_price, SUM(quantity) as size_count
FROM price
GROUP BY size;


-- Question 3: What are the top 3 most and least sold pizzas and their prices?
-- Least sold pizzas
SELECT pizza_name, price, SUM(quantity) as pizza_count
FROM price
GROUP BY pizza_name
ORDER BY pizza_count
LIMIT 3;


--Most sold pizzas
SELECT pizza_name, price, SUM(quantity) as pizza_count
FROM price
GROUP BY pizza_name
ORDER BY pizza_count DESC
LIMIT 3;

-- Question 4: What are the top 3 most expensive and top 3 cheapest pizzas, along with their total quantity sold?
-- Cheapest pizzas

SELECT pizza_name, price, SUM(quantity) as sum_pizza
FROM price
GROUP BY pizza_name
ORDER BY price
LIMIT 3;

-- Expensive pizzas
SELECT pizza_name, price, SUM(quantity) as sum_pizza
FROM price
GROUP BY pizza_name
ORDER BY price DESC
LIMIT 3;

-- Question 5: Which price points have the highest number of orders, and what are their associated categories and sizes?

SELECT price, SUM(quantity) AS price_count, category, size
FROM price
GROUP BY price, category
ORDER BY price_count DESC
LIMIT 5;

-- Question 6: What are the top 3 pizzas with the most orders, and what are their prices?

SELECT pizza_name, price, COUNT(DISTINCT order_id) as order_count
FROM price
GROUP BY price, pizza_name
ORDER BY order_count DESC
LIMIT 5;

-- Question 7: What is the average order value
SELECT DISTINCT ROUND(AVG(quantity*price),2) as avg_order
FROM price
GROUP BY order_id
ORDER BY avg_order DESC
LIMIT 5;
