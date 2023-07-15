-- )1- Afficher la liste des receptionnistes, avec l'hotel auquel ils sont rattachés
select  id_user , first_name,last_name,email,role,hotel_city,hotel_adress,hotel_phone_number,hotel_email from reservation inner join "user" on "user".id_user = reservation.id_user_in_reservation
inner join room on room.id_room =reservation.id_room_in_reservation
inner join hotel on hotel.id_hotel = room.id_hotel_in_room  where role like '%ceptionni%' ;


--) 3-Afficher la liste des réservations en commençant par la plus récente, pour un hotel donné

select id_reservation,reservation_date,	hotel_city,hotel_adress , id_room ,id_hotel from reservation inner join room on room.id_room=reservation.id_room_in_reservation 
inner join hotel on hotel.id_hotel = room.id_hotel_in_room where id_hotel =4 order by reservation_date desc;

--9) Afficher le nombre de réservations effectuées par un client donné durant une période donnée

SELECT COUNT(*) AS nombre_reservations
FROM reservation
WHERE id_customer_in_reservation = 69
AND reservation_date >= '2023-01-01 10:20:00'
AND reservation_date <= ' 2023-12-17 08:20:40 ';

--OU 
create view reservation_count as select id_reservation ,reservation_date,id_customer_in_reservation from
reservation where reservation_date >= '2023-01-01 10:20:00'
AND reservation_date <= ' 2023-12-17 08:20:40 ';
select count(*) from reservation_count;

-- 6-Afficher la liste des réservations d'un client donné
SELECT *
FROM reservation
WHERE id_customer_in_reservation = 69;

-- 11 -    Afficher la liste des chambres qui correspondent à un intervalle de prix donné par le client	

SELECT *
FROM room
INNER JOIN room_type ON room.id_room_type_in_room = room_type.id_room_type
WHERE room_type.price_of_night >= 20000
AND room_type.price_of_night <= 60000;
