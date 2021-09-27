set linesize 1024;
CLEAR SCREEN;

DROP TABLE DATA;
CREATE TABLE DATA (ID NUMBER, OUTLOOK VARCHAR2(10), TEMPERATURE VARCHAR2(10), HUMIDITY VARCHAR2(10), RAIN VARCHAR2(10));


INSERT INTO DATA VALUES(1,'sunny', 'hot', 'high', 'yes');
INSERT INTO DATA VALUES(2,'sunny', 'hot', 'high', 'yes');
INSERT INTO DATA VALUES(3,'windy', 'hot', 'high', 'no');
INSERT INTO DATA VALUES(4,'overcast', 'mild', 'high', 'no');
INSERT INTO DATA VALUES(5,'overcast', 'cool', 'normal', 'no');
INSERT INTO DATA VALUES(6,'overcast', 'cool', 'normal', 'no');
INSERT INTO DATA VALUES(7,'windy', 'cool', 'normal', 'no');
INSERT INTO DATA VALUES(8,'sunny', 'mild', 'high', 'yes');
INSERT INTO DATA VALUES(9,'sunny', 'cool', 'normal', 'no');
INSERT INTO DATA VALUES(10,'overcast', 'mild', 'normal', 'no');
INSERT INTO DATA VALUES(11,'sunny', 'mild', 'normal', 'no');
INSERT INTO DATA VALUES(12,'windy', 'mild', 'high', 'no');
INSERT INTO DATA VALUES(13,'windy', 'hot', 'normal', 'no');
INSERT INTO DATA VALUES(14,'overcast', 'mild', 'high', 'yes');

COMMIT;

SELECT * FROM DATA;





