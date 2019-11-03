use fletnix

/* Opdracht a */
SELECT movie.title,movie.publication_year,Movie_Genre.genre_name
FROM Movie INNER JOIN Movie_Genre ON Movie.movie_id = Movie_Genre.movie_id
ORDER BY Movie_Genre.genre_name

/* Opdracht b */
SELECT * from movie
where movie.publication_year >=1990 AND movie.publication_year <=2010

/* Opdracht c */
Select customer.user_name, customer.subscription_start
from customer
where Customer.subscription_end IS NULL

/* Opdracht D */
SELECT person.person_id, person.firstname,person.lastname,Movie_Cast.role
FROM person JOIN Movie_Cast on person.person_id = Movie_Cast.person_id
WHERE movie_id = 328277

/* Opdracht e */
SELECT movie.title,movie.publication_year
FROM Movie  JOIN Movie_Cast
ON movie_cast.movie_id = movie.movie_id
WHERE movie_cast.person_id = 426628

/* Opdracht f */

/* Opdracht g */
SELECT TOP 100 Movie.Title as Titel, count(Watch_History.movie_id) as Aantal_Bekeken
FROM Movie JOIN Watch_History ON movie.movie_id = Watch_History.movie_id
GROUP BY Movie.Title


/* Opdracht h */
SELECT Movie.Title, movie.publication_year, count(Watch_History.movie_id) as Keer_Bekeken
FROM Movie JOIN Watch_History ON movie.movie_id = Watch_History.movie_id
GROUP BY Movie.Title, movie.publication_year

/* Opdracht i */
SELECT title, Publication_year, count(genre_name) as aantal_genres
FROM Movie JOIN Movie_Genre ON Movie.movie_id = Movie_Genre.movie_id
GROUP BY Movie_genre.movie_id, title, publication_year
HAVING count(genre_name) > 8


/* Opdracht j */
select	 Person.firstname, Person.lastname
from	 Movie_genre join Movie_cast
on		 Movie_genre.movie_id = Movie_cast.movie_id join Person
on		 Person.person_id = Movie_cast.person_id
where	 Movie_genre.genre_name = 'Horror'
 AND Person.person_id in (select Person.person_id from	Movie_genre join Movie_cast
	on		Movie_genre.movie_id = Movie_cast.movie_id join Person
	on		Person.person_id = Movie_cast.person_id
	where	Movie_genre.genre_name = 'Family' AND Person.gender='F')


/* Opdracht k */
select firstname, lastname
from person
where person_id in (select top 1	Movie_directors.person_id
from			Movie_directors
group by		Movie_directors.person_id
order by count(movie_id) desc)

/* Opdracht l */													
select 	Movie_Genre.genre_name as Genre,	(cast (count(Movie_id) AS float) / (select cast(count(movie_id)AS float) from Movie)* 100) as Procent
from	Movie_Genre 
group by Movie_Genre.genre_name

/* Opdracht m */
select * from(
select Customer_mail_address as Klant, cast(count(movie_id)as float) /  cast(count(distinct cast(watch_date as date))as float) as gemiddelde
from Watch_History
group by customer_mail_address) as innerSelect
where gemiddelde > 2

