use master
drop database if exists fletnix

create database fletnix
go


use fletnix

create table Person (
   person_id	numeric           not null,
   lastname		varchar(50)          not null,
   firstname	varchar(50)           not null,
   gender		char(1)           null,
   constraint PK_PERSON primary key (person_id)
   )

create table Movie_Genre(
	movie_id	numeric not null,
	genre_name	varchar(255) not null,
	constraint PK_MOVIE_GENRE primary key (movie_id, genre_name)
	)

create table Genre(
	genre_name	varchar(255) not null,
	description varchar(255) null,
	constraint PK_GENRE primary key (genre_name)
	)

create table Movie_Directors(
	movie_id	numeric not null,
	person_id	numeric not null,
	constraint PK_MOVIE_DIRECTORS primary key (movie_id, person_id)
	)


create table Movie_Cast(
	movie_id	numeric not null,
	person_id	numeric not null,
	role		varchar(255) not null,
	constraint PK_MOVIE_CAST primary key (movie_id, person_id, role)
	)


create table Movie(
	movie_id			numeric not null,
	title				varchar(255) not null,
	duration			numeric null,
	decription			varchar(255) null,
	publication_year	numeric null,
	cover_image			varchar(255) null,
	previous_part		numeric null, 
	price				numeric(5,2) not null,
	URL					varchar(255) null,	
	constraint PK_MOVIE primary key (movie_id)
	)

create table Watch_History(
	movie_id				numeric not null,
	customer_mail_address	varchar(255) not null,
	watch_date				datetime not null,
	price					numeric(5,2) not null,
	invoiced				bit not null,
	constraint PK_WATCH_HISTORY primary key (movie_id, customer_mail_address, watch_date)
	)

create table Customer(
	customer_mail_address	varchar(255) not null,
	lastname				varchar(50) not null,
	firstname				varchar(50) not null,
	payment_method			varchar(10) not null,
	payment_card_number		varchar(30) not null,
	contract_type			varchar(10) not null,
	subscription_start		date not null,
	subscription_end		date  null,
	user_name				varchar(30) not null,
	password				varchar(50) not null,
	country_name			varchar(50) not null,
	gender					char(1) null,
	birth_date				date null,
	constraint PK_CUSTOMER primary key(customer_mail_address)
	)

create table Payment(
	payment_method varchar(10) not null,
	constraint PK_PAYMENT primary key(payment_method)
	)

create table Contract(
	contract_type			varchar(10) not null,
	price_per_month			numeric(5,2) not null,
	discount_percentage		numeric(2) not null,
	constraint PK_CONTRACT primary key(contract_type)
	)

create table Country(
	country_name varchar(50) not null,
	constraint PK_COUNTRY primary key(country_name)
	)
