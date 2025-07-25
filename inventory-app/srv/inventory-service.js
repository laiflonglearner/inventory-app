const cds = require("@sap/cds");

module.exports = cds.service.impl(async function () {
  this.on("updateStock", async (req) => {
    const { materialId, quantityChange } = req.data;
    const tx = cds.transaction(req);

    // Validate materialId
    if (!materialId) {
      return req.error(400, "materialId is required.");
    }

    // Convert quantityChange to integer if it's a string or number
    const parsedQuantity =
      typeof quantityChange === "string"
        ? parseInt(quantityChange, 10)
        : quantityChange;

    // Validate quantityChange
    if (isNaN(parsedQuantity) || !Number.isInteger(parsedQuantity)) {
      return req.error(400, "quantityChange must be an integer.");
    }

    try {
      const stockEntry = await tx.run(
        SELECT.one.from("inventory.Stock").where({ material_ID: materialId })
      );

      if (!stockEntry) {
        // Create new stock entry
        await tx.run(
          INSERT.into("inventory.Stock").entries({
            material_ID: materialId,
            quantity: parsedQuantity,
          })
        );
      } else {
        // Validate new quantity (prevent negative stock)
        const newQuantity = stockEntry.quantity + parsedQuantity;
        if (newQuantity < 0) {
          return req.error(400, "Stock quantity cannot be negative.");
        }

        // Update existing stock
        await tx.run(
          UPDATE("inventory.Stock")
            .set({ quantity: newQuantity })
            .where({ material_ID: materialId })
        );
      }

      return "Stock updated successfully!";
    } catch (error) {
      return req.error(500, `Failed to update stock: ${error.message}`);
    }
  });
});

// Next: add generic handlers for other entities if needed. For example:
// this.before('CREATE', 'Materials', async (req) => { /* ... */ });
// this.on('READ', 'Stock', async (req) => { /* ... */ });
