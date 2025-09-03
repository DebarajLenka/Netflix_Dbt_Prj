WITH ratings AS (
  SELECT DISTINCT user_id FROM {{ ref('stage_ratings') }}
),

tags AS (
  SELECT DISTINCT user_id FROM {{ ref('stage_tags') }}
)

SELECT DISTINCT user_id
FROM (
  SELECT * FROM ratings
  UNION
  SELECT * FROM tags
)