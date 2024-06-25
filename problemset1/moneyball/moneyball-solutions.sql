-- https://cs50.harvard.edu/sql/2024/psets/1/moneyball/

--1
SELECT "year", ROUND(AVG("salary"), 2) AS "avg salary" FROM "salaries"
GROUP BY "year"
ORDER BY "year";

--2
SELECT "year", "salary" FROM "salaries"
WHERE "player_id" = (
    SELECT "id" FROM "players" WHERE "first_name" = 'Cal' AND "last_name" = 'Ripken'
    )
ORDER BY "year" DESC;

--3
SELECT "year", "HR" FROM "performances"
WHERE "player_id" = (
    SELECT "id" FROM "players" WHERE "first_name" = 'Ken' AND "last_name" = 'Griffey'
                               AND "birth_year" = 1969
    )
ORDER BY "year" DESC;

--4
SELECT "first_name", "last_name", "salary" FROM salaries
JOIN "players" ON salaries.player_id = players.id
WHERE "year" = 2001
ORDER BY "salary", "first_name", "last_name", "player_id"
LIMIT 50;

--5
SELECT "name" FROM "teams" WHERE "id" IN (
    SELECT "team_id" FROM "performances"
    WHERE "player_id" = (
        SELECT "id" FROM "players" WHERE "first_name" = 'Satchel' AND "last_name" = 'Paige'
        )
    );

--6
SELECT "name", SUM("H") AS "total hits" FROM "performances"
LEFT JOIN "teams" ON performances.team_id = teams.id
WHERE "performances"."year" = 2001
GROUP BY "team_id"
ORDER BY "total hits" DESC;

--7
SELECT "first_name", "last_name" FROM "players"
WHERE "id" = (
    SELECT "player_id" FROM "salaries"
    ORDER BY "salary" DESC LIMIT 1
    );

--8
SELECT "salary" FROM "salaries"
WHERE "year" = 2001
AND "player_id" = (
    SELECT "player_id" FROM "performances"
    WHERE "year" = 2001
    ORDER BY "HR" DESC LIMIT 1
    );

--9
SELECT "name", AVG("salary") AS "average salary" FROM "salaries"
LEFT JOIN "teams" ON "salaries"."team_id" = "teams"."id"
WHERE "salaries"."year" = 2001
GROUP BY "team_id"
ORDER BY "average salary" LIMIT 5;

--10
SELECT "first_name", "last_name", "salary", "HR", "performances"."year" FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON (
    "players"."id" = "performances"."player_id"
        AND "salaries"."year" = "performances"."year")
ORDER BY salaries."player_id" DESC, salaries."year" DESC, "HR" DESC, "salary" DESC;

--11
SELECT "first_name", "last_name", "salary"/"H" AS "dollars per hit" FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
JOIN "performances" ON (
    "players"."id" = "performances"."player_id"
        AND "salaries"."year" = "performances"."year")
WHERE salaries."year" = 2001 AND "H" > 0
ORDER BY "dollars per hit", "first_name", "last_name" LIMIT 10;