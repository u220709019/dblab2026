use movie_db;


# 1. Show the films with a budget greater than $10 million and a ranking lower than 6.
SELECT title ,budget,ranking 
FROM movies
WHERE budget > 10000000 AND ranking < 6;

# 2. Show the action films with a rating higher than 8.8, produced after 2009.

select title ,rating ,year 
FROM movies m
JOIN genres g on m.movie_id = g.movie_id
WHERE g.genre_name = 'Action' and m.rating >8.8 and m.year >2009;

select title ,duration , oscars
from  movies m
join genres g on m.movie_id = g.movie_id
where g.genre_name = 'Drama' and m.duration >150 and m.oscars >2;


 



# 3. Show the drama films with a duration of more than 150 minutes and more than 2 Oscars.
select title ,duration , oscars
from movies
where duration >150 and oscars >-2
and movie_id in(select movie_id from genres where genre_name = 'Drama');


# 4. Show the thriller films whose budget is greater than 25 million$.
select movie_id ,title
from movies
where budget >25000000 and movies.movie_id in(select movie_id from  genres where genre_name = 'Thriller');

select movies.movie_id ,movies.title ,movies.budget
from movies 
join genres on movies.movie_id = genres.movie_id
where movies.budget >25000000 and genres.genre_name = 'Thriller';



# 5. Show the drama films whose language is Italian and produced between 1990-2000.		
 
SELECT m.title, m.language, m.year
FROM movies m
JOIN genres g ON m.movie_id = g.movie_id
join language l on m.movie_id = l.movie_id
WHERE g.genre = 'Drama'
  AND m.language = 'Italian'
  AND m.year BETWEEN 1990 AND 2000;


# 6. Show the Quentin Tarantino films which have more than 500000 votes and produced before 2000.	 