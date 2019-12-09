DROP INDEX "idx_demo$fleet_plane_demo$fleet_demo$vehicle";
DROP INDEX "idx_demoshared$fleet_plane_demoshared$fleet_demoshared$vehicle";
ALTER TABLE "demo$fleet_plane" RENAME TO "demo$fleet_vehicle";
ALTER TABLE "demoshared$fleet_plane" RENAME TO "demoshared$fleet_vehicle";
CREATE INDEX "idx_demo$fleet_vehicle_demo$fleet_demo$vehicle" ON "demo$fleet_vehicle" ("demo$fleetid" ASC,"demo$vehicleid" ASC);
UPDATE "mendixsystem$association"
 SET "association_name" = 'Demo.Fleet_Vehicle', 
"table_name" = 'demo$fleet_vehicle', 
"parent_entity_id" = 'd525fae7-d6f5-4a9d-8992-0f1f33ee8ab1', 
"child_entity_id" = '549c37b4-8fd8-4c59-8e16-d8bd183f22ff', 
"parent_column_name" = 'demo$vehicleid', 
"child_column_name" = 'demo$fleetid', 
"pk_index_name" = NULL, 
"index_name" = 'idx_demo$fleet_vehicle_demo$fleet_demo$vehicle'
 WHERE "id" = 'a2badb7e-10b9-4b2b-acfe-cf2a0ee33d04';
CREATE INDEX "idx_demoshared$fleet_vehicle_demoshared$fleet_demoshared$vehicle" ON "demoshared$fleet_vehicle" ("demoshared$fleetid" ASC,"demoshared$vehicleid" ASC);
UPDATE "mendixsystem$association"
 SET "association_name" = 'DemoShared.Fleet_Vehicle', 
"table_name" = 'demoshared$fleet_vehicle', 
"parent_entity_id" = 'b05e4a64-c767-45cb-80e6-788015ff6f9b', 
"child_entity_id" = '4cb093db-0b78-4954-bbf7-a429944483c3', 
"parent_column_name" = 'demoshared$vehicleid', 
"child_column_name" = 'demoshared$fleetid', 
"pk_index_name" = NULL, 
"index_name" = 'idx_demoshared$fleet_vehicle_demoshared$fleet_demoshared$vehicle'
 WHERE "id" = '7041ec7b-b5e3-4074-b56b-3951cd3cfd1a';
UPDATE "mendixsystem$version"
 SET "versionnumber" = '4.2', 
"lastsyncdate" = '20191209 02:17:48';
