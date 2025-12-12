-- 9️⃣ Find employees whose salary increased compared to previous year
-- Tables:
-- •	salary_history(emp_id, year, salary)
-- 👉 Compare latest year's salary with previous year.
CREATE DATABASE SALARY_HISTORY_DB;
USE SALARY_HISTORY_DB;

CREATE TABLE salary_history(
emp_id INT ,
year YEAR,
salary DOUBLE
);

INSERT INTO salary_history(emp_id, year, salary) VALUES
(101, 2020, 45000),
(101, 2021, 47000),
(101, 2022, 52000),
(102, 2020, 30000),
(102, 2021, 32000),
(102, 2022, 35000);

SELECT 
    s1.emp_id,
    s1.year AS current_year,
    s1.salary AS current_salary,
    s2.year AS previous_year,
    s2.salary AS previous_salary
FROM salary_history s1
JOIN salary_history s2
    ON s1.emp_id = s2.emp_id
    AND s1.year = s2.year + 1
WHERE s1.salary > s2.salary;


