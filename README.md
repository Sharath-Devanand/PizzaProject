# Pizza Sales Analysis

## Project Background

I am a data analyst working at Pizza Stop, a local pizzeria based in Sheffield. I focus on extracting insights from the 2015 sales records containing 20K+ orders. Based on these insights, I am tasked with providing recommendations to the pricing, operations, and finance departments.


## Executive Summary


## Data Description

The dataset comprises 4 tables each focusing on different aspects of the operations at the Pizzeria

1. Orders - Consists of order IDs and the dates and times the order was placed.
2. Order Details - Presents the number of pizzas in each order along with a pizza type ID linking to the pizza table
3. Pizza - The Pizza tables contain records of the size and price of a particular pizza along with its type ID linked to the Pizza details table
4. Pizza Details - The Pizza details comprise the name of the pizza for the corresponding type ID, its category (out of 4 distinct categories) and the corresponding ingredients.

<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/PizzaProject_schema.png?raw=true" width="60%">
</p>

## Analysis and Insights

The analysis is further sub-divided into 4 different categories each associated with each of the departments in the Pizza shop to which the insights are relevant

### Exploratory Analysis

Following are insights based on the initial analysis on the dataset

1. There are 32 distinct pizzas across 4 major categories - Chicken, Classic, Supreme and Veggie.
2. Pizzas come in 5 different sizes - Small (S), Medium (M), Large (L), Extra large (XL) and Double Extra Large (XXL).
3. The price of the pizzas range from 9 to 23 GBP while Extra large and double extra large pizzas are found to be the highest prices of 25 and 36 GBP.
4. Restaurent has had 20k+ orders that year with 48k pizzas made - averaging 2 pizzas per order and a maximum of upto 4 pizzas in an order.
5. An average of 59 orders per day ranging from 27 to 115 per day with .


### Revenue Analysis

1. Classic Category generates the maximum revenue of 220k GBP, while the Veggie produced the least sales of 193k pounds.
2. Large sized pizzas contribute to the most sales with 375k GBP while XXL pizzas had the least revenue with 1k GBP owing to the reason of high price.
3. Contrasting to category sales, 3 pizzas- Thai Chicken, Barbecue chicken and California chicken from the Chicken category across all sizes produce the maximum revenue ranging from 41k to 43k pounds with an average of 18 pounds per pizza across all sizes.
4. Barbeque Chicken Pizza is the best selling pizza across all sizes(42k GBP).
5. 96% percent of the sales or revenue is from orders with only one pizza in the order.
6. More than one pizza orders - The California Chicken pizza and the classic big meat pizza - most revenue.
7. Third highest bill is 285 pounds with highest being 440 and 415, with an average of 16 pounds per day.


<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/Revenue_Category.png?raw=true" width="60%">
</p>

<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/Revenue_Quantity.png?raw=true" width="60%">
</p>

<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/Revenue_Size.png?raw=true" width="60%">
</p>



### Price Analysis

1. Classic category is the most-selling while Chicken is the least-selling due to price. Supreme category had more orders than the Veggie category despite the higher average price. This could indicate a lesser preference of the Veggie pizzas.
2. The large size pizzas are the most ordered with close to 18k+ orders while the double extra large pizzas are the least ordered.
3. The Classic Deluxe Pizza is the best selling pizza (2453), followedby barbeque chicken (24).
4. Cheapest pizzas - Big Meat Pizza and the Vegetables pizza have 78% and 62% of the maximum orders respectively. Contrastingly, Expensive pizzas - Thai chicken and California Chicken are amongst the most sold.
5. Average Order Value is 17 GBP. 


<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/topPizzas.png?raw=true" width="60%">
</p>

<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/Orders_hour.png?raw=true" width="60%">
</p>

<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/Revenue_day.png?raw=true" width="60%">
</p>

### Time-series (Operations) Analysis

1. 26th and 27th November has the highest sales earning 4400+ GBP each day with 265 pizzas.
2. Month-wise order percentage of 9% across all months indicate consistent sales throughout the year with July having the highest revenue (72k GBP)
3. Second quarter had the highest sales with 208k GBP while fourth quarter presents the least with 199k GBP. This seems unlikely due to the holiday season in quarter 4.
4. Lunch times of 12pm - 2pm an Dinner times of 7pm- 9pm present the busiest times of the day.
5. Weekdays present 72% of the sales of the week indicating a strong presence near workplaces rather than residential areas.
6. Peak hours of 4pm - 9pm comprises 54% of the sales, indicating no imbalance in orders in the evening/dinner.

<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/revenue_quarter.png?raw=true" width="60%">
</p>

<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/Weekday_orders.png?raw=true" width="60%">
</p>

<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/revenue_peaktimes.png?raw=true" width="60%">
</p>

## Recommendations

The following categories present the recommendations for each department based on the insights gathered from the above analysis.

### Finance



### Pricing


### Operations


## Assumptions and Caveats


