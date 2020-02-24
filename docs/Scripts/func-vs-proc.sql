CREATE PROCEDURE procedure1(INOUT p1 TEXT) 
AS $$
BEGIN
	RAISE NOTICE 'Procedure Parameter: %', p1 ;
END ;
$$
LANGUAGE plpgsql ;

call procedure1('ptest');

CREATE FUNCTION function1(INOUT p1 TEXT) 
RETURNS TEXT
AS $$
BEGIN
    RAISE NOTICE 'Function Parameter: %', p1 ;
END ;
$$
LANGUAGE plpgsql ;

SELECT function1('ftest')