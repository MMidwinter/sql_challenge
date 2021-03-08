-- This is item 1, joining the employee table with the salary table using emp_no as a foriegn ID
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
join salaries
	on salaries.emp_no = employees.emp_no;

-- This is for item 2, using a like string and wild card parameters to find employees hired in 1986
select first_name, last_name, hire_date
from employees
where hire_date like '%1986%';

--This is for item 3, joining the dept_manager table to both the departments and employee tables
select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name
from dept_manager
join departments
	on departments.dept_no = dept_manager.dept_no
join employees
	on employees.emp_no = dept_manager.emp_no;
	
--This section is for item 4, joining the dept_emp table to the department and employee tables. There will be some duplicate entries
-- As some employees work in multiple sections
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
join departments
	on departments.dept_no = dept_emp.dept_no
join employees
	on employees.emp_no = dept_emp.emp_no;
	
--This section is for item 5, where i did equal to hercules for the first name, and used a wildcard operator after B to find all
--last names starting with B
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

--This section is for item 6, using the code from item 4 i added a where filter to only show individuals in the sales department
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
join departments
	on departments.dept_no = dept_emp.dept_no
join employees
	on employees.emp_no = dept_emp.emp_no
where departments.dept_name = 'Sales';

--this section is for item 7, same code as 6 but added a or statement to include development
select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
join departments
	on departments.dept_no = dept_emp.dept_no
join employees
	on employees.emp_no = dept_emp.emp_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';

--This section is for item 8, list in decending order is the frequency of last names
select last_name, count(last_name) as Frequency
from employees
group by last_name
order by count(last_name) desc;

--Epilogue