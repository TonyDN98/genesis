/*
FUNCTII SQL
    - Functiile SQL sunt pre-def in sistemul ORACLE si pot fi utilizate in instructiuni SQL. A nu se confunda cu PLSQL.
    - Daca o functie SQL este apelata cu un argument diferit de cel asteptat, at sistemul converteste implicit argumentul inainte de evaluare.
    - Daca o functie SQL este apelata cu NULL atunci intoarce automat NULL.
*/

-----------------------------------------------------------------------------------------------

/* 
FUNCTII SINGLE-ROW
    - returneaza cate o singurear linie rezultat pentru fiecare linie a tabelului.
    - TO_CHAR - Converteste un numar sau date in sir de caractere
        * TO_CHAR(7) = '7';
        * TO_CHAR(-7) = '-7';
        * TO_CHAR(SYSDATE, 'DD/MM/YYYY') = '02/12/2005';
        
    - TO_DATE - Converteste un numar sau sir de caractere intr-o data.
        * TO_DATE('02-DEC-2005', dd-mon-yyyy);  

*/

select replace ('$a$aa', , '$') 
from dual;

/*
DECODE
-daca a =a intoarce a daca nu c daor cand avem egalitate in if , a=b, nu daca in a se afla ceva de genul b
-b=a intoarce b daca nu  c
-salariu pe  pozitia a3
-nu putem avem operator like in decode
-sa  valori daca NU e egal
 */

/* Pentru fiecare anagajat sa se afiseze numele si o coloana care reprezinta nr de vocale /conseoane din nume preferinta la INSTR prob pt vineri
consoanle , nr vocale - nr consoane ||| sirul care se traduce, si cel  ce se traduce */

select last_name, initcap(replace(translate(lower(last_name),'aeiou','#'),'#'))
from employees;
                                  
SELECT * FROM DUAL;
DESC DUAL;

select to_char(hire_date, 'dd/mm/yyyy') || ' ,' || last_name ||' , ' || first_name "Hire_date of employees" from  employees 
order by hire_date asc;
SELECT TO_CHAR(SYSDATE, 'MONTH') FROM DUAL;
-----------------------------------------------------------------------------------------------
/*
1.
Scrie?i o cerere care are urm?torul rezultat pentru fiecare angajat:
<prenume angajat> <nume angajat> castiga <salariu> lunar dar doreste <salariu de 3 ori mai mare>. 
Etichetati coloana
“Salariu ideal�?. Pentru concatenare, utiliza?i atât func?ia CONCAT cât ?i operatorul “||�?.
*/

SELECT last_name || ' ' || first_name || ' castiga: ' || salary || ' lunar dar doreste ' || (salary * 3)
FROM EMPLOYEES;

-----------------------------------------------------------------------------------------------
/*
2.
Scrie?i o cerere prin care s? se afi?eze prenumele salariatului
cu prima litera majuscul? ?i toate celelalte litere mici, numele acestuia cu majuscule ?i lungimea numelui, 
pentru angaja?ii al c?ror nume începe cu J sau M sau care au a treia liter? din nume A. Rezultatul va fi 
ordonat descresc?tor dup? lungimea numelui. Se vor eticheta coloanele corespunz?tor.
Se cer 2 solu?ii (cu operatorul LIKE ?i func?ia SUBSTR).
*/

SELECT INITCAP(last_name) || ' ' || UPPER(first_name) || ' ' || 'Lungime : ' || LENGTH(first_name) "Ex2"
FROM EMPLOYEES
WHERE first_name LIKE 'J%' OR first_name LIKE 'M%' OR first_name LIKE '__a%'
ORDER BY LENGTH(first_name) DESC;

SELECT INITCAP(last_name) || ' ' || UPPER(first_name) || ' ' || 'Lungime : ' || LENGTH(first_name) 
FROM EMPLOYEES
WHERE substr(first_name,1,1) = 'J' OR substr(first_name,1,1) = 'M'  OR substr(first_name,3,1) = 'a'
ORDER BY LENGTH(first_name) DESC;

-----------------------------------------------------------------------------------------------
/*
3.
S? se afi?eze pentru angaja?ii cu prenumele „Steven�?, codul, numele ?i 
codul departamentului în care lucreaz?. C?utarea trebuie s? nu fie case-sensitive,
iar eventualele blank-uri care preced sau urmeaz? numelui trebuie ignorate.

INTREBARE: AR TREBUI ADAUGATA INCA O CONDITIE AND ?? 

 WHERE (first_name = 'Steven' OR first_name = 'steven') AND TRIM(BOTH ' ' FROM first_name) ??
*/


SELECT employee_id, first_name || ' ' || last_name "Emp name" , department_id
FROM  EMPLOYEES
WHERE (first_name = 'Steven' OR first_name = 'steven');
-----------------------------------------------------------------------------------------------
/*

4. S? se afi?eze pentru to?i angaja?ii al c?ror nume se termin? cu litera 'e', codul, numele, 
lungimea numelui ?i pozi?ia din nume în care apare prima data litera 'a'. 
Utiliza?i alias-uri corespunz?toare pentru coloane.
    INTREBARE: CA FUNCTIA SA INTOARCA NUMARUL INDEXULUI IN CARE APARE LITERA X AR TREBUI SA PUNEM SI TO_NUMBER ? 
        SELECT employee_id, first_name, length(first_name) , TO_NUMBER(INSTR(first_name, 'a'))
    FROM EMPLOYEES
    WHERE first_name LIKE '%e';
*/

SELECT employee_id "ID", first_name, length(first_name) "Lungime nume", TO_NUMBER(INSTR(first_name, 'a')) "INDEX"
FROM EMPLOYEES
WHERE first_name LIKE '%e'
ORDER BY employee_id ASC;




SELECT employee_id "ID", first_name, length(first_name) "Lungime nume", TO_NUMBER(INSTR(first_name, 'a')) "INDEX"
FROM EMPLOYEES
WHERE SUBSTR(first_name, -1,1) = 'e'
ORDER BY employee_id ASC;
-----------------------------------------------------------------------------------------------
/*
5. S? se afi?eze detalii despre salaria?ii care au lucrat un num?r întreg de s?pt?mâni pân? la data curent?
 expr_date1 – expr_date2
*/

--TO_DATE  expr_date1 – expr_date2
SELECT  FLOOR(SYSDATE - HIRE_DATE), HIRE_DATE,TO_CHAR(HIRE_DATE,'DAY')
FROM EMPLOYEES
WHERE MOD(FLOOR(SYSDATE - HIRE_DATE),7)=0;

-----------------------------------------------------------------------------------------------
/*
6. S? se afi?eze codul salariatului, numele, salariul, salariul m?rit cu 15%, exprimat cu dou?
zecimale ?i num?rul de sute al salariului nou rotunjit la 2 zecimale. Eticheta?i ultimele dou?
coloane “Salariu nou�?, respectiv “Numar sute�?. Se vor lua în considerare salaria?ii al c?ror
salariu nu este divizibil cu 1000.
*/
SELECT employee_id, last_name, salary "SALARIU VECHI",
ROUND((salary * 15/100)) "15%",
TO_NUMBER(TO_CHAR((salary + (salary * 15/100)),'99999.99')) "SALARIU NOU",
ROUND(TO_NUMBER((salary + (salary * 15/100)),'99999.99') / 100,2) "NR DE SUTE"
FROM EMPLOYEES
WHERE MOD(salary,1000) >= 1
ORDER BY employee_id;
                             

/* 7. Să se listeze numele şi data angajării salariaţilor care câştigă comision. Să se eticheteze
coloanele „Nume angajat�?, „Data angajarii�?. Pentru a nu obţine alias-ul datei angajării
trunchiat, utilizaţi funcţia RPAD. */
                             
select last_name, rpad(hire_date,15)
from employees
where commission_pct is not null;

-----------------------------------------------------------------------------------------------
  
/* PROBLEMA 11 
Să se afişeze numele şi prenumele angajatului (într-o singură coloană), data angajării şi
data negocierii salariului, care este prima zi de Luni după 6 luni de serviciu. Etichetaţi
această coloană “Negociere�?. 
                             
care este prima zi de luni incepand cu data de  ....  -> add_mounth, add_day
mounth bettween prima oara data mare dupa data mica 
hire_date + 6 luni care pica luni */

SELECT last_name || '  ' || first_name "NUME", hire_date,
       NEXT_DAY(ADD_MONTHS(hire_date, 6), 'Monday') "Negociere" 
FROM employees;


select last_name || ' ' || first_name, hire_date, next_day(add_month(hire_date, 6), 'Monday')
from employees;

-----------------------------------------------------------------------------------------------
  
/* PROBLEMA 14
Să se afişeze numele angajaţilor şi comisionul. Dacă un angajat nu câştigă comision, să
se scrie “Fara comision�?. Etichetaţi coloana “Comision�?.
*/

SELECT first_name || ' ' ||last_name "Nume ang", commission_pct,
CASE
WHEN commission_pct > 0 THEN
    'Commision'
ELSE 'Fara comsion'
END
FROM employees;

-----------------------------------------------------------------------------------------------
/* PROBLEMA 16 
 Să se afişeze numele, codul job-ului, salariul şi o coloană care să arate salariul după
mărire. Se presupune că pentru IT_PROG are loc o mărire de 20%, pentru SA_REP
creşterea este de 25%, iar pentru SA_MAN are loc o mărire de 35%. Pentru ceilalţi
angajaţi nu se acordă mărire. Să se denumească coloana "Salariu renegociat".  */

select last_name, job_id, salary,
decode(job_id,'IT_PROG',salary*1.2,'SA_REP',salary*1.25,
'SA_MAN',salary*1.35,salary) "Salariu renegociat"
from employees;

-- PROBLEMA 16 CU CASE
select last_name, job_id, salary,
salary*
(case job_id
  when 'IT_PROG' then 1.2
  when 'SA_REP' then 1.25
  when 'SA_MAN' then 1.35
  else 1
  end) "Salariu renegociat"
from employees;

-- PROBLEMA 16 case general
select last_name, job_id, salary,
salary*
(case  
  when job_id='IT_PROG' then 1.2
  when job_id='SA_REP' then 1.25
  when job_id='SA_MAN' then 1.35
  else 1
  end) "Salariu renegociat"
from employees;

--SAU

select last_name, job_id, salary,
salary*
(case  
  when job_id in ('IT_PROG', 'SH_CLERK') then 1.2
  when job_id='SA_REP' then 1.25
  when job_id='SA_MAN' then 1.35
  else 1
  end) "Salariu renegociat"
from employees;

-----------------------------------------------------------------------------------------------
                             

/*
17. S? se afi?eze numele salariatului, codul ?i numele departamentului pentru to?i angaja?ii.
Obs: Numele sau alias-urile tabelelor sunt obligatorii în dreptul coloanelor care au acela?i
nume în mai multe tabele. Altfel, nu sunt necesare dar este recomandat? utilizarea lor pentru
o mai bun? claritate a cererii.
*/
SELECT e.employee_id, e.last_name, d.department_name "Nume Departament"
FROM EMPLOYEES e INNER JOIN DEPARTMENTS d ON (d.department_id = e.department_id)
ORDER BY e.employee_id ASC, d.department_id  ASC;

-----------------------------------------------------------------------------------------------
/*
18. S? se listeze titlurile job-urile care exist? în departamentul 30.
*/
SELECT j.job_id, j.job_title, d.department_id
FROM DEPARTMENTS d left JOIN JOB_HISTORY jh ON (d.department_id = jh.department_id) 
left JOIN JOBS j ON (jh.job_id = j.job_id)
WHERE d.department_id = 30;

SELECT j.job_title , d.department_id,
FROM JOBS j JOIN JOB_HISTORY jh ON (j.job_id = jh.job_id)
JOIN DEPARTMENTS d ON (jh.deparment_id = d.department_id)
WHERE d.department_id = 30;

select department_id from departments
where department_id = 30;

--18 angajatii au jobul , nu departamentele

select *
from employees join jobs on (employees.job_id = jobs.job_id)
where department_id = 30;

-- 19.S? se afi?eze numele angajatului, numele departamentului ?i locatia pentru to?i angaja?ii care c�?tig? comision.
SELECT e.first_name || ' ' || e.last_name, d.department_name, l.city,e.commission_pct
FROM employees e JOIN departments d ON(e.department_id = d.department_id) JOIN locations l ON(d.location_id = l.location_id)
WHERE e.commission_pct IS NOT NULL
ORDER BY e.commission_pct DESC;

--20 .S? se afi?eze numele salariatului ?i numele departamentului pentru to?i salaria?ii care au litera A inclus? �n nume.
SELECT e.first_name || ' ' || e.last_name , d.department_name
FROM employees e JOIN departments d ON(e.department_id = d.department_id)
WHERE first_name LIKE'%a%' OR first_name LIKE'A%';







