#Oh no the game was not popular in the EU!! :(
ALTER TABLE SERVERS DROP COLUMN Region;

#players wanted to be able to show off how long they have played our game!
ALTER TABLE PLAYERS ADD
	accntCreated	TIMESTAMP	NOT NULL DEFAULT CURRENT_TIMESTAMP;

#Fix it so that Player Aliases are unique
ALTER TABLE PLAYERS ADD CONSTRAINT UniqueAlias UNIQUE(Alias); 

#Drop NumberInStack from ITEMS and Put it into the INT table
ALTER TABLE ITEMS DROP COLUMN NumberInStack;
ALTER TABLE CHARACTERS_ITEMS_INT ADD NumberInStack TINYINT UNSIGNED NOT NULL DEFAULT 1;
