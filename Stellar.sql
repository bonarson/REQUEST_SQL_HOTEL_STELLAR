------------------------------------------------------------
--        Script Postgre 
------------------------------------------------------------
------------------------------------------------------------
-- Table: Customer
------------------------------------------------------------
CREATE TABLE "customer"(
	id_customer SERIAL,
	customer_firstname varchar(100) not null,
	customer_lastname varchar (100) not null,
	gender CHAR (1) check (
		gender = 'M'
		OR gender = 'F'
	),
	phone_number varchar (20) not null,
	emmergency_contact varchar (20) not null,
	email varchar (100) not null,
	nationality varchar (50) not null,
	customer_password varchar (8) not null,
	PRIMARY KEY (id_customer)
);

------------------------------------------------------------
-- Table: USER
------------------------------------------------------------
CREATE TABLE "user"(
	id_user SERIAL,
	first_name varchar (100) not null,
	last_name varchar (100) not null,
	email varchar (100) not null,
	password varchar (30) not null,
	role varchar (100) not null,
	primary key (id_user)
);

------------------------------------------------------------
-- Table: Feature
------------------------------------------------------------
CREATE TABLE feature(
	id_feature SERIAL,
	feature_name VARCHAR (100) NOT NULL,
	feature_description text,
	PRIMARY KEY (id_feature)
);

------------------------------------------------------------
-- Table: promotion
------------------------------------------------------------
CREATE Table promotion(
	id_promotion SERIAL,
	percentage float,
	promotion_name varchar(100),
	primary key(id_promotion)
);

------------------------------------------------------------
-- Table: Hotel
------------------------------------------------------------
CREATE TABLE hotel(
	id_hotel SERIAL,
	hotel_city varchar(100) not null,
	hotel_adress varchar (100) not null,
	hotel_phone_number int not null,
	hotel_email varchar(100),
	primary key (id_hotel)
);

------------------------------------------------------------
-- Table: Romm_type
------------------------------------------------------------
CREATE TABLE room_type(
	id_room_type SERIAL not null,
	name_of_room_type varchar (100) not null,
	service varchar (100) not null,
	room_type_number int not null,
	price_of_night int not null,
	primary key (id_room_type)
);

------------------------------------------------------------
-- Table: Conference_room
------------------------------------------------------------
CREATE TABLE conference_room(
	id_conference_room SERIAL,
	floor_area INT not null,
	price_for_one_hour FLOAT not null,
	id_hotel_in_conference_room int,
	foreign key (id_hotel_in_conference_room) references hotel(id_hotel),
	PRIMARY KEY (id_conference_room)
);

------------------------------------------------------------
-- Table: Romm
------------------------------------------------------------
CREATE TABLE room(
	id_room SERIAL NOT NULL,
	room_number INT NOT NULL,
	id_hotel_in_room INT,
	id_room_type_in_room INT,
	PRIMARY KEY (id_room),
	FOREIGN KEY (id_hotel_in_room) REFERENCES hotel(id_hotel),
	FOREIGN KEY (id_room_type_in_room) REFERENCES room_type(id_room_type)
);

------------------------------------------------------------
-- Table: Reservation
------------------------------------------------------------
CREATE TABLE reservation(
	id_reservation int,
	reservation_date timestamp NOT NULL check(reservation_date < start_date_if_stay),
	start_date_if_stay timestamp NOT NULL check (start_date_if_stay < end_date_of_stay),
	end_date_of_stay timestamp NOT NULL check (end_date_of_stay > start_date_if_stay),
	id_customer_in_reservation int,
	id_user_in_reservation int,
	id_conference_room_in_reservation int,
	id_room_in_reservation int,
	PRIMARY KEY (id_reservation),
	FOREIGN KEY (id_customer_in_reservation) REFERENCES customer(id_customer),
	FOREIGN KEY (id_user_in_reservation) REFERENCES "user"(id_user),
	FOREIGN KEY (id_conference_room_in_reservation) REFERENCES conference_room(id_conference_room),
	FOREIGN KEY (id_room_in_reservation) REFERENCES room(id_room),
);

------------------------------------------------------------
-- Table: Payement
------------------------------------------------------------
CREATE TABLE payement(
	id_payement SERIAL,
	payement_mode VARCHAR (100) NOT NULL,
	payement_value FLOAT NOT NULL,
	id_reservation_in_payement INT,
	PRIMARY KEY (id_payement),
	FOREIGN KEY (id_reservation_in_payement) REFERENCES reservation(id_reservation)
);

------------------------------------------------------------
-- Table: has_prom
CREATE Table has_prom(
	id_has_prom int primary key,
	start_date date,
	end_date date,
	id_promotion_in_has_prom int,
	id_romm_type_in_has_prom int,
	foreign key(id_promotion_in_has_prom) references promotion(id_promotion),
	foreign key(id_romm_type_in_has_prom) references room_type(id_room_type)
);

------------------------------------------------------------
---table has
CREATE TABLE has(
	id_has SERIAL primary key,
	id_feature_in_has INT,
	id_room_type_in_has INT,
	FOREIGN KEY (id_feature_in_has) references feature(id_feature),
	FOREIGN KEY (id_room_type_in_has) references room_type(id_room_type)
);