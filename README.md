# Pizza-Sales-Analysis-

## Table of Contents
- [Project Overview](#project-overview)
- [Dataset Description](#dataset-description)
- [Key Insights and Recommendations](#key-insights-and-recommendations)


### Project Overview
This project analyzes a pizza sales dataset to uncover customer preferences, identify peak sales hours, and determine top-performing products. The goal is to generate actionable insights to improve sales strategies and operational efficiency for a fictional pizza shop.


<img width="1116" height="628" alt="dashboard_page" src="https://github.com/user-attachments/assets/b07d5a36-e5f4-4b99-be42-c9173e71164c" />


### Tools Used
- Microsoft Excel
- SQL Server
  
### Dataset Description
- The dataset includes tables for `orders`, `order_details`, `pizzas`, and `pizza_types`.
- Approximately 4,500 records across multiple tables.
- Key fields: `order_id`, `pizza_id`, `quantity`, `order_time`, and `price`.

### Data Cleaning & Preparation
- Removed null values in `order_time` and `quantity` columns.
- Converted order times to 24-hour format.
- Joined the `orders`, `order_details`, and `pizzas` tables using foreign keys.
- Removed duplicate records and standardized pizza names.
- Replaced pizza size abbreviations (S, M, L, XL, XXL) with full names (Small, Medium, Large, Extra Large, Extra Extra Large).

### Analysis & KPIs
- Total Revenue: $817,860
- Most Ordered Pizzas: Classic Deluxe and Chicken Pizzas
- Most Profitable Pizza: Barbecue Chicken Deluxe
- Peak Order Time: 6 PM – 8 PM on Fridays
- Average Order Quantity: 2.3 pizzas per order

### SQL Queries Used
Sample Query – Total Revenue by Pizza:
SELECT pizza_name, SUM(total_price) AS total_revenue
FROM pizza_sales$
GROUP BY pizza_name
ORDER BY total_revenue DESC;
Sample Query – Total Revenue:
SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales$;

### Key Insights and Recommendations
- Classic Deluxe and Chicken Pizzas are top sellers — consider promoting these more.
- Large-size pizzas contribute significantly to sales — offer bundle promotions with Large sizes.
- Most orders are placed Friday/Saturday evenings, especially between 6 PM – 8 PM — introduce discount campaigns on off-peak days (Sunday–Wednesday) between 1 PM – 3 PM and 9 PM – 11 PM.
- Brie Carre Pizza has the lowest sales and revenue — consider updating the recipe or running marketing tests to increase its appeal.

### Challenges Faced and What I Learned
- Learned how to join multiple tables using SQL foreign keys.
- Improved Excel skills in calculating KPIs using formulas and pivot tables.
- Gained experience presenting findings clearly through charts and dashboards.




