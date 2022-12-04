SELECT COUNT(*)
FROM
  testtable;
      
    
TRUNCATE TABLE testtable

SELECT * FROM testtable;

INSERT INTO  testtable
VALUES
(
'HELLO; Myname;is;Amine',
'HELLO-AMINE')

SELECT * FROM testtable;

SELECT
SUBSTR(  P_nom,0,
                INSTR(P_Nom, ';',1,1)-1) testCol_0 ,
SUBSTR(  P_nom, INSTR(P_Nom, ';',1,1)+1,
                INSTR(P_Nom, ';',1,2) - INSTR(P_Nom, ';',1,1)-1)testCol_1,
SUBSTR(  P_nom, INSTR(P_Nom, ';',1,2)+1,
                INSTR(P_Nom, ';',1,3) - INSTR(P_Nom, ';',1,2)-1)testCol_2,
SUBSTR(  P_nom, INSTR(P_Nom, ';',1,3)+1)testCol_3
 -- LENGTH(P_nom) - INSTR(P_Nom, ';',1,3)
                FROM testtable;
   
                
SELECT * FROM all_directories



SHOW parameter smtp_out_server
