SELECT id, title
FROM movie
WHERE yr=1962

SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

SELECT id
FROM actor
WHERE name = 'Glenn Close';

SELECT id
FROM movie
WHERE title = 'Casablanca';


SELECT name
FROM actor
INNER JOIN casting
ON actor.id = casting.actorid
WHERE movieid = 11768;

SELECT name
FROM actor
INNER JOIN casting
ON actor.id = casting.actorid
INNER JOIN movie
ON casting.movieid = movie.id
WHERE title = 'Alien';


SELECT title
FROM movie
INNER JOIN casting
ON movie.id = casting.movieid
INNER JOIN actor
ON casting.actorid = actor.id
WHERE name = 'Harrison Ford';


SELECT title
FROM movie
INNER JOIN casting
ON movie.id = casting.movieid
INNER JOIN actor
ON casting.actorid = actor.id
WHERE name = 'Harrison Ford'
AND ord != 1;

SELECT title, name
FROM movie
INNER JOIN casting
ON movie.id = casting.movieid
INNER JOIN actor
ON casting.actorid = actor.id
WHERE yr = 1962
AND ord = 1;


SELECT yr,COUNT(title) 
FROM movie 
INNER JOIN casting 
ON movie.id=movieid
INNER JOIN actor   
ON actorid=actor.id
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;


SELECT title, name
FROM movie
INNER JOIN casting ON id = movieid
INNER JOIN actor ON actorid = actor.id
WHERE movie.id IN (
SELECT movieid
FROM casting
WHERE actorid = (
SELECT id
FROM actor
WHERE name = 'Julie Andrews')) 
AND ord = 1;

SELECT name
FROM actor
INNER JOIN casting ON actor.id = casting.actorid
INNER JOIN movie ON  movie.id = casting.movieid
WHERE name IN (
SELECT name
FROM actor
WHERE ord = 1)
GROUP BY name
HAVING COUNT(name) >= 15;

SELECT title, COUNT(name)
FROM movie
INNER JOIN casting ON id = movieid
INNER JOIN actor ON actorid = actor.id
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(name) DESC, title;

SELECT name
FROM actor
INNER JOIN casting ON actor.id = casting.actorid
INNER JOIN movie ON  movie.id = casting.movieid
WHERE movie.id IN (
SELECT movieid
FROM casting
WHERE actorid = (
SELECT actor.id
FROM actor
WHERE name = 'Art Garfunkel'))
AND name != 'Art Garfunkel';