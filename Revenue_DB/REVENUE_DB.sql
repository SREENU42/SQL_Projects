-- 8️⃣ Show monthly revenue for the past 12 months
-- Table: payments(payment_id, amount, payment_date)
-- 👉 Group by year + month and calculate monthly revenue.

CREATE DATABASE Revenue;
USE Revenue;

CREATE TABLE Payment(
payment_id INT NOT NULL,
amount DOUBLE ,
payment_date DATE
);

INSERT INTO Payment VALUES
(1, 100, '2024-01-10'),
(2, 150, '2024-02-15'),
(3, 200, '2024-02-20'),
(4, 300, '2024-03-05'),
(5, 250, '2023-12-28');

SELECT 
    YEAR(payment_date) AS revenue_year,
    MONTH(payment_date) AS revenue_month,
    SUM(amount) AS monthly_revenue
FROM Payment
GROUP BY 
    YEAR(payment_date),
    MONTH(payment_date)
ORDER BY 
    revenue_year,
    revenue_month;

