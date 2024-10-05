SELECT 
    id,
    INITCAP(TRIM(name)) AS name,
    department_id,
    hire_date
FROM {{ source("DBT_DATTAGIRI79", "DBTUSE") }}
