    DROP VIEW SHOWTABLE;

    CREATE VIEW SHOWTABLE AS 
    SELECT ID, OUTLOOK, TEMPERATURE, HUMIDITY FROM TESTSET@site1;
    NATURAL JOIN DATASET;
    COMMIT;

    SELECT * FROM SHOWTABLE;