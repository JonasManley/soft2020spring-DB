-- Create a list of all courses and their prerequisite courses
-- Suggest different solutions and prove which is better

explain analyze 
select distinct pc.course_id, c.title, c.dept_name, pc.prereq_id, p.title, p.dept_name 
from prereq as pc inner join course as c on pc.course_id = c.course_id
inner join prereq as pp inner join course as p on pp.prereq_id = p.course_id
on pc.course_id = pp.course_id 
where c.dept_name = 'Comp. Sci.' order by course_id;
	
explain analyze 
select distinct Course.course_id, c.title, c.credits, c.dept_name, Prereq.prereq_id, p.title, p.credits, p.dept_name 
from prereq as Course inner join prereq as Prereq on Course.course_id = Prereq.course_id
inner join course as c on Course.course_id = c.course_id
inner join course as p on Prereq.prereq_id = p.course_id
where c.dept_name = 'Comp. Sci.' order by course_id;

-- Create b-tree index on dept_name
create index dni on course(dept_name);
-- Does it help to the execution plan?

-- Create hash index (for = comparison only)
create index dnh on course using hash(dept_name)
-- Does it help to the execution plan?

create index cid on course(course_id)
create index pri on prereq(course_id)

-- Compare the following queries
explain analyze select * from student where name like 'Mathias' order by name
explain analyze select * from student where name like 'Mathias'
create index sti on student(name)
explain analyze select * from student where name like 'Mathias'

-- Explain how to find the name of the instructor who teaches Japanese during the fall semester of 2007
select name from instructor as i inner join teaches as t on i.id = t.id
inner join section as s on t.course_id=s.course_id and t.sec_id=s.sec_id and t.semester=s.semester
inner join course as c on s.course_id=c.course_id 
WHERE s.year = 2007 and s.semester = 'Fall' and c.title='Japanese';

-- Analyze indexes
select * from pg_settings
select * from pg_indexes where tablename='course'