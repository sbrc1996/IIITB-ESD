-- Write a query to display the names of projects that Joyce English is working on.


select e.fname, e.lname, e.ssn, e.sex, w.hours, p.pname
from employee e
inner join works_on w
on e.ssn = w.essn
inner join project p
on w.pno = p.pnumber
where e.fname = 'Joyce' and e.lname = 'English';


-- Write a query to display the name of the employee along with the employee’s salary and the supervisor’s salary. (Do NOT use nested queries)


SELECT e.fname,e.minit,e.lname,m.fname,m.lname,e.salary,m.salary,e.ssn,m.ssn
from employee e
inner join employee m
on e.super_ssn = m.ssn;


-- Write a query to display the names of all the employees who are on bench (i.e., who are not working on any project).


with cte_not_working as (

	select e.ssn
	from employee e
	right JOIN works_on w
	on e.ssn = w.essn
	where w.essn is null
)

select * from employee where ssn in (select * from cte_not_working);


-- Show the result (NOT the query) of “EMPLOYEE left outer join DEPENDENT” (display only the key values from each of the tables). 


select *
from employee e
left join `dependent` d
on e.ssn = d.essn;

-- Write a query to display the ESSN of the employee who has clocked the maximum project hours.

with cte_hours_clocked as (
            select essn,sum(`hours`) as hours_clocked
            from works_on
            group by essn
)

select * from employee where ssn in (
                    select essn from cte_hours_clocked where hours_clocked in 
                                                                            (select max(hours_clocked) from cte_hours_clocked)
);

-- Write a query to show the name of employees who work on all the projects.

with cte_count_project as (
            select count(*) as cnt
            from project
) ,

cte_emp_ssn as (    select e.ssn, count(*) as no_of_projects_worked
                    from employee e
                    inner join works_on w
                    on e.ssn = w.essn
                    group by e.ssn
)


select * from employee where ssn in (
                                        select c.ssn
                                        from cte_emp_ssn c
                                        where c.no_of_projects_worked = (select cnt from cte_count_project)
);

Alternate:
select fname,lname from employee e inner join works_on w on e.ssn = w.essn  and w.pno = ALL (select distinct pnumber from project);

