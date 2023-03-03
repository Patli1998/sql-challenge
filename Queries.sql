-- List employee Information--
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees 
INNER JOIN salaries 
ON employees.emp_no = salaries.emp_no;

-- List full name and hire date for 1986 --
SELECT employees.last_name, employees.first_name, employees.hire_date
FROM employees 
WHERE employees.hire_date > '1985-12-31' AND hire_date < '1987-01-01';

-- List of department manager with department info --
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON employees.emp_no = dept_manager.emp_no;

-- List of dept number for each employee with employee number and info --
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees 
ON dept_emp.emp_no = employees.emp_no;

-- List full name and sex of first name = Hercules and last name starting with the letter 'B' --
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%';
 
-- List each employee in the Sales department by full name and employee number --
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments 
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales';

--List employees in sales AND development departments, including full name department name and employee number --
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN departments
ON dept_emp.dept_no = departments.dept_no
JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'


-- List of frequency counts, in DESC order of all employees last names.(that is, how many employees share each last name)
SELECT employees.last_name, COUNT(employees.last_name) AS count_of_last_names
FROM employees
GROUP BY employees.last_name
ORDER BY count_of_last_names DESC;
