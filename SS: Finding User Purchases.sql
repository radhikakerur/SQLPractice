/*
Write a query that'll identify returning active users. A returning active user is a user that has made a second purchase 
within 7 days of any other of their purchases. Output a list of user_ids of these returning active users.
*/

select distinct t1.user_id
from amazon_transactions t1
join amazon_transactions t2
on t1.user_id = t2.user_id
    and t2.created_at - t1.created_at between 0 and 7
    and t1.id <> t2.id
order by t1.user_id
