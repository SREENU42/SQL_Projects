-- 3.Get customers who never placed any order
-- Tables:
-- •	customers(customer_id, name)
-- •	orders(order_id, customer_id, amount)
-- 👉 Find all customers who did NOT order anything.


CREATE DATABASE CUSTOMER_DB;
USE CUSTOMER_DB;

CREATE TABLE customers (
customer_id INT Primary Key,
name Varchar(20)
);
CREATE TABLE orders (
order_id INT,
customer_id INT Not Null,
amount DOUBLE
);

INSERT INTO customers VALUES
(1, 'Ram'),
(2, 'Sita'),
(3, 'Ravi'),
(4, 'Teja');

INSERT INTO orders VALUES
(101, 1, 500),
(102, 3, 1200);

SELECT c.customer_id, c.name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

SELECT * FROM customers;