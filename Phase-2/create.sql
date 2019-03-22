CREATE DATABASE prakalpa_voting_portal;
\c prakalpa_voting_portal;
CREATE TABLE users(USN CHAR(20) PRIMARY KEY  NOT NULL, NAME CHAR(20) NOT NULL UNIQUE, EMAIL CHAR(100), ROLE CHAR(20));
CREATE TABLE registered_phones( PHONE_ID CHAR(20) PRIMARY KEY  NOT NULL, ISVERIFIED BOOLEAN, REGISTERED_AT TIMESTAMP);
CREATE TABLE attendance( ID INT PRIMARY KEY  NOT NULL,USN CHAR(20) NOT NULL references users(USN),PHONE_ID CHAR(20) references registered_phones(PHONE_ID),LAST_MODIFIEDAT TIMESTAMP);
CREATE TABLE teams( ID CHAR(20) PRIMARY KEY  NOT NULL, NAME CHAR(100) UNIQUE, PHOTO_URL CHAR(50) UNIQUE,DESCRIPTION CHAR(300),CREATED_AT TIMESTAMP);
CREATE TABLE votes(ID CHAR(20) PRIMARY KEY NOT NULL, USN CHAR(20) NOT NULL references users(USN),TEAM_ID CHAR(20) NOT NULL references teams(ID));
CREATE TABLE nonce( UUID CHAR(100) PRIMARY KEY NOT NULL, COUNT INT,  TIME_LOG TIMESTAMP);
CREATE TABLE sessions( TOKEN CHAR(300) PRIMARY KEY NOT NULL, TIME_LOG TIMESTAMP, PAYLOAD CHAR(100), SIGNATURE CHAR(100),UUID CHAR(100) references nonce(UUID));








