ALTER TABLE "demoshared$assettemplate" RENAME TO "4f8e7338447d4827be4efe93c6768ff3";
ALTER TABLE "demoshared$lopatemplate" RENAME TO "f6aeebc638f64e77bdff2cd44a66b1a8";
ALTER TABLE "demoshared$planetemplate" RENAME TO "208524064b15435096d44cc74b7b7b29";
ALTER TABLE "demoshared$tasktemplate" RENAME TO "45b6118887894b3a9b453d2526991ba4";
DELETE FROM "mendixsystem$entity" 
 WHERE "id" = 'fcff17a3-9b34-4d6c-9e03-7e65c6824e30';
DELETE FROM "mendixsystem$entityidentifier" 
 WHERE "id" = 'fcff17a3-9b34-4d6c-9e03-7e65c6824e30';
DELETE FROM "mendixsystem$sequence" 
 WHERE "attribute_id" IN (SELECT "id"
 FROM "mendixsystem$attribute"
 WHERE "entity_id" = 'fcff17a3-9b34-4d6c-9e03-7e65c6824e30');
DELETE FROM "mendixsystem$attribute" 
 WHERE "entity_id" = 'fcff17a3-9b34-4d6c-9e03-7e65c6824e30';
DELETE FROM "mendixsystem$entity" 
 WHERE "id" = '1e30b02b-790e-4da3-a3e1-0f65524dfc23';
DELETE FROM "mendixsystem$entityidentifier" 
 WHERE "id" = '1e30b02b-790e-4da3-a3e1-0f65524dfc23';
DELETE FROM "mendixsystem$sequence" 
 WHERE "attribute_id" IN (SELECT "id"
 FROM "mendixsystem$attribute"
 WHERE "entity_id" = '1e30b02b-790e-4da3-a3e1-0f65524dfc23');
DELETE FROM "mendixsystem$attribute" 
 WHERE "entity_id" = '1e30b02b-790e-4da3-a3e1-0f65524dfc23';
DELETE FROM "mendixsystem$entity" 
 WHERE "id" = 'eaa67fba-c1f2-4789-852a-565d7f22bceb';
DELETE FROM "mendixsystem$entityidentifier" 
 WHERE "id" = 'eaa67fba-c1f2-4789-852a-565d7f22bceb';
DELETE FROM "mendixsystem$sequence" 
 WHERE "attribute_id" IN (SELECT "id"
 FROM "mendixsystem$attribute"
 WHERE "entity_id" = 'eaa67fba-c1f2-4789-852a-565d7f22bceb');
DELETE FROM "mendixsystem$attribute" 
 WHERE "entity_id" = 'eaa67fba-c1f2-4789-852a-565d7f22bceb';
DELETE FROM "mendixsystem$entity" 
 WHERE "id" = '36a44438-7a12-4520-bd04-47f205a24c6a';
DELETE FROM "mendixsystem$entityidentifier" 
 WHERE "id" = '36a44438-7a12-4520-bd04-47f205a24c6a';
DELETE FROM "mendixsystem$sequence" 
 WHERE "attribute_id" IN (SELECT "id"
 FROM "mendixsystem$attribute"
 WHERE "entity_id" = '36a44438-7a12-4520-bd04-47f205a24c6a');
DELETE FROM "mendixsystem$attribute" 
 WHERE "entity_id" = '36a44438-7a12-4520-bd04-47f205a24c6a';
DROP TABLE "4f8e7338447d4827be4efe93c6768ff3";
DROP TABLE "f6aeebc638f64e77bdff2cd44a66b1a8";
DROP TABLE "208524064b15435096d44cc74b7b7b29";
DROP TABLE "45b6118887894b3a9b453d2526991ba4";
UPDATE "mendixsystem$version"
 SET "versionnumber" = '4.2', 
"lastsyncdate" = '20191209 01:15:50';
