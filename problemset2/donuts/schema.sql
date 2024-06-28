-- https://cs50.harvard.edu/sql/2024/psets/2/donuts/

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price_per_unit" REAL CHECK ("price_per_unit" > 0.0),
    PRIMARY KEY ("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "gluten_free" INTEGER CHECK ("gluten_free" = 0 OR "gluten_free" = 1),
    "price" REAL CHECK ("price" > 0.0),
    PRIMARY KEY ("id")
);

CREATE TABLE "recipes" (
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,
    "units" REAL CHECK ("units" > 0.0),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id"),
    UNIQUE ("donut_id", "ingredient_id")
);

CREATE TABLE "orders" (
    "order_no" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY ("order_no"),
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "order_contents" (
    "order_no" INTEGER,
    "donut_id" INTEGER,
    "quantity" INTEGER CHECK ("quantity" > 0),
    FOREIGN KEY ("order_no") REFERENCES "orders"("order_no"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id")
);