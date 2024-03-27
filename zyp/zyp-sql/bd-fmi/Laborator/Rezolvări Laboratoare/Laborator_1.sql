--EXERCITII

/*1. SA SE LISTEZE STRUCTURA TABELELOR CU FCT DESC 
  2. SA SE LISTEZE CONTINUTUL SELECT * FROM X;*/

-- EMPLOYEES
DESC EMPLOYEES;
SELECT * FROM EMPLOYEES;

--DEPARTMENTS
DESC DEPARTMENTS;
SELECT * FROM  DEPARTMENTS;

--LOCATIONS
DESC LOCATIONS;
SELECT * FROM LOCATIONS;

--COUNTRIES
DESC COUNTRIES;
SELECT * FROM COUNTERIES;

--REGIONS
DESC REGIONS;
SELECT * FROM REGIONS;

--JOB_HISTORY 
DESC JOB_HISTORY;
SELECT * FROM JOB_HISTORY;

--JOBS
DESC JOBS;
SELECT * FROM JOBS;

------------------------------------------------------------------------------------------------------------------

/*3. Sa se afiseze codul ang, numele, cod_job , data ang
  * Exercitiul este improvizat cu join , nu este rezolvarea problemei.
*/

SELECT ang.employee_id AS ID, ang.first_name || ' ' ||ang.last_name "Nume Angajat" , ang.department_id, TO_CHAR(ang.hire_date, 'DD.MM.YY') "Data Angajarii", d.department_name "Nume Dep"
FROM EMPLOYEES ang JOIN DEPARTMENTS d ON(ang.department_id = d.department_id)
ORDER BY employee_id ASC;

-- ... Pentru departamentul cu ID-ul 30
SELECT ang.employee_id AS ID, ang.first_name || ' ' ||ang.last_name "Nume Angajat" , ang.department_id, TO_CHAR(ang.hire_date, 'DD.MM.YY') "Data Angajarii", d.department_name "Nume Dep"
FROM EMPLOYEES ang JOIN DEPARTMENTS d ON(ang.department_id = d.department_id)
WHERE ang.department_id = 50
ORDER BY employee_id ASC;

------------------------------------------------------------------------------------------------------------------

/* 4. S? se listeze, cu ?i f?r? duplicate, codurile job-urilor din tabelul EMPLOYEES.  */
SELECT job_id "Cod_job" FROM EMPLOYEES;
SELECT DISTINCT job_id "Cod_job" FROM EMPLOYEES;

------------------------------------------------------------------------------------------------------------------

/* 5. S? se afi?eze numele concatenat cu job_id-ul, separate prin virgula si spatiu, si
etichetati coloana “Angajat si titlu”. */

SELECT first_name || ' '|| last_name || ' , '|| job_id "Angajat si titlu"
FROM EMPLOYEES;

------------------------------------------------------------------------------------------------------------------

/* 6. Creati o cerere prin care sa se afiseze toate datele din tabelul EMPLOYEES. Separa?i
fiecare coloan? printr-o virgul?. Etichetati coloana ”Informatii complete”. */

SELECT employee_id || ' , ' || first_name || ' , ' || last_name || ' , ' || email || ' , ' || phone_number|| ' , ' || hire_date
|| ' , ' || job_id || ' , ' || salary || ' , ' || commission_pct || ' , ' || manager_id || ' , ' || department_id "Informatii complete"
FROM EMPLOYEES;

------------------------------------------------------------------------------------------------------------------

/* 7. Sa se listeze numele si salariul angaja?ilor care câ?tig? mai mult de 2850 $.*/
SELECT first_name || ' , ' || last_name , salary 
FROM EMPLOYEES
WHERE salary >= 2850;

------------------------------------------------------------------------------------------------------------------

/* 8. S? se creeze o cerere pentru a afi?a numele angajatului ?i num?rul departamentului
pentru angajatul nr. 104.*/
SELECT first_name || ' ' || last_name ,department_id
FROM EMPLOYEES
WHERE department_id = 104;

------------------------------------------------------------------------------------------------------------------

/* 9. S? se afi?eze numele ?i salariul pentru to?i angaja?ii al c?ror salariu nu se afl? în
domeniul 1500-2850$. */
SELECT first_name || ' ' || last_name , salary
FROM EMPLOYEES
WHERE SALARY BETWEEN 1500 AND 2850;

--OR

SELECT first_name || ' ' || last_name , salary
FROM EMPLOYEES
WHERE SALARY >= 1500 AND SALARY <=  2850;

-- SA ZICEM CA VREM LA FEL CA IN CEREREA ANTERIOARA DAR NU VREM ANG CU SALARIUL IN DOMENIUL 1500-2850$

SELECT first_name || ' ' || last_name , salary
FROM EMPLOYEES
WHERE SALARY NOT BETWEEN 1500 AND 2850;

------------------------------------------------------------------------------------------------------------------

/* 10. S? se creeze o cerere pentru a afi?a numele angajatului ?i num?rul departamentului
pentru angajatul nr. 104.
*/

SELECT first_name || ' ' || last_name "Nume Ang" , department_id 
FROM EMPLOYEES
WHERE employee_id = 104;

------------------------------------------------------------------------------------------------------------------

/* 11. S? se afi?eze numele ?i salariul pentru to?i angaja?ii al c?ror salariu nu se afl? în
domeniul 1500-2850$.
*/

SELECT first_name || ' ' || last_name "Nume Ang" , salary
FROM EMPLOYEES
WHERE salary NOT BETWEEN 1500 AND 2850;

------------------------------------------------------------------------------------------------------------------

/* 12. S? se afi?eze numele, job-ul ?i data la care au început lucrul salaria?ii angaja?i între
20 Februarie 1987 ?i 1 Mai 1989. Rezultatul va fi ordonat cresc?tor dup? data de
început.
SELECT
*/

SELECT first_name || ' ' || last_name "Nume Ang" , job_id, hire_date
FROM EMPLOYEES
WHERE hire_date  BETWEEN  '16-JUN-03' AND '22-MAY-07'
ORDER BY hire_date ASC;

SELECT first_name || ' ' || last_name "Nume Ang" , job_id, hire_date
FROM EMPLOYEES
WHERE hire_date  BETWEEN  '16-JUN-2003' AND '22-MAY-2007'
ORDER BY hire_date ASC;

------------------------------------------------------------------------------------------------------------------

/* 13. S? se afi?eze numele salaria?ilor ?i codul departamentelor pentru toti angaja?ii din
departamentele 10 ?i 30 în ordine alfabetic? a numelor.
*/

SELECT first_name || ' ' || last_name , department_id 
FROM EMPLOYEES
WHERE department_id IN (10,30)
ORDER BY first_name;

------------------------------------------------------------------------------------------------------------------

/* 14. Să se afişeze numele şi salariile angajatilor care câştigă mai mult de 3500 $ şi
lucrează în departamentul 10 sau 30. Se vor eticheta coloanele drept Angajat si Salariu
lunar.
*/

SELECT first_name || ' ' || last_name "Nume Ang" , salary,department_id
FROM EMPLOYEES
WHERE salary > 3500 AND department_id IN(10,30);

------------------------------------------------------------------------------------------------------------------

/* 
15. Care este data curentă? Afişaţi diferite formate ale acesteia.
*/

SELECT sysdate FROM dual;
SELECT TO_CHAR(sysdate,'d-mm-y') FROM dual;
SELECT TO_CHAR(sysdate,'day-mm-yy') FROM dual;
SELECT TO_CHAR(sysdate,'ddd-mm-y') FROM dual;
SELECT TO_CHAR(sysdate,'dd-mon-yyyy') FROM dual;

------------------------------------------------------------------------------------------------------------------

/* 
16. Sa se afiseze numele şi data angajării pentru fiecare salariat care a fost angajat in
2007. Se cer 2 soluţii: una în care se lucrează cu formatul implicit al datei şi alta prin
care se formatează data.
*/

SELECT first_name || ' ' || last_name , hire_date
FROM EMPLOYEES
WHERE hire_date LIKE '%07';

SELECT first_name || ' ' || last_name , hire_date
FROM EMPLOYEES
WHERE to_char(hire_date, 'yyyy') = '2007';

------------------------------------------------------------------------------------------------------------------

/* 
17. Să se afişeze numele şi job-ul pentru toţi angajaţii care nu au manager.
*/

SELECT first_name || ' ' || last_name, manager_id
FROM EMPLOYEES
WHERE manager_id IS NULL;

------------------------------------------------------------------------------------------------------------------

/* 
18. Sa se afiseze numele, salariul si comisionul pentru toti salariatii care castiga
comisioane. Sa se sorteze datele in ordine descrescatoare a salariilor si comisioanelor.
*/

SELECT first_name || ' ' || last_name "Nume Ang" ,commission_pct
FROM EMPLOYEES
WHERE commission_pct IS NOT NULL
ORDER BY salary, commission_pct;

------------------------------------------------------------------------------------------------------------------

/* 
19. Eliminaţi clauza WHERE din cererea anterioară. Unde sunt plasate valorile NULL în
ordinea descrescătoare?
*/

SELECT first_name || ' ' || last_name "Nume Ang" ,commission_pct
FROM EMPLOYEES
ORDER BY salary, commission_pct; --NULL's are on  the end of the  list.

------------------------------------------------------------------------------------------------------------------

/* 
20. Să se listeze numele tuturor angajatilor care au a treia literă din nume ‘A’.
*/

SELECT last_name || ' ' || first_name "Nume Ang cu  a3-a litera A"
FROM EMPLOYEES
WHERE last_name LIKE '__a%';


SELECT last_name || ' ' || first_name "Nume Ang cu  a3-a litera A"
FROM EMPLOYEES
WHERE substr(last_name,3,1) = lower('a');


------------------------------------------------------------------------------------------------------------------

/* 
21. Să se listeze numele tuturor angajatilor care au 2 litere ‘L’ in nume şi lucrează în
departamentul 30 sau managerul lor este 101.
*/

SELECT last_name || ' ' ||first_name "Nume Ang", department_id, manager_id
FROM EMPLOYEES
WHERE (first_name LIKE '%l%l%' AND department_id = 30) OR (first_name LIKE '%l%l%' AND manager_id = 101);

------------------------------------------------------------------------------------------------------------------

/* 
22. Să se afiseze numele, job-ul si salariul pentru toti salariatii al caror job conţine şirul
“clerk” sau “rep” si salariul nu este egal cu 1000, 2000 sau 3000 $. (operatorul NOT IN)
*/

SELECT last_name || ' ' || first_name, job_id, salary
FROM EMPLOYEES
WHERE (lower(job_id)  LIKE '%clerk' OR lower(job_id)  LIKE '%rep') AND salary NOT IN(1000,2000,3000);

------------------------------------------------------------------------------------------------------------------

/* 
23. Să se afiseze numele, salariul si comisionul pentru toti angajatii al caror salariu este
mai mare decat comisionul (salary*commission_pct) marit de 5 ori.
*/

SELECT last_name || ' ' || first_name ,salary, 5 * (salary* commission_pct)
FROM EMPLOYEES
WHERE salary > 5 * (salary* commission_pct);

-----------------------------------END------------------------------------------------------------------------------------------
/*
SAGEATA DE LA EMPLOYEE LA EL INSUSI, EX CA SA VAD CARE ESTE SEFUL UNNUI ANAGAT SI SEFUL LA RANDUL LUI TREBUIE SA FIE UN ANG
*/
