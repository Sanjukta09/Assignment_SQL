--Query 6
SELECT COUNT (cu.customer_id), c.country
FROM customer cu
JOIN address ON address.address_id =cu.address_id
JOIN city ON address.city_id =city.city_id
RIGHT JOIN country c ON c.country_id =city.country_id
GROUP BY c.country
ORDER BY COUNT (cu.customer_id);
