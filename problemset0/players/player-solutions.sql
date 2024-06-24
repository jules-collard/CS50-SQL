-- https://cs50.harvard.edu/sql/2024/psets/0/players/

--1
SELECT "birth_city" FROM "players"
    WHERE
        "first_name" = 'Jackie'
        AND "last_name" = 'Robinson';

--2
SELECT "bats" FROM "players"
    WHERE
        "first_name" = 'Babe'
        AND "last_name" = 'Ruth';

--3
SELECT "id" FROM "players"
    WHERE "debut" IS NULL;

--4
SELECT "first_name", "last_name" FROM "players"
    WHERE NOT "birth_country" = 'USA'
    ORDER BY "first_name", "last_name";

--5
SELECT "first_name", "last_name" FROM "players"
    WHERE "bats" = 'R'
    ORDER BY "first_name", "last_name";

--6
SELECT "first_name", "last_name", "debut" FROM "players"
    WHERE "birth_city" = 'Pittsburgh'
    ORDER BY "debut" DESC, "first_name", "last_name";

--7
SELECT COUNT(*) FROM "players"
    WHERE
        ("bats" = 'L' AND "throws" = 'R')
        OR ("bats" = 'R' AND "throws" = 'L');

--8
SELECT ROUND(AVG("weight"),2) AS "Average Weight",
       ROUND(AVG("height"),2) AS "Average Height" FROM "players"
    WHERE "debut" >= '2000-01-01';

--9
SELECT "first_name", "last_name" FROM players
    WHERE "final_game" LIKE '2022-%'
    ORDER BY "first_name", "last_name";