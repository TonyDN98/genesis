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


--We want to display each patient's full name in a single column.
--Their last_name in all upper letters must appear first, then first_name in all lower case letters. 
--Separate the last_name and first_name with a comma. Order the list by the first_name in decending order
--EX: SMITH,jane

select  concat(upper(last_name),',',lower(first_name)) as "Full Name"
from patients
order by first_name desc;


-- Show the province_id(s), sum of height; where the total sum of its patient's height is greater 
--than or equal to 7,000.

select province_id, SUM(height)
from patients
group by province_id
having SUM(height) >= 7000;


-- Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'

select (max(weight) - min(weight)) as weightDifference
from patients
WHERE last_name = 'Maroni';

-- Show all of the days of the month (1-31) and how many admission_dates occurred on that day. 
-- Sort by the day with most admissions to least admissions.


select day(admission_date) as 'day_addmission', count(admission_date) as 'nr_of_ad'
from admissions 
group by day_addmission
order by nr_of_ad DESC;


-- Show all columns for patient_id 542's most recent admission_date.

SELECT * 
from admissions
WHERE patient_id = 542
ORDER BY admission_date desc
LIMIT 1;

SELECT *
FROM admissions
WHERE patient_id = 542
GROUP BY patient_id
HAVING
  admission_date = MAX(admission_date);
  
  
SELECT *
FROM admissions
WHERE
  patient_id = '542'
  AND admission_date = (
    SELECT MAX(admission_date)
    FROM admissions
    WHERE patient_id = '542'
  )
  
SELECT *
FROM admissions
GROUP BY patient_id
HAVING
  patient_id = 542
  AND max(admission_date)


--Show patient_id, attending_doctor_id, and diagnosis for admissions that match one of the two criteria:
--1. patient_id is an odd number and attending_doctor_id is either 1, 5, or 19.
--2. attending_doctor_id contains a 2 and the length of patient_id is 3 characters.

select patient_id, attending_doctor_id, diagnosis
from admissions
WHERE MOD(patient_id,2) != 0 AND attending_doctor_id IN (1,5,19) or 
attending_doctor_id LIKE '%2%' AND LENGTH(patient_id) = 3

SELECT
  patient_id,
  attending_doctor_id,
  diagnosis
FROM admissions
WHERE
  (
    attending_doctor_id IN (1, 5, 19)
    AND patient_id % 2 != 0
  )
  OR 
  (
    attending_doctor_id LIKE '%2%'
    AND len(patient_id) = 3
  )