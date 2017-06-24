DROP TABLE IF EXISTS ITEMS;

CREATE TABLE ITEMS(
	ItemID		INT			NOT NULL AUTO_INCREMENT,
	NumberInStack	TINYINT UNSIGNED	NOT NULL,
	Name		CHAR(20)		NOT NULL,
	OnLootTable	BOOL			NOT NULL DEFAULT TRUE,
	CONSTRAINT	ItemPK	PRIMARY KEY(ItemID)
);
