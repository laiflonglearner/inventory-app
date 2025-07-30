using InventoryService as service from '../../srv/inventory-service';

annotate service.Materials with @(
    UI.LineItem: [                                          // Defines columns for the list view (table) in Fiori List Report
        { Value: ID, Label: 'ID' },                         // Displays ID field with label "ID" in table
        { Value: name, Label: 'Material Name' },
        { Value: description, Label: 'Description' },
        { Value: unit, Label: 'Unit' },
        { Value: stock.quantity, Label: 'Current Stock' }
    ],
    UI.HeaderInfo: {                     // Configures header for Object Page (detail view)
        TypeName: 'Material',            // Singular name for a single record
        TypeNamePlural: 'Materials',     // Plural name for multiple records
        Title: { Value: name }           // Uses name field as title for a record in Object Page
    },
    UI.SelectionFields: [
        name,
        stock.quantity
    ]
);