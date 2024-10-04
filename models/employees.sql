
{{ config(materialized='table') }}

WITH 
-- Step 1: Normalize employee names
normalized_employees AS (
    SELECT 
        id,
        INITCAP(TRIM(name)) AS name,  -- Normalize name: remove spaces and convert to proper case
        department_id,
        hire_date
    FROM Employees
),

-- Step 2: Aggregate total salary by department
department_salary_agg AS (
    SELECT 
        e.department_id,
        d.department_name,
        SUM(s.salary_amount) AS total_salary,
        AVG(s.salary_amount) AS avg_salary,
        COUNT(e.id) AS employee_count
    FROM Employees e
    JOIN Salaries s ON e.id = s.employee_id
    JOIN Departments d ON e.department_id = d.department_id
    GROUP BY e.department_id, d.department_name
),

-- Step 3: Filter employees hired in the last 2 years
recent_hires AS (
    SELECT 
        e.id,
        e.name,
        e.hire_date,
        d.department_name
    FROM normalized_employees e
    JOIN Departments d ON e.department_id = d.department_id
    WHERE e.hire_date >= DATEADD(YEAR, -2, CURRENT_DATE)
)

-- Step 4: Final output combining all the transformations
SELECT 
    e.id,
    e.name,
    e.hire_date,
    ds.department_name,
    ds.total_salary,
    ds.avg_salary,
    ds.employee_count
FROM recent_hires e
JOIN department_salary_agg ds ON e.department_name = ds.department_name
ORDER BY e.hire_date DESC