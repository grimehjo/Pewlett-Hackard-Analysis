DROP TABLE employees CASCADE;

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Retirement eligibility

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Retirement eligibility

SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')

-- Retirement eligibility

SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring

SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

DROP TABLE retirement_info;

-- Create new table for retiring employees

SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Check the table

SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables

SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables

SELECT retirement_info.emp_no,
    retirement_info.first_name,
	retirement_info.last_name,
    dept_emp.to_date
	FROM retirement_info
	LEFT JOIN dept_emp
	ON retirement_info.emp_no = dept_emp.emp_no;
	
-- Joining retirement_info and dept_emp tables

SELECT ri.emp_no,
    ri.first_name,
ri.last_name,
    de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;

-- Joining departments and dept_manager tables

SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Employee count by department number

SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no;

-- Employee count by department number

SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT * FROM salaries;

SELECT * FROM salaries
ORDER BY to_date DESC;

SELECT emp_no, first_name, last_name
INTO retirement_dept
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT emp_no,
    first_name,
	last_name,
    gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01');
	 
-- List of managers per department

SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);
		
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

SELECT * FROM dept_info;
-- 
SELECT * FROM retirement_info;
-- 
SELECT * FROM departments;


SELECT ri.emp_no,
    ri.first_name,
    ri.last_name, d.dept_name


FROM retirement_info as ri
INNER JOIN dept_emp AS de
ON (ri.emp_no=de.emp_no)
INNER JOIN departments as d
ON (de.dept_no=d.dept_no)
WHERE d.dept_name ='Sales';


SELECT * FROM dept_info


WHERE dept_name = 'Sales';


SELECT * FROM dept_info;
-- 
SELECT * FROM retirement_info;
-- 
SELECT * FROM departments;


SELECT ri.emp_no,
    ri.first_name,
    ri.last_name, d.dept_name
INTO retirement_sales_dev
FROM retirement_info as ri
INNER JOIN dept_emp AS de
ON (ri.emp_no=de.emp_no)
INNER JOIN departments as d
ON (de.dept_no=d.dept_no)
WHERE d.dept_name IN ('Sales','Development');


SELECT DISTINCT ON (e.emp_no)  d.dept_name, e.emp_no 
INTO dep_title
FROM Employees as e
JOIN dept_emp as de
ON (e.emp_no=de.emp_no)
JOIN Departments as d on
de.dept_no = d.dept_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date ='9999-01-01')

SELECT dt.dept_name , t.title,  COUNT(dt.emp_no) 
INTO dept_title_retire
FROM dep_title as dt
JOIN Titles as t ON
dt.emp_no = t.emp_no
GROUP BY dept_name , t.title
;


SELECT DISTINCT ON (e.emp_no) dept_name, e.emp_no 
INTO dept_title_A
FROM Employees as e
JOIN dept_emp as de
ON (e.emp_no=de.emp_no)
join Departments as d on
de.dept_no = d.dept_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (de.to_date ='9999-01-01');
			   
SELECT dt.dept_name , title,  COUNT(dt.emp_no)
INTO dept_title_5255
FROM dept_title_A as dt
JOIN Titles t on
dt.emp_no = t.emp_no
GROUP BY dept_name , t.title;
