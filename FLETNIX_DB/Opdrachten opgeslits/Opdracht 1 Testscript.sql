use fletnix
delete Movie
delete Movie_Directors
delete Movie_Cast
delete Person
delete Movie_Genre
delete Genre 
delete Watch_History
delete Payment
delete Contract
delete Country
delete Customer

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