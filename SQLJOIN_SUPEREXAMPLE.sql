CREATE TABLE A (ID NUMBER);
CREATE TABLE B (ID NUMBER);
select *FROM A;
insert into B values (4);
--INNER JOIN--NO RECORDS WILL BE MATCHED, NO RECORDS FETCHED
SELECT  * FROM A JOIN B
ON A.ID=B.ID;
SELECT * FROM A;
SELECT * FROM B;

delete from B where id='';


SELECT  * FROM A full OUTER JOIN B
ON A.ID=B.ID;
TABLE A:                  TABLE B;
ID                         ID
1                          1
1                           1
2                            4
3                          NULL
NULL
NULL
commit;
CREATE TABLE JOIN_EX (ID NUMBER);
CREATE TABLE JOIN_EX1 (ID NUMBER);
INSERT INTO JOIN_EX1 VALUES('');
SELECT*FROM JOIN_EX1;
SELECT *FROM JOIN_EX A JOIN JOIN_EX1 B
ON A.ID=B.ID;
SELECT*FROM JOIN_EX A  LEFT OUTER JOIN JOIN_EX1 B
ON A.ID=B.ID;

SELECT*FROM JOIN_EX A  RIGHT OUTER JOIN JOIN_EX1 B
ON A.ID=B.ID;
SELECT*FROM JOIN_EX A  FULL OUTER JOIN JOIN_EX1 B
ON A.ID=B.ID;

select * from B where id is not null
union all
select*from B where id is null and rownum=1;
select*from B where rownum<=4;
DELETE FROM EMPLOYEES WHERE ROWID NOT IN(select max(ROWID) from employees  WHERE ROWNUM<=5);
   -- remove duplicates based on hire_date
delete from EMPLOYEES where rowid in ( select rowid from 
(select rowid,employee_id,hiredate,row_number() over (partition by employee_id order by hire_date desc) as rn from emp) where rn>1));


select floor(sysdate-hire_date) as lenth_hr from employees;