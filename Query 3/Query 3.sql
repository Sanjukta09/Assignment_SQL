--QUERY 3
SELECT act.First_name, act.last_name, f.title, f.description
FROM actor act
LEFT JOIN film_actor fa 
ON act.actor_id =fa.actor_id
LEFT JOIN film f 
ON f.film_id =fa.film_id
ORDER BY act.First_name ASC;
