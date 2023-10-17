--QUERY 1
SELECT film.title, language.name
FROM film
JOIN language ON film.language_id = language.language_id;