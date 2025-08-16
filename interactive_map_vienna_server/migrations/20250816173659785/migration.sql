BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "water_stations" (
    "id" bigserial PRIMARY KEY,
    "objectId" text NOT NULL,
    "type" text NOT NULL,
    "latitude" double precision NOT NULL,
    "longitude" double precision NOT NULL
);


--
-- MIGRATION VERSION FOR interactive_map_vienna
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('interactive_map_vienna', '20250816173659785', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250816173659785', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
