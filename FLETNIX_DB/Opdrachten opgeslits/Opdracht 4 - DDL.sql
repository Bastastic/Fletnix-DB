use master
use fletnix

drop table if exists award_rewards
drop table if exists awards
drop table if exists code

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