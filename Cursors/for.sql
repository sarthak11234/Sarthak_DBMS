BEGIN
  FOR rec IN (SELECT product_id, name FROM product) LOOP
     DBMS_OUTPUT.PUT_LINE(rec.product_id || '-' || rec.name);
  END LOOP;
END;
/