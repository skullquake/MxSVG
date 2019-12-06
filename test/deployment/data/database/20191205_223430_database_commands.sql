CREATE TABLE "lopa$fleet" (
	"id" BIGINT NOT NULL,
	"name" VARCHAR_IGNORECASE(200) NULL,
	PRIMARY KEY("id"));
INSERT INTO "mendixsystem$entity" ("id", 
"entity_name", 
"table_name")
 VALUES ('549c37b4-8fd8-4c59-8e16-d8bd183f22ff', 
'Lopa.Fleet', 
'lopa$fleet');
INSERT INTO "mendixsystem$attribute" ("id", 
"entity_id", 
"attribute_name", 
"column_name", 
"type", 
"length", 
"default_value", 
"is_auto_number")
 VALUES ('27924366-4417-4be5-937a-a237db1d7489', 
'549c37b4-8fd8-4c59-8e16-d8bd183f22ff', 
'Name', 
'name', 
30, 
200, 
'', 
false);
CREATE TABLE "lopa$fleet_plane" (
	"lopa$fleetid" BIGINT NOT NULL,
	"lopa$planeid" BIGINT NOT NULL,
	PRIMARY KEY("lopa$fleetid","lopa$planeid"));
CREATE INDEX "idx_lopa$fleet_plane_lopa$plane_lopa$fleet" ON "lopa$fleet_plane" ("lopa$planeid" ASC,"lopa$fleetid" ASC);
INSERT INTO "mendixsystem$association" ("id", 
"association_name", 
"table_name", 
"parent_entity_id", 
"child_entity_id", 
"parent_column_name", 
"child_column_name", 
"index_name")
 VALUES ('78f9c2a7-e20d-4486-ab9a-8b1d4a487651', 
'Lopa.Fleet_Plane', 
'lopa$fleet_plane', 
'549c37b4-8fd8-4c59-8e16-d8bd183f22ff', 
'd525fae7-d6f5-4a9d-8992-0f1f33ee8ab1', 
'lopa$fleetid', 
'lopa$planeid', 
'idx_lopa$fleet_plane_lopa$plane_lopa$fleet');
CREATE TABLE "lopa$lopa" (
	"id" BIGINT NOT NULL,
	"_id" BIGINT NULL,
	PRIMARY KEY("id"));
CREATE SEQUENCE "lopa$lopa__id_mxseq" AS BIGINT START WITH 1;
INSERT INTO "mendixsystem$entity" ("id", 
"entity_name", 
"table_name")
 VALUES ('cb6128a7-b5c0-4e35-b4c7-476fc07f1853', 
'Lopa.LOPA', 
'lopa$lopa');
INSERT INTO "mendixsystem$attribute" ("id", 
"entity_id", 
"attribute_name", 
"column_name", 
"type", 
"length", 
"default_value", 
"is_auto_number")
 VALUES ('708c5e43-ca86-4af5-915d-7e8268f6efa2', 
'cb6128a7-b5c0-4e35-b4c7-476fc07f1853', 
'_id', 
'_id', 
0, 
0, 
'1', 
true);
INSERT INTO "mendixsystem$sequence" ("attribute_id", 
"name", 
"start_value", 
"current_value")
 VALUES ('708c5e43-ca86-4af5-915d-7e8268f6efa2', 
'lopa$lopa__id_mxseq', 
1, 
0);
CREATE TABLE "lopa$lopa_filedocument" (
	"lopa$lopaid" BIGINT NOT NULL,
	"main$filedocumentid" BIGINT NOT NULL,
	PRIMARY KEY("lopa$lopaid","main$filedocumentid"),
	CONSTRAINT "uniq_lopa$lopa_filedocument_lopa$lopaid" UNIQUE ("lopa$lopaid"));
CREATE INDEX "idx_lopa$lopa_filedocument_main$filedocument_lopa$lopa" ON "lopa$lopa_filedocument" ("main$filedocumentid" ASC,"lopa$lopaid" ASC);
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
'f72d1849-b1f7-4d8f-8219-0a46d8c51525', 
'lopa$lopaid', 
'main$filedocumentid', 
'idx_lopa$lopa_filedocument_main$filedocument_lopa$lopa');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_lopa$lopa_filedocument_lopa$lopaid', 
'1c9ba935-4d9c-4e23-aac5-af1fe021ad1c', 
'0f8ca1cf-741b-3ae7-a5e7-03e732699900');
CREATE TABLE "lopa$task" (
	"id" BIGINT NOT NULL,
	"description" VARCHAR_IGNORECASE(2147483647) NULL,
	"name" VARCHAR_IGNORECASE(200) NULL,
	PRIMARY KEY("id"));
INSERT INTO "mendixsystem$entity" ("id", 
"entity_name", 
"table_name")
 VALUES ('14e26751-ed5e-48c7-bc63-1edb3f287e47', 
'Lopa.Task', 
'lopa$task');
INSERT INTO "mendixsystem$attribute" ("id", 
"entity_id", 
"attribute_name", 
"column_name", 
"type", 
"length", 
"default_value", 
"is_auto_number")
 VALUES ('745a4d12-d77e-4d6d-a231-92d30f7c4b8d', 
'14e26751-ed5e-48c7-bc63-1edb3f287e47', 
'Description', 
'description', 
30, 
0, 
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
 VALUES ('b6ff7cf2-7678-487f-a855-1ad0cef376c4', 
'14e26751-ed5e-48c7-bc63-1edb3f287e47', 
'Name', 
'name', 
30, 
200, 
'', 
false);
CREATE TABLE "lopa$task_asset" (
	"lopa$taskid" BIGINT NOT NULL,
	"lopa$assetid" BIGINT NOT NULL,
	PRIMARY KEY("lopa$taskid","lopa$assetid"),
	CONSTRAINT "uniq_lopa$task_asset_lopa$taskid" UNIQUE ("lopa$taskid"));
CREATE INDEX "idx_lopa$task_asset_lopa$asset_lopa$task" ON "lopa$task_asset" ("lopa$assetid" ASC,"lopa$taskid" ASC);
INSERT INTO "mendixsystem$association" ("id", 
"association_name", 
"table_name", 
"parent_entity_id", 
"child_entity_id", 
"parent_column_name", 
"child_column_name", 
"index_name")
 VALUES ('b81be0ad-e0a3-4460-a176-159541e56ec8', 
'Lopa.Task_Asset', 
'lopa$task_asset', 
'14e26751-ed5e-48c7-bc63-1edb3f287e47', 
'889a189d-cb6b-4229-93c7-a8c1fb5ef1df', 
'lopa$taskid', 
'lopa$assetid', 
'idx_lopa$task_asset_lopa$asset_lopa$task');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_lopa$task_asset_lopa$taskid', 
'b81be0ad-e0a3-4460-a176-159541e56ec8', 
'32b1c173-cdc6-3730-94d6-b657b3c3262f');
CREATE TABLE "splitstringutility$resultstring" (
	"id" BIGINT NOT NULL,
	"value" VARCHAR_IGNORECASE(2147483647) NULL,
	PRIMARY KEY("id"));
INSERT INTO "mendixsystem$entity" ("id", 
"entity_name", 
"table_name")
 VALUES ('4f67f7e5-1529-456a-9026-502197b61625', 
'SplitStringUtility.ResultString', 
'splitstringutility$resultstring');
INSERT INTO "mendixsystem$attribute" ("id", 
"entity_id", 
"attribute_name", 
"column_name", 
"type", 
"length", 
"default_value", 
"is_auto_number")
 VALUES ('f05df0f2-3594-4113-9142-367b03861765', 
'4f67f7e5-1529-456a-9026-502197b61625', 
'Value', 
'value', 
30, 
0, 
'', 
false);
CREATE TABLE "lopa$plane" (
	"id" BIGINT NOT NULL,
	"name" VARCHAR_IGNORECASE(200) NULL,
	PRIMARY KEY("id"));
INSERT INTO "mendixsystem$entity" ("id", 
"entity_name", 
"table_name")
 VALUES ('d525fae7-d6f5-4a9d-8992-0f1f33ee8ab1', 
'Lopa.Plane', 
'lopa$plane');
INSERT INTO "mendixsystem$attribute" ("id", 
"entity_id", 
"attribute_name", 
"column_name", 
"type", 
"length", 
"default_value", 
"is_auto_number")
 VALUES ('9e47067a-8bf4-4105-a2c3-c582ee457825', 
'd525fae7-d6f5-4a9d-8992-0f1f33ee8ab1', 
'Name', 
'name', 
30, 
200, 
'', 
false);
CREATE TABLE "lopa$plane_lopa" (
	"lopa$planeid" BIGINT NOT NULL,
	"lopa$lopaid" BIGINT NOT NULL,
	PRIMARY KEY("lopa$planeid","lopa$lopaid"),
	CONSTRAINT "uniq_lopa$plane_lopa_lopa$lopaid" UNIQUE ("lopa$lopaid"),
	CONSTRAINT "uniq_lopa$plane_lopa_lopa$planeid" UNIQUE ("lopa$planeid"));
CREATE INDEX "idx_lopa$plane_lopa_lopa$lopa_lopa$plane" ON "lopa$plane_lopa" ("lopa$lopaid" ASC,"lopa$planeid" ASC);
INSERT INTO "mendixsystem$association" ("id", 
"association_name", 
"table_name", 
"parent_entity_id", 
"child_entity_id", 
"parent_column_name", 
"child_column_name", 
"index_name")
 VALUES ('0f988086-b2c8-4395-a11b-9fd75cbcb255', 
'Lopa.Plane_LOPA', 
'lopa$plane_lopa', 
'd525fae7-d6f5-4a9d-8992-0f1f33ee8ab1', 
'cb6128a7-b5c0-4e35-b4c7-476fc07f1853', 
'lopa$planeid', 
'lopa$lopaid', 
'idx_lopa$plane_lopa_lopa$lopa_lopa$plane');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_lopa$plane_lopa_lopa$lopaid', 
'0f988086-b2c8-4395-a11b-9fd75cbcb255', 
'e9776086-357b-397a-ae1e-fb11f3d65fe8');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_lopa$plane_lopa_lopa$planeid', 
'0f988086-b2c8-4395-a11b-9fd75cbcb255', 
'036b57e0-d0dc-32c6-9a53-52453856e090');
CREATE TABLE "lopa$asset" (
	"id" BIGINT NOT NULL,
	"name" VARCHAR_IGNORECASE(200) NULL,
	PRIMARY KEY("id"));
INSERT INTO "mendixsystem$entity" ("id", 
"entity_name", 
"table_name")
 VALUES ('889a189d-cb6b-4229-93c7-a8c1fb5ef1df', 
'Lopa.Asset', 
'lopa$asset');
INSERT INTO "mendixsystem$attribute" ("id", 
"entity_id", 
"attribute_name", 
"column_name", 
"type", 
"length", 
"default_value", 
"is_auto_number")
 VALUES ('0821d371-290b-4653-aff5-c5b767ac397b', 
'889a189d-cb6b-4229-93c7-a8c1fb5ef1df', 
'Name', 
'name', 
30, 
200, 
'', 
false);
CREATE TABLE "lopa$asset_lopa" (
	"lopa$assetid" BIGINT NOT NULL,
	"lopa$lopaid" BIGINT NOT NULL,
	PRIMARY KEY("lopa$assetid","lopa$lopaid"),
	CONSTRAINT "uniq_lopa$asset_lopa_lopa$assetid" UNIQUE ("lopa$assetid"));
CREATE INDEX "idx_lopa$asset_lopa_lopa$lopa_lopa$asset" ON "lopa$asset_lopa" ("lopa$lopaid" ASC,"lopa$assetid" ASC);
INSERT INTO "mendixsystem$association" ("id", 
"association_name", 
"table_name", 
"parent_entity_id", 
"child_entity_id", 
"parent_column_name", 
"child_column_name", 
"index_name")
 VALUES ('a0dc1292-abe3-4b34-9a2a-28817f9c208f', 
'Lopa.Asset_LOPA', 
'lopa$asset_lopa', 
'889a189d-cb6b-4229-93c7-a8c1fb5ef1df', 
'cb6128a7-b5c0-4e35-b4c7-476fc07f1853', 
'lopa$assetid', 
'lopa$lopaid', 
'idx_lopa$asset_lopa_lopa$lopa_lopa$asset');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_lopa$asset_lopa_lopa$assetid', 
'a0dc1292-abe3-4b34-9a2a-28817f9c208f', 
'7f415898-2fe0-315f-9e1a-4cafe09fdb26');
CREATE TABLE "lopa$asset_tgt" (
	"lopa$assetid" BIGINT NOT NULL,
	"main$tgtid" BIGINT NOT NULL,
	PRIMARY KEY("lopa$assetid","main$tgtid"),
	CONSTRAINT "uniq_lopa$asset_tgt_main$tgtid" UNIQUE ("main$tgtid"),
	CONSTRAINT "uniq_lopa$asset_tgt_lopa$assetid" UNIQUE ("lopa$assetid"));
CREATE INDEX "idx_lopa$asset_tgt_main$tgt_lopa$asset" ON "lopa$asset_tgt" ("main$tgtid" ASC,"lopa$assetid" ASC);
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
'ab4a017a-6ab1-4308-808a-67dee9664cc1', 
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
UPDATE "mendixsystem$version"
 SET "versionnumber" = '4.2', 
"lastsyncdate" = '20191205 22:34:28';
