-- Deadlock Demo
-- Admin and Arne run one transaction each
-- Both lock one record and try to update another at the same time, but disturb each other 
-- One of the transactions is killed

--Arne
begin transaction;
	select course_id, title, credits from course where course_id = '900' for update; -- explicit locking
	select pg_sleep(10);
	UPDATE course SET credits = 18 WHERE  course_id = '901';
	--UPDATE course SET dept_name = 'Comp. Sci.' WHERE  course_id = '900';
commit;

-- rollback;

