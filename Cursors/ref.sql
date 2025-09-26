DECLARE
   TYPE rc IS REF CURSOR; c rc;
   v_name product.name%TYPE;
BEGIN
   OPEN c FOR SELECT name FROM product;
   FETCH c INTO v_name;
   DBMS_OUTPUT.PUT_LINE(v_name);
   CLOSE c;
END;
/
