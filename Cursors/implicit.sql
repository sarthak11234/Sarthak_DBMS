DECLARE v_name product.name%TYPE;
BEGIN
   SELECT name INTO v_name
   FROM product
   WHERE product_id = 101;

   DBMS_OUTPUT.PUT_LINE('Product name = '|| v_name);

   IF SQL%FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Row found!');
   END IF;
END;
/
