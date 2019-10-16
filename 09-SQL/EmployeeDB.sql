create table departments (dept_no varchar(5), dept_name varchar(25))

create table dept_emp (emp_no int, dept_no varchar(5), from_date date, to_date date)

create table dept_manager (dept_no varchar(5), emp_no int, from_date date, to_date date)

create table employees (emp_no int primary key, birth_date date, first_name varchar(25), last_name varchar(25),
						gender char(1), hire_date date)
						
create table salaries (emp_no int, salary int, from_date date, to_date date)

create table titles (emp_no int, title varchar(25), from_date date, to_date date)

--List the details of each employee: employee number, last name, first name, gender, and salary.--

select salaries.emp_no, salary, last_name, first_name, gender
from salaries join employees on salaries.emp_no = employees.emp_no

--List employees who were hired in 1986.--

select last_name, first_name, hire_date
from employees
where hire_date between '01-01-1986' and '12-31-1986'

--List the manager of each department with the following information:department number, department name,--
--the manager's employee number, last name, first name, and start and end employment dates.--

select departments.dept_no, dept_name, employees.emp_no, last_name, first_name, from_date, to_date
from departments inner join dept_manager
ON departments.dept_no = dept_manager.dept_no
inner join employees
ON dept_manager.emp_no = employees.emp_no

--List the department of each employee with the following information: employee number, last name, first name, and department name.--

select dept_emp.emp_no, last_name, first_name, dept_name
from dept_emp inner join employees
ON dept_emp.emp_no = employees.emp_no
inner join departments
ON dept_emp.dept_no = departments.dept_no

--List all employees whose first name is "Hercules" and last names begin with "B."--

select first_name, last_name from employees
where first_name = 'Hercules' and last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.--

select dept_emp.emp_no, last_name, first_name, dept_name
from dept_emp inner join employees
on dept_emp.emp_no=employees.emp_no
inner join departments
on departments.dept_no=dept_emp.dept_no
where departments.dept_no = 'd007'

--List all employees in the Sales and Development departments, including their employee number,--
--last name, first name, and department name.--

select dept_emp.emp_no, last_name, first_name, dept_name
from dept_emp inner join employees
on dept_emp.emp_no=employees.emp_no
inner join departments
on departments.dept_no=dept_emp.dept_no
where departments.dept_no = 'd005' 
union 
select dept_emp.emp_no, last_name, first_name, dept_name
from dept_emp inner join employees
on dept_emp.emp_no=employees.emp_no
inner join departments
on departments.dept_no=dept_emp.dept_no
where departments.dept_no = 'd007'

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.--

select last_name,
count (employees.last_name) as last_name_frequency
from employees
group by last_name
order  by count (employees.last_name) desc;

-- Bonus--

select last_name, first_name, gender, hire_date, emp_no
from employees where emp_no = '499942'









