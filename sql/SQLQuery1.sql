DROP DATABASE Furniture
GO
CREATE DATABASE Furniture
GO
USE Furniture
GO
CREATE TABLE Users
(
	uid INT IDENTITY(1,1) PRIMARY KEY,
	username VARCHAR(150) NOT NULL UNIQUE,
	[password] VARCHAR(150) NOT NULL,
	fullname VARCHAR(150) NOT NULL,
	email VARCHAR(150) NOT NULL UNIQUE,
	address VARCHAR(150) NOT NULL,
	phonenumber VARCHAR(150) NOT NULL UNIQUE,
	avatarURL VARCHAR(MAX),
)

CREATE TABLE Categories
(
	cid INT IDENTITY(1, 1) PRIMARY KEY,
	cname VARCHAR(150) NOT NULL
)

CREATE TABLE Products
(
	pid INT IDENTITY(1, 1) PRIMARY KEY,
	pname VARCHAR(MAX) NOT NULL,
	price FLOAT NOT NULL,
	[pshortdesc] VARCHAR(MAX) NOT NULL,
	[pdesc] VARCHAR(MAX) NOT NULL,
	available BIT NOT NULL, 
)

CREATE TABLE Product_Categories
(
	pid INT FOREIGN KEY REFERENCES dbo.Products(pid),
	cid INT FOREIGN KEY REFERENCES dbo.Categories(cid),
	PRIMARY KEY(pid, cid)
)

CREATE TABLE Product_Images
(
	imgid INT PRIMARY KEY IDENTITY(1,1),
	pid INT FOREIGN KEY REFERENCES dbo.Products(pid),
	imageURL VARCHAR(MAX) NOT NULL,
)

CREATE TABLE Product_Comments 
(
	cmtid INT PRIMARY KEY IDENTITY(1,1),
	pid INT FOREIGN KEY REFERENCES dbo.Products(pid),
	uid INT FOREIGN KEY REFERENCES dbo.Users(uid),
	cdate DATETIME,
	comment VARCHAR(MAX) NOT NULL,
)

CREATE TABLE Contact 
(
	ctid INT IDENTITY(1,1) PRIMARY KEY,
	fullname VARCHAR(150) NOT NULL,
	email VARCHAR(150) NOT NULL,
	[subject] VARCHAR(150) NOT NULL,
	[message] VARCHAR(max) NOT NULL
)

SELECT p.pid, p.pname, p.price, p.pshortdesc, p.pdesc, p.available, ISNULL(c.cid, -1) cid, c.cname, ISNULL(pi.imgid, -1) imgid, pi.imageURL FROM dbo.Products p LEFT OUTER JOIN dbo.Product_Categories pc ON pc.pid = p.pid LEFT OUTER JOIN dbo.Categories c ON c.cid = pc.cid  LEFT OUTER JOIN dbo.Product_Images pi ON pi.pid = p.pid WHERE p.pid = ?

SELECT ROW_NUMBER() OVER(ORDER BY pc.cmtid), pc.cmtid, pc.cdate, pc.comment, u.uid, u.fullname, u.avatarURL FROM dbo.Product_Comments pc INNER JOIN dbo.Users u ON u.uid = pc.uid WHERE pc.pid = ? ORDER BY pc.cdate DESC

INSERT INTO dbo.Product_Comments(pid, uid, cdate, comment) VALUES (?, ?, GETDATE(), ?)
SELECT * FROM dbo.Users

WITH r AS(SELECT ROW_NUMBER() OVER(ORDER BY pc.cdate DESC) AS rownum, pc.cmtid, pc.cdate, pc.comment, u.uid, u.fullname, u.avatarURL FROM dbo.Product_Comments pc INNER JOIN dbo.Users u ON u.uid = pc.uid WHERE pid = 3)SELECT * FROM r ORDER BY r.cdate DESC

SELECT COUNT(*) total FROM dbo.Product_Comments WHERE pid = 3