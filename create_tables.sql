CREATE TABLE ARTICLE (
ArticleID SERIAL PRIMARY KEY,
Date timestamp,
Author varchar(30),
text varchar(1000));

CREATE TABLE COMMENT (
CommentID SERIAL PRIMARY KEY,
numLikes int, 
SourceID int,
FOREIGN KEY (SourceID)
REFERENCES ARTICLE (ArticleID), 
text varchar(1000));

CREATE TABLE PERMISSIONS (
PermissionID varchar(8) UNIQUE,
CanComment boolean,
CanEdit boolean, 
CanPostArticle boolean);

CREATE TABLE USERS (
UserID SERIAL PRIMARY KEY,
UserName varchar(50) NOT NULL,
UserPass varchar(30) NOT NULL,
PermissionSet varchar(8),
FOREIGN KEY (PermissionSet)
REFERENCES PERMISSIONS(PermissionID),
Name varchar(50) NOT NULL);

CREATE TABLE TAG (
TagID SERIAL PRIMARY KEY,
Name varchar(20) NOT NULL,
Descr varchar(100) NOT NULL,
TotalViews int NOT NULL);

CREATE TABLE ARTICLETAGS (
ArticleID int NOT NULL, 
TagID int NOT NULL, 
FOREIGN KEY(ArticleID)
REFERENCES ARTICLE(ArticleID),
FOREIGN KEY(TagID)
REFERENCES TAG(TagID));

CREATE TABLE USERTAGS (
UserID int NOT NULL,
TagID int NOT NULL,
FOREIGN KEY (UserID)
REFERENCES USERS(UserID),
FOREIGN KEY(TagID)
REFERENCES TAG(TagID));
