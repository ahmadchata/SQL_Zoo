
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

SELECT name FROM world
  WHERE continent = 'Europe'
  AND GDP/population >
     (SELECT GDP/population FROM world
      WHERE name = 'United Kingdom');

SELECT name, continent FROM world
WHERE continent = (SELECT continent FROM world
       WHERE name ='Argentina')
    OR continent = (SELECT continent   FROM world
       WHERE name ='Australia')
    ORDER BY name;

SELECT name, population FROM world
WHERE population > (SELECT population
FROM world
WHERE name = 'Canada')
AND population < (SELECT population
FROM world
WHERE name = 'Poland');

SELECT name, CONCAT(ROUND(population/(SELECT population FROM world WHERe name = 'Germany')*100, 0),'%') AS percentage
FROM world
WHERE continent = 'Europe';

SELECT name
  FROM world
 WHERE GDP>= ALL(SELECT GDP
                           FROM world
                          WHERE continent = 'Europe'AND GDP IS NOT null) AND continent != 'Europe';

SELECT continent, name
FROM world x
WHERE name <= ALL
             (SELECT name FROM world y
              WHERE y.continent = x.continent);

SELECT name, continent, population
FROM world
WHERE continent NOT IN (select continent FROM world WHERE population > 25000000)

SELECT name, continent
FROM world x
WHERE population > ALL
             (SELECT population*3 FROM world y
              WHERE y.continent = x.continent
              AND x.name <> y.name);