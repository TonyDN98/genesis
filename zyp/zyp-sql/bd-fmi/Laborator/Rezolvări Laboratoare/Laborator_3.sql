/* PROBLEMA 1 GATES
Scrieţi o cerere pentru a se afişa numele, luna (în litere) şi anul angajării pentru toţi salariaţii din acelaşi departament 
cu Gates, al căror nume conţine litera “a”. Se va exclude Gates. Se vor da 2 soluţii pentru determinarea apariţiei literei “A”
în nume. De asemenea, pentru una din metode se va da şi varianta join-ului conform standardului SQL99.

** luna in litere gates e exclus
** join employee cu employee
** inca un tabel de emplyee sa l gasim pe gates si dep lui */

select ang.last_name, to_char(ang.hire_date, 'month-yyyy'),ang.employee_id,ang.department_id
from employees ang join employees gates on (ang.department_id = ang.department_id)
where lower(ang.last_name) like '%a%' and lower(gates.last_name) = 'gates'and lower(ang.last_name) != 'gates'; 

-------------------------------------------------------------------------------------------------------------------

/* 2. 
Să se afişeze codul şi numele angajaţilor care lucrează în acelasi departament cu cel puţin un angajat al cărui nume conţine 
litera “t”. Se vor afişa, de asemenea, codul şi  numele departamentului respectiv. 
Rezultatul va fi ordonat alfabetic după nume. Se vor da 2 soluţii pentru join (condiţie în clauza WHERE şi sintaxa introdusă 
de standardul SQL3). */

select  distinct ang.employee_id, ang.last_name, ang.department_id, d.department_name

from employees ang join employees t on (ang.department_id = t.department_id)
join departments d on (ang.department_id = ang.department_id)
where lower(t.last_name)  like '%t%' and
ang.employee_id <> t.employee_id
order by ang.last_name;
-------------------------------------------------------------------------------------------------------------------

--ex 4,5,6 TEMAAA

-------------------------------------------------------------------------------------------------------------------

/*OPERATIUNI PE MULTIMI 
** Operatori pe multimi
** Reuninule  UNION
** Reuninune cu dublicate UNION ALL
** Intesectare INTERSECT
** Diferenta MINUS
** Sa concida nr de coloane si tipuri de date compatibile
** ; se pune la sfarsit
** Daca facem reunuini si  nr de coloane nu e  identic putem adauga coalena cu  nul */

select c1,c2,c3
from log1
union 
select c1,null, c2
from log2

select to_char (c3 number)
from log1
union
select c6 varchar
log2;

-------------------------------------------------------------------------------------------------------------------

/* PROBLEMA 10
Se cer codurile departamentelor al căror nume conţine şirul “re” sau în care lucrează angajaţi având codul job-ului “SA_REP”. 
Cum este ordonat rezultatul? */

select department_id 
from departments 
where lower(department_name) like '%re%'
union 
select department_id 
from employees
where upper(job_id) = 'SA_REP' and department_id is not null;

/* PROBLEMA 11 

** UNION ALL reuleaza mai rpd ca union

Ce se întâmplă dacă înlocuim UNION cu UNION ALL în comanda precedentă?*/

select department_id 
from departments 
where lower(department_name) like '%re%'
union all
select department_id 
from employees
where upper(job_id) = 'SA_REP' and department_id is not null;



/*PROBLEMA 13
Se cer codurile departamentelor al căror nume conţine şirul “re” şi în care lucrează angajaţi având codul job-ului “HR_REP”.

**Cand avem SI in enenunt aveam operatorul INTERSECT
*/

select department_id 
from departments 
where lower(department_name) like '%re%'
intersect
select department_id 
from employees
where upper(job_id) = 'HR_REP';


