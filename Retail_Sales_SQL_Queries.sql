CREATE DATABASE RetailSalesDB;
USE RetailSalesDB;


CREATE TABLE Retail_Sales
(
order_id VARCHAR(50),
order_date DATE,
ship_date DATE,
ship_mode VARCHAR(50),
customer_name VARCHAR(100),
segment VARCHAR(30),
State_name VARCHAR(100),
country VARCHAR(100),
market VARCHAR(50),
region VARCHAR(50),
product_id VARCHAR(60),
category VARCHAR(50),
sub_category VARCHAR(50),
product_name VARCHAR(300),
sales FLOAT,
quantity INT,
discount FLOAT,
profit FLOAT,
shipping_cost FLOAT,
order_priority VARCHAR(30),
order_year INT
)

SELECT count(*) FROM Retail_Sales;
SELECT * FROM Retail_Sales;

SELECT SUM(SALES) AS TOTAL_SALES FROM Retail_Sales ;
SELECT SUM(profit) AS TOTAL_PROFIT FROM Retail_Sales;

SELECT TOP 10 product_name, SUM(sales) AS total_sales FROM Retail_Sales GROUP BY product_name ORDER BY total_sales DESC;
SELECT TOP 10 product_name, SUM(profit) AS total_profit FROM Retail_Sales GROUP BY product_name ORDER BY total_profit DESC;

SELECT region, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM Retail_Sales GROUP BY region ORDER BY total_sales DESC;

SELECT region, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM Retail_Sales GROUP BY region having SUM(profit) < 0;

SELECT order_year, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM Retail_Sales GROUP BY order_year ORDER BY total_sales DESC;

SELECT category, SUM(sales) AS total_sales, SUM(profit) AS total_profit, SUM(quantity) AS total_qty
FROM Retail_Sales GROUP BY category ORDER BY total_sales DESC;

select count(order_date) from Retail_Sales where sales IS NULL

SELECT category, SUM(profit) AS total_profit
FROM Retail_Sales GROUP BY category ORDER BY total_profit DESC;

SELECT category, AVG(profit) AS AVG_profit
FROM Retail_Sales GROUP BY category ORDER BY AVG_profit DESC;

SELECT order_year, SUM(sales) AS total_sales, SUM(profit) AS total_profit, SUM(quantity) AS total_qty
FROM Retail_Sales GROUP BY order_year ORDER BY order_year;

SELECT  customer_name, SUM(sales) AS total_sales, SUM(profit) AS total_profit, SUM(quantity) AS total_qty
FROM Retail_Sales GROUP BY customer_name ORDER BY total_sales DESC;

SELECT product_name, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM Retail_Sales GROUP BY product_name having SUM(profit) < 0;