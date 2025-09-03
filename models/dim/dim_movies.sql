WITH stage_movies AS (
    SELECT * FROM {{ ref('stage_movies') }}
)
SELECT
    movie_id,
    INITCAP(TRIM(title)) AS movie_title,
    SPLIT(genres, '|') AS genre_array,
    genres
FROM stage_movies