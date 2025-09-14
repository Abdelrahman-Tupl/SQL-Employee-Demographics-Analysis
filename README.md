# SQL Project: Employee Demographics Analysis

This was a hands-on project I built to test my SQL skills right after finishing my beginner-level course. The goal wasn't just to pull data, but to practice combining different SQL clauses (`WHERE`, `GROUP BY`, `HAVING`, `ORDER BY`) to answer more complex questions in a single query.

This repository contains the two main queries I wrote to analyze the employee demographics data from the "Parks and Recreation" dataset.

---

### What I Practiced in this Project

* **Combining Multiple Filters:** I practiced writing `WHERE` clauses with several `AND` conditions to narrow down the data to a very specific group of employees.
* **Aggregating Data:** I used `GROUP BY` along with aggregate functions like `AVG()` and `COUNT()` to summarize the filtered data and find key metrics.
* **Filtering on Aggregates with `HAVING`:** This was the main challenge for me. I used `HAVING` to filter the results based on the *outcome* of an aggregation (for example, finding groups where the average age was over 40).
* **Advanced Sorting:** I sorted the final results using `ORDER BY` on more than one column, using both `ASC` and `DESC` to organize the output.

---

### The Queries I Wrote

Here are the exact queries I developed for this analysis.

#### Query 1: Filtering by Age and Gender
This query looks for employees in a specific age range, groups them by gender, and then filters those groups based on the average age and number of employees.

```sql
-- Advanced Grouping and Filtering by Gender and Age
select gender, avg(age) Filtered_Avg_Age, count(employee_id) Filtered_Emp_Count
from parks_and_recreation.employee_demographics
where (age <= 50) and (age >= 30) and (birth_date < 1990-01-01)
group by gender
having Filtered_Avg_Age > 42 and Filtered_Emp_Count >= 2
order by Filtered_Avg_Age asc, Filtered_Emp_Count desc
;
```

#### Query 2: A Deeper Dive into Demographics
This query adds another layer by filtering on names using `NOT LIKE`, then groups and filters the results to find very specific employee sub-groups.

```sql
-- Advanced Employee Demographic Analysis by Gender and Birth Date
select gender, avg(age) Average_Employee_Age, min(birth_date) Oldest_Birth_Date, count(employee_id) Employee_Count
from parks_and_recreation.employee_demographics
where (age < 60 and birth_date >= '1970-01-01' and first_name not like '%a%')
group by gender
having (Average_Employee_Age > 40 and Employee_Count < 5)
order by Average_Employee_Age desc, Oldest_Birth_Date asc
;
```

---

### How to Run This

1.  **Get the Database:** You'll need the `parks_and_recreation` database, which is provided by Alex the Analyst in his course materials.
2.  **Run the Script:** Simply execute the queries above in a MySQL client (like MySQL Workbench).

---

### 🔗 Credit & Inspiration

This whole project was inspired by the lessons and challenges in **Alex the Analyst's SQL series** on YouTube.
