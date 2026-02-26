WITH CTE AS (
    select 
        TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
        DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
        HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,

        {{get_day_type('STARTED_AT')}} as  DAY_TYPE,

        {{get_season('STARTED_AT')}} as SEASON_OF_YEAR
    from 
    {{ source('demo', 'bike') }}
)
select
*
from CTE