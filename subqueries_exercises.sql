-- SUBQUERY EXERCISES
USE employees;

-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
SELECT *
FROM employees
JOIN dept_emp USING(emp_no)
WHERE hire_date = (
SELECT hire_date
FROM employees
WHERE emp_no = 101010
)
AND to_date > CURDATE();

-- 2. Find all the titles ever held by all current employees with the first name Aamod.
SELECT emp_no, title, CONCAT(first_name, ' ', last_name) AS full_name, titles.from_date, titles.to_date
FROM titles
JOIN dept_emp USING(emp_no)
JOIN employees USING(emp_no)
WHERE emp_no IN (
SELECT emp_no
FROM employees
WHERE first_name = 'Aamod'
)
AND dept_emp.to_date > CURDATE();
-- Shows every title ever held by each individual employee with the first name 'Aamod'
SELECT title
FROM titles
JOIN dept_emp USING(emp_no)
JOIN employees USING(emp_no)
WHERE emp_no IN (
SELECT emp_no
FROM employees
WHERE first_name = 'Aamod'
)
AND dept_emp.to_date > CURDATE()
GROUP BY title;
-- List of titles that have ever been held by employees with the first name 'Aamod'
-- Could also use DISTINCT in lieu of GROUP BY

-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SELECT COUNT(*)
FROM (
SELECT *
FROM employees
WHERE emp_no IN (
SELECT emp_no
FROM dept_emp
GROUP BY emp_no
HAVING MAX(to_date) < CURDATE()
)) AS u;
-- 59,900 people in the employees table are no longer working for the company.
/*
Could also use NOT IN instead of GROUP BY/HAVING:
SELECT COUNT(*)
FROM (
SELECT *
FROM employees
WHERE emp_no NOT IN (
SELECT emp_no
FROM dept_emp
WHERE to_date > CURDATE()
)) AS u;
*/

-- 4. Find all the current department managers that are female. List their names in a comment in your code.
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
JOIN dept_manager USING(emp_no)
WHERE emp_no IN (
SELECT emp_no
FROM employees
WHERE gender = 'F'
)
AND to_date > CURDATE();
/*
Isamu Legleitner
Karsten Sigstam
Leon DasSarma
Hilary Kambil
*/

-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SELECT emp_no, first_name, last_name, salary
FROM employees
JOIN salaries USING(emp_no)
WHERE salary > (
SELECT avg(salary)
FROM salaries
)
AND to_date > CURDATE();
-- 63810.7448 is the overall, historical average salary, including current salaries.

-- 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
SELECT COUNT(*)
FROM (
SELECT *
FROM salaries
WHERE salary > (
(SELECT MAX(salary)
FROM salaries WHERE to_date > CURDATE()) - (SELECT STDDEV(salary)
FROM salaries WHERE to_date > CURDATE()))
AND to_date > CURDATE()
) AS s;
-- There are 83 current salaries within 1 standard deviation of the current highest salary.

SELECT STDDEV(salary)
FROM salaries WHERE to_date > CURDATE();

SELECT CAST(
((SELECT COUNT(*)
FROM (
SELECT *
FROM salaries
WHERE salary > (
(SELECT MAX(salary)
FROM salaries WHERE to_date > CURDATE()) - (SELECT STDDEV(salary)
FROM salaries WHERE to_date > CURDATE()))
AND to_date > CURDATE()
) AS s) / (SELECT COUNT(*)
FROM salaries WHERE to_date > CURDATE())) AS DECIMAL(65, 10));
-- More simply:
SELECT CAST((83 / 240124) AS DECIMAL(65, 10));
-- ~.0346% of all current salaries in the salaries table are within 1 standard deviation of the current highest salary

SELECT CAST(
((SELECT COUNT(*)
FROM (
SELECT *
FROM salaries
WHERE salary > (
(SELECT MAX(salary)
FROM salaries WHERE to_date > CURDATE()) - (SELECT STDDEV(salary)
FROM salaries WHERE to_date > CURDATE()))
AND to_date > CURDATE()
) AS s) / (SELECT COUNT(*)
FROM salaries)) AS DECIMAL(65, 10));
-- More simply:
SELECT CAST((83 / 2844047) AS DECIMAL(65, 10));
-- ~.0029% of all salaries in the salaries table are within 1 standard deviation of the current highest salary


-- BONUS EXERCISES

-- 1. Find all the department names that currently have female managers.
SELECT dept_name
FROM departments
JOIN dept_manager USING(dept_no)
WHERE emp_no IN (
SELECT emp_no
FROM employees
WHERE gender = 'F'
)
AND to_date > CURDATE();
/*
Finance
Human Resources
Development
Research
*/

-- 2. Find the first and last name of the employee with the highest salary.
SELECT first_name, last_name
FROM employees
WHERE emp_no = (
SELECT emp_no
FROM salaries
GROUP BY emp_no
ORDER BY MAX(salary) DESC
LIMIT 1);
-- Tokuyasu Pesch

-- 3. Find the department name that the employee with the highest salary works in.
SELECT dept_name
FROM departments
JOIN dept_emp USING(dept_no)
WHERE emp_no = (
SELECT emp_no
FROM salaries
GROUP BY emp_no
ORDER BY MAX(salary) DESC
LIMIT 1);
-- Sales