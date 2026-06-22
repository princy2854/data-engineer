{% macro convert_date(column_name) %}

CAST(
    REPLACE(
        REPLACE({{ column_name }}, 'T', ' '),
        'Z',
        ''
    )
    AS DATETIME
)

{% endmacro %}