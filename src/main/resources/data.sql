INSERT INTO category(id, name) VALUES (1, 'Food')
    ON DUPLICATE KEY UPDATE name = name;

INSERT INTO category(id, name) VALUES (2, 'Travel')
    ON DUPLICATE KEY UPDATE name = name;

INSERT INTO category(id, name) VALUES (3, 'Shopping')
    ON DUPLICATE KEY UPDATE name = name;

INSERT INTO category(id, name) VALUES (4, 'Bills')
    ON DUPLICATE KEY UPDATE name = name;
