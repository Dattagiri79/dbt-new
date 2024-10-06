{% snapshot mock_orders %}

{% set new_schema = target.schema + '_snapshot' %}

{{
    config(
        target_database='DBT',
        target_schema=new_schema,
        unique_key='ORDER_ID',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

select * 
from DBT.{{ target.schema }}.mock_orders

{% endsnapshot %}