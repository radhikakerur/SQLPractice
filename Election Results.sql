/*
The election is conducted in a city and everyone can vote for one or more candidates, or choose not to vote at all. 
Each person has 1 vote so if they vote for multiple candidates, their vote gets equally split across these candidates. 
For example, if a person votes for 2 candidates, these candidates receive an equivalent of 0.5 vote each.
Find out who got the most votes and won the election. Output the name of the candidate or multiple names in case of a tie. 
To avoid issues with a floating-point error you can round the number of votes received by a candidate to 3 decimal places.
*/
--Option 1:
with votes as(
    select voter
        , count(distinct candidate) vote_share
    from voting_results
    group by voter
)

select candidate
from (
    select *, rank()over(order by total_votes desc) rk
    from (
        select candidate
            , sum(votes)total_votes
        from (
            select res.voter
                , res.candidate
                , 1*1.00/v.vote_share as votes
            from (select * from voting_results where candidate is not null )res
            join votes v
            on v.voter = res.voter
            )tmp1
        group by candidate 
        )tmp2
    )tmp3
where rk = 1


--Option 2:
SELECT candidate
FROM
  (SELECT candidate,
          round(sum(vote_value), 3) n_votes,
          dense_rank() over(
                            ORDER BY round(sum(vote_value), 3) DESC) place
   FROM
     (SELECT voter,
             candidate,
             1.0 / count(*) over(PARTITION BY voter) vote_value
      FROM voting_results
      WHERE candidate IS NOT NULL)a
   GROUP BY candidate)results
WHERE place = 1
