
DECLARE

res VARCHAR2(150);
CURSOR cur ;
BEGIN
       MAJ_NOM_FICHIER_EXPORT('DEVRD_LMCON_STLD_CLT_','YYYY-MM-DD_HH24MI', res, cur);
       DBMS_OUTPUT.PUT_LINE(res);
END;


BEGIN

END;











