WITH 
-- Step 1: Normalize employee names
normalized_employees AS (
    SELECT 
        id,
        INITCAP(TRIM(name)) AS name,  -- Normalize name: remove spaces and convert to proper case
        department_id,
        hire_date
    FROM Employees
) ,
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

SELECT * 
FROM normalized_employees