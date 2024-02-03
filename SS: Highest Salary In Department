# Stratascratch
# Highest Salary In Department

select department
    , first_name
    , salary
from (
    select department
        , first_name
        , salary
        , dense_rank()over(partition by department order by salary desc) dr
    from employee
    )tmp
where dr = 1
