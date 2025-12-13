-- 🔟 Detect duplicate email IDs in a user table
-- Table: users(user_id, email)
-- 👉 Identify emails that appear more than once.

CREATE DATABASE Emails_DB;
USE Emails_DB;

CREATE TABLE users (
    user_id INT,
    email VARCHAR(100)
);
INSERT INTO users (user_id, email) VALUES
(1, 'a@gmail.com'),
(2, 'b@gmail.com'),
(3, 'a@gmail.com'),
(4, 'c@gmail.com'),
(5, 'b@gmail.com'),
(6, 'd@gmail.com');

SELECT 
    email,
    COUNT(*) AS duplicate_count
FROM users
GROUP BY email
HAVING COUNT(*) > 1;

