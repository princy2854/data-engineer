{{ config(materialized='table') }}

SELECT

    (SELECT COUNT(*) FROM {{ ref('fact_issues') }}) AS total_issues,

    (SELECT COUNT(*) FROM {{ ref('fact_pull_requests') }}) AS total_prs,

    (SELECT SUM(is_merged)
     FROM {{ ref('fact_pull_requests') }}) AS merged_prs,

    (SELECT ROUND(AVG(days_to_close),2)
     FROM {{ ref('fact_issues') }}) AS avg_issue_close_days,

    (SELECT ROUND(AVG(days_to_merge),2)
     FROM {{ ref('fact_pull_requests') }}) AS avg_pr_merge_days