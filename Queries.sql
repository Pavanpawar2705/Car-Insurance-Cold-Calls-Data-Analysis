show tables; -- car_insurance_cold_calls_dataset
-- Problem 2: Data Exploration
-- 2.1
select count(*) from car_insurance_cold_calls_dataset; -- 4000

-- 2.2
select distinct(job) from car_insurance_cold_calls_dataset;  -- 12 and list

-- 2.3
select case
when age <18 then '18'
when (age >= 18 and age <= 30) then '18-30'
when (age >= 31 and age <= 45) then '31-45'
when (age >= 46 and age <= 60) then '46-60'
else '60+'
end age_groups,
count(*)*100/(select count(*) from car_insurance_cold_calls_dataset) as breakdown
from car_insurance_cold_calls_dataset
group by age_groups;

-- 2.4
SELECT COUNT(*)
FROM car_insurance_cold_calls_dataset A
WHERE Id IS NULL
OR Age IS NULL
OR Job IS NULL
OR Marital IS NULL
OR Education IS NULL
OR A.Default IS NULL
OR Balance IS NULL
OR HHInsurance IS NULL
OR CarLoan IS NULL
OR Communication IS NULL
OR LastContactDay IS NULL
OR LastContactMonth IS NULL
OR NoOfContacts IS NULL
OR DaysPassed IS NULL
OR PrevAttempts IS NULL
OR Outcome IS NULL
OR CallStart IS NULL
OR CallEnd IS NULL
OR CarInsurance IS NULL;

(OR)

SELECT COUNT(*) AS RecordsWithMissingValues
FROM car_insurance_cold_calls_dataset A
WHERE 
  COALESCE(Id,Age,Job,Marital,Education,A.Default,Balance,HHInsurance,CarLoan,Communication,LastContactDay,LastContactMonth,NoOfContacts,DaysPassed,PrevAttempts,Outcome,CallStart,CallEnd,CarInsurance) IS NULL;

-- 2.5
SELECT outcome, count(*) from car_insurance_cold_calls_dataset group by outcome;

-- 2.6
select count(*) from car_insurance_cold_calls_dataset where HHInsurance = 1 and CarLoan =1

-- Problem 3: Aggregations

-- 3.1
select job, avg(balance), min(balance), max(balance) from car_insurance_cold_calls_dataset group by job;

-- 3.2
select CASE
when HHInsurance = 1 then "Insurance Holders"
else "Non-holders"
END as holders,
count(*)
from car_insurance_cold_calls_dataset
group by holders;

-- 3.3
-- Continuation


