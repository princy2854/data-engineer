select

    pr_id,
    draft,
    number,

    date(created_at) as created_date_key,
    date(closed_at) as closed_date_key,
    date(updated_at) as updated_date_key,


    date(merged_at) as merged_date_key,

    is_merged,

    days_to_merge,

    1 as pr_count

from {{ ref('silver_pull_requests') }}