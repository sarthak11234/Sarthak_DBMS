CREATE OR REPLACE TRIGGER udateclient_v1
BEFORE UPDATE OR DELETE ON clientmaster 
FOR EACH ROW
BEGIN
   IF UPDATING THEN
      INSERT INTO audi VALUES(:old.srno, :old.name || ' (UPDATED)');
   ELSIF DELETING THEN
      INSERT INTO audi VALUES(:old.srno, :old.name || ' (DELETED)');
   END IF;
END;
/
