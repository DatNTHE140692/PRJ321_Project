CREATE DATABASE Furniture
GO
USE Furniture
GO
CREATE TABLE Contact 
(
	id INT PRIMARY KEY IDENTITY(1,1),
	fullName VARCHAR(150) NOT NULL,
	email VARCHAR(150) NOT NULL,
	[subject] VARCHAR(150) NOT NULL,
	[message] VARCHAR(max) NOT NULL
)

CREATE TABLE Account 
(
	id INT IDENTITY(1,1),
	username VARCHAR(150) NOT NULL,
	[password] VARCHAR(150) NOT NULL,
	fullname VARCHAR(150) NOT NULL,
	email VARCHAR(150) NOT NULL,
	address VARCHAR(150) NOT NULL,
	phonenumber VARCHAR(150) NOT NULL,
	PRIMARY KEY(id, username, email, phonenumber)
)
INSERT INTO dbo.Contact(fullName, email, subject, message) VALUES(?,?,?,?)
SELECT * FROM dbo.Contact
DROP TABLE dbo.Account
INSERT INTO dbo.Account (username, password, fullname, email, address, phonenumber) VALUES (?, ?, ?, ?, ?, ?)
SELECT * FROM dbo.Account WHERE username LIKE '1' OR email LIKE 'admin@admin.test' OR phonenumber LIKE ''
SELECT * FROM dbo.Account WHERE username LIKE 'admin' AND password LIKE 'admin'