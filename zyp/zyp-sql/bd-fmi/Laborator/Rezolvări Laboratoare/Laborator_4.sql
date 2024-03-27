Problema 1
/*
AVG ignora null ? 
  - DA
count ignira ?  
  - DA
*/

SELECT ROUND(sum(commission_pct)/COUNT(employee_id),2)
FROM EMPLOYEES;


 Problema 2.

 SELECT MIN(salary) Minim, MAX(salary) Maxim,
       SUM(salary) Suma, ROUND(AVG(salary)) Media
FROM   EMPLOYEES



Problema 5
/*
Să se determine numărul de angajaţi care sunt şefi. Etichetati coloana “Nr. manageri”.
*/                                  

SELECT COUNT(DISTINCT manager_id) Manageri
FROM EMPLOYEES;



Problema  7
/*
Scrieţi o cerere pentru a se afişa numele departamentului, locaţia, numărul de angajaţi şi salariul mediu pentru angajaţii
din acel departament. Coloanele vor fi etichetate corespunzător.
*/
                                   
--Caz Gresit
SELECT department_name,location_id,COUNT(employee_id) nr,
ROUND(AVG(salary),2) medie
from EMPLOYEES JOIN departments using(department_id)
GROUP BY department_name,location_id;

--Caz Corect


Problema 8
/*
Să se afişeze codul şi numele angajaţilor care câstiga mai mult decât salariul mediu din firmă. 
Se va sorta rezultatul în ordine descrescătoare a salariilor. 
*/

SELECT employee_id,last_name,AVG(salary) medie
FROM EMPLOYEES
-- WHERE filtreaza liniile.
GROUP BY employee_id,last_name,salary
-- Clauza  HAVING imi filtreaza grupurile.
HAVING salary>avg(salary);


Problema 10
/*
Pentru departamentele in care salariul maxim depăşeşte 3000$, să se obţină codul, numele acestor departamente
şi salariul maxim pe departament.
                                   
*/
SELECT department_id, department_name, max(salary)
FROM EMPLOYEES JOIN departments using(department_id)
--WHERE max(salary)>3000 Fundamental GRESIT!!!
GROUP BY department_id, department_name
HAVING max(salary)>3000;


Problema 14
/*
Să se obtina codul, titlul şi salariul mediu al job-ului pentru care salariul mediu este  minim. 
*/
SELECT job_id, job_title, AVG(salary) medie
FROM EMPLOYEES JOIN jobs using(job_id)
GROUP BY job_id, job_title
HAVING AVG(salary) = (SELECT MIN(AVG(salary))
                      FROM EMPLOYEES
                      GROUP BY job_id);

-- SAU
SELECT job_id,job_title,AVG(salary) medie
FROM EMPLOYEES JOIN jobs using(job_id)
GROUP BY job_id,job_title
HAVING AVG(salary)=(SELECT min(avg(salary))
                    FROM EMPLOYEES
                    GROUP BY job_id);

/*
 * sub cerer in select = o valoare(1linie, 1 coloana)
 * sub in from = doar nesinc
	- grija la col folosita in join
	- col calc in from primesc nume
*/
			       
Problema 27
			       
/*
Scrieţi o cerere pentru a afişa job-ul, salariul total pentru job-ul respectiv pe departamente 
 si salariul total pentru job-ul respectiv pe departamentele 30, 50, 80.
Se vor eticheta coloanele corespunzător. Rezultatul va apărea sub forma de mai jos:  
       Job             Dep30          Dep50   Dep80      Total       
 */
SELECT c1, (subcerere),c3
FROM tabel;

SELECT department_id,job_id Job, 
 (SELECT sum(salary)
  FROM EMPLOYEES
  WHERE department_id=30 AND job_id=e.job_id) Dep30,
   (SELECT sum(salary)
  FROM EMPLOYEES
  WHERE department_id=50 AND job_id=e.job_id) Dep50,
   (SELECT sum(salary)
  FROM EMPLOYEES
   WHERE department_id=80 AND job_id=e.job_id) Dep80,
SUM(salary) total
FROM EMPLOYEES e
GROUP BY department_id, job_id
GROUP BY department_id, job_id;

Problema 28

/* 
Să se creeze o cerere prin care să se afişeze numărul total de angajaţi şi, din acest total, numărul celor care au fost 
angajaţi în 1997, 1998, 1999 si 2000. Denumiti capetele de tabel in mod corespunzator.
*/

SELECT COUNT(employee_id) total,
(SELECT COUNT(employee_id)
 FROM EMPLOYEES
 WHERE to_char(hire_date,'yyyy')=1997) An1997,
 (SELECT COUNT(employee_id)
 FROM EMPLOYEES
 WHERE to_char(hire_date,'yyyy')=1998) An1998
FROM EMPLOYEES
GROUP BY 8;

-- SAU MAI USOR

SELECT (SELECT COUNT(employee_id) FROM employees) total,
(SELECT COUNT(employee_id)
 FROM EMPLOYEES
 WHERe to_char(hire_date,'yyyy')=1997) An1997,
 (SELECT COUNT(employee_id)
 FROM EMPLOYEES
 WHERe to_char(hire_date,'yyyy')=1998) An1998
FROM DUAL;


--SUBCERE IN FROM DOAR NESINCRONIZATE - > PT CA FROM SE EXECUTA PRIMUL , IAR O SUBCERE IN FROM INSEAMAN NESICRONIZATA
			       
PRoblemele 31, 32,34  
/*
31. Să se afişeze numele, salariul, codul departamentului si salariul mediu din departamentul respectiv.
32. Modificaţi cererea anterioară, pentru a determina şi listarea numărului de angajaţi din departamente.
34.  Rezolvaţi problema 22 cu ajutorul subcererilor specificate în clauza FROM.
*/

SELECT last_name, salary, department_id, medie,nr

FROM employees JOIN (SELECT avg(salary) medie, 
                       COUNT(*) nr,department_id
                      FROM employees
                      GROUP BY department_id) 
USING (department_id);   




Problema 33
/*
Pentru fiecare departament, să se afişeze numele acestuia, numele şi salariul celor mai prost plătiţi angajaţi din cadrul său.
*/

SELECT  D.DEPARTMENT_NAME, DEPARTMENT_ID,minSALARY,
FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME
FROM EMPLOYEES JOIN (SELECT DEPARTMENT_ID,min(salary) minSALARY
                      FROM EMPLOYEES
                      GROUP BY DEPARTMENT_ID)
                USING(DEPARTMENT_ID)
      RIGHT JOIN departments d using(department_id)
WHERE salary = minSalary OR employee_id IS NULL;

-- Ce este Gresit 
SELECT * FROM EMPLOYEES LEFT JOIN departments ON (column1) WHERE B.column2=10; 

SELECT * FROM A tab1 LEFT JOIN B tab2 ON (tab1.column1 = tab2.colum2) WHERE B.column2=10; 




--Sa se afiseze codul, numele departamentului si numarul de angajati pentru departamentele in care lucreaza mai putin de 4 angajati. 


select department_id, department_name, count(employee_id)
from employees join departments using(department_id)
group by department_id, department_name
having count(employee_id) <= 4
ORDER BY department_id;

--dep care nu au  ang ? 

select department_id, department_name, count(employee_id)
from employees right outer join departments using(department_id)
group by department_id, department_name
having count(employee_id) < 4
ORDER BY department_id;