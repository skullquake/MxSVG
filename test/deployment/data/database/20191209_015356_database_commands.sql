ALTER TABLE "demo$assettemplate" RENAME TO "b8780efc56ec456d99a97336a7917258";
ALTER TABLE "demo$diagram_filedocument" DROP CONSTRAINT "uniq_demo$diagram_filedocument_demo$diagramid";
ALTER TABLE "demo$diagram_filedocument" DROP CONSTRAINT "uniq_demo$diagram_filedocument_svg$filedocumentid";
DROP INDEX "idx_demo$diagram_filedocument_svg$filedocument_demo$diagram";
ALTER TABLE "demo$diagram_filedocument" RENAME TO "192199af651e4f6b94a9f202330b8434";
ALTER TABLE "demo$lopatemplate" RENAME TO "678878352ba44daaa07ab30009dffa11";
ALTER TABLE "demo$plane_diagram" DROP CONSTRAINT "uniq_demo$plane_diagram_demo$diagramid";
ALTER TABLE "demo$plane_diagram" DROP CONSTRAINT "uniq_demo$plane_diagram_demo$planeid";
DROP INDEX "idx_demo$plane_diagram_demo$diagram_demo$plane";
DROP INDEX "idx_demo$fleet_plane_demo$fleet_demo$plane";
ALTER TABLE "demo$planetemplate" RENAME TO "815e2450de5d42409be2866d83b3f7db";
ALTER TABLE "demo$tasktemplate" RENAME TO "7c70763ca2534b14904da155d36ca9d0";
ALTER TABLE "demo$userdata_tgt" DROP CONSTRAINT "uniq_demo$userdata_tgt_demo$userdataid";
ALTER TABLE "demo$userdata_tgt" DROP CONSTRAINT "uniq_demo$userdata_tgt_svg$tgtid";
DROP INDEX "idx_demo$userdata_tgt_svg$tgt_demo$userdata";
ALTER TABLE "demo$userdata_tgt" RENAME TO "292ac9c827a24d2b85b3c387401b8ead";
ALTER TABLE "demoshared$diagram_filedocument_shared" DROP CONSTRAINT "uniq_demoshared$diagram_filedocument_shared_demoshared$diagramid";
DROP INDEX "idx_demoshared$diagram_filedocument_shared_svg$filedocument_demoshared$diagram";
ALTER TABLE "demoshared$diagram_filedocument_shared" RENAME TO "b5bafaa45d66462f8dd768b0c973bca0";
DROP INDEX "idx_demoshared$fleet_plane_demoshared$fleet_demoshared$plane";
ALTER TABLE "demoshared$plane_diagram" DROP CONSTRAINT "uniq_demoshared$plane_diagram_demoshared$diagramid";
ALTER TABLE "demoshared$plane_diagram" DROP CONSTRAINT "uniq_demoshared$plane_diagram_demoshared$planeid";
DROP INDEX "idx_demoshared$plane_diagram_demoshared$diagram_demoshared$plane";
ALTER TABLE "demoshared$userdata_tgt_shared" DROP CONSTRAINT "uniq_demoshared$userdata_tgt_shared_demoshared$userdataid";
ALTER TABLE "demoshared$userdata_tgt_shared" DROP CONSTRAINT "uniq_demoshared$userdata_tgt_shared_svg$tgtid";
DROP INDEX "idx_demoshared$userdata_tgt_shared_svg$tgt_demoshared$userdata";
ALTER TABLE "demoshared$userdata_tgt_shared" RENAME TO "5ab29ed91ad146cd871d60e4d670d294";
ALTER TABLE "svg$filedocument" RENAME TO "11ab0a50d73b44ef8c9f95aec78a2a21";
ALTER TABLE "svg$selectedtgt" DROP CONSTRAINT "uniq_svg$selectedtgt_svg$filedocumentid";
ALTER TABLE "svg$selectedtgt" DROP CONSTRAINT "uniq_svg$selectedtgt_svg$tgtid";
DROP INDEX "idx_svg$selectedtgt_svg$tgt_svg$filedocument";
ALTER TABLE "svg$selectedtgt" RENAME TO "c60dadca7f6a450586c8f0e164b75504";
ALTER TABLE "svg$tgt" RENAME TO "0e8cde9f58c9466f98732304c7bea0cf";
ALTER TABLE "svg$tgt_filedocument" DROP CONSTRAINT "uniq_svg$tgt_filedocument_svg$tgtid";
DROP INDEX "idx_svg$tgt_filedocument_svg$filedocument_svg$tgt";
ALTER TABLE "svg$tgt_filedocument" RENAME TO "a60617bd537d4b2fafff3f81cafea991";
ALTER TABLE "demo$plane" RENAME TO "demo$vehicle";
ALTER TABLE "demo$plane_diagram" RENAME TO "demo$vehicle_diagram";
ALTER TABLE "demoshared$plane" RENAME TO "demoshared$vehicle";
ALTER TABLE "demoshared$plane_diagram" RENAME TO "demoshared$vehicle_diagram";
DELETE FROM "mendixsystem$entity" 
 WHERE "id" = 'ec0afed6-9399-45ef-94fe-ff768cc76719';
DELETE FROM "mendixsystem$entityidentifier" 
 WHERE "id" = 'ec0afed6-9399-45ef-94fe-ff768cc76719';
DELETE FROM "mendixsystem$sequence" 
 WHERE "attribute_id" IN (SELECT "id"
 FROM "mendixsystem$attribute"
 WHERE "entity_id" = 'ec0afed6-9399-45ef-94fe-ff768cc76719');
DELETE FROM "mendixsystem$attribute" 
 WHERE "entity_id" = 'ec0afed6-9399-45ef-94fe-ff768cc76719';
CREATE TABLE "demo$diagram_filedocument" (
	"demo$diagramid" BIGINT NOT NULL,
	"svg$filedocumentid" BIGINT NOT NULL,
	PRIMARY KEY("demo$diagramid","svg$filedocumentid"),
	CONSTRAINT "uniq_demo$diagram_filedocument_svg$filedocumentid" UNIQUE ("svg$filedocumentid"),
	CONSTRAINT "uniq_demo$diagram_filedocument_demo$diagramid" UNIQUE ("demo$diagramid"));
CREATE INDEX "idx_demo$diagram_filedocument_svg$filedocument_demo$diagram" ON "demo$diagram_filedocument" ("svg$filedocumentid" ASC,"demo$diagramid" ASC);
DELETE FROM "mendixsystem$association" 
 WHERE "id" = 'cf521a6d-7928-40bc-9a23-ad14cc2c890a';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_demo$diagram_filedocument_demo$diagramid';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_demo$diagram_filedocument_svg$filedocumentid';
INSERT INTO "mendixsystem$association" ("id", 
"association_name", 
"table_name", 
"parent_entity_id", 
"child_entity_id", 
"parent_column_name", 
"child_column_name", 
"index_name")
 VALUES ('cf521a6d-7928-40bc-9a23-ad14cc2c890a', 
'Demo.Diagram_FileDocument', 
'demo$diagram_filedocument', 
'38d477f3-a55b-4497-aaaa-2d63507e9da7', 
'cdc1be2b-b871-4b58-97ec-a9b3c05f9775', 
'demo$diagramid', 
'svg$filedocumentid', 
'idx_demo$diagram_filedocument_svg$filedocument_demo$diagram');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demo$diagram_filedocument_svg$filedocumentid', 
'cf521a6d-7928-40bc-9a23-ad14cc2c890a', 
'51ea3fff-b1fb-30eb-b0d5-1b8f5877f021');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demo$diagram_filedocument_demo$diagramid', 
'cf521a6d-7928-40bc-9a23-ad14cc2c890a', 
'e105724a-ae3c-3996-8050-08d3618dc836');
DELETE FROM "mendixsystem$entity" 
 WHERE "id" = '60bbc48f-f565-4f0d-886b-b7a31c906d9e';
DELETE FROM "mendixsystem$entityidentifier" 
 WHERE "id" = '60bbc48f-f565-4f0d-886b-b7a31c906d9e';
DELETE FROM "mendixsystem$sequence" 
 WHERE "attribute_id" IN (SELECT "id"
 FROM "mendixsystem$attribute"
 WHERE "entity_id" = '60bbc48f-f565-4f0d-886b-b7a31c906d9e');
DELETE FROM "mendixsystem$attribute" 
 WHERE "entity_id" = '60bbc48f-f565-4f0d-886b-b7a31c906d9e';
UPDATE "mendixsystem$entity"
 SET "entity_name" = 'Demo.Vehicle', 
"table_name" = 'demo$vehicle', 
"superentity_id" = NULL
 WHERE "id" = 'd525fae7-d6f5-4a9d-8992-0f1f33ee8ab1';
ALTER TABLE "demo$vehicle_diagram" ALTER COLUMN "demo$planeid" RENAME TO "demo$vehicleid";
CREATE INDEX "idx_demo$vehicle_diagram_demo$diagram_demo$vehicle" ON "demo$vehicle_diagram" ("demo$diagramid" ASC,"demo$vehicleid" ASC);
ALTER TABLE "demo$vehicle_diagram" ADD CONSTRAINT "uniq_demo$vehicle_diagram_demo$vehicleid" UNIQUE ("demo$vehicleid");
ALTER TABLE "demo$vehicle_diagram" ADD CONSTRAINT "uniq_demo$vehicle_diagram_demo$diagramid" UNIQUE ("demo$diagramid");
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_demo$plane_diagram_demo$diagramid';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_demo$plane_diagram_demo$planeid';
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demo$vehicle_diagram_demo$diagramid', 
'5d5aed91-1633-4309-965c-350e8d807ed5', 
'95b64813-6560-3938-a7c8-6afa234f85f8');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demo$vehicle_diagram_demo$vehicleid', 
'5d5aed91-1633-4309-965c-350e8d807ed5', 
'293ad614-07e4-3407-9942-3b49066ff6f5');
UPDATE "mendixsystem$association"
 SET "association_name" = 'Demo.Vehicle_Diagram', 
"table_name" = 'demo$vehicle_diagram', 
"parent_entity_id" = 'd525fae7-d6f5-4a9d-8992-0f1f33ee8ab1', 
"child_entity_id" = '38d477f3-a55b-4497-aaaa-2d63507e9da7', 
"parent_column_name" = 'demo$vehicleid', 
"child_column_name" = 'demo$diagramid', 
"pk_index_name" = NULL, 
"index_name" = 'idx_demo$vehicle_diagram_demo$diagram_demo$vehicle'
 WHERE "id" = '5d5aed91-1633-4309-965c-350e8d807ed5';
ALTER TABLE "demo$fleet_plane" ALTER COLUMN "demo$planeid" RENAME TO "demo$vehicleid";
CREATE INDEX "idx_demo$fleet_plane_demo$fleet_demo$vehicle" ON "demo$fleet_plane" ("demo$fleetid" ASC,"demo$vehicleid" ASC);
UPDATE "mendixsystem$association"
 SET "association_name" = 'Demo.Fleet_Plane', 
"table_name" = 'demo$fleet_plane', 
"parent_entity_id" = 'd525fae7-d6f5-4a9d-8992-0f1f33ee8ab1', 
"child_entity_id" = '549c37b4-8fd8-4c59-8e16-d8bd183f22ff', 
"parent_column_name" = 'demo$vehicleid', 
"child_column_name" = 'demo$fleetid', 
"pk_index_name" = NULL, 
"index_name" = 'idx_demo$fleet_plane_demo$fleet_demo$vehicle'
 WHERE "id" = 'a2badb7e-10b9-4b2b-acfe-cf2a0ee33d04';
DELETE FROM "mendixsystem$entity" 
 WHERE "id" = '8887acf6-04f4-448e-8343-28253421e44e';
DELETE FROM "mendixsystem$entityidentifier" 
 WHERE "id" = '8887acf6-04f4-448e-8343-28253421e44e';
DELETE FROM "mendixsystem$sequence" 
 WHERE "attribute_id" IN (SELECT "id"
 FROM "mendixsystem$attribute"
 WHERE "entity_id" = '8887acf6-04f4-448e-8343-28253421e44e');
DELETE FROM "mendixsystem$attribute" 
 WHERE "entity_id" = '8887acf6-04f4-448e-8343-28253421e44e';
DELETE FROM "mendixsystem$entity" 
 WHERE "id" = 'f709e3b6-540a-4ba6-9fd5-042a821ec735';
DELETE FROM "mendixsystem$entityidentifier" 
 WHERE "id" = 'f709e3b6-540a-4ba6-9fd5-042a821ec735';
DELETE FROM "mendixsystem$sequence" 
 WHERE "attribute_id" IN (SELECT "id"
 FROM "mendixsystem$attribute"
 WHERE "entity_id" = 'f709e3b6-540a-4ba6-9fd5-042a821ec735');
DELETE FROM "mendixsystem$attribute" 
 WHERE "entity_id" = 'f709e3b6-540a-4ba6-9fd5-042a821ec735';
CREATE TABLE "demo$userdata_tgt" (
	"demo$userdataid" BIGINT NOT NULL,
	"svg$tgtid" BIGINT NOT NULL,
	PRIMARY KEY("demo$userdataid","svg$tgtid"),
	CONSTRAINT "uniq_demo$userdata_tgt_svg$tgtid" UNIQUE ("svg$tgtid"),
	CONSTRAINT "uniq_demo$userdata_tgt_demo$userdataid" UNIQUE ("demo$userdataid"));
CREATE INDEX "idx_demo$userdata_tgt_svg$tgt_demo$userdata" ON "demo$userdata_tgt" ("svg$tgtid" ASC,"demo$userdataid" ASC);
DELETE FROM "mendixsystem$association" 
 WHERE "id" = 'acb3c9b8-cd80-4260-a469-f8c1c77d2ce1';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_demo$userdata_tgt_demo$userdataid';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_demo$userdata_tgt_svg$tgtid';
INSERT INTO "mendixsystem$association" ("id", 
"association_name", 
"table_name", 
"parent_entity_id", 
"child_entity_id", 
"parent_column_name", 
"child_column_name", 
"index_name")
 VALUES ('acb3c9b8-cd80-4260-a469-f8c1c77d2ce1', 
'Demo.UserData_Tgt', 
'demo$userdata_tgt', 
'7ba5488f-ee15-43a3-a217-11d85dafcf26', 
'1aed8bba-abdf-4645-be73-8ce83116fb91', 
'demo$userdataid', 
'svg$tgtid', 
'idx_demo$userdata_tgt_svg$tgt_demo$userdata');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demo$userdata_tgt_svg$tgtid', 
'acb3c9b8-cd80-4260-a469-f8c1c77d2ce1', 
'3785d7c6-07ff-3713-b95d-b276e841ee15');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demo$userdata_tgt_demo$userdataid', 
'acb3c9b8-cd80-4260-a469-f8c1c77d2ce1', 
'ef148c2b-aea9-396c-bf8a-ff2cefe783d5');
CREATE TABLE "demoshared$diagram_filedocument_shared" (
	"demoshared$diagramid" BIGINT NOT NULL,
	"svg$filedocumentid" BIGINT NOT NULL,
	PRIMARY KEY("demoshared$diagramid","svg$filedocumentid"),
	CONSTRAINT "uniq_demoshared$diagram_filedocument_shared_demoshared$diagramid" UNIQUE ("demoshared$diagramid"));
CREATE INDEX "idx_demoshared$diagram_filedocument_shared_svg$filedocument_demoshared$diagram" ON "demoshared$diagram_filedocument_shared" ("svg$filedocumentid" ASC,"demoshared$diagramid" ASC);
DELETE FROM "mendixsystem$association" 
 WHERE "id" = '27a1e7d0-28a9-4a6b-b650-4b404fc22c7b';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_demoshared$diagram_filedocument_shared_demoshared$diagramid';
INSERT INTO "mendixsystem$association" ("id", 
"association_name", 
"table_name", 
"parent_entity_id", 
"child_entity_id", 
"parent_column_name", 
"child_column_name", 
"index_name")
 VALUES ('27a1e7d0-28a9-4a6b-b650-4b404fc22c7b', 
'DemoShared.Diagram_FileDocument_Shared', 
'demoshared$diagram_filedocument_shared', 
'a12e4268-c8ed-4e51-ab6f-c1626e4c9026', 
'cdc1be2b-b871-4b58-97ec-a9b3c05f9775', 
'demoshared$diagramid', 
'svg$filedocumentid', 
'idx_demoshared$diagram_filedocument_shared_svg$filedocument_demoshared$diagram');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demoshared$diagram_filedocument_shared_demoshared$diagramid', 
'27a1e7d0-28a9-4a6b-b650-4b404fc22c7b', 
'77c3b3d4-4249-33a6-b1b2-3c42b7d61b99');
UPDATE "mendixsystem$entity"
 SET "entity_name" = 'DemoShared.Vehicle', 
"table_name" = 'demoshared$vehicle', 
"superentity_id" = NULL
 WHERE "id" = 'b05e4a64-c767-45cb-80e6-788015ff6f9b';
ALTER TABLE "demoshared$fleet_plane" ALTER COLUMN "demoshared$planeid" RENAME TO "demoshared$vehicleid";
CREATE INDEX "idx_demoshared$fleet_plane_demoshared$fleet_demoshared$vehicle" ON "demoshared$fleet_plane" ("demoshared$fleetid" ASC,"demoshared$vehicleid" ASC);
UPDATE "mendixsystem$association"
 SET "association_name" = 'DemoShared.Fleet_Plane', 
"table_name" = 'demoshared$fleet_plane', 
"parent_entity_id" = 'b05e4a64-c767-45cb-80e6-788015ff6f9b', 
"child_entity_id" = '4cb093db-0b78-4954-bbf7-a429944483c3', 
"parent_column_name" = 'demoshared$vehicleid', 
"child_column_name" = 'demoshared$fleetid', 
"pk_index_name" = NULL, 
"index_name" = 'idx_demoshared$fleet_plane_demoshared$fleet_demoshared$vehicle'
 WHERE "id" = '7041ec7b-b5e3-4074-b56b-3951cd3cfd1a';
ALTER TABLE "demoshared$vehicle_diagram" ALTER COLUMN "demoshared$planeid" RENAME TO "demoshared$vehicleid";
CREATE INDEX "idx_demoshared$vehicle_diagram_demoshared$diagram_demoshared$vehicle" ON "demoshared$vehicle_diagram" ("demoshared$diagramid" ASC,"demoshared$vehicleid" ASC);
ALTER TABLE "demoshared$vehicle_diagram" ADD CONSTRAINT "uniq_demoshared$vehicle_diagram_demoshared$vehicleid" UNIQUE ("demoshared$vehicleid");
ALTER TABLE "demoshared$vehicle_diagram" ADD CONSTRAINT "uniq_demoshared$vehicle_diagram_demoshared$diagramid" UNIQUE ("demoshared$diagramid");
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_demoshared$plane_diagram_demoshared$diagramid';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_demoshared$plane_diagram_demoshared$planeid';
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demoshared$vehicle_diagram_demoshared$diagramid', 
'b86b321a-5a5f-49a8-b98f-b8ecc44b273a', 
'1124384f-9455-30ef-8c8b-3c0f58a2deb1');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demoshared$vehicle_diagram_demoshared$vehicleid', 
'b86b321a-5a5f-49a8-b98f-b8ecc44b273a', 
'32e10115-d50d-3229-94d7-7f6f715d6d25');
UPDATE "mendixsystem$association"
 SET "association_name" = 'DemoShared.Vehicle_Diagram', 
"table_name" = 'demoshared$vehicle_diagram', 
"parent_entity_id" = 'b05e4a64-c767-45cb-80e6-788015ff6f9b', 
"child_entity_id" = 'a12e4268-c8ed-4e51-ab6f-c1626e4c9026', 
"parent_column_name" = 'demoshared$vehicleid', 
"child_column_name" = 'demoshared$diagramid', 
"pk_index_name" = NULL, 
"index_name" = 'idx_demoshared$vehicle_diagram_demoshared$diagram_demoshared$vehicle'
 WHERE "id" = 'b86b321a-5a5f-49a8-b98f-b8ecc44b273a';
CREATE TABLE "demoshared$userdata_tgt_shared" (
	"demoshared$userdataid" BIGINT NOT NULL,
	"svg$tgtid" BIGINT NOT NULL,
	PRIMARY KEY("demoshared$userdataid","svg$tgtid"),
	CONSTRAINT "uniq_demoshared$userdata_tgt_shared_svg$tgtid" UNIQUE ("svg$tgtid"),
	CONSTRAINT "uniq_demoshared$userdata_tgt_shared_demoshared$userdataid" UNIQUE ("demoshared$userdataid"));
CREATE INDEX "idx_demoshared$userdata_tgt_shared_svg$tgt_demoshared$userdata" ON "demoshared$userdata_tgt_shared" ("svg$tgtid" ASC,"demoshared$userdataid" ASC);
DELETE FROM "mendixsystem$association" 
 WHERE "id" = 'bcbfead2-2de6-4f32-ad91-2cdce65875ef';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_demoshared$userdata_tgt_shared_demoshared$userdataid';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_demoshared$userdata_tgt_shared_svg$tgtid';
INSERT INTO "mendixsystem$association" ("id", 
"association_name", 
"table_name", 
"parent_entity_id", 
"child_entity_id", 
"parent_column_name", 
"child_column_name", 
"index_name")
 VALUES ('bcbfead2-2de6-4f32-ad91-2cdce65875ef', 
'DemoShared.UserData_Tgt_Shared', 
'demoshared$userdata_tgt_shared', 
'f5c8aaf6-dc1c-4dd7-bf9b-72e5a04419e5', 
'1aed8bba-abdf-4645-be73-8ce83116fb91', 
'demoshared$userdataid', 
'svg$tgtid', 
'idx_demoshared$userdata_tgt_shared_svg$tgt_demoshared$userdata');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demoshared$userdata_tgt_shared_svg$tgtid', 
'bcbfead2-2de6-4f32-ad91-2cdce65875ef', 
'e483878c-e5df-3a70-a6b7-de4653d5d62a');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demoshared$userdata_tgt_shared_demoshared$userdataid', 
'bcbfead2-2de6-4f32-ad91-2cdce65875ef', 
'2b9f94fd-3833-3439-8fe8-b17bcbec3685');
DELETE FROM "mendixsystem$entity" 
 WHERE "id" = 'e6acf2e3-ef4a-4211-a297-921a57e14f6d';
DELETE FROM "mendixsystem$entityidentifier" 
 WHERE "id" = 'e6acf2e3-ef4a-4211-a297-921a57e14f6d';
DELETE FROM "mendixsystem$sequence" 
 WHERE "attribute_id" IN (SELECT "id"
 FROM "mendixsystem$attribute"
 WHERE "entity_id" = 'e6acf2e3-ef4a-4211-a297-921a57e14f6d');
DELETE FROM "mendixsystem$attribute" 
 WHERE "entity_id" = 'e6acf2e3-ef4a-4211-a297-921a57e14f6d';
DELETE FROM "mendixsystem$association" 
 WHERE "id" = 'c87ec799-224b-47a1-bc32-d288cb2a07cc';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_svg$selectedtgt_svg$filedocumentid';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_svg$selectedtgt_svg$tgtid';
DELETE FROM "mendixsystem$entity" 
 WHERE "id" = 'cffd491d-ef5d-4d89-96c5-59ad5cf9295c';
DELETE FROM "mendixsystem$entityidentifier" 
 WHERE "id" = 'cffd491d-ef5d-4d89-96c5-59ad5cf9295c';
DELETE FROM "mendixsystem$sequence" 
 WHERE "attribute_id" IN (SELECT "id"
 FROM "mendixsystem$attribute"
 WHERE "entity_id" = 'cffd491d-ef5d-4d89-96c5-59ad5cf9295c');
DELETE FROM "mendixsystem$attribute" 
 WHERE "entity_id" = 'cffd491d-ef5d-4d89-96c5-59ad5cf9295c';
DELETE FROM "mendixsystem$association" 
 WHERE "id" = '8f464d3b-e856-4c94-83e5-e810ac4bfdc7';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_svg$tgt_filedocument_svg$tgtid';
CREATE TABLE "svg$filedocument" (
	"id" BIGINT NOT NULL,
	PRIMARY KEY("id"));
INSERT INTO "mendixsystem$entity" ("id", 
"entity_name", 
"table_name", 
"superentity_id")
 VALUES ('cdc1be2b-b871-4b58-97ec-a9b3c05f9775', 
'SVG.FileDocument', 
'svg$filedocument', 
'170ce49d-f29c-4fac-99a6-b55e8a3aeb39');
CREATE TABLE "svg$selectedtgt" (
	"svg$filedocumentid" BIGINT NOT NULL,
	"svg$tgtid" BIGINT NOT NULL,
	PRIMARY KEY("svg$filedocumentid","svg$tgtid"),
	CONSTRAINT "uniq_svg$selectedtgt_svg$tgtid" UNIQUE ("svg$tgtid"),
	CONSTRAINT "uniq_svg$selectedtgt_svg$filedocumentid" UNIQUE ("svg$filedocumentid"));
CREATE INDEX "idx_svg$selectedtgt_svg$tgt_svg$filedocument" ON "svg$selectedtgt" ("svg$tgtid" ASC,"svg$filedocumentid" ASC);
INSERT INTO "mendixsystem$association" ("id", 
"association_name", 
"table_name", 
"parent_entity_id", 
"child_entity_id", 
"parent_column_name", 
"child_column_name", 
"index_name")
 VALUES ('a1af0b68-f8b2-4ae8-8bec-710c6d34e167', 
'SVG.SelectedTgt', 
'svg$selectedtgt', 
'cdc1be2b-b871-4b58-97ec-a9b3c05f9775', 
'1aed8bba-abdf-4645-be73-8ce83116fb91', 
'svg$filedocumentid', 
'svg$tgtid', 
'idx_svg$selectedtgt_svg$tgt_svg$filedocument');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_svg$selectedtgt_svg$tgtid', 
'a1af0b68-f8b2-4ae8-8bec-710c6d34e167', 
'87f11483-eca6-3d03-835c-214f6c9076d7');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_svg$selectedtgt_svg$filedocumentid', 
'a1af0b68-f8b2-4ae8-8bec-710c6d34e167', 
'292c3222-f1fa-3db1-b023-a88536355bda');
CREATE TABLE "svg$tgt" (
	"id" BIGINT NOT NULL,
	"fill" VARCHAR_IGNORECASE(200) NULL,
	"_class" VARCHAR_IGNORECASE(200) NULL,
	"_id" VARCHAR_IGNORECASE(200) NULL,
	"name" VARCHAR_IGNORECASE(200) NULL,
	PRIMARY KEY("id"));
INSERT INTO "mendixsystem$entity" ("id", 
"entity_name", 
"table_name")
 VALUES ('1aed8bba-abdf-4645-be73-8ce83116fb91', 
'SVG.Tgt', 
'svg$tgt');
INSERT INTO "mendixsystem$attribute" ("id", 
"entity_id", 
"attribute_name", 
"column_name", 
"type", 
"length", 
"default_value", 
"is_auto_number")
 VALUES ('88c6ec00-2911-4517-b589-642a4419fc1f', 
'1aed8bba-abdf-4645-be73-8ce83116fb91', 
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
 VALUES ('45ad4145-d30d-404c-bb44-1ea572bde954', 
'1aed8bba-abdf-4645-be73-8ce83116fb91', 
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
 VALUES ('fc2acc8f-ede7-4abb-b99e-3b8b61c4e7cf', 
'1aed8bba-abdf-4645-be73-8ce83116fb91', 
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
 VALUES ('97a89a98-7285-47e7-b436-02644cf20e03', 
'1aed8bba-abdf-4645-be73-8ce83116fb91', 
'Name', 
'name', 
30, 
200, 
'', 
false);
CREATE TABLE "svg$tgt_filedocument" (
	"svg$tgtid" BIGINT NOT NULL,
	"svg$filedocumentid" BIGINT NOT NULL,
	PRIMARY KEY("svg$tgtid","svg$filedocumentid"),
	CONSTRAINT "uniq_svg$tgt_filedocument_svg$tgtid" UNIQUE ("svg$tgtid"));
CREATE INDEX "idx_svg$tgt_filedocument_svg$filedocument_svg$tgt" ON "svg$tgt_filedocument" ("svg$filedocumentid" ASC,"svg$tgtid" ASC);
INSERT INTO "mendixsystem$association" ("id", 
"association_name", 
"table_name", 
"parent_entity_id", 
"child_entity_id", 
"parent_column_name", 
"child_column_name", 
"index_name")
 VALUES ('ae50dccd-0588-4b67-ac93-f70239ffb64e', 
'SVG.Tgt_FileDocument', 
'svg$tgt_filedocument', 
'1aed8bba-abdf-4645-be73-8ce83116fb91', 
'cdc1be2b-b871-4b58-97ec-a9b3c05f9775', 
'svg$tgtid', 
'svg$filedocumentid', 
'idx_svg$tgt_filedocument_svg$filedocument_svg$tgt');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_svg$tgt_filedocument_svg$tgtid', 
'ae50dccd-0588-4b67-ac93-f70239ffb64e', 
'b280c62e-d884-3679-96d3-7b5df016c9b3');
DELETE FROM "system$filedocument" 
 WHERE "id" IN (SELECT "id"
 FROM "11ab0a50d73b44ef8c9f95aec78a2a21");
DROP TABLE "b8780efc56ec456d99a97336a7917258";
DROP TABLE "192199af651e4f6b94a9f202330b8434";
DROP TABLE "678878352ba44daaa07ab30009dffa11";
DROP TABLE "815e2450de5d42409be2866d83b3f7db";
DROP TABLE "7c70763ca2534b14904da155d36ca9d0";
DROP TABLE "292ac9c827a24d2b85b3c387401b8ead";
DROP TABLE "b5bafaa45d66462f8dd768b0c973bca0";
DROP TABLE "5ab29ed91ad146cd871d60e4d670d294";
DROP TABLE "11ab0a50d73b44ef8c9f95aec78a2a21";
DROP TABLE "c60dadca7f6a450586c8f0e164b75504";
DROP TABLE "0e8cde9f58c9466f98732304c7bea0cf";
DROP TABLE "a60617bd537d4b2fafff3f81cafea991";
UPDATE "mendixsystem$version"
 SET "versionnumber" = '4.2', 
"lastsyncdate" = '20191209 01:53:09';
