// srv/inventory-service.cds

using { inventory as db } from '../db/schema'; // Import data model

// 'service' keyword defines an OData service.
// 'InventoryService' is the name of our service.
// '@(path: '/inventory')' is an annotation that defines the base URL path
// where this service will be exposed. So, it will be accessible at
// http://localhost:4004/inventory/ (or whatever the host/port is, this is the default one!).
service InventoryService @(path: '/inventory') {

    /* 
        This line exposes the 'Materials' entity from our data model (db.Materials) through this service.
        'as projection on' means we are creating a view/projection of the underlying database entity. 
        By default, it exposes all fields.
        This allows clients to perform CRUD (Create, Read, Update, Delete) operations on the Materials data via OData requests.
        In short: this line exposes Material entity
    */
    entity Materials as projection on db.Materials; 
    // Same, this line exposes Stock entity from our data model (db.Stock)
    // through this service, making it accessible via OData.

    annotate db.Materials with @(       // Adds metadata to db.Materials for SAP Fiori UI customization
        UI.LineItem: [                  // Defines columns for the list view (table) in Fiori List Report
        { Value: ID, Label: 'ID' },     // Displays ID field with label "ID" in table
        { Value: name, Label: 'Name' },
        { Value: unit, Label: 'Unit' }
        ],
        UI.HeaderInfo: {                // Configures header for Object Page (detail view)
        TypeName: 'Material',           // Singular name for a single record
        TypeNamePlural: 'Materials',    // Plural name for multiple records
        Title: { Value: name }          // Uses name field as title for a record in Object Page
        }
    );

    entity Stock as projection on db.Stock;

    // Action for updating stock
    /* The returns String part is important. 
       If the action is defined without a return type 
       (e.g., action updateStock(materialId: String, quantityChange: Integer);), 
       the CAP runtime treats it as a void action, result >> 204 No Content response.
    */
    action updateStock(materialId: UUID, quantityChange: Integer) returns String;

}