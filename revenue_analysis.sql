/*

Revenue Analysis

This analysis focuses on understanding revenue patterns across different categories, pizza sizes, and individual pizzas. 
By leveraging SQL queries, we aim to uncover trends in sales performance, the impact of pizza size on revenue, and how different quantities affect total revenue distribution. 

Key Insights:
1. Ranking of pizza categories based on total revenue.
2. The effect of pizza size on revenue and pricing trends.
3. Identifying the top revenue-generating pizzas within each category.
4. Comparing individual pizza sales to their category's total revenue.
5. Understanding revenue distribution across different purchase quantities.
6. Analyzing whether category rankings change when considering only orders with more than one pizza.


*/

-- Creating a view to store revenue-related data for easy analysis

CREATE VIEW IF NOT EXISTS Revenue AS
SELECT  t1.order_id AS order_id,
        t1.order_detail_id AS order_detail_id,
        t1.pizza_id AS pizza_id,
        t1.quantity AS quantity,
        t2.size AS size,
        t2.price AS price,
        t3.pizza_name AS pizza_name,
        t3.category AS category,
        t2.price*t1.quantity AS cost
FROM OrderDetails t1
LEFT JOIN Pizzas t2
ON t1.pizza_id = t2.pizza_id
LEFT JOIN PizzaTypes t3
ON t2.pizza_type_id = t3.pizza_type_id;




-- Question 1: Which pizza categories generate the most revenue?
SELECT category, SUM(cost) AS category_sales
FROM Revenue
GROUP BY category
ORDER BY category_sales DESC;

-- Question 2: How does pizza size impact revenue and average price?
SELECT size, SUM(cost) AS size_sales, ROUND(AVG(price),1) AS price_avg
FROM Revenue
GROUP BY size
ORDER BY size_sales DESC;

-- Question 3: Which pizzas generate the most revenue within each category?
-- Additionally, how does the average revenue of these pizzas compare to their category's average?
SELECT category, pizza_name,
        SUM(cost) as pizza_sales,
        ROUND(AVG(cost),2) as pizza_avg,
        ROUND(AVG(cost) OVER (PARTITION BY category),2) AS category_avg
FROM revenue
GROUP BY category, pizza_name
ORDER BY pizza_sales DESC
LIMIT 10;

-- Question 4: How does the revenue of individual pizzas compare to their overall category revenue?
SELECT pizza_id,
        category,
        SUM(cost) AS id_sales,
        SUM(cost) OVER(PARTITION BY category) AS cat_sales
FROM revenue
GROUP BY pizza_id
LIMIT 5;

-- Question 5: How is revenue distributed across different quantities of pizzas purchased?
SELECT quantity, COUNT(quantity), SUM(cost) as quant_sales, ROUND(SUM(cost)/(SELECT SUM(cost) FROM revenue)*100,2) AS quant_percent
FROM revenue
GROUP BY quantity;

-- Bonus Analysis: What are the top 3 revenue-generating pizzas when ordered in quantities greater than 1?
SELECT  category,pizza_name, SUM(cost) as pizza_sales_top3
FROM revenue
WHERE quantity > 1
GROUP BY pizza_name
ORDER BY pizza_sales_top3 DESC
LIMIT 3;

-- Question 6: Does the ranking of pizza categories change when considering only orders with more than one pizza?
SELECT category,
        SUM(cost) as cat_sales_morethanone
FROM revenue
WHERE quantity>1
GROUP BY category;


SELECT order_id,
        SUM(cost) AS order_cost
FROM revenue
GROUP BY order_id
ORDER BY order_cost DESC
LIMIT 5;