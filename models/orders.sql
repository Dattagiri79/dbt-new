{{ config (
materialized='incremental',
unique_key= 'id'
)}}

with orders as(
    select * from {{ ref('norm_dbt') }}
    {% if is_incremental() %}
    where hire_date >= (select max(hire_date) from {{ this }} )
    {% endif %}
)select * from orders