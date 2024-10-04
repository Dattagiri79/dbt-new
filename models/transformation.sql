with
    employee_salary_department as (
        select e.id, e.name, d.department_name, s.salary_amount
        from employees e
        join salaries s on e.id = s.employee_id
        join departments d on e.department_id = d.department_id
    )

-- Step 3: Select transformed data from employee_salary_department for validation
select *
from employee_salary_department
