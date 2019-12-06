ALTER TABLE "lopa$asset_lopa" DROP CONSTRAINT "uniq_lopa$asset_lopa_lopa$assetid";
DROP INDEX "idx_lopa$asset_lopa_lopa$lopa_lopa$asset";
ALTER TABLE "lopa$asset_tgt" DROP CONSTRAINT "uniq_lopa$asset_tgt_lopa$assetid";
ALTER TABLE "lopa$asset_tgt" DROP CONSTRAINT "uniq_lopa$asset_tgt_main$tgtid";
DROP INDEX "idx_lopa$asset_tgt_main$tgt_lopa$asset";
DROP INDEX "idx_lopa$fleet_plane_lopa$plane_lopa$fleet";
ALTER TABLE "lopa$lopa_filedocument" DROP CONSTRAINT "uniq_lopa$lopa_filedocument_main$filedocumentid";
ALTER TABLE "lopa$lopa_filedocument" DROP CONSTRAINT "uniq_lopa$lopa_filedocument_lopa$lopaid";
DROP INDEX "idx_lopa$lopa_filedocument_main$filedocument_lopa$lopa";
ALTER TABLE "lopa$plane_lopa" DROP CONSTRAINT "uniq_lopa$plane_lopa_lopa$lopaid";
ALTER TABLE "lopa$plane_lopa" DROP CONSTRAINT "uniq_lopa$plane_lopa_lopa$planeid";
DROP INDEX "idx_lopa$plane_lopa_lopa$lopa_lopa$plane";
ALTER TABLE "lopa$task_asset" DROP CONSTRAINT "uniq_lopa$task_asset_lopa$taskid";
DROP INDEX "idx_lopa$task_asset_lopa$asset_lopa$task";
ALTER TABLE "main$tgt_filedocument" DROP CONSTRAINT "uniq_main$tgt_filedocument_main$tgtid";
DROP INDEX "idx_main$tgt_filedocument_main$filedocument_main$tgt";
ALTER TABLE "lopa$asset" RENAME TO "demo$asset";
ALTER TABLE "lopa$asset_lopa" RENAME TO "demo$asset_lopa";
ALTER TABLE "lopa$asset_tgt" RENAME TO "demo$asset_tgt";
ALTER TABLE "lopa$fleet" RENAME TO "demo$fleet";
ALTER TABLE "lopa$fleet_plane" RENAME TO "demo$fleet_plane";
ALTER TABLE "lopa$lopa" RENAME TO "demo$lopa";
ALTER TABLE "lopa$lopa_filedocument" RENAME TO "demo$lopa_filedocument";
ALTER TABLE "lopa$plane" RENAME TO "demo$plane";
ALTER TABLE "lopa$plane_lopa" RENAME TO "demo$plane_lopa";
ALTER TABLE "lopa$task" RENAME TO "demo$task";
ALTER TABLE "lopa$task_asset" RENAME TO "demo$task_asset";
ALTER TABLE "main$filedocument" RENAME TO "svg$filedocument";
UPDATE "system$filedocument"
 SET "submetaobjectname" = 'SVG.FileDocument'
 WHERE "submetaobjectname" = 'Main.FileDocument';
ALTER TABLE "main$tgt" RENAME TO "svg$tgt";
ALTER TABLE "main$tgt_filedocument" RENAME TO "svg$tgt_filedocument";
UPDATE "mendixsystem$entity"
 SET "entity_name" = 'Demo.Asset', 
"table_name" = 'demo$asset', 
"superentity_id" = NULL
 WHERE "id" = '889a189d-cb6b-4229-93c7-a8c1fb5ef1df';
ALTER TABLE "demo$asset_lopa" ALTER COLUMN "lopa$assetid" RENAME TO "demo$assetid";
ALTER TABLE "demo$asset_lopa" ALTER COLUMN "lopa$lopaid" RENAME TO "demo$lopaid";
CREATE INDEX "idx_demo$asset_lopa_demo$lopa_demo$asset" ON "demo$asset_lopa" ("demo$lopaid" ASC,"demo$assetid" ASC);
ALTER TABLE "demo$asset_lopa" ADD CONSTRAINT "uniq_demo$asset_lopa_demo$assetid" UNIQUE ("demo$assetid");
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_lopa$asset_lopa_lopa$assetid';
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demo$asset_lopa_demo$assetid', 
'a0dc1292-abe3-4b34-9a2a-28817f9c208f', 
'7f415898-2fe0-315f-9e1a-4cafe09fdb26');
UPDATE "mendixsystem$association"
 SET "association_name" = 'Demo.Asset_LOPA', 
"table_name" = 'demo$asset_lopa', 
"parent_entity_id" = '889a189d-cb6b-4229-93c7-a8c1fb5ef1df', 
"child_entity_id" = 'cb6128a7-b5c0-4e35-b4c7-476fc07f1853', 
"parent_column_name" = 'demo$assetid', 
"child_column_name" = 'demo$lopaid', 
"pk_index_name" = NULL, 
"index_name" = 'idx_demo$asset_lopa_demo$lopa_demo$asset'
 WHERE "id" = 'a0dc1292-abe3-4b34-9a2a-28817f9c208f';
ALTER TABLE "demo$asset_tgt" ALTER COLUMN "lopa$assetid" RENAME TO "demo$assetid";
ALTER TABLE "demo$asset_tgt" ALTER COLUMN "main$tgtid" RENAME TO "svg$tgtid";
CREATE INDEX "idx_demo$asset_tgt_svg$tgt_demo$asset" ON "demo$asset_tgt" ("svg$tgtid" ASC,"demo$assetid" ASC);
ALTER TABLE "demo$asset_tgt" ADD CONSTRAINT "uniq_demo$asset_tgt_svg$tgtid" UNIQUE ("svg$tgtid");
ALTER TABLE "demo$asset_tgt" ADD CONSTRAINT "uniq_demo$asset_tgt_demo$assetid" UNIQUE ("demo$assetid");
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_lopa$asset_tgt_lopa$assetid';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_lopa$asset_tgt_main$tgtid';
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demo$asset_tgt_svg$tgtid', 
'f1f2a247-b255-469d-b1b6-151ea30ed41b', 
'ba88bbdf-1af3-35e0-9873-ca92f82ffb24');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demo$asset_tgt_demo$assetid', 
'f1f2a247-b255-469d-b1b6-151ea30ed41b', 
'22211d17-27ab-3c61-bab8-6304b6571f09');
UPDATE "mendixsystem$association"
 SET "association_name" = 'Demo.Asset_Tgt', 
"table_name" = 'demo$asset_tgt', 
"parent_entity_id" = '889a189d-cb6b-4229-93c7-a8c1fb5ef1df', 
"child_entity_id" = 'cffd491d-ef5d-4d89-96c5-59ad5cf9295c', 
"parent_column_name" = 'demo$assetid', 
"child_column_name" = 'svg$tgtid', 
"pk_index_name" = NULL, 
"index_name" = 'idx_demo$asset_tgt_svg$tgt_demo$asset'
 WHERE "id" = 'f1f2a247-b255-469d-b1b6-151ea30ed41b';
UPDATE "mendixsystem$entity"
 SET "entity_name" = 'Demo.Fleet', 
"table_name" = 'demo$fleet', 
"superentity_id" = NULL
 WHERE "id" = '549c37b4-8fd8-4c59-8e16-d8bd183f22ff';
ALTER TABLE "demo$fleet_plane" ALTER COLUMN "lopa$planeid" RENAME TO "demo$planeid";
ALTER TABLE "demo$fleet_plane" ALTER COLUMN "lopa$fleetid" RENAME TO "demo$fleetid";
CREATE INDEX "idx_demo$fleet_plane_demo$plane_demo$fleet" ON "demo$fleet_plane" ("demo$planeid" ASC,"demo$fleetid" ASC);
UPDATE "mendixsystem$association"
 SET "association_name" = 'Demo.Fleet_Plane', 
"table_name" = 'demo$fleet_plane', 
"parent_entity_id" = '549c37b4-8fd8-4c59-8e16-d8bd183f22ff', 
"child_entity_id" = 'd525fae7-d6f5-4a9d-8992-0f1f33ee8ab1', 
"parent_column_name" = 'demo$fleetid', 
"child_column_name" = 'demo$planeid', 
"pk_index_name" = NULL, 
"index_name" = 'idx_demo$fleet_plane_demo$plane_demo$fleet'
 WHERE "id" = '78f9c2a7-e20d-4486-ab9a-8b1d4a487651';
ALTER SEQUENCE "lopa$lopa__id_mxseq" RENAME TO "demo$lopa__id_mxseq";
UPDATE "mendixsystem$sequence"
 SET "name" = 'demo$lopa__id_mxseq'
 WHERE "attribute_id" = '708c5e43-ca86-4af5-915d-7e8268f6efa2';
UPDATE "mendixsystem$entity"
 SET "entity_name" = 'Demo.LOPA', 
"table_name" = 'demo$lopa', 
"superentity_id" = NULL
 WHERE "id" = 'cb6128a7-b5c0-4e35-b4c7-476fc07f1853';
ALTER TABLE "demo$lopa_filedocument" ALTER COLUMN "main$filedocumentid" RENAME TO "svg$filedocumentid";
ALTER TABLE "demo$lopa_filedocument" ALTER COLUMN "lopa$lopaid" RENAME TO "demo$lopaid";
CREATE INDEX "idx_demo$lopa_filedocument_svg$filedocument_demo$lopa" ON "demo$lopa_filedocument" ("svg$filedocumentid" ASC,"demo$lopaid" ASC);
ALTER TABLE "demo$lopa_filedocument" ADD CONSTRAINT "uniq_demo$lopa_filedocument_svg$filedocumentid" UNIQUE ("svg$filedocumentid");
ALTER TABLE "demo$lopa_filedocument" ADD CONSTRAINT "uniq_demo$lopa_filedocument_demo$lopaid" UNIQUE ("demo$lopaid");
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_lopa$lopa_filedocument_lopa$lopaid';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_lopa$lopa_filedocument_main$filedocumentid';
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demo$lopa_filedocument_svg$filedocumentid', 
'1c9ba935-4d9c-4e23-aac5-af1fe021ad1c', 
'1c5f6645-b25b-3415-b3be-686fd6dc83dc');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demo$lopa_filedocument_demo$lopaid', 
'1c9ba935-4d9c-4e23-aac5-af1fe021ad1c', 
'0f8ca1cf-741b-3ae7-a5e7-03e732699900');
UPDATE "mendixsystem$association"
 SET "association_name" = 'Demo.LOPA_FileDocument', 
"table_name" = 'demo$lopa_filedocument', 
"parent_entity_id" = 'cb6128a7-b5c0-4e35-b4c7-476fc07f1853', 
"child_entity_id" = 'e6acf2e3-ef4a-4211-a297-921a57e14f6d', 
"parent_column_name" = 'demo$lopaid', 
"child_column_name" = 'svg$filedocumentid', 
"pk_index_name" = NULL, 
"index_name" = 'idx_demo$lopa_filedocument_svg$filedocument_demo$lopa'
 WHERE "id" = '1c9ba935-4d9c-4e23-aac5-af1fe021ad1c';
UPDATE "mendixsystem$entity"
 SET "entity_name" = 'Demo.Plane', 
"table_name" = 'demo$plane', 
"superentity_id" = NULL
 WHERE "id" = 'd525fae7-d6f5-4a9d-8992-0f1f33ee8ab1';
ALTER TABLE "demo$plane_lopa" ALTER COLUMN "lopa$planeid" RENAME TO "demo$planeid";
ALTER TABLE "demo$plane_lopa" ALTER COLUMN "lopa$lopaid" RENAME TO "demo$lopaid";
CREATE INDEX "idx_demo$plane_lopa_demo$lopa_demo$plane" ON "demo$plane_lopa" ("demo$lopaid" ASC,"demo$planeid" ASC);
ALTER TABLE "demo$plane_lopa" ADD CONSTRAINT "uniq_demo$plane_lopa_demo$lopaid" UNIQUE ("demo$lopaid");
ALTER TABLE "demo$plane_lopa" ADD CONSTRAINT "uniq_demo$plane_lopa_demo$planeid" UNIQUE ("demo$planeid");
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_lopa$plane_lopa_lopa$lopaid';
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_lopa$plane_lopa_lopa$planeid';
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demo$plane_lopa_demo$lopaid', 
'0f988086-b2c8-4395-a11b-9fd75cbcb255', 
'e9776086-357b-397a-ae1e-fb11f3d65fe8');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demo$plane_lopa_demo$planeid', 
'0f988086-b2c8-4395-a11b-9fd75cbcb255', 
'036b57e0-d0dc-32c6-9a53-52453856e090');
UPDATE "mendixsystem$association"
 SET "association_name" = 'Demo.Plane_LOPA', 
"table_name" = 'demo$plane_lopa', 
"parent_entity_id" = 'd525fae7-d6f5-4a9d-8992-0f1f33ee8ab1', 
"child_entity_id" = 'cb6128a7-b5c0-4e35-b4c7-476fc07f1853', 
"parent_column_name" = 'demo$planeid', 
"child_column_name" = 'demo$lopaid', 
"pk_index_name" = NULL, 
"index_name" = 'idx_demo$plane_lopa_demo$lopa_demo$plane'
 WHERE "id" = '0f988086-b2c8-4395-a11b-9fd75cbcb255';
UPDATE "mendixsystem$entity"
 SET "entity_name" = 'Demo.Task', 
"table_name" = 'demo$task', 
"superentity_id" = NULL
 WHERE "id" = '14e26751-ed5e-48c7-bc63-1edb3f287e47';
ALTER TABLE "demo$task_asset" ALTER COLUMN "lopa$assetid" RENAME TO "demo$assetid";
ALTER TABLE "demo$task_asset" ALTER COLUMN "lopa$taskid" RENAME TO "demo$taskid";
CREATE INDEX "idx_demo$task_asset_demo$asset_demo$task" ON "demo$task_asset" ("demo$assetid" ASC,"demo$taskid" ASC);
ALTER TABLE "demo$task_asset" ADD CONSTRAINT "uniq_demo$task_asset_demo$taskid" UNIQUE ("demo$taskid");
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_lopa$task_asset_lopa$taskid';
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demo$task_asset_demo$taskid', 
'b81be0ad-e0a3-4460-a176-159541e56ec8', 
'32b1c173-cdc6-3730-94d6-b657b3c3262f');
UPDATE "mendixsystem$association"
 SET "association_name" = 'Demo.Task_Asset', 
"table_name" = 'demo$task_asset', 
"parent_entity_id" = '14e26751-ed5e-48c7-bc63-1edb3f287e47', 
"child_entity_id" = '889a189d-cb6b-4229-93c7-a8c1fb5ef1df', 
"parent_column_name" = 'demo$taskid', 
"child_column_name" = 'demo$assetid', 
"pk_index_name" = NULL, 
"index_name" = 'idx_demo$task_asset_demo$asset_demo$task'
 WHERE "id" = 'b81be0ad-e0a3-4460-a176-159541e56ec8';
UPDATE "mendixsystem$entity"
 SET "entity_name" = 'SVG.FileDocument', 
"table_name" = 'svg$filedocument', 
"superentity_id" = '170ce49d-f29c-4fac-99a6-b55e8a3aeb39'
 WHERE "id" = 'e6acf2e3-ef4a-4211-a297-921a57e14f6d';
UPDATE "mendixsystem$entity"
 SET "entity_name" = 'SVG.Tgt', 
"table_name" = 'svg$tgt', 
"superentity_id" = NULL
 WHERE "id" = 'cffd491d-ef5d-4d89-96c5-59ad5cf9295c';
ALTER TABLE "svg$tgt_filedocument" ALTER COLUMN "main$filedocumentid" RENAME TO "svg$filedocumentid";
ALTER TABLE "svg$tgt_filedocument" ALTER COLUMN "main$tgtid" RENAME TO "svg$tgtid";
CREATE INDEX "idx_svg$tgt_filedocument_svg$filedocument_svg$tgt" ON "svg$tgt_filedocument" ("svg$filedocumentid" ASC,"svg$tgtid" ASC);
ALTER TABLE "svg$tgt_filedocument" ADD CONSTRAINT "uniq_svg$tgt_filedocument_svg$tgtid" UNIQUE ("svg$tgtid");
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_main$tgt_filedocument_main$tgtid';
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_svg$tgt_filedocument_svg$tgtid', 
'8f464d3b-e856-4c94-83e5-e810ac4bfdc7', 
'4ea0064c-4b22-3756-a671-2d4d3bd655fb');
UPDATE "mendixsystem$association"
 SET "association_name" = 'SVG.Tgt_FileDocument', 
"table_name" = 'svg$tgt_filedocument', 
"parent_entity_id" = 'cffd491d-ef5d-4d89-96c5-59ad5cf9295c', 
"child_entity_id" = 'e6acf2e3-ef4a-4211-a297-921a57e14f6d', 
"parent_column_name" = 'svg$tgtid', 
"child_column_name" = 'svg$filedocumentid', 
"pk_index_name" = NULL, 
"index_name" = 'idx_svg$tgt_filedocument_svg$filedocument_svg$tgt'
 WHERE "id" = '8f464d3b-e856-4c94-83e5-e810ac4bfdc7';
UPDATE "mendixsystem$version"
 SET "versionnumber" = '4.2', 
"lastsyncdate" = '20191206 04:25:34';
