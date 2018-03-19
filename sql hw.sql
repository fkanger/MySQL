SELECT 
    first_name, last_name
FROM
    actor;

SELECT 
    UPPER(CONCAT(first_name, ' ', last_name)) AS 'Actor Name'
FROM
    actor;
    
SELECT 
    first_name, last_name, actor_id
FROM
    actor
WHERE
    first_name = 'Joe';

SELECT 
    first_name, last_name, actor_id
FROM
    actor
WHERE
    last_name LIKE '%gen%';

SELECT 
    first_name, last_name, actor_id
FROM
    actor
WHERE
    last_name LIKE '%li%'
ORDER BY last_name , first_name;

SELECT 
    country, country_id
FROM
    country
WHERE
    country IN ('Afghanistan' , 'Bangladesh', 'China');

alter table actor add column middle_name varchar(30) after first_name;

alter table actor modify column middle_name blob;

alter table actor drop column middle_name;

SELECT 
    last_name, COUNT(last_name) AS 'count last name'
FROM
    actor
GROUP BY last_name;

SELECT 
    last_name, COUNT(last_name) AS 'count last name'
FROM
    actor
GROUP BY last_name
HAVING `count last name` >= 2;

UPDATE actor 
SET 
    first_name = 'HARPO'
WHERE
    first_name = 'GROUCHO'
        AND last_name = 'Williams';

UPDATE actor 
SET 
    first_name = CASE
        WHEN first_name = 'HARPO' THEN 'GROUCHO'
        ELSE 'MUCHO GROUCHO'
    END
WHERE
    actor_id = 172;

show create table address;

SELECT 
    staff.first_name, staff.last_name, address.address
FROM
    staff
        INNER JOIN
    address ON (staff.address_id = address.address_id);
    
SELECT 
    staff.first_name, staff.last_name, SUM(payment.amount)
FROM
    staff
        INNER JOIN
    payment ON (staff.staff_id = payment.staff_id)
WHERE
    MONTH(payment.payment_date) = 08
        AND YEAR(payment.payment_date) = 2005
GROUP BY staff.staff_id;

SELECT 
    film.title, COUNT(film_actor.actor_id) AS `count actor`
FROM
    film_actor
        INNER JOIN
    film ON (film.film_id = film_actor.film_id)
GROUP BY film.title;

SELECT 
    title, COUNT(inventory_id) AS 'number of copies'
FROM
    film
        INNER JOIN
    inventory USING (film_id)
WHERE
    title = 'Hunchback Impossible'
GROUP BY title;

SELECT 
    c.first_name,
    c.last_name,
    SUM(p.amount) AS 'Total Amount Paid'
FROM
    payment AS p
        JOIN
    customer AS c ON p.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name;

SELECT 
    title
FROM
    film
WHERE
    title LIKE 'K%'
        OR title LIKE 'Q%'
        AND language_id IN (SELECT 
            language_id
        FROM
            language
        WHERE
            name = 'English');
            
SELECT 
    first_name, last_name
FROM
    actor
WHERE
    actor_id IN (SELECT 
            actor_id
        FROM
            film_actor
        WHERE
            film_id = (SELECT 
                    film_id
                FROM
                    film
                WHERE
                    title = 'Alone Trip'));          