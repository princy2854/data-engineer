select
    contributor_id,
    contributor_type,
    login,
    site_admin,
    view_type
from {{ ref('silver_contributors') }}