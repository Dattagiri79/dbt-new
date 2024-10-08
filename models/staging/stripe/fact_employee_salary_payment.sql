WITH RankedSalaries AS (
    SELECT 
        employee_id,
        department_id,
        hire_date,
        salary_amount,
        ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY hire_date DESC) AS rn
    FROM {{ source("stripe", "FACT_EMPLOYEE_SALARY") }}
)
SELECT 
    employee_id,
    department_id,
    hire_date,
    salary_amount
FROM RankedSalaries
WHERE rn = 1