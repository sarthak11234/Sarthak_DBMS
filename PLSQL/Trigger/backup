CREATE OR REPLACE TRIGGER backup_trigger
BEFORE UPDATE OR DELETE ON clientmaster
FOR EACH ROW
BEGIN
    INSERT INTO audi(srno, name)
    VALUES (:OLD.srno, :OLD.name || ' (BACKUP)');
END;
/
