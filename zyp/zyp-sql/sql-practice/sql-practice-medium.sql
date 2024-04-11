-- Show unique birth years from patients and order them by ascending.

SELECT DISTINCT YEAR(birth_date) as birth_year
FROM patients
ORDER BY birth_year ASC;

--Show unique first names from the patients table which only occurs once in the list.
-- For example, if two or more people are named 'John' in the first_name column then don't include their name 
-- in the output list. If only 1 person is named 'Leo' then include them in the output.

SELECT	first_name 
FROM (
    SELECT first_name, count(first_name) as ocurred
    FROM patients
    GROUP BY first_name )
WHERE ocurred = 1

SELECT first_name
FROM patients
GROUP BY first_name
HAVING COUNT(first_name) = 1

-- Show patient_id and first_name from patients where their first_name start and ends with 's' 
-- and is at least 6 characters long.

select patient_id, first_name
from patients
where lower(first_name) LIKE 's%s'
AND length(first_name) >= 6;

-- Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.

-- Primary diagnosis is stored in the admissions table.

select p.patient_id, p.first_name, p.last_name
FROM patients p INNER JOIN admissions ad ON(p.patient_id = ad.patient_id)
WHERE lower(diagnosis) = 'dementia'

SELECT
  patient_id,
  first_name,
  last_name
FROM patients
WHERE patient_id IN (
    SELECT patient_id
    FROM admissions
    WHERE diagnosis = 'Dementia'
  );


  -- Display every patient's first_name.
-- Order the list by the length of each name and then by alphabetically.

select first_name
from patients
order by length(first_name) ASC , first_name ASC;


-- Show the total amount of male patients and the total amount of female patients in the patients table.
-- Display the two results in the same row.

SELECT 
  (SELECT count(*) FROM patients WHERE gender='M') AS male_count, 
  (SELECT count(*) FROM patients WHERE gender='F') AS female_count;
  
  
SELECT 
  SUM(Gender = 'M') as male_count, 
  SUM(Gender = 'F') AS female_count
FROM patients

select 
  sum(case when gender = 'M' then 1 end) as male_count,
  sum(case when gender = 'F' then 1 end) as female_count 
from patients;


--Show first and last name, allergies from patients which have allergies to either
--'Penicillin' or 'Morphine'. Show results ordered ascending 
--by allergies then by first_name then by last_name.

SELECT
  first_name,
  last_name,
  allergies
FROM patients
WHERE
  allergies IN ('Penicillin', 'Morphine')
ORDER BY
  allergies,
  first_name,
  last_name;


-- Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.

select patient_id, diagnosis
from admissions
group by patient_id, diagnosis
HAVING count(*) > 1;


--Show the city and the total number of patients in the city.
--Order from most to least patients and then by city name ascending.

SELECT city, count(patient_id) as num_city
from patients
group by city
order by num_city DESC, city ASC

--Show first name, last name and role of every person that is either patient or doctor.
--The roles are either "Patient" or "Doctor"

SELECt first_name, last_name, 'Patient' as ROLE
from patients
union ALL 
select first_name, last_name, 'Doctor'
from doctors;

-- Show all allergies ordered by popularity. Remove NULL values from query.

select allergies, count(allergies) as total
from patients
WHERE allergies IS NOT null
group by allergies
order by total DESC


SELECT
  allergies,
  count(allergies) AS total_diagnosis
FROM patients
GROUP BY allergies
HAVING
  allergies IS NOT NULL
ORDER BY total_diagnosis DESC


--Show all patient's first_name, last_name, and birth_date who were 
--born in the 1970s decade. Sort the list starting from the earliest birth_date.

select first_name, last_name, birth_date
from patients
WHERE year(birth_date) between 1970 AND 1979
order by birth_date asc;