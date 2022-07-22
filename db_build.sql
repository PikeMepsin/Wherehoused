/*******************************************************************************
   Drop database if it exists
********************************************************************************/
DROP DATABASE IF EXISTS `Wherehoused`;


/*******************************************************************************
   Create database
********************************************************************************/
CREATE DATABASE `Wherehoused`;


USE `Wherehoused`;


/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE `Warehouse`
(
    `whID` INT NOT NULL AUTO_INCREMENT,
    `designation` NVARCHAR(160) NOT NULL,
    `sAddress` NVARCHAR(160) NOT NULL,
    CONSTRAINT `PK_Warehouse` PRIMARY KEY  (`whID`)
);

CREATE TABLE `Shelf`
(
	`shID` INT NOT NULL AUTO_INCREMENT,
    `whID` INT NOT NULL,
    `capacity` INT NOT NULL, 
    CHECK (capacity <= 1000),
    CHECK (capacity >= 0),
    CONSTRAINT PK_Shelf PRIMARY KEY(`shID`)
);

CREATE TABLE `Item`
(
	`iID` INT NOT NULL AUTO_INCREMENT,
    `name` NVARCHAR(160) NOT NULL,
    `size` INT NOT NULL,
    `quantity` INT NOT NULL,
    CHECK (size <= 1000),
    CHECK (size >= 0),
    CONSTRAINT PK_Item PRIMARY KEY(`iID`)
);

CREATE TABLE `shelfItems`
(
	`shID` INT NOT NULL,
    `iID` INT NOT NULL,
    CONSTRAINT PK_shItems PRIMARY KEY(`shID`, `iID`)
);

/*******************************************************************************
   Create Primary Key Unique Indexes
********************************************************************************/

/*******************************************************************************
   Create Foreign Keys
********************************************************************************/

CREATE INDEX `IFK_WarehouseId` ON `Warehouse` (`whId`);

ALTER TABLE `Warehouse` ADD CONSTRAINT `Designation_Unique`
	UNIQUE (`designation`);

ALTER TABLE `Shelf` ADD CONSTRAINT `FK_WarehouseId`
    FOREIGN KEY (`whID`) REFERENCES `Warehouse` (`whID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_ShelfId` ON `Shelf` (`shID`);

CREATE INDEX `IFK_ItemId` ON `Item` (`iID`);

ALTER TABLE `shelfItems` ADD CONSTRAINT `FK_shelfItemsShelfId`
    FOREIGN KEY (`shID`) REFERENCES `Shelf` (`shID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
    
ALTER TABLE `shelfItems` ADD CONSTRAINT `FK_shelfItemsItemId`
    FOREIGN KEY (`iID`) REFERENCES `Item` (`iID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_shelfItemsId` ON `shelfItems` (`shID`);

/*******************************************************************************
   Populate Tables
********************************************************************************/
INSERT INTO `Warehouse` (`designation`, `sAddress`) VALUES (N'Venus', '33 Jump St.'); #1
INSERT INTO `Warehouse` (`designation`, `sAddress`) VALUES (N'Jupiter', '1 Wolf of Wall St.'); #2
INSERT INTO `Warehouse` (`designation`, `sAddress`) VALUES (N'Saturn', '727 Interface Blvd.'); #3
INSERT INTO `Warehouse` (`designation`, `sAddress`) VALUES (N'Neptune', '8080 Localhost Dr.'); #4
INSERT INTO `Warehouse` (`designation`, `sAddress`) VALUES (N'Pluto', '111 Yongus Ln.'); #5

/** Warehouse Shelves **/
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (1, 600); #1
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (1, 400); #2
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (1, 550); #3
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (1, 900); #4

INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (2, 600); #5
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (2, 100); #6
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (2, 1000); #7
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (2, 1000); #8
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (2, 1000); #9
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (2, 1000); #10

INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (3, 0); #11
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (3, 0); #12
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (3, 0); #13
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (3, 0); #14

INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (4, 700); #15
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (4, 500); #16
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (4, 1000); #17
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (4, 1000); #18
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (4, 1000); #19

INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (5, 0); #20
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (5, 0); #21
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (5, 0); #22
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (5, 0); #23
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (5, 800); #24
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (5, 1000); #25
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (5, 1000); #26
INSERT INTO `Shelf` (`whID`, `capacity`) VALUES (5, 1000); #27

/** Create Items in storage (going by Shelf for logical simplicity) **/
INSERT INTO `Item` (`name`, `size`, `quantity`) VALUES (N'BMX Bike', 100, 4); #1
INSERT INTO `Item` (`name`, `size`, `quantity`) VALUES (N'32GB RAM (2x16)', 4, 150); #2
INSERT INTO `Item` (`name`, `size`, `quantity`) VALUES (N'Stainless Steel Stool', 50, 9); #3
INSERT INTO `Item` (`name`, `size`, `quantity`) VALUES (N'Meatball (1x)', 1, 100); #4

INSERT INTO `Item` (`name`, `size`, `quantity`) VALUES (N'Snow Tube (Inflated)', 100, 4); #5
INSERT INTO `Item` (`name`, `size`, `quantity`) VALUES (N'Butterfly Knife', 5, 100); #6
/** another BMX Bike 1 to this shelf in the shelfItems table **/

INSERT INTO `Item` (`name`, `size`, `quantity`) VALUES (N'Ford Focus', 1000, 1); #7
INSERT INTO `Item` (`name`, `size`, `quantity`) VALUES (N'Subaru Imprezza', 1000, 1); #8
INSERT INTO `Item` (`name`, `size`, `quantity`) VALUES (N'Mega Speakers', 100, 10); #9
INSERT INTO `Item` (`name`, `size`, `quantity`) VALUES (N'Micro Speakers', 10, 100); #10

INSERT INTO `Item` (`name`, `size`, `quantity`) VALUES (N'Nintendo Switch', 15, 20); #11
/** put the Butterfly Knife 6 instance on this shelf just as it is, associate in shelfItems **/

/** Warehouse 5, in shelfItems
Ford Focus 7
Ford Focus 7
Mega Speakers 9
Butterfly Knife 6 +**/ INSERT INTO `Item` (`name`, `size`, `quantity`) VALUES (N'Stainless Steel Stool', 50, 10); #12
INSERT INTO `Item` (`name`, `size`, `quantity`) VALUES (N'Mini Refrigerator', 25, 8); #13

/** Put Items on Shelves **/
# Warehouse 1
INSERT INTO `shelfitems` (`shID`, `iID`) VALUES (1, 1);
INSERT INTO `shelfitems` (`shID`, `iID`) VALUES (2, 2);
INSERT INTO `shelfitems` (`shID`, `iID`) VALUES (3, 3);
INSERT INTO `shelfitems` (`shID`, `iID`) VALUES (4, 4);
# Warehouse 2
INSERT INTO `shelfitems` (`shID`, `iID`) VALUES (5, 5);
INSERT INTO `shelfitems` (`shID`, `iID`) VALUES (6, 6);
INSERT INTO `shelfitems` (`shID`, `iID`) VALUES (6, 1);
# Warehouse 3
INSERT INTO `shelfitems` (`shID`, `iID`) VALUES (11, 7);
INSERT INTO `shelfitems` (`shID`, `iID`) VALUES (12, 8);
INSERT INTO `shelfitems` (`shID`, `iID`) VALUES (13, 9);
INSERT INTO `shelfitems` (`shID`, `iID`) VALUES (14, 10);
# Warehouse 4
INSERT INTO `shelfitems` (`shID`, `iID`) VALUES (15, 11);
INSERT INTO `shelfitems` (`shID`, `iID`) VALUES (16, 6);
# Warehouse 5
INSERT INTO `shelfitems` (`shID`, `iID`) VALUES (20, 7);
INSERT INTO `shelfitems` (`shID`, `iID`) VALUES (21, 7);
INSERT INTO `shelfitems` (`shID`, `iID`) VALUES (22, 9);
INSERT INTO `shelfitems` (`shID`, `iID`) VALUES (23, 6);
INSERT INTO `shelfitems` (`shID`, `iID`) VALUES (23, 12);
INSERT INTO `shelfitems` (`shID`, `iID`) VALUES (24, 13);
