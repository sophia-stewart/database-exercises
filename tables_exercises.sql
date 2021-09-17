USE employees;
SHOW TABLES;
DESCRIBE employees;
-- int, date, varchar, enum, and date are present in the employees table;
-- I think every table contains a numeric type column;
-- I think the departments, employees, salaries, and titles tables contain a string type column;
-- I think the dept_emp, dept_manager, employees, salaries, and titles tables contain a date type column;
-- The employees and departments tables contain data (emp_no and dept_no) that is combined in the dept_emp and dept_manager tables;
SHOW CREATE TABLE dept_manager;