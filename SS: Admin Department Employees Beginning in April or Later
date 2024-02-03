# Stratascratch
#1 Admin Department Employees Beginning in April or Later

select count(worker_id)
from worker
where department = 'Admin'
    and extract(month from joining_date) >= 04


#2 Number of Workers by Department Starting in April or Later

select department
    , count(worker_id) num_workers
from worker
where extract(month from joining_date) >= 04
group by department
order by count(worker_id) desc


