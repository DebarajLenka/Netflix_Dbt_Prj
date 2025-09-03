WITH stage_scores AS (
    SELECT * FROM {{ ref('stage_genome_scores') }}
)

SELECT
    movie_id,
    tag_id,
    ROUND(relevance, 4) AS relevance_score
FROM stage_scores
WHERE relevance > 0