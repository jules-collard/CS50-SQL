-- https://cs50.harvard.edu/sql/2024/psets/1/dese/

--1
SELECT "name", "city" FROM "schools"
WHERE "state" = 'MA' AND "type" = 'Public School';

--2
SELECT "name" FROM "districts"
WHERE "name" LIKE '%(non-op)';

--3
SELECT ROUND(AVG("per_pupil_expenditure"), 2) AS "Average Expenditure" FROM "expenditures"
WHERE "district_id" IN (
    SELECT "id" FROM "districts" WHERE "state" = 'MA'
    );

--4
SELECT "city", COUNT(*) AS "# Public Schools" FROM schools
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY "# Public Schools" DESC, "city" LIMIT 10;

--5
SELECT "city", COUNT(*) AS "# Public Schools" FROM schools
WHERE "type" = 'Public School'
GROUP BY "city"
HAVING "# Public Schools" <= 3
ORDER BY "# Public Schools" DESC, "city";

--6
SELECT "name" FROM "graduation_rates"
LEFT JOIN "schools" ON "graduation_rates"."school_id" = "schools"."id"
WHERE "graduated" = 100;

--7
SELECT "name" FROM "schools" WHERE "district_id" = (
    SELECT "id" FROM "districts" WHERE "name" = 'Cambridge'
    );

--8
SELECT "name", "pupils" FROM "expenditures"
JOIN "districts" ON "expenditures"."district_id" = "districts"."id";

--9
SELECT "name" FROM "expenditures"
JOIN "districts" ON "expenditures"."district_id" = "districts"."id"
ORDER BY "pupils" LIMIT 1;

--10
SELECT "name", "per_pupil_expenditure" FROM "expenditures"
JOIN "districts" ON "expenditures"."district_id" = "districts"."id"
ORDER BY "per_pupil_expenditure" DESC LIMIT 10;

--11
SELECT "name", "per_pupil_expenditure", "graduated" FROM "schools"
JOIN "expenditures" ON "schools"."district_id" = "expenditures"."district_id"
JOIN "graduation_rates" ON "schools"."id" = "graduation_rates"."school_id"
ORDER BY "per_pupil_expenditure" DESC, "name";

--12
SELECT "name", "per_pupil_expenditure", "exemplary" FROM "districts"
JOIN "expenditures" ON "districts"."id" = expenditures."district_id"
JOIN "staff_evaluations" ON "districts"."id" = "staff_evaluations"."district_id"
WHERE "per_pupil_expenditure" > (
    SELECT AVG("per_pupil_expenditure") FROM "expenditures"
    )
AND "exemplary" > (
    SELECT AVG("exemplary") FROM "staff_evaluations"
    )
AND "type" = 'Public School District'
ORDER BY "exemplary" DESC, "per_pupil_expenditure" DESC;