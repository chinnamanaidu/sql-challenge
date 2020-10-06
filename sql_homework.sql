
--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select emp.emp_no, emp.first_name, emp.last_name, emp.sex, sal.salary from employees emp, salaries sal where emp.emp_no=sal.emp_no
--2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date from employees where hire_date>='1986-01-01' and hire_date<='1986-12-31'

--3. List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.

select dep.dept_no, dep.dept_name, man.emp_no, man.last_name, man.first_name
from departments dep, dept_manager dept, employees man 
where dep.dept_no=dept.dept_no  and dept.emp_no=man.emp_no

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select  emp.emp_no, emp.last_name, emp.first_name, dep.dept_name 
from departments dep, dept_emp dept, employees emp 
where dep.dept_no=dept.dept_no  and dept.emp_no=emp.emp_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select emp.first_name, emp.last_name, emp.sex from employees emp where emp.first_name ='Hercules'  and emp.last_name like 'B%'


--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select  emp.emp_no, emp.last_name, emp.first_name, dep.dept_name 
from departments dep, dept_emp dept, employees emp 
where dep.dept_name='Sales' and dep.dept_no=dept.dept_no  and dept.emp_no=emp.emp_no

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, 
--and department name.

select  emp.emp_no, emp.last_name, emp.first_name, dep.dept_name 
from departments dep, dept_emp dept, employees emp 
where dep.dept_name in ('Sales', 'Development') and dep.dept_no=dept.dept_no  and dept.emp_no=emp.emp_no

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.	



select title, avg(salary) from employees emp, salaries sal, titles 
where emp.emp_no=sal.emp_no  and emp.emp_title_id=titles.title_id 
group by title


select emp.title, avg(salary) from 
(select emp.emp_no, (select title from titles where titles.title_id=emp.emp_title_id) title
from employees emp) emp, salaries where emp.emp_no=salaries.emp_no
group by title



select empl.last_name, count(*) NumSameLastName from employees empl group by empl.last_name order by 2 desc