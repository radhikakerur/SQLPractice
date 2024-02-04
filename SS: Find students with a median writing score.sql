-- Output ids of students with a median score from the writing SAT.

--Option 1:
with cte as(
    select student_id
        , sat_writing
        , row_number()over(order by sat_writing) rnum
    from sat_scores
)

select student_id
from sat_scores
where sat_writing in (
select
    case when max(rnum)%2 = 1 then 
        (select sat_writing from cte where rnum in 
            (select (max(rnum)/2)+1 from cte)
        )
    else (select avg(sat_writing) from cte where rnum in 
            (select (max(rnum)/2)+1 from cte
            union
            select (max(rnum)/2) from cte
            )
        )
    end med_score
from cte 
)


--Option 2: https://www.postgresql.org/docs/9.4/functions-aggregate.html
SELECT student_id FROM sat_scores
WHERE sat_writing = (
select percentile_cont(0.5) within group (order by sat_writing) as writing_percentile 
  from sat_scores)


