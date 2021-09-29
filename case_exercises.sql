-- CASE EXERCISES
USE employees;

-- 1. Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.
/*
-- work/thought process to get to final result:
SELECT DISTINCT emp_no, MIN(from_date) AS start_date, MAX(to_date) AS end_date, 
	CASE
		WHEN MAX(to_date) > CURDATE()
			THEN 1
		ELSE 0
	END AS is_current_employee
FROM dept_emp
GROUP BY emp_no;
-- need to figure out how to include dept_no
-- includes dept_no but also shows duplicate entries for employees:
SELECT emp_no, dept_no, MIN(from_date) AS start_date, MAX(to_date) AS end_date,
	CASE
		WHEN MAX(to_date) > CURDATE()
			THEN 1
		ELSE 0
	END AS is_current_employee
FROM dept_emp
GROUP BY emp_no, dept_no;
-- same as:
SELECT emp_no, dept_no, from_date, to_date,
	CASE
		WHEN to_date > CURDATE()
			THEN 1
		ELSE 0
	END AS is_current_employee
FROM dept_emp;
-- use temp table to work around duplicate employee entries
CREATE TEMPORARY TABLE hopper_1551.current_employees AS
SELECT DISTINCT emp_no, MIN(from_date) AS start_date, MAX(to_date) AS end_date, 
	CASE
		WHEN MAX(to_date) > CURDATE()
			THEN 1
		ELSE 0
	END AS is_current_employee
FROM dept_emp
GROUP BY emp_no;
SELECT * FROM hopper_1551.current_employees;
*/
-- Final result:
SELECT ce.emp_no, dept_no, start_date, end_date, is_current_employee
FROM hopper_1551.current_employees AS ce
JOIN employees.dept_emp AS de
  ON de.emp_no = ce.emp_no WHERE to_date IN(ce.end_date);

-- 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
SELECT CONCAT(first_name, ' ', last_name) as full_name,
	CASE
		WHEN SUBSTR(last_name, 1, 1) BETWEEN 'A' AND 'H'
			THEN 'A-H'
		WHEN SUBSTR(last_name, 1, 1) BETWEEN 'I' AND 'Q'
			THEN 'I-Q'
		ELSE 'R-Z'
	END AS alpha_group
FROM employees;

-- 3. How many employees (current or previous) were born in each decade?
SELECT MIN(birth_date), MAX(birth_date) FROM employees;
-- employee birth years range from 1952-1965
SELECT COUNT('birth_decade'),
	CASE
		WHEN birth_date LIKE '195%'
			THEN '1950s'
		ELSE '1960s'
	END AS birth_decade
FROM employees
GROUP BY birth_decade;
-- 182,886 employees were born in the 1950s and 117,138 employees were born in the 1960s.

-- BONUS EXERCISE:
-- What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT 
	CASE
		WHEN dept_name IN ('research', 'development')
			THEN 'R & D'
		WHEN dept_name IN ('finance', 'human resources')
			THEN 'Finance & HR'
		WHEN dept_name IN ('sales', 'marketing')
			THEN 'Sales & Marketing'
		WHEN dept_name IN ('Production', 'Quality Management')
			THEN 'Prod & QM'
		ELSE 'Customer Service'
	END AS dept_group,
	ROUND(avg(salary), 2) AS avg_salary
FROM departments
JOIN dept_emp USING(dept_no)
JOIN salaries USING(emp_no)
WHERE salaries.to_date > CURDATE()
AND dept_emp.to_date > CURDATE()
GROUP BY dept_group;