CREATE TABLE "demoshared$selecteduserdata" (
	"demoshared$diagramid" BIGINT NOT NULL,
	"demoshared$userdataid" BIGINT NOT NULL,
	PRIMARY KEY("demoshared$diagramid","demoshared$userdataid"),
	CONSTRAINT "uniq_demoshared$selecteduserdata_demoshared$userdataid" UNIQUE ("demoshared$userdataid"),
	CONSTRAINT "uniq_demoshared$selecteduserdata_demoshared$diagramid" UNIQUE ("demoshared$diagramid"));
CREATE INDEX "idx_demoshared$selecteduserdata_demoshared$userdata_demoshared$diagram" ON "demoshared$selecteduserdata" ("demoshared$userdataid" ASC,"demoshared$diagramid" ASC);
INSERT INTO "mendixsystem$association" ("id", 
"association_name", 
"table_name", 
"parent_entity_id", 
"child_entity_id", 
"parent_column_name", 
"child_column_name", 
"index_name")
 VALUES ('e9ab35e0-8960-4e4d-a44b-9bd16d28ac63', 
'DemoShared.SelectedUserData', 
'demoshared$selecteduserdata', 
'a12e4268-c8ed-4e51-ab6f-c1626e4c9026', 
'f5c8aaf6-dc1c-4dd7-bf9b-72e5a04419e5', 
'demoshared$diagramid', 
'demoshared$userdataid', 
'idx_demoshared$selecteduserdata_demoshared$userdata_demoshared$diagram');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demoshared$selecteduserdata_demoshared$userdataid', 
'e9ab35e0-8960-4e4d-a44b-9bd16d28ac63', 
'0dc37813-1a4b-3054-ba73-84578381ad09');
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_demoshared$selecteduserdata_demoshared$diagramid', 
'e9ab35e0-8960-4e4d-a44b-9bd16d28ac63', 
'7cef0748-7055-36f2-8ea7-1460ed8fd679');
UPDATE "mendixsystem$version"
 SET "versionnumber" = '4.2', 
"lastsyncdate" = '20191209 04:02:28';
