-- Isolation Levels Demo
-- Louise starts

-- First Case: READ COMMITTED
begin transaction isolation level read committed;
-- get this info
SELECT sum(credits) FROM course WHERE dept_name = 'Comp. Sci.';
-- Louise sees that the sum is 55

-- do something else for a while
select pg_sleep(15);

-- repeat the same query, still in the same transaction
SELECT sum(credits) FROM course WHERE dept_name = 'Comp. Sci.';
-- Louise sees another sum this time, as Arne has updated the table meanwhile :(
-- commit;

--------------------------------------------------------------------------------
-- Second Case: REPEATABLE READ
begin transaction isolation level repeatable read;
-- get this info
SELECT sum(credits) FROM course WHERE dept_name = 'Comp. Sci.';
-- Louise sees that the sum is 60

-- do something else for a while
select pg_sleep(15);

-- repeat the same query, still in the same transaction
SELECT sum(credits) FROM course WHERE dept_name = 'Comp. Sci.';
-- Louise sees the same sum this time, even that Arne has updated the table meanwhile :)
-- commit;

