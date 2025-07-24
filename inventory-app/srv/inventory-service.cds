// srv/inventory-service.cds

using { inventory as inv } from '../db/schema'; // Import data model

// 'service' keyword defines an OData service.
// 'InventoryService' is the name of our service.
// '@(path: '/inventory')' is an annotation that defines the base URL path
// where this service will be exposed. So, it will be accessible at
// http://localhost:4004/inventory/ (or whatever the host/port is, this is the default one!).
service InventoryService @(path: '/inventory') {

    /* 
        This line exposes the 'Materials' entity from our data model (inv.Materials) through this service.
        'as projection on' means we are creating a view/projection of the underlying database entity. 
        By default, it exposes all fields.
        This allows clients to perform CRUD (Create, Read, Update, Delete) operations on the Materials data via OData requests.
        In short: this line exposes Material entity
    */
    entity Materials as projection on inv.Materials; 

    // Same, this line exposes Stock entity from our data model (inv.Stock)
    // through this service, making it accessible via OData.
    entity Stock as projection on inv.Stock;
}