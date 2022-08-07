-- create database:
CREATE DATABASE	 wm75;

-- select database 'wm75' to be able to manipulate it:
USE wm75;

-- create all the 9 tables needed:
CREATE TABLE project (
	ProjectId CHAR(38) NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    ExpectedStartDate DATETIME,
    ExpectedEndDate DATETIME,
    ActualStartDate DATETIME,
    ActualEndDate NCHAR(10),
    Completed BIT,
    CustomerId INT NOT NULL,
    AdministratorId INT NOT NULL,
    PRIMARY KEY(ProjectId),
    FOREIGN KEY(CustomerId) REFERENCES customer(CustomerId),
    FOREIGN KEY(AdministratorId) REFERENCES person(UserId)
);
CREATE TABLE task (
	TaskId CHAR(38) NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    ExpectedDateStarted DATETIME NOT NULL,
    ExpectedDateCompleted DATETIME NOT NULL,
    ActualDateStarted DATETIME,
    ActualDateCompleted DATETIME,
    ProjectId CHAR(38) NOT NULL,
    TeamId INT NOT NULL,
    StatusId INT NOT NULL,
    PercentCompleted TINYINT,
    PRIMARY KEY(TaskId),
    FOREIGN KEY(ProjectId) REFERENCES project(ProjectId),
    FOREIGN KEY(TeamId) REFERENCES team(TeamId),
    FOREIGN KEY(StatusId) REFERENCES status(StatusId)
);
CREATE TABLE subtask(
	SubtaskId INT AUTO_INCREMENT NOT NULL,
    Name NVARCHAR(50),
    StatusId INT NOT NULL,
    PercentCompleted TINYINT,
    TaskId CHAR(38) NOT NULL, 
    TeamMemberId INT,
    PRIMARY KEY(SubtaskId),
    FOREIGN KEY(TaskId) REFERENCES task(TaskId),
    FOREIGN KEY(StatusId) REFERENCES status(StatusId),
    FOREIGN KEY(TeamMemberId) REFERENCES person(UserId)
);
CREATE TABLE status(
	StatusId INT AUTO_INCREMENT NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    PRIMARY KEY(StatusId)
);
CREATE TABLE predecessor(
	TaskId CHAR(38) NOT NULL,
    PredecessorId CHAR(38) NOT NULL,
    PRIMARY KEY(TaskId, PredecessorId),
    FOREIGN KEY(TaskId) REFERENCES task(TaskId),
    FOREIGN KEY(PredecessorId) REFERENCES task(TaskId)
);
CREATE TABLE customer(
	CustomerId INT AUTO_INCREMENT NOT NULL,
    Name NVARCHAR(50),
    Username NVARCHAR(50),
    Password NVARCHAR(50),
    Email NVARCHAR(50),
    TelephoneNo NVARCHAR(50),
    Company NVARCHAR(50),
    Address NVARCHAR(200),
    Country NVARCHAR(50),
    PRIMARY KEY(CustomerId)
);
CREATE TABLE team(
	TeamId INT AUTO_INCREMENT NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    Location NVARCHAR(50) NOT NULL,
    TeamLeaderId INT,
    IsExternal BIT,
    PRIMARY KEY(TeamId),
    FOREIGN KEY(TeamLeaderId) REFERENCES person(UserId)
);
CREATE TABLE person(
	UserId INT AUTO_INCREMENT NOT NULL,
    Name NVARCHAR(50) NOT NULL,
    Username NVARCHAR(50) NOT NULL,
    Password NVARCHAR(50) NOT NULL,
    Email NVARCHAR(50),
    TelephoneNo NVARCHAR(50),
    IsAdministrator BIT,
    PRIMARY KEY(UserId)
);
CREATE TABLE team_member(
	UserId INT NOT NULL,
    TeamId INT NOT NULL,
    PRIMARY KEY(UserId, TeamId),
    FOREIGN KEY(UserId) REFERENCES person(UserId),
    FOREIGN KEY(TeamId) REFERENCES team(TeamId)
);

-- insert data into the project table:
-- insert data into the task table:
-- insert data into the subtask table:
-- insert data into the status table:
INSERT INTO status(name)
VALUES('Ready to Start'), ('In Progress'), ('Completed'), ('Waiting for predecessor');

-- insert data into the predecessor table:
-- insert data into the customer table:
-- insert data into the team table:
-- insert data into the person table:
-- insert data into the team_member table:

-- testing to display the contents of a table:
SELECT * FROM status;