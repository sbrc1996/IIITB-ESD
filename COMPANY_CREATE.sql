/*
    CREATE TABLE SCRIPTS FOR COMPANY DATABASE ALONG WITH PRIMARY KEYS.
    CREATED BY:- 
    NAME :          SUBHAM BASU ROY CHOWDHURY
    ROLL :          MT2022118
   
*/
CREATE DATABASE COMPANY;
USE COMPANY;

CREATE TABLE EMPLOYEE(
    FNAME VARCHAR(50),
    MINIT VARCHAR(1),
    LNAME VARCHAR(50),
    SSN   CHAR(10) NOT NULL,
    BDATE DATE,
    `ADDRESS` VARCHAR(100),
    SEX VARCHAR(1),
    SALARY INT,
    SUPER_SSN  CHAR(10),
    DNO INT,
    CONSTRAINT PK_EMPLOYEE PRIMARY KEY (SSN)
);


CREATE TABLE DEPARTMENT(
    DNAME VARCHAR(20),
    DNUMBER INT,
    MGR_SSN CHAR(10),
    MGR_START_DATE DATE,
    CONSTRAINT PK_DEPARTMENT PRIMARY KEY (DNUMBER)
);


CREATE TABLE DEPT_LOCATIONS(
    DNUMBER INT,
    DLOCATION VARCHAR(50),
    CONSTRAINT PK_DEPT_LOCATIONS PRIMARY KEY (DNUMBER,DLOCATION)
);

CREATE TABLE WORKS_ON(
    ESSN CHAR(10),
    PNO INT,
    `HOURS` DECIMAL(4,2),
    CONSTRAINT PK_WORKS_ON PRIMARY KEY (ESSN,PNO)
);

CREATE TABLE PROJECT(
    PNAME VARCHAR(50),
    PNUMBER INT,
    PLOCATIONS VARCHAR(50),
    DNUM INT,
    CONSTRAINT PK_PROJECT PRIMARY KEY (PNUMBER)
);  

CREATE TABLE `DEPENDENT`(
    ESSN CHAR(10),
    DEPENDENT_NAME VARCHAR(50),
    SEX VARCHAR(1),
    BDATE DATE,
    RELATIONSHIP VARCHAR(20),
    CONSTRAINT PK_DEPENDENT PRIMARY KEY (ESSN,DEPENDENT_NAME)
);
