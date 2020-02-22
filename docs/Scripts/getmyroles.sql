-- List of all user-defined roles
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
FROM pg_catalog.pg_roles r
WHERE r.rolname NOT LIKE 'pg_%'
ORDER BY 1;
END; $$ 
LANGUAGE 'plpgsql';

-- call the function
SELECT * FROM getmyroles();

SELECT * FROM getmyroles() where rolename = 'arne';

