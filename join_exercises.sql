-- JOIN EXERCISES

-- Join Example Database Exercises:
-- 1. Use the join_example_db. Select all the records from both the users and roles tables.
USE join_example_db;

SELECT *
FROM users
JOIN roles ON users.role_id = roles.id;

-- 2. Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
-- guess: 4 results
SELECT *
FROM users
JOIN roles ON users.role_id = roles.id;

-- guess: 6 results
SELECT *
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

-- guess: 4 results
SELECT *
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

-- 3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.
SELECT roles.name AS 'role',
       COUNT(users.role_id) AS 'number_of_users'
FROM users
RIGHT JOIN roles ON users.role_id = roles.id
GROUP BY roles.id;

-- 

-- Employees Database Exercises:
-- 1. Use the employees database.
USE employees;

-- 2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
SELECT d.dept_name AS 'Department Name',
       CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM departments AS d
JOIN dept_manager AS dm
  ON dm.dept_no = d.dept_no AND dm.to_date > CURDATE()
JOIN employees AS e
  ON e.emp_no = dm.emp_no
ORDER BY d.dept_name; 

-- 3. Find the name of all departments currently managed by women.
SELECT d.dept_name AS 'Department Name',
       CONCAT(e.first_name, ' ', e.last_name) AS 'Manager Name'
FROM departments AS d
JOIN dept_manager AS dm
  ON dm.dept_no = d.dept_no AND dm.to_date > CURDATE()
JOIN employees AS e
  ON e.emp_no = dm.emp_no AND e.gender = 'F'
ORDER BY d.dept_name;

-- 4. Find the current titles of employees currently working in the Customer Service department.
SELECT t.title AS 'Title',
       COUNT(t.title) AS 'Count'
FROM titles AS t
JOIN dept_emp AS de
  ON de.emp_no = t.emp_no AND de.to_date > CURDATE()
JOIN departments AS d
  ON d.dept_no = de.dept_no AND d.dept_name = 'Customer Service'
WHERE t.to_date > CURDATE()
GROUP BY t.title
ORDER BY t.title;

-- 5. Find the current salary of all current managers.
SELECT d.dept_name AS 'Department Name',
       CONCAT(e.first_name, ' ', e.last_name) AS 'Name',
          s.salary AS 'Salary'
FROM departments AS d
JOIN dept_manager AS dm
  ON dm.dept_no = d.dept_no AND dm.to_date > CURDATE()
JOIN employees AS e
USING(emp_no)
JOIN salaries AS s
  ON s.emp_no = dm.emp_no AND s.to_date > CURDATE()
ORDER BY d.dept_name;

-- 6. Find the number of current employees in each department.
SELECT d.dept_no,
       d.dept_name,
       COUNT(DISTINCT de.emp_no) AS 'number_of_employees'
FROM dept_emp AS de
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date > CURDATE()
GROUP BY d.dept_name
ORDER BY d.dept_no;

-- 7. Which department has the highest average salary? Hint: Use current not historic information.
SELECT d.dept_name,
       AVG(s.salary) AS 'avg_salary'
FROM departments AS d
JOIN dept_emp AS de
  ON d.dept_no = de.dept_no AND de.to_date > CURDATE()
JOIN salaries AS s
  ON s.emp_no = de.emp_no AND s.to_date > CURDATE()
GROUP BY d.dept_name
ORDER BY avg_salary DESC
LIMIT 1;
-- Sales has the highest average salary.

-- 8. Who is the highest paid employee in the Marketing department?
SELECT first_name,
       last_name
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no AND de.to_date > CURDATE()
JOIN departments AS d
  ON d.dept_no = de.dept_no AND d.dept_name = 'Marketing'
JOIN salaries AS s
  ON s.emp_no = de.emp_no AND s.to_date > CURDATE()
ORDER BY s.salary DESC
LIMIT 1;
-- Akemi Warwick is the highest paid employee in the Marketing department.

-- 9. Which current department manager has the highest salary?
SELECT e.first_name,
       e.last_name,
       s.salary,
          d.dept_name
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no AND dm.to_date > CURDATE()
JOIN departments AS d
  ON d.dept_no = dm.dept_no
JOIN salaries AS s
  ON s.emp_no = dm.emp_no AND s.to_date > CURDATE()
ORDER BY s.salary DESC
LIMIT 1;
-- Vishwani Minakawa is the current department manager with the highest salary.

-- 10. Bonus: Find the names of all current employees, their department name, and their current manager's name.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee',
       d.dept_name AS 'Department',
           CONCAT(m.first_name, ' ', m.last_name) AS 'Manager'
FROM employees AS m
JOIN dept_emp AS de
USING(emp_no)
JOIN departments AS d
USING(dept_no)
JOIN dept_manager AS dm
USING(dept_no)
JOIN employees AS e
  ON e.emp_no = de.emp_no
WHERE de.to_date > CURDATE()
AND dm.to_date > CURDATE();

-- 11. Bonus: Who is the highest paid employee within each department?
