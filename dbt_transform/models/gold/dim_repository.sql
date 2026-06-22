select

    repo_id as repo_key,
    
    name,
    topics,
    language,

    visibility,

    description,

    default_branch,

    fork,

    private,

    created_at,
    updated_at

from {{ ref('silver_repositories') }}