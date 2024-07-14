CREATE VIEW "one_bedrooms" AS
    SELECT "id", "property_type", "host_name", "accommodates" FROM "no_descriptions"
    WHERE "bedrooms" = 1;