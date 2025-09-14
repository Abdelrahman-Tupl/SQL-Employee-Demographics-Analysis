-- Advanced Grouping and Filtering by Gender and Age
select gender, avg(age) Filtered_Avg_Age, count(employee_id) Filtered_Emp_Count
from parks_and_recreation.employee_demographics
where (age <= 50) and (age >= 30) and (birth_date < 1990-01-01)
group by gender
having Filtered_Avg_Age > 42 and Filtered_Emp_Count >= 2
order by Filtered_Avg_Age asc, Filtered_Emp_Count desc
;


-- Advanced Employee Demographic Analysis by Gender and Birth Date
select gender, avg(age) Average_Employee_Age, min(birth_date) Oldest_Birth_Date, count(employee_id) Employee_Count
from parks_and_recreation.employee_demographics
where (age < 60 and birth_date >= '1970-01-01' and first_name not like '%a%')
group by gender
having (Average_Employee_Age > 40 and Employee_Count < 5)
order by Average_Employee_Age desc, Oldest_Birth_Date asc
;
