  ---------medium ------

----1- combien de foi le client on fait de reservation dans tout hotel confondue -----

select customer.id_customer, customer.customer_firstname, COUNT(*) as compt_reservation
from customer 
inner join reservation  on customer .id_customer = reservation.id_customer_in_reservation
group by  customer.id_customer, customer.customer_firstname;

----2- la liste des chambre qui seront libre demain ------

select id_room, room_number
from room 
inner join reservation  ON room.id_room = reservation.id_room_in_reservation
where reservation.start_date_if_stay > date(now()) + interval '1 day';


-----3- la liste de room d'un type donnée -----------

select id_room, room_number
from room 
inner join room_type  on room.id_room_type_in_room = room_type.id_room_type
where room_type.name_of_room_type = 'twin'
and room.id_hotel_in_room = 1; 


 ----4- la promotion en fonction de la periode -----

select id_promotion, promotion_name, has_prom.start_date, has_prom.end_date
from promotion 
inner join has_prom on promotion.id_promotion = has_prom.id_promotion_in_has_prom
order by has_prom.start_date;



---- 8-Afficher les
-- hotels, avec le nombre de chambres par hotels

SELECT
    h.hotel_city AS ville_hotel,
    h.hotel_adress AS adresse_hotel,
    COUNT(r.id_room) AS nombre_chambres
FROM
    hotel h
    INNER JOIN room r ON r.id_hotel_in_room = h.id_hotel
GROUP BY
    h.hotel_city, h.hotel_adress;




--9--Afficher la liste des chambres occupées actuellement
SELECT
    h.hotel_city AS ville_hotel,
    h.hotel_adress AS adresse_hotel,
    r.room_number AS numero_chambre
FROM
    reservation res
    JOIN room r ON r.id_room = res.id_room_in_reservation
    JOIN hotel h ON h.id_hotel = r.id_hotel_in_room
WHERE
    res.start_date_of_stay <= CURRENT_DATE
    AND res.end_date_of_stay >= CURRENT_DATE;


    --------------------------------------------------------------



---10- Afficher les
 --chambres les moins réservés d'un hotel donné

SELECT
    r.room_number AS numero_chambre,
    COUNT(*) AS nombre_reservations
FROM
    reservation res
    JOIN room r ON r.id_room = res.id_room_in_reservation
WHERE
    r.id_hotel_in_room = 4
GROUP BY
    r.room_number
ORDER BY
    COUNT(*) ASC;

---------------------------------------------------------------
---11-Afficher les chambres
-- les plus réservés d'un hotel donné
SELECT
    r.room_number AS numero_chambre,
    COUNT(*) AS nombre_reservations
FROM
    reservation res
    JOIN room r ON r.id_room = res.id_room_in_reservation
WHERE
    r.id_hotel_in_room = 4
GROUP BY
    r.room_number
ORDER BY
    COUNT(*) DESC;


