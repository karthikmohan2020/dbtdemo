{{
      config(
        materialized = 'incremental',
        on_schema_change = 'fail'
        )
}}
WITH src_reviews AS (
        SELECT 
            *
        FROM
            {{ ref("src_reviews") }}
)
SELECT
    {{ dbt_utils.generate_surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text']) }}
    AS review_id,
    * 
FROM
    src_reviews
WHERE REVIEW_TEXT IS NOT NULL
{% if is_incremental() %}
  and REVIEW_DATE > ( select max(REVIEW_DATE) from {{ this }})
{% endif %}
