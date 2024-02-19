SELECT
    *
FROM
    {{ ref("dim_listings") }}
WHERE MINIMUM_NIGHTS < 1
LIMIT 10