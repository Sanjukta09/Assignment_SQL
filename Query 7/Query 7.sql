--QUERY 7
SELECT film_id, length , 
MAX(LENGTH) OVER() AS maximum_length,
MIN(LENGTH) OVER() AS minimum_length
FROM film;
