-- Data Storage Analysis
select oid, datname from pg_database;
select * from pg_catalog.pg_database

SELECT ctid, * from student;
-- stid = (page#, index)
-- pages fixed size 8kB

SELECT ctid, * from student order by dept_name
create index stu on student(name)

-- all dbs
SELECT relname, relpages FROM pg_class ORDER BY relpages DESC;
-- num pages for student
SELECT relname, relpages FROM pg_class where relname='student';
-- num toast pages for student
SELECT reltoastrelid FROM pg_class WHERE relname = 'student';