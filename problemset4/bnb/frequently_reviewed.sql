CREATE VIEW "frequently_reviewed" AS
    WITH "total_reviews" AS (
        SELECT "listing_id", COUNT(*) AS "reviews" FROM "reviews"
        GROUP BY "listing_id"
    )
    SELECT "listings"."id", "property_type", "host_name", "reviews" FROM "listings"
    JOIN "total_reviews" ON "listings"."id" = "total_reviews"."listing_id"
    ORDER BY "reviews" DESC, "property_type", "host_name" LIMIT 100;