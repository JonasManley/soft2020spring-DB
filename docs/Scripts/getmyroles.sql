-- A function to list of all user-defined roles
CREATE OR REPLACE FUNCTION getmyroles()
RETURNS TABLE (rolename name, memberof name[])
AS $$
BEGIN
RETURN QUERY SELECT 
      r.rolname, 
      ARRAY(SELECT b.rolname
            FROM pg_catalog.pg_auth_members m
            JOIN pg_catalog.pg_roles b ON (m.roleid = b.oid)
            WHERE m.member = r.oid) as memberof
FROM pg_catalog.pg_roles r 			-- read all useres and roles
WHERE r.rolname NOT LIKE 'pg_%'	   -- exclude system users and roles
ORDER BY 1;						   -- sort by rolname
END; $$ 
LANGUAGE 'plpgsql';

----------------------------------------------------------------------
-- call the function
SELECT * FROM getmyroles();
SELECT * FROM getmyroles() where rolename = 'admin';

----------------------------------------------------------------------
-- See all roles and details
-- SELECT rolname FROM pg_roles;
SELECT * FROM pg_roles;



