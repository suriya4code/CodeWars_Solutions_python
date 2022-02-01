'''
Find all movies two actors cast in together

Given film_actor and film tables from the DVD Rental sample database find all movies both Sidney Crowe (actor_id = 105) and Salma Nolte (actor_id = 122) cast in together and order the result set alphabetically.
film schema

 Column     | Type                        | Modifiers
------------+-----------------------------+----------
title       | character varying(255)      | not null
film_id     | smallint                    | not null

film_actor schema

 Column     | Type                        | Modifiers
------------+-----------------------------+----------
actor_id    | smallint                    | not null
film_id     | smallint                    | not null
last_update | timestamp without time zone | not null 

actor schema

 Column     | Type                        | Modifiers
------------+-----------------------------+----------
actor_id    | integer                     | not null 
first_name  | character varying(45)       | not null
last_name   | character varying(45)       | not null
last_update | timestamp without time zone | not null 

The desired output:

title
-------------
Film Title 1
Film Title 2
...
'''


select film.title from 
(select film_id, count(film_id) as cnt from film_actor 
where actor_id in (105, 122)
group by film_id
) temp
inner join film
on temp.film_id = film.film_id
where cnt=2
order by title asc

