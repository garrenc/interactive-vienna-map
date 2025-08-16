BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "toilets" (
    "id" bigserial PRIMARY KEY,
    "objectId" text NOT NULL,
    "wcId" text NOT NULL,
    "district" text NOT NULL,
    "street" text NOT NULL,
    "locationDetails" text,
    "isActive" boolean NOT NULL,
    "openingHours" text NOT NULL,
    "restrictions" text NOT NULL,
    "staffSupervision" text NOT NULL,
    "category" text NOT NULL,
    "equipment" text NOT NULL,
    "icon" text NOT NULL,
    "iconText" text NOT NULL,
    "contact" text NOT NULL,
    "department" text NOT NULL,
    "information" text NOT NULL,
    "latitude" double precision NOT NULL,
    "longitude" double precision NOT NULL
);


--
-- MIGRATION VERSION FOR interactive_map_vienna
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('interactive_map_vienna', '20250816175140124', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250816175140124', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
