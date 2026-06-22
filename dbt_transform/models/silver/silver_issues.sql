WITH issues AS (

SELECT
    CAST(id AS UNSIGNED) AS issue_id,
    IFNULL(draft,0) AS draft,
    TRIM(state) AS state,
    TRIM(title) AS title,
    locked,
    number,
    comments,

    {{ convert_date('created_at') }} AS created_at,
    {{ convert_date('updated_at') }} AS updated_at,
    {{ convert_date('closed_at') }} AS closed_at,

    TRIM(author_association) AS author_association,

    CAST(_airbyte_extracted_at AS DATETIME) AS ingestion_timestamp

FROM {{ ref('bronze_issues') }}

)

SELECT
    *,

    CASE
        WHEN closed_at IS NOT NULL
        THEN DATEDIFF(closed_at, created_at)
        ELSE 0
    END AS days_to_close

FROM issues