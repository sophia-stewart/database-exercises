USE employees;
SHOW TABLES;
DESCRIBE employees;
-- int, date, varchar, enum, and date are present in the employees table;
-- I think every table contains a numeric type column because they should all have integer primary keys;
-- I think the departments, employees, salaries, and titles tables contain a string type column because they would probably show the names of employees, titles, and/or departments;
-- I think the dept_emp, dept_manager, employees, salaries, and titles tables contain a date type column because they might contain information about hire dates, department change dates, or salary change dates;
-- The employees and departments tables contain data (emp_no and dept_no) that is combined in the dept_emp and dept_manager tables;
SHOW CREATE TABLE dept_manager;