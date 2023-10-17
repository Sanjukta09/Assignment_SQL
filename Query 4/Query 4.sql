--QUERY 4
SELECT act.First_name, act.last_name, COUNT (DISTINCT f.title) AS Number_of_films
FROM actor act
LEFT JOIN film_actor fa 
ON act.actor_id =fa.actor_id
LEFT JOIN film f 
ON f.film_id =fa.film_id
GROUP BY act.actor_id
ORDER BY act.First_name ASC;