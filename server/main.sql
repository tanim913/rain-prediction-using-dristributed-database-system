SET SERVEROUTPUT ON;
SET VERIFY OFF;
--@"E:\All materials DDS lab\pl-sql\normalizeYes.sql";
--@"E:\All materials DDS lab\pl-sql\normalizeNo.sql"
CLEAR SCREEN;
DECLARE
    yes_count NUMBER := 0;
    no_count NUMBER := 0; 
    syc NUMBER := 0;
    snc NUMBER := 0;
    wyc NUMBER := 0;
    wnc NUMBER := 0;
    oyc NUMBER := 0;
    onc NUMBER := 0;
    hyc NUMBER := 0;
    hnc NUMBER := 0;
    myc NUMBER := 0;
    mnc NUMBER := 0;
    cyc NUMBER := 0;
    cnc NUMBER := 0;
    eyc NUMBER := 0;
    enc NUMBER := 0;
    nyc NUMBER := 0;
    nnc NUMBER := 0;
    p_yes NUMBER (10,3);
    p_no NUMBER (10,3);
    p_sunny_yes NUMBER (10,3);
    p_sunny_no NUMBER (10,3);
    p_windy_yes NUMBER (10,3);
    p_windy_no NUMBER (10,3);
    p_overcast_yes NUMBER (10,3);
    p_overcast_no NUMBER (10,3);
    p_hot_yes NUMBER (10,3);
    p_hot_no NUMBER (10,3);
    p_mild_yes NUMBER (10,3);
    p_mild_no NUMBER (10,3);
    p_cool_yes NUMBER (10,3);
    p_cool_no NUMBER (10,3);
    p_high_yes NUMBER (10,3);
    p_high_no NUMBER (10,3);
    p_normal_yes NUMBER (10,3);
    p_normal_no NUMBER (10,3);
    dataset_count NUMBER ;
    testset_count NUMBER :=0;
    random_testcase NUMBER(3,0);
    f_random NUMBER(3,0);

    pnb_yes NUMBER (10,3);
    pnb_no NUMBER (10,3);


    final_probability_yes NUMBER (10,3);
    final_probability_no NUMBER (10,3);
    

    out_l VARCHAR2(10);
    temp VARCHAR2(10);
    hum VARCHAR2(10);
    rain_prediction VARCHAR2(10);
    actual_data VARCHAR2(10);

    not_getting_test_count EXCEPTION;



BEGIN
    
    --select count (id) from dataset where rain = 'yes';
    SELECT COUNT(*) INTO yes_count FROM DATASET WHERE RAIN = 'yes';
    SELECT COUNT(*) INTO no_count FROM DATASET WHERE RAIN = 'no';
    SELECT COUNT(*) INTO syc FROM DATASET WHERE RAIN = 'yes' AND OUTLOOK = 'sunny';
    SELECT COUNT(*) INTO snc FROM DATASET WHERE RAIN = 'no' AND OUTLOOK = 'sunny';
    SELECT COUNT(*) INTO wyc FROM DATASET WHERE RAIN = 'yes' AND OUTLOOK = 'windy';
    SELECT COUNT(*) INTO wnc FROM DATASET WHERE RAIN = 'no' AND OUTLOOK = 'windy';
    SELECT COUNT(*) INTO oyc FROM DATASET WHERE RAIN = 'yes' AND OUTLOOK = 'overcast';
    SELECT COUNT(*) INTO onc FROM DATASET WHERE RAIN = 'no' AND OUTLOOK = 'overcast';
    SELECT COUNT(*) INTO hyc FROM DATASET WHERE RAIN = 'yes' AND TEMPERATURE = 'hot';
    SELECT COUNT(*) INTO hnc FROM DATASET WHERE RAIN = 'no' AND TEMPERATURE = 'hot';
    SELECT COUNT(*) INTO myc FROM DATASET WHERE RAIN = 'yes' AND TEMPERATURE = 'mild';
    SELECT COUNT(*) INTO mnc FROM DATASET WHERE RAIN = 'no' AND TEMPERATURE = 'mild';
    SELECT COUNT(*) INTO cyc FROM DATASET WHERE RAIN = 'yes' AND TEMPERATURE = 'cool';
    SELECT COUNT(*) INTO cnc FROM DATASET WHERE RAIN = 'no' AND TEMPERATURE = 'cool';
    SELECT COUNT(*) INTO eyc FROM DATASET WHERE RAIN = 'yes' AND HUMIDITY = 'high';
    SELECT COUNT(*) INTO enc FROM DATASET WHERE RAIN = 'no' AND HUMIDITY = 'high';
    SELECT COUNT(*) INTO nyc FROM DATASET WHERE RAIN = 'yes' AND HUMIDITY = 'normal';
    SELECT COUNT(*) INTO nnc FROM DATASET WHERE RAIN = 'no' AND HUMIDITY = 'normal';


    SELECT COUNT(ID) INTO dataset_count FROM DATASET;


    dbms_output.put_line(syc);
    dbms_output.put_line(snc);
    dbms_output.put_line(wyc);
    dbms_output.put_line(wnc);
    dbms_output.put_line(oyc);
    dbms_output.put_line(onc);
    dbms_output.put_line(hyc);
    dbms_output.put_line(hnc);
    dbms_output.put_line(myc);
    dbms_output.put_line(mnc);
    dbms_output.put_line(cyc);
    dbms_output.put_line(cnc);
    dbms_output.put_line(eyc);
    dbms_output.put_line(enc);
    dbms_output.put_line(nyc);
    dbms_output.put_line(nnc);
    
    p_yes := yes_count/dataset_count;
    p_no := no_count/dataset_count;
    p_sunny_yes := syc/yes_count;
    p_sunny_no := snc/no_count;
    p_windy_yes := wyc/yes_count;
    p_windy_no := wnc/no_count;
    p_overcast_yes := oyc/yes_count;
    p_overcast_no := onc/no_count;
    p_hot_yes := hyc/yes_count;
    p_hot_no := hnc/no_count;
    p_mild_yes := myc/yes_count;
    p_mild_no := mnc/no_count;
    p_cool_yes := cyc/yes_count;
    p_cool_no := cnc/no_count;
    p_high_yes := eyc/yes_count;
    p_high_no := enc/no_count;
    p_normal_yes := nyc/yes_count;
    p_normal_no := nnc/no_count;

    dbms_output.put_line(p_yes);
    dbms_output.put_line(p_yes);

    
    --SELECT COUNT(ID) INTO dataset_count FROM DATASET;
    --dbms_output.put_line(dataset_count);

    SELECT COUNT(ID) INTO testset_count FROM TESTSET@SITE1;
    --dbms_output.put_line(testset_count);
    

    random_testcase := dbms_random.value(1,testset_count);
    f_random := random_testcase;
    --dbms_output.put_line(f_random);



    SELECT OUTLOOK, TEMPERATURE, HUMIDITY INTO out_l, temp, hum FROM TESTSET@SITE1 WHERE ID = f_random;
    DBMS_OUTPUT.PUT_LINE(CHR(10));
    dbms_output.put_line('Extaxted from Site1:');
    dbms_output.put_line(f_random);
    dbms_output.put_line(out_l|| '--' || temp || '--'|| hum);
    --dbms_output.put_line(temp);
    --dbms_output.put_line(hum);

    

    IF (out_l = 'sunny' AND temp = 'hot' AND hum = 'high')  then
        
        dbms_output.put_line('combination 1');

        pnb_yes := (p_yes * p_sunny_yes * p_hot_yes * p_high_yes);
        pnb_no := (p_no * p_sunny_no * p_hot_no * p_high_no);

        final_probability_yes  := normalizeYes(pnb_yes, pnb_no);
        final_probability_no := normalizeNo(pnb_yes, pnb_no);

        dbms_output.put_line(final_probability_yes); 


        
        IF (final_probability_yes > final_probability_no) then
          rain_prediction := 'yes';
        END IF;

        IF (final_probability_yes < final_probability_no) then
          rain_prediction := 'no';
        END IF;

        dbms_output.put_line('rain_prediction : '|| rain_prediction);

        FOR RowData IN (SELECT * FROM DATASET) LOOP
            IF (RowData.OUTLOOK = 'sunny' AND RowData.TEMPERATURE = 'hot' AND RowData.HUMIDITY = 'high') THEN
                --dbms_output.put_line('true');
                actual_data := RowData.RAIN;
                dbms_output.put_line('actual_data : ' || actual_data); 
                -- dbms_output.put_line(actual_data);
                EXIT;
            END IF;
	    END LOOP;

        IF (actual_data = rain_prediction) then
          dbms_output.put_line('Right Prediction');
        END IF;

        IF (actual_data <> rain_prediction) then
          dbms_output.put_line('Wrong Prediction');
        END IF;


    END IF;



    IF (out_l = 'sunny' AND temp = 'hot' AND hum = 'normal')  then
        dbms_output.put_line('combination 2');

        pnb_yes := (p_yes * p_sunny_yes * p_hot_yes * p_normal_yes);
        pnb_no := (p_no * p_sunny_no * p_hot_no * p_normal_no);

        final_probability_yes  := normalizeYes(pnb_yes, pnb_no);
        final_probability_no := normalizeNo(pnb_yes, pnb_no);

        dbms_output.put_line(final_probability_yes); 


        
        IF (final_probability_yes > final_probability_no) then
          rain_prediction := 'yes';
        END IF;

        IF (final_probability_yes < final_probability_no) then
          rain_prediction := 'no';
        END IF;

        dbms_output.put_line('rain_prediction : '|| rain_prediction);

        FOR RowData IN (SELECT * FROM DATASET) LOOP
            IF (RowData.OUTLOOK = 'sunny' AND RowData.TEMPERATURE = 'hot' AND RowData.HUMIDITY = 'normal') THEN
                --dbms_output.put_line('true');
                actual_data := RowData.RAIN;
                dbms_output.put_line('actual_data : ' || actual_data); 
                -- dbms_output.put_line(actual_data);
                EXIT;
            END IF;
	    END LOOP;

        IF (actual_data = rain_prediction) then
          dbms_output.put_line('Right Prediction');
        END IF;

        IF (actual_data <> rain_prediction) then
          dbms_output.put_line('Wrong Prediction');
        END IF;
    END IF;

    IF (out_l = 'sunny' AND temp = 'mild' AND hum = 'high')  then
        dbms_output.put_line('combination 3');

        pnb_yes := (p_yes * p_sunny_yes * p_mild_yes * p_high_yes);
        pnb_no := (p_no * p_sunny_no * p_mild_no * p_high_no);

        final_probability_yes  := normalizeYes(pnb_yes, pnb_no);
        final_probability_no := normalizeNo(pnb_yes, pnb_no);

        dbms_output.put_line(final_probability_yes); 


        
        IF (final_probability_yes > final_probability_no) then
          rain_prediction := 'yes';
        END IF;

        IF (final_probability_yes < final_probability_no) then
          rain_prediction := 'no';
        END IF;

        dbms_output.put_line('rain_prediction : '|| rain_prediction);

        FOR RowData IN (SELECT * FROM DATASET) LOOP
            IF (RowData.OUTLOOK = 'sunny' AND RowData.TEMPERATURE = 'mild' AND RowData.HUMIDITY = 'high') THEN
                --dbms_output.put_line('true');
                actual_data := RowData.RAIN;
                dbms_output.put_line('actual_data : ' || actual_data); 
                -- dbms_output.put_line(actual_data);
                EXIT;
            END IF;
	    END LOOP;

        IF (actual_data = rain_prediction) then
          dbms_output.put_line('Right Prediction');
        END IF;

        IF (actual_data <> rain_prediction) then
          dbms_output.put_line('Wrong Prediction');
        END IF;
    END IF;

    IF (out_l = 'sunny' AND temp = 'mild' AND hum = 'normal')  then
        dbms_output.put_line('combination 4');
        pnb_yes := (p_yes * p_sunny_yes * p_mild_yes * p_normal_yes);
        pnb_no := (p_no * p_sunny_no * p_mild_no * p_normal_no);

        final_probability_yes  := normalizeYes(pnb_yes, pnb_no);
        final_probability_no := normalizeNo(pnb_yes, pnb_no);

        dbms_output.put_line(final_probability_yes); 


        
        IF (final_probability_yes > final_probability_no) then
          rain_prediction := 'yes';
        END IF;

        IF (final_probability_yes < final_probability_no) then
          rain_prediction := 'no';
        END IF;

        dbms_output.put_line('rain_prediction : '|| rain_prediction);

        FOR RowData IN (SELECT * FROM DATASET) LOOP
            IF (RowData.OUTLOOK = 'sunny' AND RowData.TEMPERATURE = 'mild' AND RowData.HUMIDITY = 'normal') THEN
                --dbms_output.put_line('true');
                actual_data := RowData.RAIN;
                dbms_output.put_line('actual_data : ' || actual_data); 
                -- dbms_output.put_line(actual_data);
                EXIT;
            END IF;
	    END LOOP;

        IF (actual_data = rain_prediction) then
          dbms_output.put_line('Right Prediction');
        END IF;

        IF (actual_data <> rain_prediction) then
          dbms_output.put_line('Wrong Prediction');
        END IF;
    END IF;

    IF (out_l = 'sunny' AND temp = 'cool' AND hum = 'high')  then
        dbms_output.put_line('combination 5');
        pnb_yes := (p_yes * p_sunny_yes * p_cool_yes * p_high_yes);
        pnb_no := (p_no * p_sunny_no * p_cool_no * p_high_no);

        final_probability_yes  := normalizeYes(pnb_yes, pnb_no);
        final_probability_no := normalizeNo(pnb_yes, pnb_no);

        dbms_output.put_line(final_probability_yes); 

        IF (final_probability_yes > final_probability_no) then
          rain_prediction := 'yes';
        END IF;

        IF (final_probability_yes < final_probability_no) then
          rain_prediction := 'no';
        END IF;

        dbms_output.put_line('rain_prediction : '|| rain_prediction);

        FOR RowData IN (SELECT * FROM DATASET) LOOP
            IF (RowData.OUTLOOK = 'sunny' AND RowData.TEMPERATURE = 'cool' AND RowData.HUMIDITY = 'high') THEN
                --dbms_output.put_line('true');
                actual_data := RowData.RAIN;
                dbms_output.put_line('actual_data : ' || actual_data); 
                -- dbms_output.put_line(actual_data);
                EXIT;
            END IF;
	    END LOOP;

        IF (actual_data = rain_prediction) then
          dbms_output.put_line('Right Prediction');
        END IF;

        IF (actual_data <> rain_prediction) then
          dbms_output.put_line('Wrong Prediction');
        END IF;
    END IF;

    IF (out_l = 'sunny' AND temp = 'cool' AND hum = 'normal')  then
        dbms_output.put_line('combination 6');
        pnb_yes := (p_yes * p_sunny_yes * p_cool_yes * p_normal_yes);
        pnb_no := (p_no * p_sunny_no * p_cool_no * p_normal_no);

        final_probability_yes  := normalizeYes(pnb_yes, pnb_no);
        final_probability_no := normalizeNo(pnb_yes, pnb_no);

        dbms_output.put_line(final_probability_yes); 


        
        IF (final_probability_yes > final_probability_no) then
          rain_prediction := 'yes';
        END IF;

        IF (final_probability_yes < final_probability_no) then
          rain_prediction := 'no';
        END IF;

        dbms_output.put_line('rain_prediction : '|| rain_prediction);

        FOR RowData IN (SELECT * FROM DATASET) LOOP
            IF (RowData.OUTLOOK = 'sunny' AND RowData.TEMPERATURE = 'cool' AND RowData.HUMIDITY = 'normal') THEN
                --dbms_output.put_line('true');
                actual_data := RowData.RAIN;
                dbms_output.put_line('actual_data : ' || actual_data); 
                -- dbms_output.put_line(actual_data);
                EXIT;
            END IF;
	    END LOOP;

        IF (actual_data = rain_prediction) then
          dbms_output.put_line('Right Prediction');
        END IF;

        IF (actual_data <> rain_prediction) then
          dbms_output.put_line('Wrong Prediction');
        END IF;
    END IF;

    IF (out_l = 'windy' AND temp = 'hot' AND hum = 'high')  then
        dbms_output.put_line('combination 7');
        pnb_yes := (p_yes * p_windy_yes * p_hot_yes * p_high_yes);
        pnb_no := (p_no * p_windy_no * p_hot_no * p_high_no);

        final_probability_yes  := normalizeYes(pnb_yes, pnb_no);
        final_probability_no := normalizeNo(pnb_yes, pnb_no);

        dbms_output.put_line(final_probability_yes); 


        
        IF (final_probability_yes > final_probability_no) then
          rain_prediction := 'yes';
        END IF;

        IF (final_probability_yes < final_probability_no) then
          rain_prediction := 'no';
        END IF;

        dbms_output.put_line('rain_prediction : '|| rain_prediction);

        FOR RowData IN (SELECT * FROM DATASET) LOOP
            IF (RowData.OUTLOOK = 'windy' AND RowData.TEMPERATURE = 'hot' AND RowData.HUMIDITY = 'high') THEN
                --dbms_output.put_line('true');
                actual_data := RowData.RAIN;
                dbms_output.put_line('actual_data : ' || actual_data); 
                -- dbms_output.put_line(actual_data);
                EXIT;
            END IF;
	    END LOOP;

        IF (actual_data = rain_prediction) then
          dbms_output.put_line('Right Prediction');
        END IF;

        IF (actual_data <> rain_prediction) then
          dbms_output.put_line('Wrong Prediction');
        END IF;

    END IF;

    IF (out_l = 'windy' AND temp = 'hot' AND hum = 'normal')  then
        dbms_output.put_line('combination 8');

        pnb_yes := (p_yes * p_windy_yes * p_hot_yes * p_normal_yes);
        pnb_no := (p_no * p_windy_no * p_hot_no * p_normal_no);

        final_probability_yes  := normalizeYes(pnb_yes, pnb_no);
        final_probability_no := normalizeNo(pnb_yes, pnb_no);

        dbms_output.put_line(final_probability_yes); 


        
        IF (final_probability_yes > final_probability_no) then
          rain_prediction := 'yes';
        END IF;

        IF (final_probability_yes < final_probability_no) then
          rain_prediction := 'no';
        END IF;

        dbms_output.put_line('rain_prediction : '|| rain_prediction);

        FOR RowData IN (SELECT * FROM DATASET) LOOP
            IF (RowData.OUTLOOK = 'windy' AND RowData.TEMPERATURE = 'hot' AND RowData.HUMIDITY = 'normal') THEN
                --dbms_output.put_line('true');
                actual_data := RowData.RAIN;
                dbms_output.put_line('actual_data : ' || actual_data); 
                -- dbms_output.put_line(actual_data);
                EXIT;
            END IF;
	    END LOOP;

        IF (actual_data = rain_prediction) then
          dbms_output.put_line('Right Prediction');
        END IF;

        IF (actual_data <> rain_prediction) then
          dbms_output.put_line('Wrong Prediction');
        END IF;
    END IF;

    IF (out_l = 'windy' AND temp = 'mild' AND hum = 'high')  then
        dbms_output.put_line('combination 9');
         pnb_yes := (p_yes * p_windy_yes * p_mild_yes * p_high_yes);
        pnb_no := (p_no * p_windy_no * p_mild_no * p_high_no);

        final_probability_yes  := normalizeYes(pnb_yes, pnb_no);
        final_probability_no := normalizeNo(pnb_yes, pnb_no);

        dbms_output.put_line(final_probability_yes); 


        
        IF (final_probability_yes > final_probability_no) then
          rain_prediction := 'yes';
        END IF;

        IF (final_probability_yes < final_probability_no) then
          rain_prediction := 'no';
        END IF;

        dbms_output.put_line('rain_prediction : '|| rain_prediction);

        FOR RowData IN (SELECT * FROM DATASET) LOOP
            IF (RowData.OUTLOOK = 'windy' AND RowData.TEMPERATURE = 'mild' AND RowData.HUMIDITY = 'high') THEN
                --dbms_output.put_line('true');
                actual_data := RowData.RAIN;
                dbms_output.put_line('actual_data : ' || actual_data); 
                -- dbms_output.put_line(actual_data);
                EXIT;
            END IF;
	    END LOOP;

        IF (actual_data = rain_prediction) then
          dbms_output.put_line('Right Prediction');
        END IF;

        IF (actual_data <> rain_prediction) then
          dbms_output.put_line('Wrong Prediction');
        END IF;
    END IF;

    IF (out_l = 'windy' AND temp = 'mild' AND hum = 'normal')  then
        dbms_output.put_line('combination 10');
        pnb_yes := (p_yes * p_windy_yes * p_mild_yes * p_normal_yes);
        pnb_no := (p_no * p_windy_no * p_mild_no * p_normal_no);

        final_probability_yes  := normalizeYes(pnb_yes, pnb_no);
        final_probability_no := normalizeNo(pnb_yes, pnb_no);

        dbms_output.put_line(final_probability_yes); 


        
        IF (final_probability_yes > final_probability_no) then
          rain_prediction := 'yes';
        END IF;

        IF (final_probability_yes < final_probability_no) then
          rain_prediction := 'no';
        END IF;

        dbms_output.put_line('rain_prediction : '|| rain_prediction);

        FOR RowData IN (SELECT * FROM DATASET) LOOP
            IF (RowData.OUTLOOK = 'windy' AND RowData.TEMPERATURE = 'mild' AND RowData.HUMIDITY = 'normal') THEN
                --dbms_output.put_line('true');
                actual_data := RowData.RAIN;
                dbms_output.put_line('actual_data : ' || actual_data); 
                -- dbms_output.put_line(actual_data);
                EXIT;
            END IF;
	    END LOOP;

        IF (actual_data = rain_prediction) then
          dbms_output.put_line('Right Prediction');
        END IF;

        IF (actual_data <> rain_prediction) then
          dbms_output.put_line('Wrong Prediction');
        END IF;
    END IF;

    IF (out_l = 'windy' AND temp = 'cool' AND hum = 'high')  then
        dbms_output.put_line('combination 11');
        pnb_yes := (p_yes * p_windy_yes * p_cool_yes * p_high_yes);
        pnb_no := (p_no * p_windy_no * p_cool_no * p_high_no);

        final_probability_yes  := normalizeYes(pnb_yes, pnb_no);
        final_probability_no := normalizeNo(pnb_yes, pnb_no);

        dbms_output.put_line(final_probability_yes); 

        IF (final_probability_yes > final_probability_no) then
          rain_prediction := 'yes';
        END IF;

        IF (final_probability_yes < final_probability_no) then
          rain_prediction := 'no';
        END IF;

        dbms_output.put_line('rain_prediction : '|| rain_prediction);

        FOR RowData IN (SELECT * FROM DATASET) LOOP
            IF (RowData.OUTLOOK = 'windy' AND RowData.TEMPERATURE = 'cool' AND RowData.HUMIDITY = 'high') THEN
                --dbms_output.put_line('true');
                actual_data := RowData.RAIN;
                dbms_output.put_line('actual_data : ' || actual_data); 
                -- dbms_output.put_line(actual_data);
                EXIT;
            END IF;
	    END LOOP;

        IF (actual_data = rain_prediction) then
          dbms_output.put_line('Right Prediction');
        END IF;

        IF (actual_data <> rain_prediction) then
          dbms_output.put_line('Wrong Prediction');
        END IF;
    END IF;

    IF (out_l = 'windy' AND temp = 'cool' AND hum = 'normal')  then
        dbms_output.put_line('combination 12');

        pnb_yes := (p_yes * p_windy_yes * p_cool_yes * p_normal_yes);
        pnb_no := (p_no * p_windy_no * p_cool_no * p_normal_no);

        final_probability_yes  := normalizeYes(pnb_yes, pnb_no);
        final_probability_no := normalizeNo(pnb_yes, pnb_no);

        dbms_output.put_line(final_probability_yes); 


        
        IF (final_probability_yes > final_probability_no) then
          rain_prediction := 'yes';
        END IF;

        IF (final_probability_yes < final_probability_no) then
          rain_prediction := 'no';
        END IF;

        dbms_output.put_line('rain_prediction : '|| rain_prediction);

        FOR RowData IN (SELECT * FROM DATASET) LOOP
            IF (RowData.OUTLOOK = 'windy' AND RowData.TEMPERATURE = 'cool' AND RowData.HUMIDITY = 'normal') THEN
                --dbms_output.put_line('true');
                actual_data := RowData.RAIN;
                dbms_output.put_line('actual_data : ' || actual_data); 
                -- dbms_output.put_line(actual_data);
                EXIT;
            END IF;
	    END LOOP;

        IF (actual_data = rain_prediction) then
          dbms_output.put_line('Right Prediction');
        END IF;

        IF (actual_data <> rain_prediction) then
          dbms_output.put_line('Wrong Prediction');
        END IF;

    END IF;

    IF (out_l = 'overcast' AND temp = 'hot' AND hum = 'high')  then
      
        dbms_output.put_line('combination 13');

        pnb_yes := (p_yes * p_overcast_yes * p_hot_yes * p_high_yes);
        pnb_no := (p_no * p_overcast_no * p_hot_no * p_high_no);

        final_probability_yes  := normalizeYes(pnb_yes, pnb_no);
        final_probability_no := normalizeNo(pnb_yes, pnb_no);

        dbms_output.put_line(final_probability_yes); 


        
        IF (final_probability_yes > final_probability_no) then
          rain_prediction := 'yes';
        END IF;

        IF (final_probability_yes < final_probability_no) then
          rain_prediction := 'no';
        END IF;

        dbms_output.put_line('rain_prediction : '|| rain_prediction);

        FOR RowData IN (SELECT * FROM DATASET) LOOP
            IF (RowData.OUTLOOK = 'overcast' AND RowData.TEMPERATURE = 'hot' AND RowData.HUMIDITY = 'high') THEN
                --dbms_output.put_line('true');
                actual_data := RowData.RAIN;
                dbms_output.put_line('actual_data : ' || actual_data); 
                -- dbms_output.put_line(actual_data);
                EXIT;
            END IF;
	    END LOOP;

        IF (actual_data = rain_prediction) then
          dbms_output.put_line('Right Prediction');
        END IF;

        IF (actual_data <> rain_prediction) then
          dbms_output.put_line('Wrong Prediction');
        END IF;


    END IF;

    IF (out_l = 'overcast' AND temp = 'hot' AND hum = 'normal')  then
        dbms_output.put_line('combination 14');

        pnb_yes := (p_yes * p_overcast_yes * p_hot_yes * p_normal_yes);
        pnb_no := (p_no * p_overcast_no * p_hot_no * p_normal_no);

        final_probability_yes  := normalizeYes(pnb_yes, pnb_no);
        final_probability_no := normalizeNo(pnb_yes, pnb_no);

        dbms_output.put_line(final_probability_yes); 


        
        IF (final_probability_yes > final_probability_no) then
          rain_prediction := 'yes';
        END IF;

        IF (final_probability_yes < final_probability_no) then
          rain_prediction := 'no';
        END IF;

        dbms_output.put_line('rain_prediction : '|| rain_prediction);

        FOR RowData IN (SELECT * FROM DATASET) LOOP
            IF (RowData.OUTLOOK = 'overcast' AND RowData.TEMPERATURE = 'hot' AND RowData.HUMIDITY = 'normal') THEN
                --dbms_output.put_line('true');
                actual_data := RowData.RAIN;
                dbms_output.put_line('actual_data : ' || actual_data); 
                -- dbms_output.put_line(actual_data);
                EXIT;
            END IF;
	    END LOOP;

        IF (actual_data = rain_prediction) then
          dbms_output.put_line('Right Prediction');
        END IF;

        IF (actual_data <> rain_prediction) then
          dbms_output.put_line('Wrong Prediction');
        END IF;


    END IF;

    IF (out_l = 'overcast' AND temp = 'mild' AND hum = 'high')  then
        dbms_output.put_line('combination 15');

        pnb_yes := (p_yes * p_overcast_yes * p_mild_yes * p_high_yes);
        pnb_no := (p_no * p_overcast_no * p_mild_no * p_high_no);

        final_probability_yes  := normalizeYes(pnb_yes, pnb_no);
        final_probability_no := normalizeNo(pnb_yes, pnb_no);

        dbms_output.put_line(final_probability_yes); 


        
        IF (final_probability_yes > final_probability_no) then
          rain_prediction := 'yes';
        END IF;

        IF (final_probability_yes < final_probability_no) then
          rain_prediction := 'no';
        END IF;

        dbms_output.put_line('rain_prediction : '|| rain_prediction);

        FOR RowData IN (SELECT * FROM DATASET) LOOP
            IF (RowData.OUTLOOK = 'overcast' AND RowData.TEMPERATURE = 'mild' AND RowData.HUMIDITY = 'high') THEN
                --dbms_output.put_line('true');
                actual_data := RowData.RAIN;
                dbms_output.put_line('actual_data : ' || actual_data); 
                -- dbms_output.put_line(actual_data);
                EXIT;
            END IF;
	    END LOOP;

        IF (actual_data = rain_prediction) then
          dbms_output.put_line('Right Prediction');
        END IF;

        IF (actual_data <> rain_prediction) then
          dbms_output.put_line('Wrong Prediction');
        END IF;

    END IF;

    IF (out_l = 'overcast' AND temp = 'mild' AND hum = 'normal')  then
        dbms_output.put_line('combination 16');
        pnb_yes := (p_yes * p_overcast_yes * p_mild_yes * p_normal_yes);
        pnb_no := (p_no * p_overcast_no * p_mild_no * p_normal_no);

        final_probability_yes  := normalizeYes(pnb_yes, pnb_no);
        final_probability_no := normalizeNo(pnb_yes, pnb_no);

        dbms_output.put_line(final_probability_yes); 


        
        IF (final_probability_yes > final_probability_no) then
          rain_prediction := 'yes';
        END IF;

        IF (final_probability_yes < final_probability_no) then
          rain_prediction := 'no';
        END IF;

        dbms_output.put_line('rain_prediction : '|| rain_prediction);

        FOR RowData IN (SELECT * FROM DATASET) LOOP
            IF (RowData.OUTLOOK = 'overcast' AND RowData.TEMPERATURE = 'mild' AND RowData.HUMIDITY = 'normal') THEN
                --dbms_output.put_line('true');
                actual_data := RowData.RAIN;
                dbms_output.put_line('actual_data : ' || actual_data); 
                -- dbms_output.put_line(actual_data);
                EXIT;
            END IF;
	    END LOOP;

        IF (actual_data = rain_prediction) then
          dbms_output.put_line('Right Prediction');
        END IF;

        IF (actual_data <> rain_prediction) then
          dbms_output.put_line('Wrong Prediction');
        END IF;
    

    END IF;

    IF (out_l = 'overcast' AND temp = 'cool' AND hum = 'high')  then
        dbms_output.put_line('combination 17');

        pnb_yes := (p_yes * p_overcast_yes * p_cool_yes * p_high_yes);
        pnb_no := (p_no * p_overcast_no * p_cool_no * p_high_no);

        final_probability_yes  := normalizeYes(pnb_yes, pnb_no);
        final_probability_no := normalizeNo(pnb_yes, pnb_no);

        dbms_output.put_line(final_probability_yes); 

        IF (final_probability_yes > final_probability_no) then
          rain_prediction := 'yes';
        END IF;

        IF (final_probability_yes < final_probability_no) then
          rain_prediction := 'no';
        END IF;

        dbms_output.put_line('rain_prediction : '|| rain_prediction);

        FOR RowData IN (SELECT * FROM DATASET) LOOP
            IF (RowData.OUTLOOK = 'overcast' AND RowData.TEMPERATURE = 'cool' AND RowData.HUMIDITY = 'high') THEN
                --dbms_output.put_line('true');
                actual_data := RowData.RAIN;
                dbms_output.put_line('actual_data : ' || actual_data); 
                -- dbms_output.put_line(actual_data);
                EXIT;
            END IF;
	    END LOOP;

        IF (actual_data = rain_prediction) then
          dbms_output.put_line('Right Prediction');
        END IF;

        IF (actual_data <> rain_prediction) then
          dbms_output.put_line('Wrong Prediction');
        END IF;

    END IF;

    IF (out_l = 'overcast' AND temp = 'cool' AND hum = 'normal')  then
        dbms_output.put_line('combination 18');

         pnb_yes := (p_yes * p_sunny_yes * p_cool_yes * p_normal_yes);
        pnb_no := (p_no * p_sunny_no * p_cool_no * p_normal_no);

        final_probability_yes  := normalizeYes(pnb_yes, pnb_no);
        final_probability_no := normalizeNo(pnb_yes, pnb_no);

        dbms_output.put_line(final_probability_yes); 


        
        IF (final_probability_yes > final_probability_no) then
          rain_prediction := 'yes';
        END IF;

        IF (final_probability_yes < final_probability_no) then
          rain_prediction := 'no';
        END IF;

        dbms_output.put_line('rain_prediction : '|| rain_prediction);

        FOR RowData IN (SELECT * FROM DATASET) LOOP
            IF (RowData.OUTLOOK = 'sunny' AND RowData.TEMPERATURE = 'cool' AND RowData.HUMIDITY = 'normal') THEN
                --dbms_output.put_line('true');
                actual_data := RowData.RAIN;
                dbms_output.put_line('actual_data : ' || actual_data); 
                -- dbms_output.put_line(actual_data);
                EXIT;
            END IF;
	    END LOOP;

        IF (actual_data = rain_prediction) then
          dbms_output.put_line('Right Prediction');
        END IF;

        IF (actual_data <> rain_prediction) then
          dbms_output.put_line('Wrong Prediction');
        END IF;

    END IF;



EXCEPTION 
    
   -- WHEN not_getting_test_count THEN
       -- dbms_output.put_line("Not getting row count from Site1!");
    WHEN no_data_found THEN 
        dbms_output.put_line('No data found!'); 
    WHEN others THEN 
        dbms_output.put_line('Error!');

END;
/