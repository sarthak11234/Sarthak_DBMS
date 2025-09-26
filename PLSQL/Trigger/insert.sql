CREATE OR REPLACE TRIGGER insert_trigger
BEFORE INSERT ON clientmaster
FOR EACH ROW
BEGIN
    INSERT INTO insertbackup(srno, name)
    VALUES (:NEW.srno, :NEW.name || ' (INSERTED)');
END;
/
