-- Show departments where more than 5 employees joined this year
-- Table: employees(emp_id, name, dept, join_date)
-- 👉 Count department-wise employees who joined in the current year, and return only those with count > 5.

CREATE DATABASE EMPLOYEEDB;
USE EMPLOYEEDB;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    dept VARCHAR(100),
    join_date DATE
);

INSERT INTO employees VALUES
(1, 'Arun', 'IT', '2025-01-10'),
(2, 'Sree', 'IT', '2025-02-15'),
(3, 'Keerthana', 'IT', '2025-03-01'),
(4, 'Ravi', 'IT', '2025-03-12'),
(5, 'Bhanu', 'IT', '2025-05-20'),
(6, 'Manoj', 'IT', '2025-06-22'),
(7, 'Kiran', 'HR', '2025-01-05'),
(8, 'Priya', 'HR', '2024-11-01');

SELECT * FROM employees;

SELECT dept, COUNT(*) AS total_employees
FROM employees
WHERE YEAR(join_date) = YEAR(CURDATE())
GROUP BY dept
HAVING COUNT(*) > 5;