SELECT "title" FROM "episodes"
               WHERE "topic" IS NOT NULL
                  OR "air_date" = '2007%';