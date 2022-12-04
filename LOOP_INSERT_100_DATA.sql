
DECLARE 

it NUMERIC := 1;

BEGIN
DELETE FROM EMPLOYEES;
FOR I IN 1..100
LOOP
INSERT INTO EMPLOYEES
    (
    employee_id,
    first_name,
    last_name,
    email,
    phone,
    hire_date,
    manager_id,
    job_title
    )
    VALUES
    (
    '000' ||it||' ',
    'amine'||it,
    'mefti'||it,
    'mefti'||it||'.amine'||it||'@gmail.com',
    '1'||it||'1.1'||it||'2.123'||it||'9' ,
    '01/10/2021',
    1,
    'Ingénieur DATA'
    );
it := it + 1;
END LOOP;

END;
/
--SELECT * FROM EMPLOYEES
--


