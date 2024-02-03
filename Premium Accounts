/*
Premium Accounts
You are given a dataset that provides the number of active users per day per premium account. 
A premium account will have an entry for every day that it’s premium. 
However, a premium account may be temporarily discounted and considered not paid, this is indicated by a 
value of 0 in the final_price column for a certain day. Find out how many premium accounts that are paid on 
any given day are still premium and paid 7 days later.Output the date, the number of premium and paid accounts 
on that day, and the number of how many of these accounts are still premium and paid 7 days later. 
Since you are only given data for a 14 days period, only include the first 7 available dates in your output.
*/

select d1.entry_date
    , count(d1.account_id) as premium_paid_accounts
    , count(d2.account_id) as premium_paid_accounts_after_7d
from premium_accounts_by_day d1
left join premium_accounts_by_day d2
on d1.account_id = d2.account_id
    and d1.entry_date + 7 = d2.entry_date
    and d2.final_price > 0
where d1.final_price > 0
group by d1.entry_date
order by 1
limit 7 
