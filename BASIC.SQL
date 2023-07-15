
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




--  12 -Afficher la liste des chambres par prix décroissant

SELECT *
FROM room
INNER JOIN room_type ON room.id_room_type_in_room = room_type.id_room_type
ORDER BY room_type.price_of_night DESC;

-- 13 -Afficher la liste des chambres dont la description correspond à des mots-clés données 

SELECT *
FROM room
INNER JOIN room_type ON room.id_room_type_in_room = room_type.id_room_type
WHERE room_type.service ILIKE '%oncier%'
OR room_type.service ILIKE '%ellnes%'
OR room_type.service ILIKE '%wi%';

-- 14-Pour afficher la liste des hôtels qui contiennent des chambres dont la description correspond à 
des mots-clés donnés:

SELECT DISTINCT hotel.*
FROM hotel
INNER JOIN room ON hotel.id_hotel = room.id_hotel_in_room
INNER JOIN room_type ON room.id_room_type_in_room = room_type.id_room_type
WHERE room_type.service ILIKE '%oncier%'
OR room_type.service ILIKE '%ellnes%'
OR room_type.service ILIKE '%wi%';

--15-Pour afficher les détails sur la chambre qu'occupe un client donné actuellement :

SELECT r.id_room, r.room_number, rt.name_of_room_type, rt.service, rt.price_of_night
FROM room r
JOIN reservation res ON r.id_room = res.id_room_in_reservation
JOIN room_type rt ON r.id_room_type_in_room = rt.id_room_type
WHERE res.id_customer_in_reservation = 44;

