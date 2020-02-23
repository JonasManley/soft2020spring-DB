-- Demo of Use of Roles
-- In pgAdmin create a new Server, with a new name but connected to same localahost:5432
-- Logged in as Louise and take access to same database, which you created originally

-- Try to read a table 
select * from student;
__  Works!

-- Try to update a table
update instructor set salary = 10000 where id = '63395';
-- You get message ERROR:  permission denied for table instructor SQL state: 42501

