DECLARE
   p NUMBER;  
   CURSOR c(p NUMBER) IS 
       SELECT name FROM product WHERE price > p;
BEGIN
   
   p := &price_value;

   FOR rec IN c(p) LOOP
      DBMS_OUTPUT.PUT_LINE(rec.name);
   END LOOP;
END;
/

