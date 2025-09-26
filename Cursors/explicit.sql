SET SERVEROUTPUT ON;
DECLARE
   CURSOR c IS SELECT product_id,name FROM product;
   v_id product.product_id%TYPE; v_name product.name%TYPE;
BEGIN
   OPEN c;
   FETCH c INTO v_id, v_name;
   DBMS_OUTPUT.PUT_LINE(v_id||'-'||v_name);
   CLOSE c;
END;
/