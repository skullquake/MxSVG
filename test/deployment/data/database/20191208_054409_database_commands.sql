ALTER TABLE "demo$diagram_filedocument_shared" DROP CONSTRAINT "uniq_demo$diagram_filedocument_shared_demo$diagramid";
ALTER TABLE "demo$diagram_filedocument_shared" DROP CONSTRAINT "uniq_demo$diagram_filedocument_shared_svg$filedocumentid";
DROP INDEX "idx_demo$diagram_filedocument_shared_svg$filedocument_demo$diagram";
ALTER TABLE "demo$userdata_tgt_shared" DROP CONSTRAINT "uniq_demo$userdata_tgt_shared_demo$userdataid";
ALTER TABLE "demo$userdata_tgt_shared" DROP CONSTRAINT "uniq_demo$userdata_tgt_shared_svg$tgtid";
DROP INDEX "idx_demo$userdata_tgt_shared_svg$tgt_demo$userdata";
ALTER TABLE "demoshared$diagram_filedocument" DROP CONSTRAINT "uniq_demoshared$diagram_filedocument_demoshared$diagramid";
ALTER TABLE "demoshared$diagram_filedocument" DROP CONSTRAINT "uniq_demoshared$diagram_filedocument_svg$filedocumentid";
DROP INDEX "idx_demoshared$diagram_filedocument_svg$filedocument_demoshared$diagram";
ALTER TABLE "demoshared$userdata_tgt" DROP CONSTRAINT "uniq_demoshared$userdata_tgt_svg$tgtid";
ALTER TABLE "demoshared$userdata_tgt" DROP CONSTRAINT "uniq_demoshared$userdata_tgt_demoshared$userdataid";
DROP INDEX "idx_demoshared$userdata_tgt_svg$tgt_demoshared$userdata";
ALTER TABLE "demo$diagram_filedocument_shared" RENAME TO "demo$diagram_filedocument";
ALTER TABLE "demo$userdata_tgt_shared" RENAME TO "demo$userdata_tgt";
ALTER TABLE "demoshared$diagram_filedocument" RENAME TO "demoshared$diagram_filedocument_shared";
ALTER TABLE "demoshared$userdata_tgt" RENAME TO "demoshared$userdata_tgt_shared";
CREATE INDEX "idx_demo$diagram_filedocument_svg$filedocument_demo$diagram" ON "demo$diagram_filedocument" ("svg$filedocumentid" ASC,"demo$diagramid" ASC);
ALTER TABLE "demo$diagram_filedocument" ADD CONSTRAINT "uniq_demo$diagram_filedocument_svg$filedocumentid" UNIQUE ("svg$filedocumentid");
ALTER TABLE "demo$diagram_filedocument" ADD CONSTRAINT "uniq_demo$diagram_filedocument_demo$diagramid" UNIQUE ("demo$diagramid");
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_demo$diagram_filedocument_shared_demo$diagramid';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_demo$diagram_filedocument_shared_svg$filedocumentid';
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
UPDATE "mendixsystem$association"
 SET "association_name" = 'Demo.Diagram_FileDocument', 
"table_name" = 'demo$diagram_filedocument', 
"parent_entity_id" = '38d477f3-a55b-4497-aaaa-2d63507e9da7', 
"child_entity_id" = 'e6acf2e3-ef4a-4211-a297-921a57e14f6d', 
"parent_column_name" = 'demo$diagramid', 
"child_column_name" = 'svg$filedocumentid', 
"pk_index_name" = NULL, 
"index_name" = 'idx_demo$diagram_filedocument_svg$filedocument_demo$diagram'
 WHERE "id" = 'cf521a6d-7928-40bc-9a23-ad14cc2c890a';
CREATE INDEX "idx_demo$userdata_tgt_svg$tgt_demo$userdata" ON "demo$userdata_tgt" ("svg$tgtid" ASC,"demo$userdataid" ASC);
ALTER TABLE "demo$userdata_tgt" ADD CONSTRAINT "uniq_demo$userdata_tgt_demo$userdataid" UNIQUE ("demo$userdataid");
ALTER TABLE "demo$userdata_tgt" ADD CONSTRAINT "uniq_demo$userdata_tgt_svg$tgtid" UNIQUE ("svg$tgtid");
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_demo$userdata_tgt_shared_demo$userdataid';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_demo$userdata_tgt_shared_svg$tgtid';
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
UPDATE "mendixsystem$association"
 SET "association_name" = 'Demo.UserData_Tgt', 
"table_name" = 'demo$userdata_tgt', 
"parent_entity_id" = '7ba5488f-ee15-43a3-a217-11d85dafcf26', 
"child_entity_id" = 'cffd491d-ef5d-4d89-96c5-59ad5cf9295c', 
"parent_column_name" = 'demo$userdataid', 
"child_column_name" = 'svg$tgtid', 
"pk_index_name" = NULL, 
"index_name" = 'idx_demo$userdata_tgt_svg$tgt_demo$userdata'
 WHERE "id" = 'acb3c9b8-cd80-4260-a469-f8c1c77d2ce1';
CREATE INDEX "idx_demoshared$diagram_filedocument_shared_svg$filedocument_demoshared$diagram" ON "demoshared$diagram_filedocument_shared" ("svg$filedocumentid" ASC,"demoshared$diagramid" ASC);
ALTER TABLE "demoshared$diagram_filedocument_shared" ADD CONSTRAINT "uniq_demoshared$diagram_filedocument_shared_demoshared$diagramid" UNIQUE ("demoshared$diagramid");
ALTER TABLE "demoshared$diagram_filedocument_shared" ADD CONSTRAINT "uniq_demoshared$diagram_filedocument_shared_svg$filedocumentid" UNIQUE ("svg$filedocumentid");
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_demoshared$diagram_filedocument_demoshared$diagramid';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_demoshared$diagram_filedocument_svg$filedocumentid';
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demoshared$diagram_filedocument_shared_svg$filedocumentid', 
'27a1e7d0-28a9-4a6b-b650-4b404fc22c7b', 
'5760f3df-371d-3c80-9453-690420ff49a2');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demoshared$diagram_filedocument_shared_demoshared$diagramid', 
'27a1e7d0-28a9-4a6b-b650-4b404fc22c7b', 
'77c3b3d4-4249-33a6-b1b2-3c42b7d61b99');
UPDATE "mendixsystem$association"
 SET "association_name" = 'DemoShared.Diagram_FileDocument_Shared', 
"table_name" = 'demoshared$diagram_filedocument_shared', 
"parent_entity_id" = 'a12e4268-c8ed-4e51-ab6f-c1626e4c9026', 
"child_entity_id" = 'e6acf2e3-ef4a-4211-a297-921a57e14f6d', 
"parent_column_name" = 'demoshared$diagramid', 
"child_column_name" = 'svg$filedocumentid', 
"pk_index_name" = NULL, 
"index_name" = 'idx_demoshared$diagram_filedocument_shared_svg$filedocument_demoshared$diagram'
 WHERE "id" = '27a1e7d0-28a9-4a6b-b650-4b404fc22c7b';
CREATE INDEX "idx_demoshared$userdata_tgt_shared_svg$tgt_demoshared$userdata" ON "demoshared$userdata_tgt_shared" ("svg$tgtid" ASC,"demoshared$userdataid" ASC);
ALTER TABLE "demoshared$userdata_tgt_shared" ADD CONSTRAINT "uniq_demoshared$userdata_tgt_shared_svg$tgtid" UNIQUE ("svg$tgtid");
ALTER TABLE "demoshared$userdata_tgt_shared" ADD CONSTRAINT "uniq_demoshared$userdata_tgt_shared_demoshared$userdataid" UNIQUE ("demoshared$userdataid");
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_demoshared$userdata_tgt_demoshared$userdataid';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_demoshared$userdata_tgt_svg$tgtid';
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
UPDATE "mendixsystem$association"
 SET "association_name" = 'DemoShared.UserData_Tgt_Shared', 
"table_name" = 'demoshared$userdata_tgt_shared', 
"parent_entity_id" = 'f5c8aaf6-dc1c-4dd7-bf9b-72e5a04419e5', 
"child_entity_id" = 'cffd491d-ef5d-4d89-96c5-59ad5cf9295c', 
"parent_column_name" = 'demoshared$userdataid', 
"child_column_name" = 'svg$tgtid', 
"pk_index_name" = NULL, 
"index_name" = 'idx_demoshared$userdata_tgt_shared_svg$tgt_demoshared$userdata'
 WHERE "id" = 'bcbfead2-2de6-4f32-ad91-2cdce65875ef';
UPDATE "mendixsystem$version"
 SET "versionnumber" = '4.2', 
"lastsyncdate" = '20191208 05:44:07';
