
-- *** The Lost Letter ***
--Information: From 900 Somerville Avenue, to 2 Finnegan Street
SELECT * FROM "addresses" WHERE "id" = (
    SELECT "to_address_id" FROM "packages" WHERE "from_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
        ) AND "contents" = 'Congratulatory letter'
    );
-- *** The Devious Delivery ***
SELECT * FROM "packages" WHERE "from_address_id" IS NULL; -- package ID is 5098, contents is Duck debugger
SELECT * FROM "addresses" WHERE "id" = (
    SELECT "to_address_id" FROM "packages" WHERE "from_address_id" IS NULL
    ); -- residential


-- *** The Forgotten Gift ***
SELECT * FROM "packages" WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
    ) AND "to_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place'
    ); -- contents are flowers

SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "from_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street'
        ) AND "to_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place'
        )
    );
-- package was picked up from Warehouse (7432) by driver 17:

SELECT * FROM "drivers" WHERE "id" = 17; -- Mikel

