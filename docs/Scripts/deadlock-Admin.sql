-- Deadlock Demo
-- Admin and Arne run one transaction each
-- Both lock one record and try to update another at the same time, but disturb each other 
-- One of the transactions is killed

--Admin
begin transaction;
	select course_id, title, credits from course where course_id = '901' for update; -- explicit locking
	select pg_sleep(10);
	UPDATE course SET title = 'Databases for Developers' WHERE  course_id = '900';
	UPDATE course SET credits = 15 WHERE  course_id = '901';
commit;

-- rollback;

-----------------------------------------------------------------------
-- Deadlock analysis
SELECT S.pid, age(clock_timestamp(), query_start), query, L.mode, L.locktype FROM pg_stat_activity S
inner join pg_locks L on S.pid = L.pid order by L.granted, L.pid DESC;

-- Kill unresolvable deadlocks
SELECT pg_cancel_backend(12504)

-- See current locks