--Query 5
SELECT f.film_id, f.title, round(SUM(p.amount)) AS total_amount
FROM Rental r
JOIN payment p ON r.rental_id = p.rental_id
JOIN Inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.film_id, title
ORDER BY film_id ASC;
