create database dreamhome;
use dreamhome;
create table Branch (bno char(5) not null, street varchar(35), area varchar(10), city varchar(10), pcode varchar(10), tel_no char(15), fax_no char(15));
create table Staff (sno char(5) not null, fname varchar(10), lname varchar(10), address varchar(35), tel_no char(10), position varchar(10), sex char(1), dob char(9), salary smallint, nin char(10), bno char(5));
create table Property_For_Rent (pno char(5) not null, street varchar(35), area varchar(10), city varchar(10), pcode varchar(10), type varchar(10), rooms smallint, rent int, ono char(5) not null, sno char(5) not null, bno char(5)); 
create table Renter (rno char(5) not null, fname varchar(10), lname varchar(10), address varchar(45), tel_no char(15), pref_type varchar(10), max_rent int);
create table Owner (ono char(5) not null, fname varchar(10), lname varchar(10), address varchar(50), tel_no char(15));
create table Viewing (rno char(5) not null, pno char(5) not null, date char(9), comment varchar(15));
show tables;
