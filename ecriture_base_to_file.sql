SET SERVEROUTPUT ON;

DECLARE
    l_file     utl_file.file_type;
    l_location VARCHAR2(100) := 'ORACLE_BASE';
    l_filename VARCHAR2(100);
    l_text     VARCHAR2(100);
    l_time     VARCHAR2(100);
    isopen     BOOLEAN;
    k          NUMERIC := 0;
    numb       NUMBER;
BEGIN
    dbms_output.put_line('Bonjour'); 
    -- récupération la valeur de la date au moment de l'execution
    SELECT
        to_char(sysdate, 'YYYYMMDD_HH24MI')
    INTO l_time
    FROM
        dual;

    l_filename := 'test_amine_'
                  || l_time
                  || '.txt';
    dbms_output.put_line(l_filename); 
    -- Verification si le fichier est ouver pour le fermer 
    isopen := utl_file.is_open(l_file);
    IF isopen != true THEN
        utl_file.fclose(l_file);
    END IF;
    -- Ouverture du fichier pour ecriture w 
    l_file := utl_file.fopen(l_location, l_filename, 'w'); 
    --Numb := 1/0;
    -- Ecriture des valeurs 1 par 1 sep = ;
    FOR i IN (
        SELECT
            grantor,
            grantee,
            table_schema,
            table_name,
            privilege
        FROM
            all_tab_privs
    ) LOOP
        SELECT
            to_char(sysdate, 'MM-DD-YYYY')
        INTO l_time
        FROM
            dual;

        utl_file.put_line(l_file, k
                                  || ';'
                                  || i.grantor
                                  || ';'
                                  || i.grantee
                                  || ';'
                                  || l_time);

        k := k + 1;
    END LOOP;
    --Fermeture du fichier
    utl_file.fclose(l_file);
--Gestion des exception
EXCEPTION
    WHEN utl_file.read_error THEN
        dbms_output.put_line(' Cannot read file');
    WHEN utl_file.write_error THEN
        dbms_output.put_line(' Cannot write file');
    WHEN no_data_found THEN
        dbms_output.put_line(' END FILE ');
        utl_file.fclose(l_file);
    WHEN zero_divide THEN
        dbms_output.put_line('Erreur: ' || sqlerrm); 
    --Ecriture des erreur dans un fichier de log
        utl_file.put_line(l_file, l_time
                                  || ' Erreur: '
                                  || sqlerrm);
        utl_file.fclose(l_file);
    --INSERT INTO  LOG_TABLE (MESSAGE)  VALUES ('SQLERRM');
END;
/



--
