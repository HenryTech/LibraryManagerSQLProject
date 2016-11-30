--Switch to Master dB
USE master
GO

--Run only if dbLibMan is already present
IF EXISTS (SELECT * FROM sys.databases WHERE [name] = 'dbLibMan')
DROP DATABASE dbLibMan
GO

--Create the dbLibMan database
CREATE DATABASE dbLibMan
GO

--Switch to dbLibMan
USE dbLibMan
GO

/* Create all tables */

--Create BOOK table
CREATE TABLE BOOK
	(
		BookID int PRIMARY KEY,
		Title varchar(200) NOT NULL,
		PublisherName varchar(50) NOT NULL
	)

--Create BOOK_AUTHORS table
CREATE TABLE BOOK_AUTHORS
	(
		BookID int PRIMARY KEY,
		AuthorName varchar(50) NOT NULL
	)

--Create PUBLISHER table
CREATE TABLE PUBLISHER
	(
		Name varchar(50) PRIMARY KEY,
		[Address] varchar(50),
		Phone varchar(20)
	)

--Create BOOK_COPIES table
CREATE TABLE BOOK_COPIES
	(
		BookID int NOT NULL,
		BranchID int NOT NULL,
		No_Of_Copies int NOT NULL
	)

--Create BOOK_LOANS table
CREATE TABLE BOOK_LOANS
	(
		BookID int NOT NULL,
		BranchID int NOT NULL,
		CardNo int NOT NULL,
		DateOut date NOT NULL,
		DueDate date NOT NULL
	)

--Create LIBRARY_BRANCH table
CREATE TABLE LIBRARY_BRANCH
	(
		BranchID int PRIMARY KEY,
		BranchName varchar(50) NOT NULL,
		[Address] varchar(50)
	)

--Create BORROWER table
CREATE TABLE BORROWER
	(
		CardNo int PRIMARY KEY,
		Name varchar(50) NOT NULL,
		[Address] varchar(80) NOT NULL,
		Phone varchar(20) NULL
	)

/* Populate all tables */

--Populate BOOK table
INSERT INTO BOOK (BookID, Title, PublisherName)
	VALUES
		(25947300,'The Lost Tribe','CreateSpace'),
		(10552338,'Reamde','William Morrow'),
		(315425,'In Defense of Food: An Eater''s Manifesto','Penguin Press'),
		(5301125,'Getting Started with Arduino','Maker Media,Inc'),
		(198781,'Ben & Jerry''s Homemade Ice Cream & Dessert Book','Workman Publishing Company'),
		(687619,'Practical Electronics for Inventors','McGraw-Hill Companies'),
		(7094922,'Talent Code','Playaway'),
		(1618,'The Curious Incident of the Dog in the Night-Time','Vintage'),
		(8088,'Sunshine','Jove'),
		(6493208,'The Immortal Life of Henrietta Lacks','Crown Publishing Group'),
		(29588,'Someone Comes to Town,Someone Leaves Town','Tor Books'),
		(954674,'Little Brother','Tor Teen'),
		(23965,'Porno','Anagrama'),
		(23955,'Trainspotting','Seuil'),
		(263466,'Dragon''s Egg','Del Rey Books'),
		(68498,'King Rat','Tor Books'),
		(6422238,'Makers','Tor Books'),
		(24800,'House of Leaves','Random House'),
		(84699,'Never Eat Alone: And Other Secrets to Success,One Relationship at a Time','Crown Business'),
		(1044355,'When You Are Engulfed in Flames','Little Brown and Company'),
		(77203,'The Kite Runner','Riverhead Books'),
		(6704793,'Programming Interactivity: A Designer''s Guide to Processing,Arduino,and Openframeworks','O''Reilly Media'),
		(43641,'Water for Elephants','Algonquin Books'),
		(29589,'Eastern Standard Tribe','Tor Books'),
		(3828382,'Tribes: We Need You to Lead Us','Portfolio'),
		(2213661,'The Graveyard Book','HarperCollins'),
		(1918305,'The Geography of Bliss: One Grump''s Search for the Happiest Places in the World','Twelve'),
		(2527900,'Nudge: Improving Decisions About Health,Wealth,and Happiness','Yale University Press'),
		(7155145,'Linchpin: Are You Indispensable?','Portfolio'),
		(33313,'Kitchen Confidential: Adventures in the Culinary Underbelly','Ecco/Harper Perennial'),
		(6599565,'A Study in Emerald','Harper Audio'),
		(995103,'The Gunslinger','Plume')

--Populate BOOK_AUTHORS table
INSERT INTO BOOK_AUTHORS (BookID, AuthorName)
	VALUES
		(10552338,'Neal Stephenson'),
		(315425,'Michael Pollan'),
		(5301125,'Massimo Banzi'),
		(198781,'Ben Cohen'),
		(687619,'Paul Scherz'),
		(7094922,'Daniel Coyle'),
		(1618,'Mark Haddon'),
		(8088,'Robin McKinley'),
		(6493208,'Rebecca Skloot'),
		(29588,'Cory Doctorow'),
		(954674,'Cory Doctorow'),
		(23965,'Irvine Welsh'),
		(23955,'Irvine Welsh'),
		(263466,'Robert L. Forward'),
		(68498,'China Miéville'),
		(6422238,'Cory Doctorow'),
		(24800,'Mark Z. Danielewski'),
		(84699,'Keith Ferrazzi'),
		(1044355,'David Sedaris'),
		(77203,'Khaled Hosseini'),
		(6704793,'Joshua Noble'),
		(43641,'Sara Gruen'),
		(29589,'Cory Doctorow'),
		(3828382,'Seth Godin'),
		(2213661,'Neil Gaiman'),
		(1918305,'Eric Weiner'),
		(2527900,'Richard H. Thaler'),
		(7155145,'Seth Godin'),
		(33313,'Anthony Bourdain'),
		(6599565,'Neil Gaiman'),
		(995103,'Stephen King')

--Populate PUBLISHER table
INSERT INTO PUBLISHER (Name, [Address], Phone)
	VALUES
		('William Morrow',NULL,NULL),
		('Penguin Press',NULL,NULL),
		('Maker Media,Inc',NULL,NULL),
		('Workman Publishing Company',NULL,NULL),
		('McGraw-Hill Companies',NULL,NULL),
		('Playaway',NULL,NULL),
		('Vintage',NULL,NULL),
		('Jove',NULL,NULL),
		('Crown Publishing Group',NULL,NULL),
		('Tor Books',NULL,NULL),
		('Tor Teen',NULL,NULL),
		('Anagrama',NULL,NULL),
		('Seuil',NULL,NULL),
		('Del Rey Books',NULL,NULL),
		('Random House',NULL,NULL),
		('Crown Business',NULL,NULL),
		('Little Brown and Company',NULL,NULL),
		('Riverhead Books',NULL,NULL),
		('O''Reilly Media',NULL,NULL),
		('Algonquin Books',NULL,NULL),
		('Portfolio',NULL,NULL),
		('HarperCollins',NULL,NULL),
		('Twelve',NULL,NULL),
		('Yale University Press',NULL,NULL),
		('Ecco/Harper Perennial',NULL,NULL),
		('Harper Audio',NULL,NULL),
		('Plume',NULL,NULL)

--Populate LIBRARY_BRANCH table
INSERT INTO LIBRARY_BRANCH (BranchID, BranchName, [Address])
	VALUES
		(1,'Central',NULL),
		(2,'Sharpstown',NULL),
		(3,'Henry Crossing',NULL),
		(4,'Henry Park',NULL)

--Populate BOOK_COPIES table
INSERT INTO BOOK_COPIES (BookID, BranchID, No_Of_Copies)
	VALUES
		(10552338,1,14),
		(5301125,1,8),
		(687619,1,22),
		(1618,1,13),
		(6493208,1,11),
		(954674,1,5),
		(23955,1,14),
		(68498,1,13),
		(24800,1,14),
		(1044355,1,6),
		(6704793,1,8),
		(29589,1,7),
		(315425,2,14),
		(198781,2,8),
		(7094922,2,5),
		(8088,2,4),
		(29588,2,5),
		(23965,2,7),
		(263466,2,15),
		(6422238,2,4),
		(84699,2,5),
		(77203,2,3),
		(43641,2,12),
		(995103,3,15),
		(33313,3,5),
		(2527900,3,4),
		(2213661,3,8),
		(29589,3,7),
		(6704793,3,22),
		(1044355,3,9),
		(24800,3,6),
		(68498,3,11),
		(23955,3,24),
		(6599565,4,18),
		(7155145,4,5),
		(1918305,4,4),
		(3828382,4,7),
		(43641,4,5),
		(77203,4,8),
		(84699,4,11),
		(6422238,4,15),
		(263466,4,5),
		(23965,4,8)

--Populate BORROWER table
INSERT INTO BORROWER (CardNo, Name, [Address], Phone)
	VALUES
		(1,'Kenneth Greene','515 S Washington Dr',NULL),
		(2,'Judy Fallon','368 Baker Ave',NULL),
		(3,'Mildred Terry','195 School Road',NULL),
		(4,'Christopher Faulkner','8812 6th Dr',NULL),
		(5,'Mike Flores','480 Wilson St',NULL),
		(6,'Kimberly Bembry','70 Country Club Dr',NULL),
		(7,'Roberta Rojas','11 Old York Dr',NULL),
		(8,'Filiberto Lewis','716 Lafayette Rd',NULL),
		(9,'Debra Holland','646 Edgemont Dr',NULL),
		(10,'Sandra Goble','8938 N Winchester St',NULL)

--Populate BOOK_LOANS table
INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DueDate)
	VALUES
		(263466,2,5,'2016-11-17','2016-12-01'),
		(6422238,2,5,'2016-11-17','2016-12-01'),
		(29588,2,5,'2016-11-17','2016-12-01'),
		(8088,2,5,'2016-11-17','2016-12-01'),
		(84699,2,5,'2016-11-17','2016-12-01'),
		(315425,2,5,'2016-11-17','2016-12-01'),
		(43641,4,9,'2016-11-26','2016-12-10'),
		(23965,4,9,'2016-11-26','2016-12-10'),
		(6422238,4,9,'2016-11-26','2016-12-10'),
		(6599565,4,9,'2016-11-26','2016-12-10'),
		(7155145,4,9,'2016-11-26','2016-12-10'),
		(3828382,4,9,'2016-11-26','2016-12-10'),
		(33313,3,1,'2016-11-26','2016-12-10'),
		(995103,3,1,'2016-11-26','2016-12-10'),
		(10552338,1,2,'2016-11-29','2016-12-13'),
		(5301125,1,2,'2016-11-29','2016-12-13'),
		(1618,1,2,'2016-11-29','2016-12-13'),
		(687619,1,2,'2016-11-29','2016-12-13'),
		(6599565,4,3,'2016-11-28','2016-12-12'),
		(23965,4,3,'2016-11-28','2016-12-12'),
		(23466,4,3,'2016-11-28','2016-12-12'),
		(642238,4,3,'2016-11-28','2016-12-12'),
		(84699,4,3,'2016-11-28','2016-12-12'),
		(77203,4,3,'2016-11-28','2016-12-12'),
		(29589,1,4,'2016-11-22','2016-12-06'),
		(10552338,1,4,'2016-11-22','2016-12-06'),
		(5301125,1,4,'2016-11-22','2016-12-06'),
		(687619,1,4,'2016-11-22','2016-12-06'),
		(1618,1,4,'2016-11-22','2016-12-06'),
		(33313,3,6,'2016-11-28','2016-12-12'),
		(23955,3,6,'2016-11-28','2016-12-12'),
		(68498,3,6,'2016-11-28','2016-12-12'),
		(24800,3,6,'2016-11-28','2016-12-12'),
		(1044355,3,6,'2016-11-28','2016-12-12'),
		(6704793,3,6,'2016-11-28','2016-12-12'),
		(315425,2,7,'2016-11-30','2016-12-14'),
		(198781,2,7,'2016-11-30','2016-12-14'),
		(7094922,2,7,'2016-11-30','2016-12-14'),
		(8088,2,7,'2016-11-30','2016-12-14'),
		(29588,2,7,'2016-11-30','2016-12-14'),
		(2213661,3,8,'2016-11-28','2016-12-12'),
		(2527900,3,8,'2016-11-28','2016-12-12'),
		(995103,3,8,'2016-11-28','2016-12-12'),
		(33313,3,8,'2016-11-28','2016-12-12'),
		(29589,3,8,'2016-11-28','2016-12-12'),
		(6599565,4,10,'2016-11-17','2016-12-01'),
		(7155145,4,10,'2016-11-17','2016-12-01'),
		(1918305,4,10,'2016-11-17','2016-12-01'),
		(3828382,4,10,'2016-11-17','2016-12-01'),
		(84699,4,10,'2016-11-17','2016-12-01')





