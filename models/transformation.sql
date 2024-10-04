WITH employee_salary_department AS (
    SELECT 
        e.id,
        e.name,
        d.department_name,
        s.salary_amount
    FROM Employees e
    JOIN Salaries s ON e.id = s.employee_id
    JOIN Departments d ON e.department_id = d.department_id
)

-- Step 3: Select transformed data from employee_salary_department for validation
SELECT * 
FROM employee_salary_department