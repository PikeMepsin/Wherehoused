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
    `sAddress` NVARCHAR(160) NOT NULL,
    `numShelves` INT NOT NULL,
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

ALTER TABLE `Shelf` ADD CONSTRAINT `FK_WarehouseId`
    FOREIGN KEY (`whId`) REFERENCES `Warehouse` (`whId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_ShelfId` ON `Shelf` (`shId`);

CREATE INDEX `IFK_ItemId` ON `Item` (`iId`);

ALTER TABLE `shelfItems` ADD CONSTRAINT `FK_shelfItemsShelfId`
    FOREIGN KEY (`shId`) REFERENCES `Shelf` (`shId`) ON DELETE NO ACTION ON UPDATE NO ACTION;
    
ALTER TABLE `shelfItems` ADD CONSTRAINT `FK_shelfItemsItemId`
    FOREIGN KEY (`iId`) REFERENCES `Item` (`iId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_shelfItemsId` ON `shelfItems` (`shId`);


