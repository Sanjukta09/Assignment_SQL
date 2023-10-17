--Query 10
SELECT * 
FROM film
WHERE rental_rate BETWEEN .99 AND 4.99
ORDER BY film_id;
