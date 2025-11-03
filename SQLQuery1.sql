select * from [pizza_sales excel file]
select sum(total_price) as total_revenue from [pizza_sales excel file]
select sum(total_price)/ count(distinct order_id) as avg_order_value from [pizza_sales excel file]
select sum(quantity) as total_pizza_sold from [pizza_sales excel file]
select count(distinct order_id) as total_order from [pizza_sales excel file]
select sum(quantity)/ count(distinct order_id) as avg_pizzas_per_order from [pizza_sales excel file]

-- Daily Trend

select datename(DW, order_date) as order_day, count(distinct order_id) 
as Total_orders from [pizza_sales excel file]
group by DATENAME(DW,order_date)

-- Hourly Trend

select DATEPART(hour,order_time) as order_hours , Count(Distinct order_id)
as Total_orders from [pizza_sales excel file] group by DATEPART(hour, order_time) order by DATEPART(hour, order_time)


select pizza_category, sum(total_price) as Total_sales, sum(total_price) * 100 / (select sum(total_price) from [pizza_sales excel file]) as Total_sales
from [pizza_sales excel file] as Total_Sales
Group by pizza_category


select pizza_size, sum(total_price) as Total_sales, sum(total_price) * 100 / 
(select sum(total_price) from [pizza_sales excel file]) as pct
from [pizza_sales excel file]
Group by pizza_size order by pct desc

select pizza_category, sum(quantity) as Total_Pizza_sold
from [pizza_sales excel file] group by pizza_category

select top 5 pizza_name, sum(quantity) as Total_Pizzas_Sold
from [pizza_sales excel file] group by pizza_name
order by sum(quantity) desc

select top 5 pizza_name, sum(quantity) as Total_Pizzas_Sold
from [pizza_sales excel file] group by pizza_name
order by sum(quantity) asc