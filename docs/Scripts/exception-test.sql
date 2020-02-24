-- A procedure that runs transaction, which includes exception control
-- If OK, commit, otherwise raise error message and rollback
create or replace procedure exception_test()
LANGUAGE plpgsql    
AS $$
begin 
	CREATE TEMP TABLE IF NOT EXISTS tabletemp 
	( 	dept text,
		build text,
	 	rooms int,
	 	seats int
	);
	-- Print out the number of rooms and seats per department and building
	INSERT INTO tabletemp 
		select d.dept_name, d.building, count(c.room_number), sum(capacity) from department d full join classroom c on d.building = c.building
		group by d.dept_name;
		-- commit;
exception when others then
    raise notice 'The transaction is in an uncommittable state. ';
    raise notice 'The error: --> % %', SQLERRM, SQLSTATE;
	rollback;
end;
$$;

--------------------------------------------------------------------
-- call the procedure
call exception_test();

-- see the commited operation
select * from tabletemp;

--------------------------------------------------------------------
-- Active transactions
SELECT xact_start, backend_xid, state, state_change FROM pg_stat_activity;

