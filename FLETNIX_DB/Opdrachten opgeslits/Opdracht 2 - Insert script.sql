use master
use fletnix

delete Movie
delete Movie_Directors
delete Movie_Cast
delete Person
delete Movie_Genre
delete Genre 

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