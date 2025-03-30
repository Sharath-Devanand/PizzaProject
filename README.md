# Pizza Stop - Sales Analysis using SQL


## Project Background


I am a data analyst at Pizza Stop, a local pizzeria in Sheffield. I focus on extracting insights from the 2015 sales records containing 20K+ orders. Based on these insights, I am tasked with providing recommendations to the finance, marketing, pricing, and operations departments.


## Executive Summary

The Chicken category generates the most revenue (220,000 GBP) with one of the best-selling pizzas across size being The Barbeque Chicken indicating a focus on regular restocking of Chicken to ensure smooth operations. Weekdays present 72% of the sales indicating higher workplace customers than residential customers. Promotional factors include more discounts on weekends and family-oriented marketing strategies. The average Order Value (AOV) is 17 GBP with most of the orders being single-order pizzas. Bundling options for add-ons such as drinks and sides could effectively increase AOV. Large-sized pizzas are the most-ordered size emphasising customers with value-for-money while XL and XXL sizes should be restructured as their premium price causes the least sales.


## Data Description


The dataset comprises 4 tables each focusing on different aspects of the operations at the Pizzeria.


1. Orders - Consists of order IDs and the dates and times the order was placed.
2. Order Details - Presents the number of pizzas in each order along with a pizza type ID linking to the pizza table
3. Pizza - The Pizza tables contain records of the size and price of a particular pizza along with its type ID linked to the Pizza type table
4. Pizza Type - The Pizza details comprise the pizza name for the corresponding type ID, its category (out of 4 distinct categories) and the corresponding ingredients.


<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/PizzaProject_schema.png?raw=true" width="60%">
</p>


## Analysis and Insights


The analysis is divided into 4 different sections - Exploratory, Revenue, Pricing and Time-series.


### Exploratory Analysis


1. The pizzeria offers 32 distinct pizzas across four categories - Chicken, Classic, Supreme and Veggie - catering to a diverse range of customer preferences.


2. Pizzas come in five different sizes - Small (S), Medium (M), Large (L), Extra large (XL) and Double Extra Large (XXL) with XL and XXL demanding a premium price but lower demand.


3. The price of the pizzas ranges from 9 to 36 GBP.  The higher ranges being XL (Extra large - 25 GBP) and XXL (Double extra large - 36 GBP) are observed to have lesser sales.


4. The Restaurant had 20,000+ orders that year delivering 48,000 pizzas to customers - averaging two pizzas per order with a 96% of single-pizza orders.


5. An average of 59 orders per day are made with the order volume in the range of 27 to 115 orders per day.




### Revenue Analysis


1. Classic Category generates the highest revenue (220,000 GBP), contrasting to the fact that the top-selling pizzas - Thai Chicken, Barbecue chicken and California chicken from the Chicken category (41,000 - 43,000 GBP).


2. Large-sized pizzas contributed to the maximum revenue(375,000 GBP), while XXL pizzas had the least revenue (1,000 GBP) owing to their high pricing.


3. The Veggie category brought in the least sales (193,000 GBP) indicating more preference towards meat.


4. Barbeque Chicken Pizza is one of the best-selling pizza across sizes (42,000 GBP) shedding focus on regular restocking of the ingredients for Barbeque Chicken.


5. 96% of the revenue comes from orders with single-pizza orders. More efforts into bundling promotions and discounts.


6. Classic Big Meat pizza proves to be the most paired with pizza generating the largest revenue off orders with more than one pizza.




<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/Revenue_Category.png?raw=true" width="60%">
</p>

<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/Revenue_Size.png?raw=true" width="40%">

  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/Revenue_Quantity.png?raw=true" width="40%">
</p>

<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/pairing.png?raw=true" width="60%">
</p>






### Price Analysis


1. The Classic category is the best-selling while Veggie has lower orders despite lower average prices.This suggests that a large portion of the customers are willing to pay a higher price to not sacrifice the taste preference.


2. The large-size pizzas are the most ordered with close to 18,000+ orders while the double extra large pizzas are the least ordered suggesting there is more emphasis on value-for-money than premium prices for larger portions.


3. The Classic Deluxe Pizza is the best-selling pizza (2453), followed by Barbeque Chicken (2400). The high Barbeque Chicken orders despite being from the least ordered category indicate further inspection of other pizzas in the Chicken category owing to low orders.


4. Expensive pizzas, such as Thai Chicken and California Chicken are amongst the most sold proving a higher impact of flavour for a higher price.


5. Average Order Value (AOV) is 17 GBP, given that most of the orders consist of a single pizza. Further exploration of add-ons like sides and drinks could boost the AOV.




<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/topPizzas.png?raw=true" width="40%">

  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/expensive_orders.png?raw=true" width="40%">
</p>




### Time-series (Operations) Analysis


1. November 26th and 27th recorded the highest sales (4400+ GBP each day) with 265 pizzas sold. Identifying the underlying circumstances leading to these sales on those days could be crucial in further replication of those factors.


2. Consistent sales across months (9% per month) indicating a steady and loyal customer base throughout the year. This also indicates that there is scope for attracting first-time customers through marketing channels.


3. The fourth quarter unexpectedly has the lowest sales (199,000 GBP) despite the holiday season. Understanding the core reasons leading to this decrease could prevent Quarter 4 fall in the future years.


4. Lunchtime (12 pm - 2 pm) and Dinner time (7 pm-9 pm) are the busiest times of the day. A higher number of staff leading to faster pizza delivery time during these peak times could improve customer experience.


5. Weekdays present 72% of the sales of the week indicating a strong presence of workforce customers rather than customers from residential areas.


6. Peak hours (4 pm -9 pm) comprise 54% of the sales, suggesting a higher evening demand. Promotional activities during peak hours could attract more new customers.

<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/Revenue_day.png?raw=true" width="60%">
</p>

<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/monthly_avg_revenue.png?raw=true" width="60%">
</p>


<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/revenue_quarter.png?raw=true" width="40%">

  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/Orders_hour.png?raw=true" width="40%">
</p>


<p align="center">
  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/Weekday_orders.png?raw=true" width="40%">

  <img src="https://github.com/Sharath-Devanand/PizzaProject/blob/master/imgs/revenue_peaktimes.png?raw=true" width="40%">
</p>


## Recommendations


### Finance


1. Average Order Value of 17GBP indicates a majority of the orders are single-pizza orders. Focus on more add-ons such as sides and drinks could increase the AOV.
2. 26th and 27th November recorded the most sales - identifying the root causes producing the highest revenue could lead to replication of those factors in the future.
3. Despite holiday time, the fourth quarter projects the lowest sales. This could be due to most office spaces being closed in the neighbourhood reducing a high percentage of customers from ordering in Quarter 4.
4. Despite being one of the highest-priced pizzas, they have received a high number of orders - suggesting a high preference for taste than price. This is crucial in ranking pizza pricing based on taste.


### Marketing


1. Conducting promotional activities in the evenings (peak hours) to attract more new customers
2. Although there are year-round loyal customers, there is negligible indication of entrant of new customers. Marketing strategies should be aligned more toward acquiring new customers.
3. More revenue during weekdays indicates workplace customers are higher than household customers. Bringing more discounts on weekend would improve the chances of attracting more residential customers.
4. Family-oriented promotional events could attract customers on the weekend increasing customer base and revenue.


### Pricing


1. Reducing prices of XL and XXL size pizzas as a limited-time discount could increase more demand while maintaing revenue.
2. Bundling options for smaller pizzas could boost sales in terms of number of small pizzas.
3. Pizzas based on season with an emphasis on category and taste-based pricing could attract more orders.


### Operations


1. Lunch and dinner times require the most efficient number of staff to target faster delivery time of pizzas and increase customer experience.
2. Since Chicken category is the highest revenue-generating category, focus on regular restocking of Chicken is critical to maintain revenue.
3. Barbeque Chicken pizza has high orders, despite the overall Chicken category having the least orders. Inspection in terms of flavour in the other pizzas could help in identifying the root causes for a lower number of orders.
4. The veggie category has lower sales despite the lower average price. With the indication of most customers with an aim for value-for-money and taste preferences toward meat, improving flavours across the category should drive more sales.
5. Regular updates with new pizzas replacing lower-selling pizzas help in maintaining a year-round customer base.




## Assumptions and Caveats


1. Data Quality - The analysis assumes the sales data is processed by removing duplicates, null values and is consistent.
2. Price Consistent - There is no price change of pizzas across the year
3. External Factors - No promotional activities happened in that year.
4. Categorisation - Each pizza_id is associated with a unique category and size.


## Technical Tools Used

1. Microsoft Excel - Preprocessing and Visualisation
2. SQL - Data Analysis
