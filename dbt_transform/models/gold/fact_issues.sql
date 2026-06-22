select

    issue_id,
    draft,

    date(created_at) as created_date_key,

    date(closed_at) as closed_date_key,
    number,
    comments,

    days_to_close,
    1 as issue_count

from {{ ref('silver_issues') }}