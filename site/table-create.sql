set linesize 1024;
CLEAR SCREEN;

DROP TABLE TESTSET;
CREATE TABLE TESTSET (ID NUMBER, OUTLOOK VARCHAR2(10), TEMPERATURE VARCHAR2(10), HUMIDITY VARCHAR2(10));


INSERT INTO TESTSET VALUES(1,'sunny', 'hot', 'high');
INSERT INTO TESTSET VALUES(2,'sunny', 'hot', 'high');
INSERT INTO TESTSET VALUES(3,'windy', 'hot', 'high');
INSERT INTO TESTSET VALUES(4,'overcast', 'mild', 'high');
INSERT INTO TESTSET VALUES(5,'overcast', 'cool', 'normal');
INSERT INTO TESTSET VALUES(6,'overcast', 'cool', 'normal');
INSERT INTO TESTSET VALUES(7,'windy', 'cool', 'normal');
INSERT INTO TESTSET VALUES(8,'sunny', 'mild', 'high');
INSERT INTO TESTSET VALUES(9,'sunny', 'cool', 'normal');
INSERT INTO TESTSET VALUES(10,'overcast', 'mild', 'normal');




COMMIT;

SELECT * FROM TESTSET;



