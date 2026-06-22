select

    contributor_id as contributor_key,

    ingestion_timestamp as snapshot_date,

    contributions

from {{ ref('silver_contributors') }}