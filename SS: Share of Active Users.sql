# Share of Active Users
# Output share of US users that are active. Active users are the ones with an "open" status in the table.

select count(case when status = 'open' then user_id end)*1.00
    /count(user_id) as active_users_share
from fb_active_users
where country = 'USA'
