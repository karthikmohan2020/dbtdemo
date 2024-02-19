SELECT *
FROM
{{ ref("fact_reviews")}} R join {{ ref("dim_listings_cleansed")}} L
on R.listing_id = L.listing_id
where r.review_date < l.created_at
limit 10