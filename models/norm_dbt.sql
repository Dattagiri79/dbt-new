{{ config(materialized='table') }}

WITH 
-- Step 1: Normalize employee names
normalized_employees AS (
    SELECT 
        id,
        INITCAP(TRIM(name)) AS name,  -- Normalize name: remove spaces and convert to proper case
        department_id,
        hire_date
    FROM {{ ref('employees') }}  -- Reference the 'employees' model correctly
)
select * from normalized_employees