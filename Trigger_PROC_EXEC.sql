CREATE TABLE amine (
    name VARCHAR(22)
);

CREATE OR REPLACE TRIGGER tgg_amine AFTER
    INSERT ON amine
BEGIN
    DECLARE
        tot NUMBER;
    BEGIN
        SELECT
            COUNT(*)
        INTO tot
        FROM
            amine;
        dbms_output.put_line('HELLO WORLD ==> ' || tot);
        proc_test_table();
    END;
END;

CREATE OR REPLACE PROCEDURE proc_test_table IS
    tot_line NUMBER;
BEGIN
    SELECT
        COUNT(*)
    INTO tot_line
    FROM
        amine;
    dbms_output.put_line('Nombre de lignes dans ton tableau est ::::' || tot_line);
END;


INSERT INTO amine VALUES ( 'amine' );

SELECT COUNT(*) FROM amine;

