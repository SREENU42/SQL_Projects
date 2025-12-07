-- 4️⃣ Find products that were ordered more than 10 times in last month
-- Tables:
-- •	products(product_id, name)
-- •	orders(order_id, product_id, order_date)
-- 👉 Identify products with more than 10 orders in previous month.


CREATE DATABASE SHOP_DB;
USE SHOP_DB;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(50)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    order_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO products (product_id, name) VALUES
(1, 'Laptop'),
(2, 'Mobile'),
(3, 'Headphones'),
(4, 'Keyboard'),
(5, 'Monitor');

INSERT INTO orders (order_id, product_id, order_date) VALUES
-- Laptop Orders (12 orders in last month)
(1, 1, '2025-11-01'),
(2, 1, '2025-11-02'),
(3, 1, '2025-11-05'),
(4, 1, '2025-11-06'),
(5, 1, '2025-11-07'),
(6, 1, '2025-11-10'),
(7, 1, '2025-11-11'),
(8, 1, '2025-11-15'),
(9, 1, '2025-11-17'),
(10, 1, '2025-11-20'),
(11, 1, '2025-11-25'),
(12, 1, '2025-11-28'),

-- Mobile Orders (8 orders → should NOT appear)
(13, 2, '2025-11-01'),
(14, 2, '2025-11-03'),
(15, 2, '2025-11-05'),
(16, 2, '2025-11-10'),
(17, 2, '2025-11-13'),
(18, 2, '2025-11-15'),
(19, 2, '2025-11-18'),
(20, 2, '2025-11-27'),

-- Headphones (11 orders → should appear)
(21, 3, '2025-11-02'),
(22, 3, '2025-11-04'),
(23, 3, '2025-11-05'),
(24, 3, '2025-11-07'),
(25, 3, '2025-11-08'),
(26, 3, '2025-11-09'),
(27, 3, '2025-11-12'),
(28, 3, '2025-11-15'),
(29, 3, '2025-11-20'),
(30, 3, '2025-11-22'),
(31, 3, '2025-11-29');

SELECT p.product_id, p.name, COUNT(o.order_id) AS total_orders
FROM products p
JOIN orders o ON p.product_id = o.product_id
WHERE o.order_date BETWEEN
    DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH, '%Y-%m-01')
    AND LAST_DAY(CURDATE() - INTERVAL 1 MONTH)
GROUP BY p.product_id, p.name
HAVING COUNT(o.order_id) > 10;
