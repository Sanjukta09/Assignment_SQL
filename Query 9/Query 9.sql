--Query 9
SELECT customer_id, first_name, last_name, email 
FROM customer
WHERE email ILIKE '%in%' 
OR email ILIKE '%on%' 
OR email ILIKE '%an%';
