WITH department_salary AS (
    SELECT
        d.department_name,
        COUNT(e.id) AS employee_count,
        AVG(s.salary_amount) AS average_salary
    FROM
        Departments d
    LEFT JOIN
        Employees e ON d.department_id = e.department_id
    LEFT JOIN
        Salaries s ON e.id = s.employee_id
    GROUP BY
        d.department_name
)

SELECT
    department_name,
    employee_count,
    average_salary
FROM
    department_salary
ORDER BY
    department_name