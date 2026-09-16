--Q31 Using a CTE, find customers whose revenue is greater than the average customer revenue.

WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(o.quantity * p.price) AS total_revenue
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    JOIN customers c
        ON o.customer_id = c.customer_id
    GROUP BY
        c.customer_id,
        c.customer_name
),

average_revenue AS (
    SELECT
        *,
        AVG(total_revenue) OVER () AS average_customer_revenue
    FROM customer_revenue
)

SELECT *
FROM average_revenue
WHERE total_revenue > average_customer_revenue
ORDER BY total_revenue DESC;

--Q32 Using a CTE, find the top 2 products in each category based on revenue.

WITH product_revenue AS (
    SELECT
        p.product_id,
        p.product_name,
        p.category,
        SUM(o.quantity * p.price) AS total_revenue
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY
        p.product_id,
        p.product_name,
        p.category
),

ranked_products AS (
    SELECT
        product_id,
        product_name,
        category,
        total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY total_revenue DESC
        ) AS ranking
    FROM product_revenue
)

SELECT
    product_id,
    product_name,
    category,
    total_revenue,
    ranking
FROM ranked_products
WHERE ranking <= 2
ORDER BY category, ranking;

/*Q33 Find the customer with the highest total spending.
Display:
customer_name
country
total_orders
total_revenue */

SELECT
    c.customer_name,
    c.country,
    COUNT(o.order_id) AS total_orders,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN customers c
    ON c.customer_id = o.customer_id
JOIN products p
    ON o.product_id = p.product_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.country
ORDER BY total_revenue DESC
LIMIT 1;
		
--Q34 Find the product that generated the highest revenue in each category.

WITH product_revenue AS (
    SELECT
        p.product_id,
        p.product_name,
        p.category,
        SUM(o.quantity * p.price) AS total_revenue
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY
        p.product_id,
        p.product_name,
        p.category
),

ranked_products AS (
    SELECT
        product_id,
        product_name,
        category,
        total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY total_revenue DESC
        ) AS ranking
    FROM product_revenue
)

SELECT
    product_id,
    product_name,
    category,
    total_revenue,
    ranking
FROM ranked_products
WHERE ranking = 1
ORDER BY category, ranking;

--Q35 Calculate monthly revenue and the difference from the previous month.

with monthly_date as(
SELECT
    DATE_TRUNC('month', o.order_date) AS month_date,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY month_date
)
select 
month_date,
total_revenue,
lag(total_revenue) over (order by month_date) as previous_month,
total_revenue-(lag(total_revenue) over (order by month_date)) as difference
from monthly_date
order by month_date;

--Q36 Find customers who placed more orders than the average number of orders per customer.


WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(order_id) AS total_orders
    FROM orders
    GROUP BY customer_id
),
average_orders AS (
    SELECT
        *,
        AVG(total_orders) OVER () AS average_orders
    FROM customer_orders
)
SELECT
    customer_id,
    total_orders,
    average_orders
FROM average_orders
WHERE total_orders > average_orders;

--Q37 Find the country with the highest total revenue.

SELECT
    c.country,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN customers c
    ON c.customer_id = o.customer_id
JOIN products p
    ON o.product_id = p.product_id
GROUP BY
    c.country
ORDER BY total_revenue DESC
limit 1;

--Q38 Find each country's percentage contribution to total revenue.

WITH cte_name AS (
    SELECT
        c.country,
        SUM(o.quantity * p.price) AS total_revenue
    FROM orders o
    JOIN customers c
        ON c.customer_id = o.customer_id
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY c.country
)
SELECT *,
       ROUND(
           (total_revenue * 100) / SUM(total_revenue) OVER(),
           2
       ) AS percentage
FROM cte_name
ORDER BY total_revenue DESC;

--Q39 Find the top 3 customers from each country based on revenue.

WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.customer_name,
        c.country,
        SUM(o.quantity * p.price) AS total_revenue
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    JOIN customers c
        ON o.customer_id = c.customer_id
    GROUP BY
        c.country,
        c.customer_id,
        c.customer_name
),
customer_ranking AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY country
            ORDER BY total_revenue DESC
        ) AS rn
    FROM customer_revenue
)
SELECT *
FROM customer_ranking
WHERE rn <= 3
ORDER BY country, rn;

/*Q40  Create a final summary containing:
total_customers
total_products
total_orders
total_quantity_sold
total_revenue
average_order_value */

SELECT 
    COUNT(DISTINCT c.customer_id) AS total_customers,
    COUNT(DISTINCT p.product_id) AS total_products,
    COUNT(o.order_id) AS total_orders,
    SUM(o.quantity) AS total_quantity_sold,
    SUM(o.quantity * p.price) AS total_revenue,
    AVG(o.quantity * p.price) AS average_order_value
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
JOIN customers c
    ON o.customer_id = c.customer_id;

