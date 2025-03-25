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
CREATE VIEW IF NOT EXISTS pizzaPrice AS
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
SELECT category,
        ROUND(AVG(price),2) as category_price,
        SUM(quantity) as category_count
FROM pizzaPrice
GROUP BY category
ORDER BY category_count DESC;


-- Question 2: How do average prices vary across different pizza sizes?
SELECT size,
        ROUND(AVG(price),2) as avg_price,
        SUM(quantity) as size_count
FROM pizzaPrice
GROUP BY size
ORDER BY size_count DESC;


-- Question 3: What are the top 3 most and least sold pizzas and their prices?
-- Least sold pizzas
SELECT pizza_name, price, SUM(quantity) as least_sold_count
FROM pizzaPrice
GROUP BY pizza_name
ORDER BY least_sold_count
LIMIT 3;


--Most sold pizzas
SELECT pizza_name, price, SUM(quantity) as most_sold_count
FROM pizzaPrice
GROUP BY pizza_name
ORDER BY most_sold_count DESC
LIMIT 3;

-- Question 4: What are the top 3 most expensive and top 3 cheapest pizzas, along with their total quantity sold?
-- Cheapest pizzas

WITH max_quantity AS(
        SELECT SUM(quantity) as max_sold
        FROM pizzaPrice
        GROUP BY pizza_name
        ORDER BY max_sold DESC
        LIMIT 1
        )

SELECT pizza_name,
        price AS cheapest_price,
        SUM(quantity) as count_pizza,
        ROUND(SUM(quantity)*100.0/(SELECT max_sold FROM max_quantity),1) AS percentage_from_max
FROM pizzaPrice
GROUP BY pizza_name
ORDER BY cheapest_price, count_pizza DESC
LIMIT 3;

-- Expensive pizzas

WITH max_quantity AS(
        SELECT SUM(quantity) as max_sold
        FROM pizzaPrice
        GROUP BY pizza_name
        ORDER BY max_sold DESC
        LIMIT 1
        )


SELECT pizza_name,
        price AS expensive_price,
        SUM(quantity) as count_pizza,
        ROUND(SUM(quantity)*100.0/(SELECT max_sold FROM max_quantity),1) AS percentage_from_max
FROM pizzaPrice
GROUP BY pizza_name
ORDER BY expensive_price DESC, count_pizza DESC
LIMIT 3;

-- Question 5: Which price points have the highest number of orders, and what are their associated categories and sizes?

SELECT price, SUM(quantity) AS price_count, category, size
FROM pizzaPrice
GROUP BY price, category
ORDER BY price_count DESC
LIMIT 5;

-- Question 6: What are the top 3 pizzas with the most orders, and what are their prices?

SELECT pizza_name, price, COUNT(DISTINCT order_id) as order_count
FROM pizzaPrice
GROUP BY price, pizza_name
ORDER BY order_count DESC
LIMIT 5;

-- Question 7: What is the average order value

SELECT ROUND(SUM(price*quantity)/(SELECT DISTINCT COUNT(order_id) FROM pizzaPrice),1) as aov
FROM pizzaPrice;


