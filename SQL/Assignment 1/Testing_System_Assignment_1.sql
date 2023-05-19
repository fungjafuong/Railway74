DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
DepartmentID             INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
DepartmentName           VARCHAR(50)
);

DROP TABLE IF EXISTS Position;
CREATE TABLE `Position` (
PositionID               INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
PositionName             ENUM('Dev', 'Test', 'Scrum_Master', 'PM')
);

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
AccountID                INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
Email                    VARCHAR(50) UNIQUE,
Username                 VARCHAR(50) UNIQUE,
Fullname                 VARCHAR(50),
DepartmentID             INT,
FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
PositionID               INT,
FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID),
CreateDate               DATE
);

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
GroupID                  INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
GroupName                VARCHAR(20),
CreatorID                INT,
CreateDate               DATE
);

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
GroupID                  INT ,
FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID),
AccountID                INT ,
FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID),
JoinDate                 DATE
);

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
TypeID                   INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
TypeName                 ENUM('Essay', 'Multiple_Choice')
);

DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion (
CategoryID               INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
CategoryName             VARCHAR(20)
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
QuestionID               INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
Content                  VARCHAR(250),
CategoryID               INT,
FOREIGN KEY (CategoryID ) REFERENCES CategoryQuestion(CategoryID),
TypeID                   INT,
FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
CreatorID                INT,
CreateDate               DATE
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer (
AnswerID                 INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
Content                  VARCHAR(250),
QuestionID               INT,
FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID),
isCorrect                BOOLEAN
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam (
ExamID                   INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
`Code`                   VARCHAR(10),
Title                    VARCHAR(100),
CategoryID               INT,
FOREIGN KEY (CategoryID ) REFERENCES CategoryQuestion(CategoryID),
Duration                 INT,
CreatorID                INT,
CreateDate               DATE
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion (
ExamID                   INT ,
FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
QuestionID               INT,
FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);

















