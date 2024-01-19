-- Lab MySQL advanced-queries
-- 1
select 
    concat(a1.first_name, ' ', a1.last_name) as 'ACTOR 1',
    concat(a2.first_name, ' ', a2.last_name) as 'ACTOR 2'
from 
    sakila.film_actor as fa1
join sakila.film_actor as fa2 on fa1.film_id = fa2.film_id and fa1.actor_id < fa2.actor_id
join sakila.actor as a1 on fa1.actor_id = a1.actor_id
join sakila.actor as a2 on fa2.actor_id = a2.actor_id
limit 2; 

-- 2
select
  actor_id,
  count(film_id) as num_films,
  rank() over (order by count(film_id) desc) as actor_rank
from
  film_actor
group by
  actor_id
order by
  actor_rank;