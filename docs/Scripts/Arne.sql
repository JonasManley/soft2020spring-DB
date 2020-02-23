-- Demo of Use of Roles
-- In pgAdmin create a new Server, with a new name but connected to same localahost:5432
-- Logged in as Arne and take access to same database, which you created originally

-- Try to read a table 
SELECT * FROM public.course where course_id = '900';
__  Works!

-- Try to update a table
insert into course values('900', 'Databases', 'Comp. Sci.', 10);
--  Works!