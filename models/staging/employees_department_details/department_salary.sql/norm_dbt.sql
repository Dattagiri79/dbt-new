{{ config(materialized='view') }}

WITH 
-- Step 1: Normalize employee names
normalized_employees AS (
    SELECT 
        id,
        INITCAP(TRIM(name)) AS name,  -- Normalize name: remove spaces and convert to proper case
        department_id,
        hire_date
    FROM {{ source("DBT_DATTAGIRI79", "EMPLOYEES") }}  -- Reference the 'employees' model correctly
)
select * from normalized_employees