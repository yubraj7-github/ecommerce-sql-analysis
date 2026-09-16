--Q1 Find the total number of customers.

SELECT COUNT(customer_id)
FROM customers;

--Q2 Find the total number of products.

SELECT COUNT(product_id)
FROM products;

--Q3 Find the total number of orders.

SELECT COUNT(order_id)
FROM orders;

--Q4 Find the average product price.

SELECT 
AVG(price) as average
FROM products;

--Q5 Find the cheapest and most expensive products.

SELECT 
    MAX(price) AS expensive,
    MIN(price) AS cheapest
FROM products;