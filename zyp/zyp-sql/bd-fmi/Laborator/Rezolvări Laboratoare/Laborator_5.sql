
Problema 7
/*
Sa se afiseze numele si salariul celor mai prost platiti angajati din fiecare departament 
(se cer 3 solutii: subcerere sincronizata, subcerere nesincronizata si  subcerere în clauza FROM).

*/


------------------------------

Problema 10 
/* 
Sa se obtina numele primilor 3 angajati avand salariul maxim. Rezultatul se va afişa în ordine crescătoare a salariilor.
*/

select employee_id, salary
from (select * 
      from employees
      order by salary desc)
where rownum<4


select employee_id, salary
from employees
where salary in ( 
                  select salary
                  from 
                        (select distinct salary
                        from employees
                        order by salary desc)
                  where rownum<4);


--sa se afiseze info despre ang care au fost ang dupa KING

select *
from employees
where hire_date > all(select hire_date
                 from employees
                 where lower(last_name)='king');
                 
select *
from employees
where hire_date > (select max(hire_date)
                 from employees
                 where lower(last_name)='king'); 
