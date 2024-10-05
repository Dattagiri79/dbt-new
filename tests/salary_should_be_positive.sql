
with employee_salary_payment as(
    select * from {{ ref("fact_employee_salary_payment") }}
) 
select 
employee_id,
department_id,
salary_amount
from employee_salary_payment
where salary_amount <= 0
