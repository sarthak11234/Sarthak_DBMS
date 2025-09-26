DECLARE 
    R      NUMBER(3); 
    Bn     VARCHAR2(30); 
    Amt    NUMBER(6,2); 
    DOI    DATE; 
    DR     DATE := SYSDATE; 
    days   NUMBER; 
BEGIN 
    R := &R; 
    Bn := '&Bn'; 

    SELECT Date_of_Issue 
    INTO DOI 
    FROM borrower1 
    WHERE Roll_no = R AND NameOfBook = Bn AND Status = 'I';

    days := DR - DOI;

    IF days < 15 THEN 
        DBMS_OUTPUT.PUT_LINE('No fine'); 
        UPDATE borrower1  
        SET Status = 'R' 
        WHERE Roll_no = R AND NameOfBook = Bn; 
    END IF;

    IF days >= 15 AND days < 30 THEN
        Amt := days * 5;
        DBMS_OUTPUT.PUT_LINE('Fine: ' || Amt); 
        UPDATE borrower1  
        SET Status = 'R' 
        WHERE Roll_no = R AND NameOfBook = Bn; 
    END IF;

    IF days >= 30 THEN
        Amt := days * 50;
        DBMS_OUTPUT.PUT_LINE('Fine: ' || Amt); 
        UPDATE borrower1  
        SET Status = 'R' 
        WHERE Roll_no = R AND NameOfBook = Bn; 
    END IF;

    INSERT INTO fine1 (Roll_no, FineDate, Amt) 
    VALUES (R, DR, NVL(Amt,0));

    COMMIT;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No matching issued book found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
