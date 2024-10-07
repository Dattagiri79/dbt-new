{{ config(materialized='view') }}


with recent_hires AS (
    SELECT 
        e.id,
        e.name,
        e.hire_date,
        d.department_name
    FROM {{ ref('norm_dbt') }} e
    JOIN {{ source("DBT_DATTAGIRI79", "DEPARTMENTS") }} d ON e.department_id = d.department_id
    WHERE e.hire_date >= DATEADD(YEAR, -2, CURRENT_DATE)
)
select * from recent_hires