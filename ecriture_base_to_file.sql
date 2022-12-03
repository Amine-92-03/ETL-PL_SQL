SET SERVEROUTPUT ON;
DECLARE
L_FILE UTL_FILE.FILE_TYPE;
L_LOCATION VARCHAR2(100) := 'ORACLE_BASE';
L_FILENAME VARCHAR2(100);
L_TEXT VARCHAR2(100);
L_TIME VARCHAR2(100);
isOpen BOOLEAN;
k NUMERIC := 0;
Numb NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Bonjour'); 
    -- récupération la valeur de la date au moment de l'execution
    SELECT TO_CHAR(SYSDATE, 'YYYYMMDD_HH24MI' ) INTO L_TIME FROM dual;
    L_FILENAME := 'test_amine_'|| L_TIME ||'.txt';
    DBMS_OUTPUT.PUT_LINE(L_FILENAME); 
    -- Verification si le fichier est ouver pour le fermer 
    isOpen := UTL_FILE.IS_OPEN( L_FILE );
    IF isOpen != TRUE THEN
      UTL_FILE.FCLOSE(L_FILE);
    END IF;
    -- Ouverture du fichier pour ecriture w 
    L_FILE := UTL_FILE.FOPEN(L_LOCATION, L_FILENAME, 'w'); 
    --Numb := 1/0;
    -- Ecriture des valeurs 1 par 1 sep = ;
    FOR I IN (select grantor,grantee, table_schema, table_name, privilege from   all_tab_privs ) LOOP
         SELECT TO_CHAR(SYSDATE, 'MM-DD-YYYY' ) INTO L_TIME FROM dual;
         UTL_FILE.PUT_LINE(L_FILE, k ||';' || I.grantor ||';'||I.grantee||';'||L_TIME);
         k := k + 1 ;
    END LOOP;
    --Fermeture du fichier
    UTL_FILE.FCLOSE(L_FILE);
--Gestion des exception
EXCEPTION
    WHEN UTL_FILE.READ_ERROR THEN
        DBMS_OUTPUT.PUT_LINE(' Cannot read file');
    WHEN UTL_FILE.WRITE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE(' Cannot write file');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(' END FILE ');  
        UTL_FILE.FCLOSE(L_FILE);
    WHEN ZERO_DIVIDE THEN
    DBMS_OUTPUT.PUT_LINE('Erreur: ' ||SQLERRM); 
    --Ecriture des erreur dans un fichier de log
    UTL_FILE.PUT_LINE(L_FILE, L_TIME || ' Erreur: ' ||SQLERRM);
    UTL_FILE.FCLOSE(L_FILE);
    --INSERT INTO  LOG_TABLE (MESSAGE)  VALUES ('SQLERRM');
END;
/


--SELECT * FROM LOG_TABLE

