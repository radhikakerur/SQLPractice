/*
Which user flagged the most distinct videos that ended up approved by YouTube? 
Output, in one column, their full name or names in case of a tie. I
n the user's full name, include a space between the first and the last name.
*/

select username 
from (
        select concat(user_firstname,' ', user_lastname) as username
        -- Postgres allows using aggregation function within window functions
            , dense_rank()over(order by count(distinct u.video_id) desc)dr
        from user_flags u
        join (select * from flag_review where reviewed_outcome = 'APPROVED') f
        on u.flag_id = f.flag_id
        group by concat(user_firstname,' ', user_lastname)
    )tmp
where dr =1
