
--Selecciona las columnas film_id y title de la tabla film.
select film_id, title from film;

--Selecciona 5 filas de la tabla film, obteniendo todas las columnas.
select * from film limit 5;

--Selecciona filas de la tabla film donde film_id sea menor que 4.
select * from film where film_id < 4;

--Selecciona filas de la tabla film donde el rating sea PG o G.
select * from film where rating in ('PG', 'G');

--Selecciona filas de la tabla actor donde el nombre sea Angela, Angelina o Audrey usando IN.
select * from actor where first_name in ('Angela','Angelina','Audrey');

--Obtenga una lista de actores con el nombre de Julia.
select first_name, last_name from actor where first_name = 'Julia';

--Obtenga una lista de actores con el nombre Chris, Cameron o Cuba.
select first_name, last_name from actor where first_name in ('Chris','Cameron','Cuba');

--Seleccione la fila del cliente para el cliente llamado Jamie Rice.
select * from customer where first_name = 'Jamie' and last_name = 'Rice';

--Seleccione el monto y la fecha de pago del pago fue inferior a $ 1.
select amount, payment_date from payment where amount < 1;

--¿Cuáles son las diferentes duraciones de alquiler permitidas por la tienda?
select distinct rental_duration from film;

--Ordena las filas en la tabla city por country_id y luego por city.
select * from city order by country_id, city;

--¿Cuáles son los ID de los últimos 3 clientes para devolver un alquiler?
select customer_id,return_date from rental where return_date is not null
order by return_date desc --para traer las fechas más recientes
limit 3;

--¿Cuántas películas tienen la clasificación NC-17? ¿Cuántos están clasificados como PG o PG-13?
select rating, count (rating) as total_rating from film where rating in ('NC-17','PG','PG-13') group by rating ;

--¿Cuántos clientes diferentes tienen registros en la tabla rental?
select count (distinct customer_id) from rental;

--¿Hay algún cliente con el mismo apellido?
select last_name, count (distinct last_name) as tot_lastname from customer group by last_name; --where tot_lastname > 1

--¿Qué película (id) tiene la mayor cantidad de actores?
select film_id, count (distinct actor_id) as actor_in_film from film_actor group by film_id order by actor_in_film desc;

--¿Qué actor (id) aparece en la mayor cantidad de películas?
select actor_id, count (distinct film_id) as film_by_actor from film_actor group by actor_id order by film_by_actor desc;

--Cuenta el número de ciudades para cada country_id en la tabla city. Ordena los resultados por count(*).
select country_id, count (distinct city) as count_city from city group by country_id;

--¿Cuál es la tarifa de alquiler promedio de las películas? ¿Puedes redondear el resultado a 2 decimales?
select round(avg(rental_rate),2) from film;

--Selecciona los 10 actores que tienen los nombres más largos (nombre y apellido combinados).
select actor_id,first_name,last_name,char_length(CONCAT(first_name,last_name)) as long_name from actor order by long_name desc limit 10;
