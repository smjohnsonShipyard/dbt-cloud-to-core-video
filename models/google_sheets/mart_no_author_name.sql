with QryNoAuthor as (
    SELECT
        author_of_article,
        crew_member
    FROM
        {{ ref('int_ahod_submissions')}}
    WHERE author_of_article is null
),
qryAggregate as (
    SELECT 
        crew_member,
        count(crew_member) as number_of_submissions_without_author
    FROM 
        QryNoAuthor
    GROUP BY 
        crew_member
)

select * from qryAggregate