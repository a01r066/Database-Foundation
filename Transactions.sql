SELECT * FROM inventory.categories;

-- Start a transaction block 
BEGIN TRANSACTION

INSERT INTO inventory.categories
VALUES (4, 'Gift Baskets', 'Holiday Favorites');

INSERT INTO inventory.categories
VALUES (5, 'Party Platters', 'Holiday Favorites');

SELECT * FROM inventory.categories;

-- Choose only one of the below lines to close transaction
-- Undo changes and revert to previous data table state
ROLLBACK TRANSACTION

-- Finalize the change to the data table
COMMIT TRANSACTION
