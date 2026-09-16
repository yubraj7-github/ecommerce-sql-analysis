# 📊 E-Commerce Sales Analysis Using PostgreSQL

## 📌 Project Overview

This project analyzes e-commerce sales data using PostgreSQL and SQL.

The purpose of this project is to understand customer behavior, product performance, revenue trends, and overall sales performance.

The analysis focuses on answering practical business questions that a Data Analyst may encounter in an e-commerce environment.

---

## 🎯 Business Objectives

* Analyze overall sales performance
* Calculate total revenue
* Identify top-performing products
* Identify high-value customers
* Analyze customer purchasing behavior
* Analyze revenue by country
* Analyze revenue by product category
* Analyze monthly revenue trends
* Calculate revenue contribution
* Apply advanced SQL techniques to business problems

---

## 🗂️ Dataset

The database contains three tables:

### Customers

| Column        | Description                |
| ------------- | -------------------------- |
| customer_id   | Unique customer identifier |
| customer_name | Customer name              |
| country       | Customer country           |

### Products

| Column       | Description               |
| ------------ | ------------------------- |
| product_id   | Unique product identifier |
| product_name | Product name              |
| category     | Product category          |
| price        | Product price             |

### Orders

| Column      | Description             |
| ----------- | ----------------------- |
| order_id    | Unique order identifier |
| customer_id | Customer identifier     |
| order_date  | Date of order           |
| product_id  | Product identifier      |
| quantity    | Quantity purchased      |

---

## 🔗 Database Schema

```text
Customers
    |
    | customer_id
    ↓
  Orders
    |
    | product_id
    ↓
 Products
```

---

## 🛠️ Tools Used

* PostgreSQL
* pgAdmin 4
* SQL
* Git
* GitHub

---

## 📚 SQL Concepts Demonstrated

* SELECT
* WHERE
* ORDER BY
* LIMIT
* COUNT
* SUM
* AVG
* MIN
* MAX
* GROUP BY
* HAVING
* INNER JOIN
* LEFT JOIN
* CASE WHEN
* Subqueries
* CTEs
* Window Functions
* RANK()
* ROW_NUMBER()
* LAG()
* DATE_TRUNC()
* Aggregate Functions
* Revenue Analysis
* Customer Analysis
* Product Analysis
* Time-Series Analysis

---

# 📊 Analysis Performed

## Customer Analysis

* Number of orders per customer
* Total quantity purchased
* Customer revenue
* Top customers
* Customers with no orders
* Revenue by country
* Customer segmentation

## Product Analysis

* Product sales volume
* Product revenue
* Top products
* Revenue by category
* Average price by category
* Products that have not been ordered

## Revenue Analysis

* Total revenue
* Average order value
* Monthly revenue
* Monthly order volume
* Running revenue
* Previous-month revenue
* Product revenue contribution

## Advanced SQL Analysis

* Customer revenue ranking
* Product revenue ranking
* Top products
* Top products by category
* Above-average customers
* Revenue percentage contribution
* Running totals
* Previous-month comparison

---

# 🔍 Key Findings

The following findings are based on the SQL analysis performed on the dataset.

### Overall Performance

* Total customers: **15**
* Total products: **12**
* Total orders: **40**
* Total quantity sold: **83**
* Total revenue: **15,980**
* Average order value: **399.50**

### Customer Insights

* Highest-revenue customer: **Hari Thapa — 2,700**
* Highest-revenue country: **Nepal — 6,980**

### Product Insights

* Highest-revenue product: **Laptop — 5,600**
* Best-selling product by quantity: **Mouse — 17 units**
* Highest-revenue category: **Electronics — 11,430**

### Monthly Performance

* Highest-revenue month: **May 2025 — 3,070**
* Lowest-revenue month: **July 2025 — 1,315**

---

# 💡 Business Recommendations

Based on the analysis, the business could:

* Monitor high-performing products and categories.
* Identify opportunities to increase purchases from lower-value customers.
* Monitor monthly revenue trends.
* Investigate products with low or zero sales.
* Analyze customer purchasing patterns to improve customer retention.
* Focus marketing efforts on products and categories with strong revenue performance.

---

# 📸 Analysis Screenshots

Screenshots of important SQL analysis results will be added here.

---

# 📁 Project Structure

```text
ecommerce-sql-analysis/
│
├── data/
│   ├── customers.csv
│   ├── products.csv
│   └── orders.csv
│
├── sql/
│   ├── 01_database_setup.sql
│   ├── 02_basic_analysis.sql
│   ├── 03_customer_analysis.sql
│   ├── 04_product_analysis.sql
│   ├── 05_revenue_analysis.sql
│   └── 06_advanced_analysis.sql
│
├── screenshots/
│
├── README.md
└── .gitignore
```

---

# ▶️ How to Run the Project

### 1. Create the database

Create a PostgreSQL database named:

```text
ecommerce_analysis
```

### 2. Open pgAdmin 4

Open the PostgreSQL Query Tool.

### 3. Run the database setup

Run:

```text
01_database_setup.sql
```

This creates the tables and inserts the data.

### 4. Run the analysis queries

Run the SQL files in this order:

```text
02_basic_analysis.sql
03_customer_analysis.sql
04_product_analysis.sql
05_revenue_analysis.sql
06_advanced_analysis.sql
```

### 5. Review the results

Use the query results to identify business insights and review the findings presented in this README.

---

# 🎓 Portfolio Purpose

This project was created as part of my Data Analyst portfolio to demonstrate practical SQL and PostgreSQL skills through an end-to-end business analysis project.

---

## 👤 Author

**Yubraj Shrestha**

Aspiring Data Analyst

**Skills:**

SQL | PostgreSQL | Excel | Power BI | Python
