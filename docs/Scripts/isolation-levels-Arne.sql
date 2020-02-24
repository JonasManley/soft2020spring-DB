-- Isolation Levels Demo

--Arne updates the table "cource", while Louise's transaction is still in progress
begin transaction isolation level read committed;
select pg_sleep(5);
	SELECT sum(credits) FROM course WHERE dept_name = 'Comp. Sci.';
	-- INSERT INTO course VALUES ('903', 'AI', 'Comp. Sci.', 5);
	UPDATE course set credits = 10 WHERE course_id = '903';
commit;
