{{
  config(
    materialized = 'incremental',
    on_schema_change='fail'
  )
}}

WITH stage_ratings AS (
  SELECT * FROM {{ ref('stage_ratings') }}
)

SELECT
  user_id,
  movie_id,
  rating,
  rating_timestamp
FROM stage_ratings
WHERE rating IS NOT NULL

{% if is_incremental() %}
  AND rating_timestamp > (SELECT MAX(rating_timestamp) FROM {{ this }})
{% endif %}