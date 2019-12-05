ALTER TABLE "main$tgt" ADD "fill" VARCHAR_IGNORECASE(200) NULL;
INSERT INTO "mendixsystem$attribute" ("id", 
"entity_id", 
"attribute_name", 
"column_name", 
"type", 
"length", 
"default_value", 
"is_auto_number")
 VALUES ('57e06f5d-221f-4147-8e2c-e0982f344fe6', 
'ab4a017a-6ab1-4308-808a-67dee9664cc1', 
'Fill', 
'fill', 
30, 
200, 
'', 
false);
UPDATE "mendixsystem$version"
 SET "versionnumber" = '4.2', 
"lastsyncdate" = '20191204 23:25:56';
