with department_salary_agg AS (
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
)

select * from department_salary_agg