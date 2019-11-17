--create table of number of titles retiring
select 	t.emp_no,
		ri.first_name,
		ri.last_name,
		t.title,
		t.from_date,
		s.salary
into number_of_titles_retiring
from titles as t

right join retirement_info as ri on ri.emp_no = t.emp_no
left join salaries as s on s.emp_no = ri.emp_no

-----------------------------------------------------------------
--list of retiring employees with same title
select last_from_date.title,
	   count(last_from_date.emp_no)
into retiring_employees_with_same_title
from
	(select *,
	 row_number() over (partition by emp_no order by from_date desc) as row_num
	 from number_of_titles_retiring) as last_from_date

where last_from_date.row_num = 1
group by last_from_date.title;

-----------------------------------------------------------------
--list of employees who are ready for a mentor
select 	e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		last_date.title as current_title,
		start_date.from_date as first_hire_date,
		last_date.to_date
into whos_ready_for_a_mentor		
from employees as e

left join (select *
		   from (select	emp_no,
				 		from_date,
				 		row_number() over (partition by emp_no order by from_date asc) as row_num
		   		 from titles) as first_start_date
		   where first_start_date.row_num = 1) as start_date
on start_date.emp_no = e.emp_no

left join (select *
		   from (select	emp_no,
				 		title,
				 		to_date,
				 		row_number() over (partition by emp_no order by to_date desc) as row_num
		   		 from titles) as last_to_date
		   where last_to_date.row_num = 1) as last_date
on last_date.emp_no = e.emp_no

where (e.birth_date between '1965-01-01' and '1965-12-31')
and (last_date.to_date = '9999-01-01')

order by e.emp_no asc;