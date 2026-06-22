
WITH dates AS (

    SELECT DATE(created_at) AS full_date
    FROM {{ ref('silver_issues') }}

    UNION

    SELECT DATE(closed_at)
    FROM {{ ref('silver_issues') }}
    WHERE closed_at IS NOT NULL

    UNION

    SELECT DATE(created_at)
    FROM {{ ref('silver_pull_requests') }}

    UNION

    SELECT DATE(merged_at)
    FROM {{ ref('silver_pull_requests') }}
    WHERE merged_at IS NOT NULL

)

SELECT DISTINCT

    CAST(DATE_FORMAT(full_date,'%Y%m%d') AS UNSIGNED) AS date_key,

    full_date,

    DAY(full_date) AS day_number,

    MONTH(full_date) AS month_number,

    MONTHNAME(full_date) AS month_name,

    QUARTER(full_date) AS quarter_number,

    YEAR(full_date) AS year_number,

    WEEKDAY(full_date)+1 AS weekday_number,

    DAYNAME(full_date) AS weekday_name,

    WEEK(full_date) AS week_number

FROM dates
WHERE full_date IS NOT NULL