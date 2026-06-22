{{ config(materialized='table') }}

SELECT

    dc.login,

    dc.contributor_type,

    dc.site_admin,

    dc.view_type,

    dc.contributor_id,

    sc.contributions

FROM {{ ref('dim_contributor') }} dc

LEFT JOIN {{ ref('silver_contributors') }} sc
    ON dc.contributor_id = sc.contributor_id