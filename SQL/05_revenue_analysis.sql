--Q17 Calculate total revenue by month.

SELECT
    DATE_TRUNC('month',o.order_date) as month_date,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY month_date
ORDER BY month_date;

--Q18 Calculate the number of orders by month.

SELECT 
    DATE_TRUNC('month', order_date) AS month_date,
    COUNT(order_id) AS number_of_orders
FROM orders
GROUP BY month_date
ORDER BY month_date;

--Q19 Find the month with the highest revenue.

SELECT
    DATE_TRUNC('month', o.order_date) AS month_date,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY month_date
ORDER BY total_revenue DESC
LIMIT 1;

--Q20 Calculate a running total of revenue by order date.

WITH cte_name AS (
    SELECT
        o.order_date,
        SUM(o.quantity * p.price) AS total_revenue
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY o.order_date
)
SELECT
    order_date,
    total_revenue,
    SUM(total_revenue) OVER (
        ORDER BY order_date
    ) AS running_total
FROM cte_name
ORDER BY order_date;
order by order_date;

--Q21 Find each customer's first order date.

SELECT *
FROM (
    SELECT 
        customer_id,
        order_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id 
            ORDER BY order_date
        ) AS rn
    FROM orders
) t
WHERE rn = 1;

--Q22 Find each customer's most recent order date.

SELECT *
FROM (
    SELECT 
        customer_id,
        order_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id 
            ORDER BY order_date desc
        ) AS rn
    FROM orders
) t
WHERE rn = 1;

/*Q 23 Classify products:
price < 50       → Cheap
50–200           → Medium
> 200            → Expensive */

SELECT *,
    CASE 
        WHEN price < 50 THEN 'cheap'
        WHEN price >= 50 AND price <= 200 THEN 'medium'
        ELSE 'expensive'
    END AS price_category
FROM products;

/* Q24 Classify customers based on their total revenue:
< 300            → Low Value
300–1000         → Medium Value
> 1000           → High Value */

WITH cte_name AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(p.price * o.quantity) AS total_revenue
    FROM orders o
    JOIN customers c
        ON c.customer_id = o.customer_id
    JOIN products p
        ON p.product_id = o.product_id
    GROUP BY 
        c.customer_id,
        c.customer_name
)
SELECT *,
    CASE 
        WHEN total_revenue < 300 THEN 'low value'
        WHEN total_revenue >= 300 AND total_revenue <= 1000 THEN 'medium value'
        ELSE 'high value'
    END AS price_category
FROM cte_name;

--Q25 Rank products based on total revenue.

SELECT
    p.product_id,
    p.product_name,
    SUM(o.quantity * p.price) AS total_revenue,
    ROW_NUMBER() OVER (
        ORDER BY SUM(o.quantity * p.price) DESC
    ) AS ranking
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name;

--Q26 Rank customers based on total revenue.

SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.quantity * p.price) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(o.quantity * p.price) DESC
    ) AS ranking
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
JOIN customers c
    ON c.customer_id=o.customer_id
GROUP BY c.customer_id,c.customer_name;

--Q27 Find the top 3 products based on revenue.

SELECT *
FROM (
    SELECT
        p.product_id,
        p.product_name,
        SUM(o.quantity * p.price) AS total_revenue,
        DENSE_RANK() OVER (
            ORDER BY SUM(o.quantity * p.price) DESC
        ) AS ranking
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY p.product_id, p.product_name
) t
WHERE ranking <= 3;

--Q28 Calculate the percentage contribution of each product to total revenue.

WITH cte_name AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(o.quantity * p.price) AS total_revenue
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY p.product_id, p.product_name
)
SELECT
    product_id,
    product_name,
    ROUND(
        (total_revenue / SUM(total_revenue) OVER ()) * 100.0,
        2
    ) AS percentage
FROM cte_name;


--Q29 Use LAG() to show the previous order's revenue.

SELECT
    o.order_id,
    o.order_date,
    SUM(o.quantity * p.price) AS total_revenue,
    LAG(SUM(o.quantity * p.price))
        OVER (ORDER BY o.order_date) AS previous_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY o.order_id, o.order_date
ORDER BY o.order_date;

--Q30 Use LEAD() to show the next order's revenue.


SELECT
    o.order_id,
    o.order_date,
    SUM(o.quantity * p.price) AS total_revenue,
    LEAD(SUM(o.quantity * p.price))
        OVER (ORDER BY o.order_date) AS next_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY o.order_id, o.order_date
ORDER BY o.order_date;

