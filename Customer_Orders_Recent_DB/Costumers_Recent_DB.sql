--  Get each customer’s most recent order
-- Tables:
-- •	orders(order_id, customer_id, order_date, amount)
-- 👉 For each customer, return latest order using a window function.

CREATE DATABASE Orders_DB;
USE Orders_DB;

DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders(
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    order_date DATE,
    amount FLOAT
);

INSERT INTO Orders VALUES
(101, 1, '2024-01-10', 500),
(102, 1, '2024-02-15', 700),
(103, 1, '2024-03-05', 600),

(201, 2, '2024-01-12', 300),
(202, 2, '2024-03-10', 900),

(301, 3, '2024-02-01', 400);

SELECT *
FROM (
    SELECT 
        order_id,
        customer_id,
        order_date,
        amount,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id 
            ORDER BY order_date DESC
        ) AS rn
    FROM Orders
) AS t
WHERE rn = 1;



