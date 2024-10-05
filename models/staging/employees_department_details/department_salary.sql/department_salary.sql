{{ config(materialized='view') }}

with department_salary_agg AS (
    SELECT 
        e.department_id,
        d.department_name,
        SUM(s.salary_amount) AS total_salary,
        AVG(s.salary_amount) AS avg_salary,
        COUNT(e.id) AS employee_count
    FROM {{ source("DBT_DATTAGIRI79", "EMPLOYEES") }} e
    JOIN {{ source("DBT_DATTAGIRI79", "SALARIES") }} s ON e.id = s.employee_id
    JOIN {{ source("DBT_DATTAGIRI79", "DEPARTMENTS") }} d ON e.department_id = d.department_id
    GROUP BY e.department_id, d.department_name
)
select * from department_salary_agg