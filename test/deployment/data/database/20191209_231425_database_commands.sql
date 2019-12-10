ALTER TABLE "demoshared$userdata" ADD "fill" VARCHAR_IGNORECASE(200) NULL;
UPDATE "demoshared$userdata"
 SET "fill" = '#00FF00';
INSERT INTO "mendixsystem$attribute" ("id", 
"entity_id", 
"attribute_name", 
"column_name", 
"type", 
"length", 
"default_value", 
"is_auto_number")
 VALUES ('6954db91-d4be-4ad4-9ee0-632a8e0d830b', 
'f5c8aaf6-dc1c-4dd7-bf9b-72e5a04419e5', 
'Fill', 
'fill', 
30, 
200, 
'#00FF00', 
false);
UPDATE "mendixsystem$version"
 SET "versionnumber" = '4.2', 
"lastsyncdate" = '20191209 23:13:46';
