--https://cs50.harvard.edu/sql/2024/psets/2/atl/

CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" INTEGER CHECK ("age" >= 0),
    PRIMARY KEY("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    PRIMARY KEY ("id")
);

CREATE TABLE "concourse_assignments" (
    "airline_id" INTEGER,
    "concourse" TEXT NOT NULL CHECK ("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'G')),
    FOREIGN KEY ("airline_id") REFERENCES "airlines"("id"),
    UNIQUE ("airline_id", "concourse")
);

CREATE TABLE "checkins" (
    "id" INTEGER,
    "passenger_id" INTEGER NOT NULL,
    "flight_id" INTEGER NOT NULL,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY ("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_no" INTEGER NOT NULL,
    "airline_id" INTEGER,
    "dep_airport" TEXT NOT NULL,
    "arr_airport" TEXT NOT NULL,
    "dep_datetime" NUMERIC,
    "arr_datetime" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);