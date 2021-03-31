SELECT * FROM inventory.categories;

BEGIN TRANSACTION

INSERT INTO inventory.categories
    VALUES('4', 'Olive Kan', 'Oliver Twist');

INSERT INTO inventory.categories
    VALUES('5', 'Peter Pan', 'Charlie Chaplin');

COMMIT TRANSACTION

ROLLBACK TRANSACTION