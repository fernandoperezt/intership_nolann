DROP TABLE IF EXISTS Follows;
DROP TABLE IF EXISTS Joins;
DROP TABLE IF EXISTS Workshop;
DROP TABLE IF EXISTS Team;
DROP TABLE IF EXISTS TheUser;

CREATE TABLE TheUser
    ( 
    email VARCHAR(40) PRIMARY KEY
    	CHECK(email LIKE '%_@%_.%_'),
 
    xNumber VARCHAR(9), 
 
    password VARCHAR(20), 
 
    firstName VARCHAR(20) NOT NULL,
 
    lastName VARCHAR(20) NOT NULL,
 
    isAdmin BOOLEAN NOT NULL
);

CREATE TABLE Team 
    ( 
    teamID INTEGER AUTO_INCREMENT PRIMARY KEY,
 
    name VARCHAR(20), 
 
    year INTEGER, 
 
    semester INTEGER 
    	CHECK(semester = 1 OR semester = 2) /* should lock the values to 1 & 2 */ 
);

CREATE TABLE Workshop  
    ( 
    workshopID INTEGER AUTO_INCREMENT PRIMARY KEY,
 
    type VARCHAR(50) 
    	CHECK (Type = 'machine learning' OR Type = 'cloud computing' OR Type = 'others'), 
 
    typeName VARCHAR(50) UNIQUE
);

CREATE TABLE Joins  
    ( 
    userEmail VARCHAR(40) 
    	REFERENCES TheUser(email), 
 
    theTeam INTEGER
    	REFERENCES Team(teamID), 
 
    CONSTRAINT pk_Joins PRIMARY KEY (userEmail, theTeam) 
);
 
CREATE TABLE Follows  
    ( 
    theTeam INTEGER
    	REFERENCES Team(teamID), 
 
    theWorkshop INTEGER
    	REFERENCES Workshop(workshopID), 
 
    CONSTRAINT pk_Follows PRIMARY KEY (theTeam, theWorkshop) 
);

