with qryNoFivetran as (
    SELECT
        article_link,
        author_of_article,
        date_to_publish,
        name_of_publication,
        timestamp,
        title_of_article,
        who_is_this_,
        why_is_this_article_interesting_to_you_
    FROM
        {{ ref('raw_ahod_submissions')}}
),
qryNameCleanup as (
    SELECT
        article_link,
        author_of_article,
        date_to_publish,
        name_of_publication,
        timestamp,
        title_of_article,
        why_is_this_article_interesting_to_you_,
        CASE
            WHEN who_is_this_ = 'Wes' THEN 'Wes Poulsen'
            WHEN who_is_this_ = 'Joseph' THEN 'Joseph McDermott'
            ELSE who_is_this_
        END as crew_member
    FROM qryNoFivetran

)

select * from qryNameCleanup