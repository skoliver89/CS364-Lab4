#Pre-emptive clean up statements
DROP TABLE IF EXISTS CHARACTERS_LOGS;
DROP TRIGGER IF EXISTS ins_character;
DROP TRIGGER IF EXISTS update_character;

#Create a log table
CREATE TABLE CHARACTERS_LOGS (
	LogID		INT					NOT NULL 
		AUTO_INCREMENT,
	PlayerID	INT					NOT NULL,
	CharacterID	INT 					NOT NULL,
	Name		CHAR(20)				NULL,
	Level		TINYINT UNSIGNED			NULL,
	Sex		ENUM('Male', 'Female')			NULL,
	Class		ENUM('Mage', 'Warrior', 'Priest')	NULL,
	modTime		DATETIME				NOT NULL,
	modType		CHAR(20)				NOT NULL,
	CONSTRAINT	characterLogPK	PRIMARY KEY(LogID)
);

DELIMITER $$
##INSERT TRIGGER - No need to log all the data, it is in the real table!
CREATE TRIGGER ins_character AFTER INSERT ON CHARACTERS
FOR EACH ROW
INSERT INTO CHARACTERS_LOGS
SET	CharacterID = NEW.CharacterID,
	PlayerID = NEW.PlayerID,
	modTime = NOW(),
	modType = 'NEW';

##UPDATE TRIGGER - log the old data before update
CREATE TRIGGER update_character BEFORE UPDATE ON CHARACTERS
FOR EACH ROW
INSERT INTO CHARACTERS_LOGS
SET	CharacterID = OLD.CharacterID,
	PlayerID = OLD.PlayerID,
	Name = OLD.Name,
	Level = OLD.Level,
	Sex = OLD.Sex,
	Class = OLD.Class,
	modTime = NOW(),
	modType = 'UPDATE';
$$
DELIMITER ;
