use master
use fletnix

delete award_rewards
delete awards
delete code
delete Person

--- Zonder insert into Person kan het script niet meerdere malen gerund worden---
insert into Person
select cast(id AS int) AS person_id,
	   LEFT(Lname,50) AS lastname,
       LEFT(Fname,50) AS firstname,
	   LEFT(Gender,1) AS gender
from MYIMDB.dbo.Imported_Person

insert into Person
select cast(id + 1000000 AS int) AS person_id,
	   LEFT(Lname,50) AS lastname,
	   LEFT(Fname,50) AS firstname,
	   NULL AS gender
from MYIMDB.dbo.Imported_Directors

insert into code
values 
('W','Won'),
('N','Nominated')

insert into awards
values 
(1, 'Academy Awards', 'Best Film Editing', 2000,'Netherlands'),
(2, 'Academy Awards', 'Best Sound Effects Editing', 2000,'Netherlands'),
(3, 'Academy Awards', 'Best Visual Effects', 2000,'Netherlands'),
(4, 'BAFTA Awards', 'Best Sound', 2000, 'New Zealand'), 
(5, 'BAFTA Awards', 'Best Cinematography', 2000, 'New Zealand') ,
(6, 'BAFTA Awards', 'Best Production Design', 2000, 'New Zealand') ,
(7, 'BAFTA Awards', 'Best Editing', 2000, 'New Zealand') 



	
insert into Person values	(950001, 'Rubell', 'Paul', 'M'),(950002,'Hymms','Richard', 'M'),
							(950003, 'Davis','Dane','M'),(950004, 'Gaeta', 'John', 'M'),(950005, 'Courtley', 'Steve', 'M'),
							(950006, 'Thum', 'Jon', 'M'),(950007, 'Lee', 'David', 'M'),(950008, 'Reitz', 'John', 'M'),
							(950009, 'Rudloff','Gregg', 'M'),(950010, 'Campbell', 'David', 'M'), (950011, 'Davis', 'Dane', 'M'),
							(950012, 'Belfort', 'Tom', 'M'),(950013, 'Beemer', 'Bob', 'M'),(950014, 'Pope', 'Bill', 'M'),
							(950015, 'Hall', 'Conrad', 'M'),(950016, 'Anwar', 'Tariq', 'M')



insert into award_rewards
values

(1, 207992, 450813, 'W'),
(1, 160492, 176884, 'N'),
(1, 160492, 950001, 'N'),
(1, 160492, 1068042, 'N'),
(1, 303564, 1054796, 'N'),
(2, 112290, 251397, 'N'),
(2, 112290, 950002, 'N'),
(2, 207992, 950003, 'W'),
(2, 313474, 65453, 'N'),
(3, 313474, 251981, 'N'),
(3, 313474, 91712, 'N'),
(3, 207992, 950004, 'W'),
(3, 207992, 440853, 'W'),
(3, 207992, 950005, 'W'),
(3, 207992, 950006, 'W'),
(4, 207992, 950007, 'W'),
(4, 207992, 950008, 'W'),
(4, 207992, 950009, 'W'),
(4, 207992, 950010, 'W'),
(4, 207992, 950003, 'W'),
(4, 313474, 65453, 'N'),
(4, 313474, 950011, 'N'),
(4, 313474, 950012, 'N'),
(5, 207992, 950013, 'N'),
(5, 13798, 950014, 'W'),
(6, 207992, 364716, 'N'),
(6, 304862, 203143, 'W'),
(7, 207992, 450813, 'N'),
(7, 13789, 950015, 'W'),
(7, 13789, 183753, 'W')