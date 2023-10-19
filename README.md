**Exploring DVD Rental Database with SQL Queries**

Welcome to our blog where we delve into the fascinating world of DVD rental databases and analyze various SQL queries that offer valuable insights and information from such a database. We'll be using the renowned DVD rental database and examining ten queries, each with a unique purpose and output.


DVD Rental Database Overview

The DVD rental database is a comprehensive collection of interconnected tables that store vital information related to films, customers, rentals, actors, payments, and more. Key tables within this database include:

* Film: Contains film details such as title, description, release year, rental duration, rental rate, and more.
* Customer: Holds customer information like names, addresses, emails, and rental history.
* Actor: Stores actor details including first name and last name.
* Rental: Contains rental transactions, including rental dates and return dates.
* Inventory: Connects films to rental transactions by storing inventory details.
* Payment: Records payment information related to rentals.


SQL Queries: Unveiling Insights

Let's dive into ten SQL queries, each with a unique purpose and output, to extract valuable insights from the DVD rental database.


Query 1: Film Titles and Languages
The first query retrieves film titles along with their respective languages.

SELECT film.title, language.name
FROM film
JOIN language ON film.language_id = language.language_id;
This query combines information from the film and language tables to provide a list of film titles along with their respective languages.

Query 2: Customer Details by Address
Query 2 fetches customer details based on their address ID being greater than 100.

SELECT first_name, last_name, email 
FROM customer
WHERE address_id > 100;
Here, we are filtering customer details by their address IDs to display the first name, last name, and email addresses.


Query 3: Actor Film Information
The third query retrieves actor names along with the titles and descriptions of the films they are associated with.

SELECT act.first_name, act.last_name, f.title, f.description
FROM actor act
LEFT JOIN film_actor fa 
ON act.actor_id = fa.actor_id
LEFT JOIN film f 
ON f.film_id = fa.film_id
ORDER BY act.first_name ASC;
This query utilizes the actor, film_actor, and film tables to provide a comprehensive list of actor names and the films they are linked to.


Query 4: Films Rented by a Specific Customer
In query 4, we retrieve film titles rented by a specific customer (customer_id = 5).

SELECT film.title
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
WHERE rental.customer_id = 5;
This query combines information from the film, inventory, and rental tables to display the film titles rented by the specified customer.


Query 5: Number of Rentals per Film
Query 5 counts the number of rentals for each film, displaying the film title and the corresponding rental count.

SELECT film.title, COUNT(rental.rental_id) AS rental_count
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title
ORDER BY rental_count DESC;
This query utilizes the film, inventory, and rental tables to calculate and display the number of rentals for each film, sorted by rental count in descending order.

Query 6: Customers with the Most Rentals
Query 6 finds the top customers who have made the most rentals. It orders the customers by the number of rentals in descending order.

SELECT customer.first_name, customer.last_name, COUNT(rental.rental_id) AS rental_count
FROM customer
JOIN rental ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id
ORDER BY rental_count DESC;
This query involves joining the customer and rental tables to calculate the number of rentals made by each customer and then presents the customers in descending order of rental count.


Query 7: Films Never Rented
Query 7 identifies films that have never been rented. This information could be useful for inventory management or marketing strategies.

SELECT film.film_id, film.title
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
WHERE inventory.inventory_id IS NULL;
In this query, we use a left join between the film and inventory tables to find films that have no corresponding entries in the inventory table, indicating they have never been rented.


Query 8: Films with the Highest Average Rental Duration
In Query 8, we'll identify films with the highest average rental duration, helping to understand which films are rented for the longest periods on average.

SELECT film.film_id, film.title, AVG(rental.return_date - rental.rental_date) AS avg_rental_duration
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.film_id, film.title
ORDER BY avg_rental_duration DESC;
This query joins the film, inventory, and rental tables to calculate the average rental duration for each film, and then presents the films in descending order of average rental duration.


Query 9: Films Rented by the Most Active Customers
Query 9 identifies films that have been rented by the most active customers, helping us understand which films are popular among frequent renters.

SELECT film.film_id, film.title, COUNT(rental.rental_id) AS rental_count
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.film_id, film.title
ORDER BY rental_count DESC;
In this query, we combine information from the film, inventory, and rental tables to count the number of times each film has been rented, presenting the films in descending order of rental count.


Query 10: Total Revenue from Film Rentals
For our final query, let's calculate the total revenue generated from film rentals. This is crucial for assessing the financial performance of the rental business.

SELECT SUM(payment.amount) AS total_revenue
FROM payment;
In this query, we sum up the "amount" column from the payment table to calculate the total revenue generated from all film rentals.

This concludes our exploration of SQL queries on the DVD rental database. We've covered a variety of queries to extract valuable information and insights. Stay tuned for more articles and queries in the future!
