--create database Class4Homework
--Homework to create diagrams primary key and foreign key
--create table airport (
--				id bigint,
--				airport_name varchar(50),
--				country varchar(50),
--				state varchar(50),
--				city varchar(50),
--				created_at datetime,
--				updated_at datetime,
--				constraint P_Key primary key (id)
--				)
--create table airline (
--				id bigint,
--				airline_code varchar,
--				airline_name bigint,
--				airline_country varchar(50),
--				created_at datetime,
--				updated_at datetime,
--				constraint P_Key_airline primary key (id)
--				)

--drop table flights -- foreign key ni qo'shish uchun ishlatdim.

--create table flights (
--				flight_id bigint,
--				departing_gate varchar(20),
--				arriving_gate varchar(20),
--				created_at datetime,
--				updated_at datetime,
--				airline_id bigint,
--				departing_airport_id bigint,
--				arriving_airport_id bigint,
--				constraint P_Key_flights primary key (flight_id),
--				foreign key (airline_id) references airline (id),
--				foreign key (departing_airport_id) references airport (id),
--				foreign key (arriving_airport_id) references flight_manifest (id)
--				)

--drop table flight_manifest -- foreign key ni qo'shish uchun ishlatdim.

--create table flight_manifest (
--					id bigint,
--					created_at datetime,
--					updated_at datetime,
--					booking_id bigint,
--					flight_id bigint,
--					constraint P_Key_flight_manifest primary key (id),
--					foreign key (booking_id) references booking (bookingid)
--					)

--drop table boarding_pass -- foreign key ni qo'shish uchun ishlatdim.

--create table boarding_pass (
--					id bigint,
--					qr_code varchar(8000),
--					created_at datetime,
--					updated_at datetime,
--					booking_id bigint,
--					constraint P_Key_boarding_pass primary key (id),
--					foreign key (booking_id) references booking (bookingid)
--					)

--drop table baggage -- foreign key ni qo'shish uchun ishlatdim.

--create table baggage (
--					id bigint,
--					weight_in_kg decimal(4,2),
--					created_date datetime,
--					updated_date datetime,
--					booking_id bigint,
--					constraint P_Key_baggage primary key (id),
--					foreign key (booking_id) references booking (bookingid)
--					)



----create table booking (
----					bookingid bigint,
----					flight_id bigint,
----					status varchar(20),
----					booking_platform varchar(20),
----					created_at datetime,
----					updated_at datetime,
----					passenger_id bigint,
----					constraint P_Key_booking primary key (bookingid)
----					)

--drop table security_check -- foreign key ni qo'shish uchun ishlatdim.

--create table security_check (
--					id bigint,
--					check_result varchar(20),
--					comments varchar(8000),
--					created_at datetime,
--					updated_at datetime,
--					passenger_id bigint,
--					constraint P_Key_security_check primary key (id),
--					foreign key (passenger_id) references passengers (id)
--					)



--create table passengers (
--					id bigint,
--					first_name varchar(50),
--					last_name varchar(50),
--					date_of_birth date,
--					country_of_citizenship varchar(50),
--					country_of_residence varchar(50),
--					passport_number varchar(20),
--					created_at datetime,
--					updated_at datetime,
--					constraint P_Key_passengers primary key (id)
--					)

--drop table baggage_check -- foreign key ni qo'shish uchun ishlatdim.

--create table baggage_check (
--					id bigint,
--					check_result varchar(50),
--					created_at bigint,
--					updated_at bigint,
--					booking_id bigint,
--					passenger_id bigint,
--					constraint P_Key_baggage_check primary key (id),
--					foreign key (passenger_id) references passengers (id),
--					foreign key (booking_id) references booking (bookingid)
--					)

--drop table no_fly_list -- foreign key ni qo'shish uchun ishlatdim.

--create table no_fly_list (
--					id bigint,
--					active_from date,
--					active_to date,
--					no_fly_reason varchar(255),
--					created_at datetime,
--					updated_at datetime,
--					psgnr_id bigint,
--					constraint P_Key_no_fly_list primary key (id),
--					foreign key (psgnr_id) references passengers (id)
--					)