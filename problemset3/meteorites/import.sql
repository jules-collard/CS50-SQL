CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT,
    "class" TEXT,
    "mass" double,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" DOUBLE,
    "long" DOUBLE,
    PRIMARY KEY ("id")
);

UPDATE "temp"
SET "lat" = NULL WHERE "lat" = 0.0;

UPDATE "temp"
SET "long" = NULL WHERE "long" = 0.0;

UPDATE "temp"
SET "mass" = NULL WHERE "mass" = 0.0;

UPDATE "temp"
SET "year" = NULL WHERE "year" = 0;

UPDATE "temp"
SET "mass" = ROUND("mass", 2);

UPDATE "temp"
SET "lat" = ROUND("lat", 2);

UPDATE "temp"
SET "long" = ROUND("long", 2);

DELETE FROM "temp"
WHERE "nametype" = 'Relict';

INSERT INTO "meteorites" ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long" FROM "temp"
ORDER BY "year", "name";

DROP TABLE "temp";