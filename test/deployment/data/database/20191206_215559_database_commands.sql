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
 VALUES ('c87ec799-224b-47a1-bc32-d288cb2a07cc', 
'SVG.SelectedTgt', 
'svg$selectedtgt', 
'e6acf2e3-ef4a-4211-a297-921a57e14f6d', 
'cffd491d-ef5d-4d89-96c5-59ad5cf9295c', 
'svg$filedocumentid', 
'svg$tgtid', 
'idx_svg$selectedtgt_svg$tgt_svg$filedocument');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_svg$selectedtgt_svg$tgtid', 
'c87ec799-224b-47a1-bc32-d288cb2a07cc', 
'b2b9812f-cbea-32cb-b8b1-44000c9d3bca');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_svg$selectedtgt_svg$filedocumentid', 
'c87ec799-224b-47a1-bc32-d288cb2a07cc', 
'4123a1ef-1f51-334d-b70d-93c866c23a4d');
UPDATE "mendixsystem$version"
 SET "versionnumber" = '4.2', 
"lastsyncdate" = '20191206 21:54:28';
