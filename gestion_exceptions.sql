SET SERVEROUTPUT ON;

DECLARE
    age           NUMERIC := 10;
    erreur_age EXCEPTION;
    erreur_code EXCEPTION;
    erreur_nom_table EXCEPTION;
    test_division NUMERIC;
    PRAGMA exception_init ( erreur_code, -06550 );
    PRAGMA exception_init ( erreur_nom_table, -00942 );
BEGIN
    SELECT
        SUM(region_id)
    INTO age
    FROM
        countries;
   -- WHERE REGION_ID = 100;
    dbms_output.put_line('Gestion des exceptions');
    --test_division := 1 + 'Amine';
    IF age < 18 THEN
        RAISE erreur_age;
    ELSE
        dbms_output.put_line('AGE supérieur a 18');
    END IF;

EXCEPTION
    WHEN erreur_nom_table THEN
        dbms_output.put_line('Erreur due au table mal ecrite');
    WHEN erreur_code THEN
        dbms_output.put_line('Erreur due au code mal ecrit');
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
        dbms_output.put_line('erreur :' || sqlerrm);
END;