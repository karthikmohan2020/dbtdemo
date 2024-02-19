{% snapshot scd_raw_listings %}
    
{{
    config(
           target_database='demo',
           target_schema='dev',
           unique_key='id',
           strategy='timestamp',
           updated_at='updated_at',
           invalidate_hard_deletes=True
    )
}}
    
SELECT * FROM {{ source('demo','listings') }}

{% endsnapshot %}