CREATE TABLE "main$tgt" (
	"id" BIGINT NOT NULL,
	"_class" VARCHAR_IGNORECASE(200) NULL,
	"_id" VARCHAR_IGNORECASE(200) NULL,
	"name" VARCHAR_IGNORECASE(200) NULL,
	PRIMARY KEY("id"));
INSERT INTO "mendixsystem$entity" ("id", 
"entity_name", 
"table_name")
 VALUES ('ab4a017a-6ab1-4308-808a-67dee9664cc1', 
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
 VALUES ('f93316ee-d945-49ca-aefa-05193a4ae970', 
'ab4a017a-6ab1-4308-808a-67dee9664cc1', 
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
 VALUES ('60a35c00-80ce-4024-98ef-cd936eea189d', 
'ab4a017a-6ab1-4308-808a-67dee9664cc1', 
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
 VALUES ('6bfae890-d651-417a-8e05-4af8fdc9618d', 
'ab4a017a-6ab1-4308-808a-67dee9664cc1', 
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
 VALUES ('fced9f3f-f1cf-4d55-97c7-285bd449be2f', 
'Main.Tgt_FileDocument', 
'main$tgt_filedocument', 
'ab4a017a-6ab1-4308-808a-67dee9664cc1', 
'f72d1849-b1f7-4d8f-8219-0a46d8c51525', 
'main$tgtid', 
'main$filedocumentid', 
'idx_main$tgt_filedocument_main$filedocument_main$tgt');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_main$tgt_filedocument_main$tgtid', 
'fced9f3f-f1cf-4d55-97c7-285bd449be2f', 
'1ac5cac4-e7a2-382b-ada0-b219d9f45dca');
UPDATE "mendixsystem$version"
 SET "versionnumber" = '4.2', 
"lastsyncdate" = '20191204 01:34:48';
