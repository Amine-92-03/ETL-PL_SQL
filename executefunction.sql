

BEGIN
DBMS_OUTPUT.PUT_LINE(modiifier_nom_fichier_sortie('amine_','YYYY-MM-DD_HH24MI'));
END;



VARIABLE res VARCHAR2(50);
EXECUTE :res := modiifier_nom_fichier_sortie('amine_','YYYY-MM-DD_HH24MI');
PRINT res;

