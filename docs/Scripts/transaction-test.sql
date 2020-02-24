-- Transaction Test
CREATE OR REPLACE PROCEDURE transaction_test() 
LANGUAGE plpgsql 
AS $$
DECLARE
BEGIN
  CREATE TABLE committed_table (id int);
  INSERT INTO committed_table VALUES (1);
  COMMIT;
  
  CREATE TABLE rollback_table (id int);
  INSERT INTO rollback_table VALUES (1);
  ROLLBACK;  
END $$;

call transaction_test();

select * from committed_table;
select * from rollback_table;