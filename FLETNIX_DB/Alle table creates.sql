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

create table code (

code char NOT NULL,
won_or_nominated varchar(255) NOT NULL
)

create table awards (

award_id int NOT NULL,
award_name varchar(255) NOT NULL,
catogorie varchar(255) NOT NULL,
[year] int NOT NULL,
place varchar(50) NOT NULL
)

create table award_rewards (

award_id int NOT NULL,
movie_id numeric NOT NULL,
person_id numeric NOT NULL,
code char NOT NULL
)


alter table Movie_Directors
	add constraint FK_MOVIE_DIRECTORS_REF_PERSON foreign key (person_id)
	references Person(person_id)
	on update cascade on delete cascade

alter table Movie_Directors	
	add constraint FK_MOVIE_DIRECTORS_REF_MOVIE foreign key (movie_id)
	references Movie(movie_id)
	on update cascade on delete cascade

alter table Movie_Cast
	add constraint FK_MOVIE_CAST_REF_MOVIE foreign key (movie_id)
	references Movie(movie_id)
	on update cascade on delete cascade

alter table Movie
	add constraint UC_PREVIOUS_PART unique (previous_part, movie_id)

alter table Movie_Genre
	add constraint FK_MOVIE_GENRE_REF_MOVIE foreign key(movie_id)
	references Movie(movie_id)
	on update cascade on delete cascade

alter table Movie_Genre	
	add constraint FK_MOVIE_GENRE_REF_GENRE foreign key(genre_name)
	references Genre(genre_name)
	on update cascade on delete cascade

alter table Watch_History
	add constraint FK_WATCH_HISTORY_REF_MOVIE foreign key(movie_id)
	references Movie(movie_id)
	on update cascade on delete no action

alter table Watch_History
	add constraint FK_WATCH_HISTORY_REF_CUSTOMER foreign key(customer_mail_address)
	references Customer(customer_mail_address)
	on update cascade on delete no action

alter table Customer
	add constraint FK_CUSTOMER_REF_PAYMENT foreign key(payment_method)
	references Payment(payment_method)
	on update cascade on delete cascade

alter table Customer
	add constraint FK_CUSTOMER_REF_CONTRACT foreign key(contract_type)
	references Contract(contract_type)
	on update cascade on delete cascade

alter table Customer
	add constraint FK_CUSTOMER_REF_COUNTRY foreign key(country_name)
	references Country(country_name)
	on update cascade on delete cascade

alter table code 
	add constraint pk_code primary key (code)

alter table awards
	add constraint pk_awards primary key (award_id),
	constraint fk_event_place foreign key (place) references country(country_name)

alter table award_rewards
	add constraint pk_award_selected primary key (award_id, movie_id,person_id),
	constraint fk_awards_selected_award_id foreign key (award_id) references awards(award_id),
	constraint fk_awards_selected_movie_id foreign key (movie_id) references movie(movie_id),
	constraint fk_awards_selected_person_id foreign key (person_id) references person(person_id),
	constraint fk_awards_rewards_code foreign key (code) references code(code)
