-- 1. List the employee number, last name, first name, sex, and salary of each employee. 

SELECT e.emp_no AS "Employee Number", 
	   e.last_name AS "Last Name", 
	   e.first_name AS "First Name", 
	   e.sex AS "Sex", 
	   s.salary AS "Salary"
FROM employees e
JOIN salaries s
ON e.emp_no = s.salary;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986. 

SELECT e.first_name AS "First Name",
	   e.last_name AS "Last Name",
	   e.hire_date AS "Hire Date"
FROM employees e
WHERE e.hire_date > '12/31/1985' and e.hire_date < '1/1/1987'
ORDER BY e.hire_date ASC;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT dm.dept_no AS "Department Number", 
	   dep.dept_name AS "Department Name", 
	   dm.emp_no AS "Employee Number", 
	   e.last_name AS "Last Name", 
	   e.first_name AS "First Name"
FROM dept_manager dm
JOIN departments dep
ON dm.dept_no = dep.dept_no
JOIN employees e
ON dm.emp_no = e.emp_no


-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name. (dept_emp, employee, department)

SELECT de.dept_no AS "Department Number", 
	   de.emp_no AS "Employee Number", 
	   e.last_name AS "Last Name", 
	   e.first_name AS "First Name", 
	   dep.dept_name AS "Department Name"
FROM dept_emp de
JOIN employees e
ON de.emp_no = e.emp_no
JOIN departments dep
ON de.dept_no = dep.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT e.first_name AS "First Name",
	   e.last_name AS "Last Name",
	   e.sex AS "Sex"
FROM employees e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name. 

SELECT dep.dept_name AS "Department Name", 
	   de.emp_no AS "Employee Number", 
	   e.last_name AS "Last Name", 
	   e.first_name AS "First Name"
FROM departments dep
JOIN dept_emp de
ON dep.dept_no = de.dept_no
JOIN employees e
ON de.emp_no = e.emp_no
WHERE dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT dep.dept_name AS "Department Name", 
	   de.emp_no AS "Employee Number", 
	   e.last_name AS "Last Name", 
	   e.first_name AS "First Name"
FROM departments dep
JOIN dept_emp de
ON dep.dept_no = de.dept_no
JOIN employees e
ON de.emp_no = e.emp_no
WHERE dept_name = 'Sales' 
OR dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT e.last_name AS "Last Name", 
	   COUNT(e.last_name) AS "Count"
FROM employees e
GROUP BY e.last_name
ORDER BY COUNT(e.last_name) DESC;