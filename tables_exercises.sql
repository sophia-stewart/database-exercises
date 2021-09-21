-- TABLES EXERCISES

-- 3. Use the employees database 
USE employees;

-- 4. List all the tables in the database
SHOW TABLES;

-- 5. Explore the employees table. What different data types are present on this table?
DESCRIBE employees;
-- int, date, varchar, enum, and date are present in the employees table;

-- 6. Which table(s) do you think contain a numeric type column?
-- I think every table contains a numeric type column because they should all have integer primary keys;

-- 7. Which table(s) do you think contain a string type column?
-- I think the departments, employees, salaries, and titles tables contain a string type column because they would probably show the names of employees, titles, and/or departments;

-- 8. Which table(s) do you think contain a date type column?
-- I think the dept_emp, dept_manager, employees, salaries, and titles tables contain a date type column because they might contain information about hire dates, department change dates, or salary change dates;

-- 9. What is the relationship between the employees and the departments tables?
-- The employees and departments tables contain data (emp_no and dept_no) that is combined in the dept_emp and dept_manager tables;

-- 10. Show the SQL that created the dept_manager table.
SHOW CREATE TABLE dept_manager;