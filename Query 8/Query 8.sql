--Query 8
WITH film_rentals AS (
  SELECT inventory.film_id, COUNT(*) AS rental_count
  FROM rental
  JOIN inventory ON rental.inventory_id = inventory.inventory_id
  GROUP BY inventory.film_id
)
SELECT f.title, Case
when fr.rental_count is Null then 0
Else fr.rental_count
End
FROM film f
Full JOIN film_rentals fr ON f.film_id = fr.film_id
Order by rental_count desc;

