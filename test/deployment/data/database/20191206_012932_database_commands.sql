ALTER TABLE "lopa$lopa_filedocument" ADD CONSTRAINT "uniq_lopa$lopa_filedocument_main$filedocumentid" UNIQUE ("main$filedocumentid");
INSERT INTO "mendixsystem$unique_constraint" ("name", 
"table_id", 
"column_id")
 VALUES ('uniq_lopa$lopa_filedocument_main$filedocumentid', 
'1c9ba935-4d9c-4e23-aac5-af1fe021ad1c', 
'1c5f6645-b25b-3415-b3be-686fd6dc83dc');
UPDATE "mendixsystem$version"
 SET "versionnumber" = '4.2', 
"lastsyncdate" = '20191206 01:29:15';
