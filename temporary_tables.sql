-- TEMPORARY TABLES EXERCISES
USE employees;

-- 1. Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.
CREATE TEMPORARY TABLE hopper_1551.employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE to_date > CURDATE();

USE hopper_1551;

SELECT * FROM employees_with_departments;

SELECT database();

-- a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);

SHOW CREATE TABLE employees_with_departments;

SELECT * FROM employees_with_departments;

-- b. Update the table so that full name column contains the correct data
UPDATE employees_with_departments
SET full_name = CONCAT(first_name, last_name);

SELECT * FROM employees_with_departments;

-- c. Remove the first_name and last_name columns from the table.
ALTER TABLE employees_with_departments
DROP COLUMN first_name,
DROP COLUMN last_name;

SELECT * FROM employees_with_departments;

-- d. What is another way you could have ended up with this same table?

-- 2. Create a temporary table based on the payment table from the sakila database.
USE sakila;

CREATE TEMPORARY TABLE hopper_1551.payment AS
SELECT *
FROM payment;

USE hopper_1551;

SELECT DATABASE();

SELECT * FROM payment;

-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
SHOW CREATE TABLE payment;
ALTER TABLE payment MODIFY COLUMN amount DECIMAL(10,2);
UPDATE payment SET amount = amount*100;
ALTER TABLE payment MODIFY COLUMN amount INT;

-- 3. Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?