-- 5️⃣ Display top 3 employees with highest total sales
-- Tables:
-- •	sales(emp_id, product_id, amount)
-- •	employees(emp_id, emp_name)
-- 👉 Calculate total sales per employee and show top 3 performers.

CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50)
);
CREATE TABLE sales (
    emp_id INT,
    product_id INT,
    amount DOUBLE
);
INSERT INTO employees (emp_id, emp_name) VALUES
(1, 'John'),
(2, 'Alice'),
(3, 'Bob'),
(4, 'David');
INSERT INTO sales (emp_id, product_id, amount) VALUES
(1, 101, 500),
(1, 102, 300),
(2, 103, 900),
(2, 105, 400),
(3, 104, 200),
(4, 106, 700),
(4, 107, 150);

SELECT e.emp_name,
       SUM(s.amount) AS total_sales
FROM employees e
JOIN sales s
    ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name
ORDER BY total_sales DESC
LIMIT 3;

