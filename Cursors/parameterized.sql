DECLARE
   CURSOR c(p NUMBER) IS SELECT name FROM product WHERE price > p;
BEGIN
   FOR rec IN c(500) LOOP
      DBMS_OUTPUT.PUT_LINE(rec.name);
   END LOOP;
END;
/
