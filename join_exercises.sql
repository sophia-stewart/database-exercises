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

-- Employees Database Exercises:
-- 1. Use the employees database.
USE employees;

-- 2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
SELECT d.dept_name AS 'department',
       CONCAT(e.first_name, ' ', e.last_name) AS 'current_manager'
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no AND dm.to_date > CURDATE()
JOIN departments AS d
  ON d.dept_no = dm.dept_no; 

-- 3. Find the name of all departments currently managed by women.
SELECT d.dept_name AS 'department'
FROM departments AS d
JOIN dept_manager AS dm
  ON dm.dept_no = d.dept_no AND dm.to_date > CURDATE()
JOIN employees AS e 
  ON e.emp_no = dm.emp_no AND e.gender = 'F'; 

-- 4. Find the current titles of employees currently working in the Customer Service department.
SELECT e.emp_no,
       CONCAT(e.first_name, ' ', e.last_name) AS 'full_name',
          t.title
FROM employees AS e
JOIN titles AS t
  ON t.emp_no = e.emp_no AND t.to_date > CURDATE()
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no AND de.to_date > CURDATE()
JOIN departments AS d
  ON d.dept_no = de.dept_no AND d.dept_name = 'Customer Service';

-- 5. Find the current salary of all current managers.
SELECT dm.emp_no,
       CONCAT(e.first_name, ' ', e.last_name) AS 'manager_name',
          s.salary AS 'current_salary'
FROM dept_manager AS dm
JOIN employees AS e
  ON e.emp_no = dm.emp_no
JOIN salaries AS s
  ON s.emp_no = dm.emp_no AND s.to_date > CURDATE()
WHERE dm.to_date > CURDATE();

-- 6. Find the number of current employees in each department.
SELECT COUNT(DISTINCT de.emp_no) AS 'number_of_employees',
       d.dept_name AS 'department'
FROM dept_emp AS de
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date > CURDATE()
GROUP BY d.dept_name;

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
SELECT d.dept_name,
       de.emp_no,
       CONCAT(e.first_name, ' ', e.last_name) AS 'full_name',
          s.salary
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
SELECT dm.emp_no,
       CONCAT(e.first_name, ' ', e.last_name) AS 'manager_name',
          s.salary
FROM employees AS e
JOIN dept_manager AS dm
  ON dm.emp_no = e.emp_no AND dm.to_date > CURDATE()
JOIN salaries AS s
  ON s.emp_no = dm.emp_no AND s.to_date > CURDATE()
ORDER BY s.salary DESC
LIMIT 1;
-- Vishwani Minakawa is the current department manager with the highest salary.

-- 10. Bonus: Find the names of all current employees, their department name, and their current manager's name.


-- 11. Bonus: Who is the highest paid employee within each department?
