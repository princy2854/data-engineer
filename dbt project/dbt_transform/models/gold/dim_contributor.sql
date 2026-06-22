select

    contributor_id,

    login,

    contributor_type,

    site_admin,

    view_type

from {{ ref('silver_contributors') }}