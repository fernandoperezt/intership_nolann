DELETE FROM Follows;
DELETE FROM Joins;
DELETE FROM Workshop;
DELETE FROM Team;
DELETE FROM TheUser;

INSERT INTO TheUser (EMAIL, XNUMBER, FIRSTNAME, LASTNAME, ISADMIN) values ('x00000001@mytudublin.ie','x00000001','student','one',0);
INSERT INTO TheUser (EMAIL, XNUMBER, FIRSTNAME, LASTNAME, ISADMIN) values ('x00000002@mytudublin.ie','x00000002','student','two',0);
INSERT INTO TheUser (EMAIL, XNUMBER, FIRSTNAME, LASTNAME, ISADMIN) values ('x00000003@mytudublin.ie','x00000003','student','three',0);
INSERT INTO TheUser (EMAIL, XNUMBER, FIRSTNAME, LASTNAME, ISADMIN) values ('x00000051@mytudublin.ie','x00000051','lecturer','one',1);
INSERT INTO TheUser (EMAIL, XNUMBER, FIRSTNAME, LASTNAME, ISADMIN) values ('x00000052@mytudublin.ie','x00000052','lecturer','two',1);

INSERT INTO Team(TEAMID, NAME, YEAR, SEMESTER) values (1, 'ML team', 2023, 1);
INSERT INTO Team(TEAMID, NAME, YEAR, SEMESTER) values (2, 'CLCO team', 2023, 2);
INSERT INTO Team(TEAMID, NAME, YEAR, SEMESTER) values (3, 'fresh team', 2023, 1);
INSERT INTO Team(TEAMID, NAME, YEAR, SEMESTER) values (4, 'user team', 2023, 2);
INSERT INTO Team(TEAMID, NAME, YEAR, SEMESTER) values (5, 'workshop team', 2023, 2);

INSERT INTO Workshop(WORKSHOPID, TYPE, TYPENAME) values (1,'machine learning', 'basics in ML');
INSERT INTO Workshop(WORKSHOPID, TYPE, TYPENAME) values (2,'machine learning', 'advanced ML');
INSERT INTO Workshop(WORKSHOPID, TYPE, TYPENAME) values (3,'cloud computing', 'AWS Basics');
INSERT INTO Workshop(WORKSHOPID, TYPE, TYPENAME) values (4,'cloud computing', 'Cloud Comp Principles');
INSERT INTO Workshop(WORKSHOPID, TYPE, TYPENAME) values (5,'others', 'DB Admin analysis');

INSERT INTO Joins(USEREMAIL, THETEAM) values ('x00000051@mytudublin.ie',1);
INSERT INTO Joins(USEREMAIL, THETEAM) values ('x00000001@mytudublin.ie',1);
INSERT INTO Joins(USEREMAIL, THETEAM) values ('x00000002@mytudublin.ie',1);
INSERT INTO Joins(USEREMAIL, THETEAM) values ('x00000052@mytudublin.ie',2);
INSERT INTO Joins(USEREMAIL, THETEAM) values ('x00000001@mytudublin.ie',2);
INSERT INTO Joins(USEREMAIL, THETEAM) values ('x00000002@mytudublin.ie',2);
INSERT INTO Joins(USEREMAIL, THETEAM) values ('x00000003@mytudublin.ie',2);
INSERT INTO Joins(USEREMAIL, THETEAM) values ('x00000051@mytudublin.ie',4);

INSERT INTO Follows(THETEAM, THEWORKSHOP) values (1,1);
INSERT INTO Follows(THETEAM, THEWORKSHOP) values (1,2);
INSERT INTO Follows(THETEAM, THEWORKSHOP) values (1,5);
INSERT INTO Follows(THETEAM, THEWORKSHOP) values (2,3);
INSERT INTO Follows(THETEAM, THEWORKSHOP) values (2,4);
INSERT INTO Follows(THETEAM, THEWORKSHOP) values (2,5);
INSERT INTO Follows(THETEAM, THEWORKSHOP) values (5,1);

SELECT * FROM TheUser;
SELECT * FROM Team;
SELECT * FROM Workshop;

SELECT * FROM Joins;
SELECT * FROM Follows;

CREATE OR REPLACE VIEW view_TeamNoUser
    (
    TeamNoUser
    )
AS
    SELECT teamID
    FROM Team
    
    EXCEPT
    
    SELECT theTeam
    FROM Joins, Team
    WHERE Joins.theTeam = Team.teamID;
;

CREATE OR REPLACE VIEW view_TeamNoWorkshop
    (
    TeamNoWorkshop
    )
AS
    SELECT teamID
    FROM Team
    
    EXCEPT
    
    SELECT theTeam
    FROM Follows, Team
    WHERE Follows.theTeam = Team.teamID;
;

SELECT *
FROM view_TeamNoUser;

SELECT *
FROM view_TeamNoWorkshop;
