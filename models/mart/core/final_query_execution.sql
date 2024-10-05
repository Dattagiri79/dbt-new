{{ config(materialized='table') }}

WITH 
-- Step 1: Reference recent_hired model
recent_hired AS (
    SELECT * FROM {{ ref('recent_hired') }}
),

-- Step 2: Reference department_salary model
department_salary AS (
    SELECT * FROM {{ ref('department_salary') }}
)

-- Step 3: Final output combining all transformations
SELECT 
    e.id,
    e.name,
    e.hire_date,
    ds.department_name,
    ds.total_salary,
    ds.avg_salary,
    ds.employee_count
FROM recent_hired e
JOIN department_salary ds ON e.department_name = ds.department_name
ORDER BY e.hire_date DESC
