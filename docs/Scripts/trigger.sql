-- Trigger Example

-- Create table supervisor_changed as a log table for changed supervisors
-- If a student changes supervisor, activate a trigger to log it

-- create the log table
CREATE TABLE IF NOT EXISTS supervisor_changed 
(
   id SERIAL PRIMARY KEY,
   student_id VARCHAR(5) NOT NULL,
   instr_id VARCHAR(5)NOT NULL,
   changed_on TIMESTAMP(6) NOT NULL
);

-- create function to be executed as triggered event
CREATE OR REPLACE FUNCTION supervisor_changes()
  RETURNS trigger AS
$BODY$  
BEGIN
   IF NEW.i_id <> OLD.i_id THEN
       INSERT INTO supervisor_changed (student_id,instr_id,changed_on)
       VALUES(OLD.s_id,OLD.i_id,now());
   END IF;
 
   RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

-- create trigger
CREATE TRIGGER supervisor_changes
  BEFORE UPDATE of i_id ON advisor
  FOR EACH ROW
  EXECUTE PROCEDURE supervisor_changes();

-- test
UPDATE advisor SET i_id = '95030' WHERE s_id = '24746';

-- validate change
select * from advisor where s_id = '24746'


