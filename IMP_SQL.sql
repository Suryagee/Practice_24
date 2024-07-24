select distinct country_name, c.*  from countries c;--unique columns
select country_id , count(*) from countries
group by country_id
having count(*)=1;---unique record
select* from employees where ROWNUM=1 --1st record
union
select* from (select*from employees order by rowid desc) where rownum=1;--last record
select* from ( select e.*, row_number() over ( partition by(rowid)  order by rowid desc) as RN from employees e ) where RN=1;--last record
select* from employees where rowid in ( select min(rowid) from employees group by rowid);--unique rceords
select * from employees where rownum<=5;
--last 5 records
select* from( select* from employees order by rowid desc) where rownum<=5;--last  5 records
--Duplicates removal:
delete from employees where rowid not in ( select min(rowid) from employees group by rowid);
--how to get duplicates
select *from employees where rowid not in ( select min(rowid) from employees group by rowid);--no dups
select employee_id,count(*) as count  from employees 
group by employee_id having
count(*) >1;--no dups