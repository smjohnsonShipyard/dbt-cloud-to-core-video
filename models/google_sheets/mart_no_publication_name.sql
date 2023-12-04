with QryNoPub as (
    SELECT
        name_of_publication,
        crew_member
    FROM
        {{ ref('int_ahod_submissions')}}
    WHERE name_of_publication is null
),
qryAggregate as (
    SELECT 
        crew_member,
        count(crew_member) as number_of_submissions_without_publication
    FROM 
        QryNoPub
    GROUP BY 
        crew_member
)

select * from qryAggregate