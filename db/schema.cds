using { cuid } from '@sap/cds/common';
namespace inventory;

entity Materials : cuid {
  name        : String(100);
  description : String(255);
  unit        : String(10);
   stock       : Association to Stock; 
  // A material can have many stock entries.
  // This association is implicit if Stock associates to Material.
  // Next: implement explicit association later
  // For simplicity: just associating from Stock is often sufficient for basic CRUD.
}

entity Stock : cuid {
  material    : Association to Materials; // A Stock entry belongs to one Material
  quantity    : Integer;
  updatedAt   : Timestamp @cds.on.update; // Automatically update timestamp on modification
}

/*
(Note: material_ID refers to the ID of the Material entity. 
Next: ensure these IDs exist in your Materials data or are generated in a way that allows linking. 
For cuid based associations in CSV, the actual UUIDs from the Materials entries would be used. 
For this smol project: I added a few entries that manually link for demonstration.
*/