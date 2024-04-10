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
