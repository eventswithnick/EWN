-- Events with Nick v7.2 admin access fix
-- Run this after creating the admin user under Supabase Authentication -> Users.
-- Replace nick@example.com with the exact email used to log in to admin.html.

insert into public.admin_users (email, display_name, is_active)
values ('nick@example.com', 'Nick', true)
on conflict (email)
do update set is_active = true, display_name = excluded.display_name;

-- Confirm that the admin email is stored:
select * from public.admin_users;

-- Optional test: confirm bookings exist:
select id, name, phone, "eventType", "eventDate", status, "dateCreated"
from public.bookings
order by "dateCreated" desc;
