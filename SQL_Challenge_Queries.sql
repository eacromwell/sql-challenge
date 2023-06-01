-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT
	x.emp_no,
	x.last_name,
	x.first_name,
	x.sex,
	y.salary
FROM employees x
LEFT JOIN salaries y
ON x.emp_no=y.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
	first_name,
	last_name,
	hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
	x.dept_no,
	y.dept_name,
	z.emp_no,
	z.first_name,
	z.last_name
FROM dept_manager x
LEFT JOIN employees z
ON x.emp_no=z.emp_no
LEFT JOIN departments y
ON x.dept_no=y.dept_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT
	x.dept_no,
	y.emp_no,
	y.last_name,
	y.first_name,
	z.dept_name
FROM employees y
LEFT JOIN dept_emp x
ON y.emp_no=x.emp_no
LEFT JOIN departments z
ON x.dept_no=z.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
	x.first_name,
	x.last_name,
	x.sex
FROM employees x
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
	x.emp_no,
	y.dept_name,
	z.last_name,
	z.first_name
FROM dept_emp x
LEFT JOIN departments y
ON x.dept_no=y.dept_no
LEFT JOIN employees z
ON x.emp_no=z.emp_no
WHERE y.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	x.emp_no,
	y.dept_name,
	z.last_name,
	z.first_name
FROM dept_emp x
LEFT JOIN departments y
ON x.dept_no=y.dept_no
LEFT JOIN employees z
ON x.emp_no=z.emp_no
WHERE y.dept_name = 'Sales' OR y.dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT
    last_name,
    COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;