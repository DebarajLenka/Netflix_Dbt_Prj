{{
    config(
        materialized = 'table'
    )
}}

WITH stage_tags AS (
    SELECT * FROM {{ ref('stage_genome_tags') }}
)

SELECT
    tag_id,
    INITCAP(TRIM(tag)) AS tag_name
FROM stage_tags