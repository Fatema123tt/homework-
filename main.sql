CREATE TABLE Branch  (
Branchnumber INT NOT NULL PRIMARY KEY ,
Name  varchar(20) NOT NULL,
Phone INT NOT NULL ,
Location varchar(20) NOT NULL );

CREATE TABLE ITEM_PUBLISHER  (
Item-number INT NOT NULL PRIMARY KEY ,
PUBLISHER_ID  INT NOT NULL,
DATE DATE NOT NULL ,
foreign key (Item-number) references ITEM(Item-number) on delete cascade );
);


CREATE TABLE Loan  (
Loan-number INT NOT NULL PRIMARY KEY ,
Data-loaned  INT NOT NULL,
Due-data DATE NOT NULL ,
Branchnumber INT NOT NULL,
CLASSIFICATION_ID INT ,
foreign key (Branchnumber) references Branch(Branchnumber) on delete cascade ,
foreign key ( CLASSIFICATION_ID) references CLASSIFICATION( ID) on delete cascade);
);


create table CLASSIFICATION(
ID int primary key,
NAME varchar(20) not null);


CREATE TABLE ITEM (
Item-number INT NOT NULL PRIMARY KEY,
Description VARCHAR(20) NOT NULL ,
ITEM_Type VARCHAR(20),
Publisher_ID INT,
Branchnumber INT NOT NULL,
CLASSIFICATION_ID INT ,
foreign key ( CLASSIFICATION_ID) references CLASSIFICATION( ID) on delete cascade,
foreign key (Branchnumber) references Branch(Branchnumber) on delete cascade
);

CREATE TABLE Privilege (
Privilegenumber INT NOT NULL PRIMARY KEY,
NAME VARCHAR(20) NOT NULL ,
Maxofitem VARCHAR(20),
Loan-time DATE,
Loan-number INT ,
foreign key (Loan-number) references Loan(Loan-number) on delete cascade
);

CREATE TABLE FINE (
FINE_number INT NOT NULL ,
Amount-of-fine INT NOT NULL ,
STATUS VARCHAR(30) ,
description VARCHAR(20),
Loan-number INT ,
foreign key (Loan-number) references Loan(Loan-number) on delete cascade);


CREATE TABLE MEMBER (
ID INT NOT NULL PRIMARY KEY,
F_NAME VARCHAR(20) NOT NULL ,
Email VARCHAR(20),
L_NAME VARCHAR(20),
M_TYPE VARCHAR(20) NOT NULL,
Dataofbirth date ,
Address INT,
Phone int ,
Branchnumber INT NOT NULL,
foreign key (Branchnumber) references Branch(Branchnumber) on delete cascade,
foreign key (Address) references Member_Address(Address_ID) on delete cascade
);

CREATE TABLE Member_Address (
Address_ID INT NOT NULL PRIMARY KEY,
City VARCHAR(20) NOT NULL ,
Building VARCHAR(20),
Street VARCHAR(20),
);

CREATE TABLE ROOM (
ROOM_NUMBER INT NOT NULL PRIMARY KEY ,
ROOM_TYPE VARCHAR(50) NOT NULL ,
Staytime VARCHAR (20) ,
STATUS VARCHAR(20) NOT NULL,
Branchnumber INT NOT NULL,
foreign key (Branchnumber) references Branch(Branchnumber) on delete cascade):

CREATE TABLE Staff (
SSN INT NOT NULL PRIMARY KEY,
F_NAME VARCHAR(20) NOT NULL ,
Gender VARCHAR(20),
L_NAME VARCHAR(20),
AGE INT,
Phone INT,
SALARY int ,
Branchnumber INT NOT NULL,
foreign key (Branchnumber) references Branch(Branchnumber) on delete cascade
);



CREATE TABLE BOOK (
ISBN INT NOT NULL PRIMARY KEY ,
NAME VARCHAR(50) NOT NULL,
STATE VARCHAR(20) NOT NULL ,
AUTHOR_ID  VARCHAR(50) NOT NULL,
PUBLISHER_ID  VARCHAR(50) NOT NULL,
Branchnumber INT NOT NULL,
CLASSIFICATION_ID INT ,
foreign key ( CLASSIFICATION_ID) references CLASSIFICATION( ID) on delete cascade,
foreign key (Branchnumber) references Branch(Branchnumber) on delete cascade,
foreign key (AUTHOR_ID) references BOOK_AUTHOR(AUTHOR_ID) on delete cascade,
foreign key (PUBLISHER_ID) references BOOK_PUBLISHER(PUBLISHER_ID) on delete cascade );


CREATE TABLE BOOK_AUTHOR  (
AUTHOR_ID INT NOT NULL PRIMARY KEY ,
A_NAME VARCHAR(20) NOT NULL );

CREATE TABLE BOOK_PUBLISHER   (
PUBLISHER_ID INT NOT NULL PRIMARY KEY ,
date_PUB DATE NOT NULL );




CREATE view vbookstatus as 
select ISBN,NAME,STATUS,PUBLISHER_ID,AUTHOR_ID
from BOOK

create user USER_ONE
IDENTIFIED by 12345
default tablespace users
temporary tablespace temp
QUOTA 500K on users;

grant connect to USER_ONE;
grant SELECT ON vbookstatus to USER_ONE;


