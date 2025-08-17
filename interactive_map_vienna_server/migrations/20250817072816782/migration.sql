BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "pois" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "category" text,
    "description" text,
    "address" text,
    "zip" text,
    "city" text,
    "latitude" double precision,
    "longitude" double precision,
    "tel1" text,
    "tel1Comment" text,
    "tel2" text,
    "tel2Comment" text,
    "tel3" text,
    "tel3Comment" text,
    "email" text,
    "webUrl" text,
    "url" text,
    "imageUrl" text
);

-- Indexes
CREATE INDEX "poi_title_idx" ON "pois" USING btree ("title");
CREATE INDEX "poi_category_idx" ON "pois" USING btree ("category");
CREATE INDEX "poi_geo_idx" ON "pois" USING btree ("latitude", "longitude");


--
-- MIGRATION VERSION FOR interactive_map_vienna
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('interactive_map_vienna', '20250817072816782', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250817072816782', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
