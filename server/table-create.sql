set linesize 1024;
CLEAR SCREEN;

DROP TABLE DATASET;
CREATE TABLE DATASET (ID NUMBER, OUTLOOK VARCHAR2(10), TEMPERATURE VARCHAR2(10), HUMIDITY VARCHAR2(10), RAIN VARCHAR2(10));


INSERT INTO DATASET VALUES(1,'sunny', 'hot', 'high', 'yes');
INSERT INTO DATASET VALUES(2,'sunny', 'hot', 'high', 'yes');
INSERT INTO DATASET VALUES(3,'windy', 'hot', 'high', 'no');
INSERT INTO DATASET VALUES(4,'overcast', 'mild', 'high', 'no');
INSERT INTO DATASET VALUES(5,'overcast', 'cool', 'normal', 'no');
INSERT INTO DATASET VALUES(6,'overcast', 'cool', 'normal', 'no');
INSERT INTO DATASET VALUES(7,'windy', 'cool', 'normal', 'no');
INSERT INTO DATASET VALUES(8,'sunny', 'mild', 'high', 'yes');
INSERT INTO DATASET VALUES(9,'sunny', 'cool', 'normal', 'no');
INSERT INTO DATASET VALUES(10,'overcast', 'mild', 'normal', 'no');
INSERT INTO DATASET VALUES(11,'sunny', 'mild', 'normal', 'no');
INSERT INTO DATASET VALUES(12,'windy', 'mild', 'high', 'no');
INSERT INTO DATASET VALUES(13,'windy', 'hot', 'normal', 'no');
INSERT INTO DATASET VALUES(14,'overcast', 'mild', 'high', 'yes');

COMMIT;

SELECT * FROM DATASET;





