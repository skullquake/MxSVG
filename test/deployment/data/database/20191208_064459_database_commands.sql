ALTER TABLE "demoshared$diagram_filedocument_shared" DROP CONSTRAINT "uniq_demoshared$diagram_filedocument_shared_svg$filedocumentid";
DELETE FROM "mendixsystem$unique_constraint" 
 WHERE "name" = 'uniq_demoshared$diagram_filedocument_shared_svg$filedocumentid';
UPDATE "mendixsystem$version"
 SET "versionnumber" = '4.2', 
"lastsyncdate" = '20191208 06:44:50';
