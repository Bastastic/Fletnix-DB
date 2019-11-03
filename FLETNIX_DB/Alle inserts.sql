use master
use fletnix

delete Watch_History
delete award_rewards
delete awards
delete code
delete Movie
delete Movie_Directors
delete Movie_Cast
delete Person
delete Movie_Genre
delete Genre 
delete Payment
delete Contract
delete Country
delete Customer

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

insert into Movie
select cast(Id AS int) AS movie_id,
       LEFT(Name,255) AS title,
	   NULL AS duration,
	   NULL AS cover_image,
	   cast(Year AS int) AS publication_year,
	   NULL AS previous_part,
	   NULL AS decription,
	   99.99 AS price,
	   NULL AS URL
from MYIMDB.dbo.Imported_Movie

insert into Genre
select DISTINCT Genre as genre_name,
       NULL as description 
from MYIMDB.dbo.Imported_Genre


insert into Movie_Genre
select DISTINCT cast(id AS int) AS movie_id,
				LEFT(Genre,50) AS genre_name
from MYIMDB.dbo.Imported_Genre

insert into Movie_Cast
select DISTINCT cast(Mid as int) as movie_id,
				cast(Pid as int) as person_id,
				LEFT(Role,255) as role
from MYIMDB.dbo.Imported_Cast

Insert into Movie_Directors
select cast(Mid as int) as movie_id,
       cast(Did + 1000000 as int) as person_id
from MYIMDB.dbo.Imported_Movie_Directors;

INSERT INTO Payment VALUES
('paypal'),
('ideal'),
('Bank'),
('WU')

INSERT INTO Contract VALUES
('Monthly', 10, 0),
('Half Year', 8.50, 15), 
('Yearly', 7, 30)


INSERT INTO Country VALUES
('Netherlands'),
('United Kingdom'),
('United States'),
('Belgium'),
('Germany'),
('China'),
('India'),
('New Zealand')

INSERT INTO Customer VALUES
 ('Bassie@gmail.com', 'en adriaan', 'bassie', 'paypal', 'Bassie@gmail.com', 'Monthly', '1-1-2014', null, 'BassieXD','BasisTheBest','Netherlands','M','1-1-2000'),
 ('dirk@Hotmail.com', 'de Jong', 'Dirk', 'Bank', '264620694', 'Monthly', '6-3-2013', null, 'Dirkie','Dirk123','China','M','8-12-1999'),
 ('reinharle@Live.com', 'Harle', 'Rein', 'ideal', 'NLING01294023', 'Monthly', '7-1-2017', null, 'HRein','ReinGeheim','India','M','12-10-2000'),
 ('wasly@Hotmail.nl', 'Wasmand', 'Wasley', 'wu', 'was123', 'Yearly', '6-12-2012', null, 'WasBeer','Wasnietnodig','Belgium','M','10-10-2012'),
 ('wutru@gmail.com', 'Hout', 'Wowwow', 'paypal', 'wutru@gmail.com', 'Yearly', '5-1-2016', null, 'Woetie','uWutMate','United Kingdom','M','12-2-2003'),
 ('stijn@gmail.com', 'Spoderman', 'Stijn', 'Bank', '5466566556', 'Half Year', '4-4-2012', null, 'Stinus','StateOfTheArtPass','Germany','M','8-6-1940');


 delete Watch_History
 insert into Watch_History values
 (150159, 'Bassie@gmail.com', '2016-02-08 00:00:00', 99.99,1),
 (150157, 'Bassie@gmail.com', '2016-02-08 10:00:01', 99.99,1),
 (150157, 'Bassie@gmail.com', '2016-02-08 11:00:02', 99.99,1),
 (150154, 'Bassie@gmail.com', '2016-02-08 12:00:03', 99.99,1),
 (150154, 'Bassie@gmail.com', '2016-02-08 20:00:04', 99.99,1),
 (150159, 'Dirk@hotmail.com', '2016-02-08 00:00:00', 99.99,1),
 (150157, 'Dirk@hotmail.com', '2016-02-09 00:00:01', 99.99,1),
 (150157, 'Dirk@hotmail.com', '2016-02-10 00:00:02', 99.99,1),
 (150154, 'Dirk@hotmail.com', '2016-02-11 00:00:03', 99.99,1),
 (150154, 'Dirk@hotmail.com', '2016-02-12 00:00:04', 99.99,1),
 (150159, 'reinharle@Live.com', '2016-02-08 00:00:00', 99.99,1),
 (150157, 'reinharle@Live.com', '2016-02-08 00:00:01', 99.99,1),
 (150157, 'reinharle@Live.com', '2016-02-09 00:00:02', 99.99,1),
 (150154, 'reinharle@Live.com', '2016-02-09 00:00:03', 99.99,1),
 (150154, 'reinharle@Live.com', '2016-02-09 00:00:04', 99.99,1)

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