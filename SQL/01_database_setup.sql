CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    product_id INT,
    quantity INT,

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

INSERT INTO customers
(customer_id, customer_name, country)
VALUES
(1, 'Ram Shrestha', 'Nepal'),
(2, 'Sita Sharma', 'Nepal'),
(3, 'John Smith', 'India'),
(4, 'Alice Brown', 'USA'),
(5, 'Hari Thapa', 'Nepal'),
(6, 'David Wilson', 'USA'),
(7, 'Priya Patel', 'India'),
(8, 'Gita Rai', 'Nepal'),
(9, 'Michael Lee', 'USA'),
(10, 'Anita Singh', 'India'),
(11, 'Ramesh Karki', 'Nepal'),
(12, 'Emma Davis', 'UK'),
(13, 'Daniel Miller', 'UK'),
(14, 'Bikash Gurung', 'Nepal'),
(15, 'Sophia Taylor', 'USA');

INSERT INTO products
(product_id, product_name, category, price)
VALUES
(101, 'Laptop', 'Electronics', 800),
(102, 'Mouse', 'Electronics', 25),
(103, 'Keyboard', 'Electronics', 50),
(104, 'Chair', 'Furniture', 150),
(105, 'Desk', 'Furniture', 300),
(106, 'Headphones', 'Electronics', 100),
(107, 'Monitor', 'Electronics', 250),
(108, 'Office Lamp', 'Furniture', 80),
(109, 'Bookshelf', 'Furniture', 220),
(110, 'Webcam', 'Electronics', 75),
(111, 'Tablet', 'Electronics', 450),
(112, 'Office Chair', 'Furniture', 200);

INSERT INTO orders
(order_id, customer_id, order_date, product_id, quantity)
VALUES
(1001, 1, '2025-01-05', 101, 1),
(1002, 2, '2025-01-07', 102, 2),
(1003, 3, '2025-01-10', 104, 1),
(1004, 1, '2025-01-15', 103, 2),
(1005, 4, '2025-01-20', 105, 1),
(1006, 5, '2025-01-25', 106, 3),
(1007, 3, '2025-02-01', 101, 1),
(1008, 6, '2025-02-05', 104, 2),
(1009, 7, '2025-02-10', 102, 5),
(1010, 8, '2025-02-15', 105, 1),
(1011, 1, '2025-02-20', 106, 2),
(1012, 5, '2025-02-25', 101, 1),
(1013, 9, '2025-03-01', 107, 2),
(1014, 10, '2025-03-05', 108, 3),
(1015, 11, '2025-03-10', 109, 1),
(1016, 12, '2025-03-15', 110, 2),
(1017, 13, '2025-03-20', 111, 1),
(1018, 14, '2025-03-25', 112, 2),
(1019, 15, '2025-04-01', 101, 1),
(1020, 2, '2025-04-05', 107, 1),
(1021, 4, '2025-04-10', 105, 2),
(1022, 6, '2025-04-15', 106, 4),
(1023, 7, '2025-04-20', 103, 3),
(1024, 8, '2025-04-25', 108, 2),
(1025, 1, '2025-05-01', 111, 1),
(1026, 5, '2025-05-05', 101, 2),
(1027, 9, '2025-05-10', 104, 3),
(1028, 10, '2025-05-15', 109, 1),
(1029, 11, '2025-05-20', 110, 2),
(1030, 12, '2025-05-25', 112, 1),
(1031, 3, '2025-06-01', 107, 2),
(1032, 13, '2025-06-05', 105, 1),
(1033, 14, '2025-06-10', 106, 3),
(1034, 15, '2025-06-15', 111, 2),
(1035, 2, '2025-06-20', 102, 10),
(1036, 4, '2025-06-25', 101, 1),
(1037, 6, '2025-07-01', 109, 2),
(1038, 7, '2025-07-05', 110, 3),
(1039, 8, '2025-07-10', 112, 2),
(1040, 1, '2025-07-15', 107, 1);


SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM orders;

SELECT COUNT(*) FROM customers;

SELECT COUNT(*) FROM products;

SELECT COUNT(*) FROM orders;

SELECT
    o.order_id,
    c.customer_name,
    p.product_name,
    p.price,
    o.quantity,
    p.price * o.quantity AS revenue
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN products p
    ON o.product_id = p.product_id;