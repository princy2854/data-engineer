WITH pull_requests AS (

SELECT
    CAST(id AS UNSIGNED) AS pr_id,

    draft,

    UPPER(TRIM(state)) AS state,

    TRIM(title) AS title,

    locked,

    number,

    {{ convert_date('created_at') }} AS created_at,

    {{ convert_date('closed_at') }} AS closed_at,

    {{ convert_date('updated_at') }} AS updated_at,

    {{ convert_date('merged_at') }} AS merged_at,

    TRIM(author_association) AS author_association,

    CAST(_airbyte_extracted_at AS DATETIME) AS ingestion_timestamp

FROM {{ ref('bronze_pull_requests') }}

)

SELECT

    pr_id,
    draft,
    state,
    title,
    locked,
    number,

    created_at,
    closed_at,
    updated_at,
    merged_at,

    CASE
        WHEN merged_at IS NOT NULL THEN 1
        ELSE 0
    END AS is_merged,

    CASE
        WHEN closed_at IS NOT NULL
        THEN DATEDIFF(closed_at, created_at)
        ELSE 0
    END AS days_to_close,

    CASE
        WHEN merged_at IS NOT NULL
        THEN DATEDIFF(merged_at, created_at)
        ELSE 0
    END AS days_to_merge,

    author_association,

    ingestion_timestamp

FROM pull_requests