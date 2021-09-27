DECLARE 
    R NUMBER (10,2);
BEGIN
    R:= normalizeYes(100,5);
    
    dbms_output.put_line(R);
   
END;
/
