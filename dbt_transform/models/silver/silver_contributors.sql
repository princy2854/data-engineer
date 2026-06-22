select CAST(id as UNSIGNED) as contributor_id,
TRIM(UPPER(type)) as contributor_type,
TRIM(UPPER(login)) AS login,
site_admin,
coalesce(contributions,0) as contributions,
TRIM(UPPER(user_view_type)) as view_type,
CAST(_airbyte_extracted_at as DATETIME) as ingestion_timestamp
from {{ ref('bronze_contributors') }}