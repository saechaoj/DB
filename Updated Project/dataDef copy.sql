DROP TABLE IF EXISTS Stores;
DROP TABLE IF EXISTS Tires;
DROP TABLE IF EXISTS Stems;
DROP TABLE IF EXISTS Rims;
DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Ship;


CREATE TABLE Stores (
    store_id INT AUTO_INCREMENT,
    inventory_id INT NOT NULL,
    street VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    zip INT(11) NOT NULL,
    PRIMARY KEY (store_id)
    -- FOREIGN KEY (inventory_id) REFERENCES Inventory(inventory_id),
    -- FOREIGN KEY (order_id) REFERENCES Order(order_id)
);

CREATE TABLE Tires (
    tire_id INT AUTO_INCREMENT,
    tire_size INT(25) NOT NULL,
    tire_type VARCHAR(255) NOT NULL,
    tire_info VARCHAR(255) NOT NULL,
    PRIMARY KEY (tire_id)
);

CREATE TABLE Stems (
    stem_id INT AUTO_INCREMENT,
    stem_type VARCHAR(255) NOT NULL,
    stem_size INT(11) NOT NULL,
    PRIMARY KEY (stem_id)
);

CREATE TABLE Rims (
    rim_id INT AUTO_INCREMENT,
    stem_id INT,
    rim_size INT NOT NULL,
    rim_type VARCHAR(255) NOT NULL,
    PRIMARY KEY (rim_id)
   --  FOREIGN KEY (stem_id),
   -- REFERENCES 'Stems' (stem_id)
);

CREATE TABLE Inventory (
     inventory_id INT AUTO_INCREMENT,
     tire_size INT(11) NOT NULL,
     tire_count INT(11) NOT NULL,
     rim_type VARCHAR(255) NOT NULL,
     rim_count INT(11) NOT NULL,
     PRIMARY KEY (inventory_id)
     -- FOREIGN KEY (tire_id) REFERENCES Tires(tire_id),
     -- FOREIGN KEY (rim_id) REFERENCES Rims(rim_id)
);

CREATE TABLE Orders (
     order_id INT AUTO_INCREMENT,
     store_id INT,
     item_number INT(11) NOT NULL,
     item_count INT(11) NOT NULL,
     PRIMARY KEY (order_id)
);

CREATE TABLE Ship (
     ship_id INT AUTO_INCREMENT,
     -- order_id INT,
     ship_date DATE,
     arrival_date DATE,
     PRIMARY KEY (ship_id)
);
-- inserts
INSERT INTO Stores (inventory_id, street, state, zip)
VALUES (1,"Albeta Park","OR", 97030),
(2,"Bomton","CA", 92240),
(3,"Cowbow","TX", 98840);

INSERT INTO Tires (tire_size, tire_type, tire_info)
VALUES (2254518, "Speed", "6 Month Warrenty"),
(2857517, "Offroad", "1 Year Warrenty"),
(2155516, "All Purpose", "2 Month Warrenty");

INSERT INTO Stems (stem_type, stem_size)
VALUES ("VS70", "Long"),
("Rubber", "Long"),
("Rubber", "Short"),
("VS2000", "Short");



INSERT INTO Rims(stem_id, rim_size, rim_type)
VALUES (3, 16,"Steel"),
(2,17,"Aluminum"),
(1, 18,"Aluminum");


INSERT INTO Inventory (tire_size, tire_count, rim_type, rim_count)
VALUES (1,50, 3, 20),
(2,50,2,20),
(3,100,1,40);
