ALTER TABLE "lopa$asset_tgt" DROP CONSTRAINT "uniq_lopa$asset_tgt_lopa$assetid";
ALTER TABLE "lopa$asset_tgt" DROP CONSTRAINT "uniq_lopa$asset_tgt_main$tgtid";
DROP INDEX "idx_lopa$asset_tgt_main$tgt_lopa$asset";
ALTER TABLE "lopa$asset_tgt" RENAME TO "7ffe7b5784794395ae8f310a71e027ff";
ALTER TABLE "lopa$lopa_filedocument" DROP CONSTRAINT "uniq_lopa$lopa_filedocument_lopa$lopaid";
ALTER TABLE "lopa$lopa_filedocument" DROP CONSTRAINT "uniq_lopa$lopa_filedocument_main$filedocumentid";
DROP INDEX "idx_lopa$lopa_filedocument_main$filedocument_lopa$lopa";
ALTER TABLE "lopa$lopa_filedocument" RENAME TO "06d6b0d2a0284a909c541136b3e9b9c0";
ALTER TABLE "main$filedocument" RENAME TO "b8f51e1589494bcf9ecd19992192e21c";
ALTER TABLE "main$tgt" RENAME TO "1015ecdb67d34deaa4afc5872657c424";
ALTER TABLE "main$tgt_filedocument" DROP CONSTRAINT "uniq_main$tgt_filedocument_main$tgtid";
DROP INDEX "idx_main$tgt_filedocument_main$filedocument_main$tgt";
ALTER TABLE "main$tgt_filedocument" RENAME TO "d8b199e5c61548a7b4cbffa047ca38f9";
CREATE TABLE "lopa$asset_tgt" (
	"lopa$assetid" BIGINT NOT NULL,
	"main$tgtid" BIGINT NOT NULL,
	PRIMARY KEY("lopa$assetid","main$tgtid"),
	CONSTRAINT "uniq_lopa$asset_tgt_main$tgtid" UNIQUE ("main$tgtid"),
	CONSTRAINT "uniq_lopa$asset_tgt_lopa$assetid" UNIQUE ("lopa$assetid"));
CREATE INDEX "idx_lopa$asset_tgt_main$tgt_lopa$asset" ON "lopa$asset_tgt" ("main$tgtid" ASC,"lopa$assetid" ASC);
DELETE FROM "mendixsystem$association" 
 WHERE "id" = 'f1f2a247-b255-469d-b1b6-151ea30ed41b';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_lopa$asset_tgt_lopa$assetid';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_lopa$asset_tgt_main$tgtid';
INSERT INTO "mendixsystem$association" ("id", 
"association_name", 
"table_name", 
"parent_entity_id", 
"child_entity_id", 
"parent_column_name", 
"child_column_name", 
"index_name")
 VALUES ('f1f2a247-b255-469d-b1b6-151ea30ed41b', 
'Lopa.Asset_Tgt', 
'lopa$asset_tgt', 
'889a189d-cb6b-4229-93c7-a8c1fb5ef1df', 
'cffd491d-ef5d-4d89-96c5-59ad5cf9295c', 
'lopa$assetid', 
'main$tgtid', 
'idx_lopa$asset_tgt_main$tgt_lopa$asset');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_lopa$asset_tgt_main$tgtid', 
'f1f2a247-b255-469d-b1b6-151ea30ed41b', 
'ba88bbdf-1af3-35e0-9873-ca92f82ffb24');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_lopa$asset_tgt_lopa$assetid', 
'f1f2a247-b255-469d-b1b6-151ea30ed41b', 
'22211d17-27ab-3c61-bab8-6304b6571f09');
CREATE TABLE "lopa$lopa_filedocument" (
	"lopa$lopaid" BIGINT NOT NULL,
	"main$filedocumentid" BIGINT NOT NULL,
	PRIMARY KEY("lopa$lopaid","main$filedocumentid"),
	CONSTRAINT "uniq_lopa$lopa_filedocument_main$filedocumentid" UNIQUE ("main$filedocumentid"),
	CONSTRAINT "uniq_lopa$lopa_filedocument_lopa$lopaid" UNIQUE ("lopa$lopaid"));
CREATE INDEX "idx_lopa$lopa_filedocument_main$filedocument_lopa$lopa" ON "lopa$lopa_filedocument" ("main$filedocumentid" ASC,"lopa$lopaid" ASC);
DELETE FROM "mendixsystem$association" 
 WHERE "id" = '1c9ba935-4d9c-4e23-aac5-af1fe021ad1c';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_lopa$lopa_filedocument_lopa$lopaid';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_lopa$lopa_filedocument_main$filedocumentid';
INSERT INTO "mendixsystem$association" ("id", 
"association_name", 
"table_name", 
"parent_entity_id", 
"child_entity_id", 
"parent_column_name", 
"child_column_name", 
"index_name")
 VALUES ('1c9ba935-4d9c-4e23-aac5-af1fe021ad1c', 
'Lopa.LOPA_FileDocument', 
'lopa$lopa_filedocument', 
'cb6128a7-b5c0-4e35-b4c7-476fc07f1853', 
'e6acf2e3-ef4a-4211-a297-921a57e14f6d', 
'lopa$lopaid', 
'main$filedocumentid', 
'idx_lopa$lopa_filedocument_main$filedocument_lopa$lopa');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_lopa$lopa_filedocument_main$filedocumentid', 
'1c9ba935-4d9c-4e23-aac5-af1fe021ad1c', 
'1c5f6645-b25b-3415-b3be-686fd6dc83dc');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_lopa$lopa_filedocument_lopa$lopaid', 
'1c9ba935-4d9c-4e23-aac5-af1fe021ad1c', 
'0f8ca1cf-741b-3ae7-a5e7-03e732699900');
DELETE FROM "mendixsystem$entity" 
 WHERE "id" = 'f72d1849-b1f7-4d8f-8219-0a46d8c51525';
DELETE FROM "mendixsystem$entityidentifier" 
 WHERE "id" = 'f72d1849-b1f7-4d8f-8219-0a46d8c51525';
DELETE FROM "mendixsystem$sequence" 
 WHERE "attribute_id" IN (SELECT "id"
 FROM "mendixsystem$attribute"
 WHERE "entity_id" = 'f72d1849-b1f7-4d8f-8219-0a46d8c51525');
DELETE FROM "mendixsystem$attribute" 
 WHERE "entity_id" = 'f72d1849-b1f7-4d8f-8219-0a46d8c51525';
DELETE FROM "mendixsystem$entity" 
 WHERE "id" = 'ab4a017a-6ab1-4308-808a-67dee9664cc1';
DELETE FROM "mendixsystem$entityidentifier" 
 WHERE "id" = 'ab4a017a-6ab1-4308-808a-67dee9664cc1';
DELETE FROM "mendixsystem$sequence" 
 WHERE "attribute_id" IN (SELECT "id"
 FROM "mendixsystem$attribute"
 WHERE "entity_id" = 'ab4a017a-6ab1-4308-808a-67dee9664cc1');
DELETE FROM "mendixsystem$attribute" 
 WHERE "entity_id" = 'ab4a017a-6ab1-4308-808a-67dee9664cc1';
DELETE FROM "mendixsystem$association" 
 WHERE "id" = 'fced9f3f-f1cf-4d55-97c7-285bd449be2f';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_main$tgt_filedocument_main$tgtid';
CREATE TABLE "main$filedocument" (
	"id" BIGINT NOT NULL,
	PRIMARY KEY("id"));
INSERT INTO "mendixsystem$entity" ("id", 
"entity_name", 
"table_name", 
"superentity_id")
 VALUES ('e6acf2e3-ef4a-4211-a297-921a57e14f6d', 
'Main.FileDocument', 
'main$filedocument', 
'170ce49d-f29c-4fac-99a6-b55e8a3aeb39');
CREATE TABLE "main$tgt" (
	"id" BIGINT NOT NULL,
	"fill" VARCHAR_IGNORECASE(200) NULL,
	"_class" VARCHAR_IGNORECASE(200) NULL,
	"_id" VARCHAR_IGNORECASE(200) NULL,
	"name" VARCHAR_IGNORECASE(200) NULL,
	PRIMARY KEY("id"));
INSERT INTO "mendixsystem$entity" ("id", 
"entity_name", 
"table_name")
 VALUES ('cffd491d-ef5d-4d89-96c5-59ad5cf9295c', 
'Main.Tgt', 
'main$tgt');
INSERT INTO "mendixsystem$attribute" ("id", 
"entity_id", 
"attribute_name", 
"column_name", 
"type", 
"length", 
"default_value", 
"is_auto_number")
 VALUES ('b93c1539-5177-452d-b673-8a9476ec7303', 
'cffd491d-ef5d-4d89-96c5-59ad5cf9295c', 
'Fill', 
'fill', 
30, 
200, 
'', 
false);
INSERT INTO "mendixsystem$attribute" ("id", 
"entity_id", 
"attribute_name", 
"column_name", 
"type", 
"length", 
"default_value", 
"is_auto_number")
 VALUES ('35460163-ecfd-49dc-9140-796419edbb91', 
'cffd491d-ef5d-4d89-96c5-59ad5cf9295c', 
'_Class', 
'_class', 
30, 
200, 
'', 
false);
INSERT INTO "mendixsystem$attribute" ("id", 
"entity_id", 
"attribute_name", 
"column_name", 
"type", 
"length", 
"default_value", 
"is_auto_number")
 VALUES ('a22931e9-970a-4ed9-aeea-3663b48660a3', 
'cffd491d-ef5d-4d89-96c5-59ad5cf9295c', 
'_Id', 
'_id', 
30, 
200, 
'', 
false);
INSERT INTO "mendixsystem$attribute" ("id", 
"entity_id", 
"attribute_name", 
"column_name", 
"type", 
"length", 
"default_value", 
"is_auto_number")
 VALUES ('06abb746-fcc9-4273-a723-189df42babff', 
'cffd491d-ef5d-4d89-96c5-59ad5cf9295c', 
'Name', 
'name', 
30, 
200, 
'', 
false);
CREATE TABLE "main$tgt_filedocument" (
	"main$tgtid" BIGINT NOT NULL,
	"main$filedocumentid" BIGINT NOT NULL,
	PRIMARY KEY("main$tgtid","main$filedocumentid"),
	CONSTRAINT "uniq_main$tgt_filedocument_main$tgtid" UNIQUE ("main$tgtid"));
CREATE INDEX "idx_main$tgt_filedocument_main$filedocument_main$tgt" ON "main$tgt_filedocument" ("main$filedocumentid" ASC,"main$tgtid" ASC);
INSERT INTO "mendixsystem$association" ("id", 
"association_name", 
"table_name", 
"parent_entity_id", 
"child_entity_id", 
"parent_column_name", 
"child_column_name", 
"index_name")
 VALUES ('8f464d3b-e856-4c94-83e5-e810ac4bfdc7', 
'Main.Tgt_FileDocument', 
'main$tgt_filedocument', 
'cffd491d-ef5d-4d89-96c5-59ad5cf9295c', 
'e6acf2e3-ef4a-4211-a297-921a57e14f6d', 
'main$tgtid', 
'main$filedocumentid', 
'idx_main$tgt_filedocument_main$filedocument_main$tgt');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_main$tgt_filedocument_main$tgtid', 
'8f464d3b-e856-4c94-83e5-e810ac4bfdc7', 
'4ea0064c-4b22-3756-a671-2d4d3bd655fb');
DELETE FROM "system$filedocument" 
 WHERE "id" IN (SELECT "id"
 FROM "b8f51e1589494bcf9ecd19992192e21c");
DROP TABLE "7ffe7b5784794395ae8f310a71e027ff";
DROP TABLE "06d6b0d2a0284a909c541136b3e9b9c0";
DROP TABLE "b8f51e1589494bcf9ecd19992192e21c";
DROP TABLE "1015ecdb67d34deaa4afc5872657c424";
DROP TABLE "d8b199e5c61548a7b4cbffa047ca38f9";
UPDATE "mendixsystem$version"
 SET "versionnumber" = '4.2', 
"lastsyncdate" = '20191206 04:25:06';
