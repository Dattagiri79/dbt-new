{{ config(materialized='table') }}

with department_salary_agg as(
    select * from {{ ref('department_salary') }}
),
RankedSalaries as(
    select * from {{ ref('fact_employee_salary_payment') }}
),
normalized_employees as(
    select * from {{ ref('norm_dbt') }}
)
SELECT 
    ne.id AS employee_id,
    ne.name,
    ne.hire_date,
    rs.salary_amount,
    ds.department_id,
    ds.department_name,
    ds.total_salary,
    ds.avg_salary,
    ds.employee_count
FROM normalized_employees ne
JOIN RankedSalaries rs ON ne.id = rs.employee_id   
JOIN department_salary_agg ds ON ne.department_id = ds.department_id
GROUP BY 
    ne.id,
    ne.name,
    ne.hire_date,
    rs.salary_amount,
    ds.department_id,
    ds.department_name,
    ds.total_salary,
    ds.avg_salary,
    ds.employee_count
ORDER BY 
    ne.id  -- Optional: Order by employee ID for clarity
