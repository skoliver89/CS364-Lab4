DROP TABLE IF EXISTS SERVERS;

CREATE TABLE SERVERS(
	ServerID	INT			NOT NULL AUTO_INCREMENT,
	Name		CHAR(20)		NOT NULL,
	Region		ENUM('US', 'EU')	NOT NULL,
	Type		ENUM('PvE', 'PvP')	NOT NULL,
	CONSTRAINT	ServerPK	PRIMARY KEY(ServerID)
);
