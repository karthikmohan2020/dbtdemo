WITH raw_reviews AS (
    SELECT
        *
    FROM
        {{ source('airbnb', 'reviews') }}
)
SELECT
    listing_id,
        date AS REVIEW_DATE,
        reviewer_name,
        comments AS REVIEW_TEXT,
        sentiment AS REVIEW_SENTIMENT
FROM
    raw_reviews