--Grab employee number, last name, first name, gender, and salary from tables


select emp.emp_no, last_name, first_name, gender, "Salary" from employees emp
join salaries sa
on emp.emp_no = sa.emp_no



--select every empoloyee who was hired in 1986
select * from employees
where hire_date > '1985-12-31'
and hire_date < '1987-12-01'




--Select every manager, their department, the department number, the manager's employee number, first, and last name, and their range of employments

select dm.dept_no, dept_name, dm.emp_no, last_name, first_name, from_date, to_date from dept_manager dm
join employees emp
on emp.emp_no = dm.emp_no
join public."Departments" dp
on dp.dept_no = dm.dept_no



--Select every employee, and return their id, first and last name, and department name

select de.emp_no, last_name, first_name, dept_name from dept_emp de
left join employees emp
on emp.emp_no = de.emp_no
left join  "Departments" dp
on dp.dept_no = de.dept_no




-- Select every employee who's first name is Hercules and last name starts with a BACKUP

select * from employees
where first_name = 'Hercules'
and last_name like 'B%'



--Select every employee in sales, and return their id, first and last name, and department name

select de.emp_no, last_name, first_name, dept_name from dept_emp de
left join employees emp
on emp.emp_no = de.emp_no
left join  "Departments" dp
on dp.dept_no = de.dept_no
where dept_name = 'Sales'


--Select every employee in sales or development, and return their id, first and last name, and department name


select de.emp_no, last_name, first_name, dept_name from dept_emp de
left join employees emp
on emp.emp_no = de.emp_no
left join  "Departments" dp
on dp.dept_no = de.dept_no
where dept_name = 'Sales'
or dept_name = 'Development'




--Show the count of all employee last names, and display them from most common to least common
select last_name, count(last_name) from employees
group by last_name
order by count(last_name) desc