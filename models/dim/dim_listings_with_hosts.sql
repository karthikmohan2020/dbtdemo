WITH L AS (
    SELECT * FROM {{ ref("dim_listings")}}
),
H AS (
    SELECT * FROM {{ ref("dim_hosts")}}
)
SELECT  
    l.listing_id,
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.price,
    l.host_id,
    h.host_name,
    h.is_superhost as host_is_superhost,
    l.created_at,
    GREATEST(l.updated_at, h.updated_at) as updated_at
FROM
L LEFT JOIN H ON L.HOST_ID = H.HOST_ID