-- SQL Project

create database SQL_p1;

use SQL_p1;

create table retail_sales
(
transactions_id	INT,
sale_date date,
sale_time time,
customer_id int,
gender varchar(10),
age int,
category varchar(20),
quantiy	int,
price_per_unit float,
cogs float,
total_sale float
);

select count(*) from retail_sales;

alter table retail_sales
modify column transactions_id INT primary key;


truncate table retail_sales;

select * from retail_sales
where sale_time= 0;

-- CHECKING FOR NULL VALUES

select * from retail_sales
where 
transactions_id is Null
or
sale_date is Null
or sale_time is Null
or customer_id is Null
or gender is Null
or age is Null
or category is Null
or quantiy is Null
or price_per_unit is Null
or cogs is Null
or total_sale is Null;

-- EDA

-- How many sales we have ?
select count(*) as total_sale from retail_sales;

-- How many customers we have?
select count(distinct customer_id) from retail_sales;

-- How many categories we have?
select count(distinct category) from retail_sales;

-- KEY BUSINESS PROBLEMS (ANALYSIS)

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'
Select * from retail_sales
where sale_date= '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022
select * from retail_sales
where category= "Clothing"
and quantiy>3
and sale_date like '2022-11%';

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select category,sum(total_sale)
from retail_sales
group by category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select round(avg(age),2)
from retail_sales
where category= "Beauty";

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from retail_sales
where total_sale>1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select gender, category,
count(transactions_id)
from retail_sales
group by gender, category
order by category;

-- Q.7 Write a SQL query to find the top 5 customers based on the highest total sales 
select customer_id,sum(total_sale)
from retail_sales
group by customer_id
order by sum(total_sale) desc
limit 5;

-- Q.8 Write a SQL query to find the number of unique customers who purchased items from each category.
select category, count(distinct customer_id)
from retail_sales
group by category;

