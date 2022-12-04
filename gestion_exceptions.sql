SET SERVEROUTPUT ON;

DECLARE
    age           NUMERIC := 10;
    erreur_age EXCEPTION;
    test_division NUMERIC;
BEGIN
    SELECT
        SUM(REGION_ID)
    INTO age
    FROM
        COUNTRIES;
   -- WHERE REGION_ID = 100;
    INSERT INTO COUNTRIES VALUES (1,2,3);
    dbms_output.put_line('Gestion des exceptions');
    --test_division := 1 + 'Amine';
    IF age < 18 THEN
        RAISE erreur_age;
    ELSE
        dbms_output.put_line('AGE supérieur a 18');
    END IF;
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('pas de données trouvées');
    WHEN erreur_age THEN
        dbms_output.put_line('AGE inférieur a 18');
    WHEN zero_divide THEN
        dbms_output.put_line('dévision par Zéro');
    WHEN value_error THEN
        dbms_output.put_line('valeur en erreur :' || sqlerrm);
    WHEN OTHERS THEN
            dbms_output.put_line('ERRUER NON identifée');
END;