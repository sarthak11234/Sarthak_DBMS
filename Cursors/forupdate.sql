SET SERVEROUTPUT ON;

DECLARE
   CURSOR c IS 
      SELECT product_id, name, price
      FROM product
      FOR UPDATE;   -- lock rows

   v_id   product.product_id%TYPE;
   v_name product.name%TYPE;
   v_price product.price%TYPE;
BEGIN
   OPEN c;
   LOOP
      FETCH c INTO v_id, v_name, v_price;
      EXIT WHEN c%NOTFOUND;

      UPDATE product
      SET price = price * 1.1
      WHERE CURRENT OF c;

      DBMS_OUTPUT.PUT_LINE(LPAD(v_id || ' - ' || v_name || ' updated', 40));
   END LOOP;
   CLOSE c;

   COMMIT;
END;
/
