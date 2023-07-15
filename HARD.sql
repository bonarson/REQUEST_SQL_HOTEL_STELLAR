
-- 2-Ériger une facture avec le montant total à payer (et le reste à payer), le nom du client,
-- la date de réservation, la date de début et de fin
SELECT
    c.customer_firstname || ' ' || c.customer_lastname AS nom_client,
    r.reservation_date AS date_reservation,
    r.start_date_if_stay AS date_debut,
    r.end_date_of_stay AS date_fin,
    p.payement_value AS montant_total,
    p.payement_value - COALESCE(partial.partial_payement, 0) AS reste_a_payer
FROM
    reservation r
    INNER JOIN customer c ON c.id_customer = r.id_customer_in_reservation
    INNER JOIN payement p ON p.id_reservation_in_payement = r.id_reservation
    LEFT JOIN (
        SELECT
            id_reservation_in_payement,
            SUM(payement_value) AS partial_payement
        FROM
            payement
        GROUP BY
            id_reservation_in_payement
    ) partial ON partial.id_reservation_in_payement = r.id_reservation
WHERE
    r.id_reservation = 2
GROUP BY
    c.customer_firstname, c.customer_lastname, r.reservation_date, r.start_date_if_stay, r.end_date_of_stay, p.payement_value, partial.partial_payement;


--ou
SELECT
    c.customer_firstname || ' ' || c.customer_lastname AS nom_client,
    r.reservation_date AS date_reservation,
    r.start_date_if_stay AS date_debut,
    r.end_date_of_stay AS date_fin,
    p.payement_value AS montant_total,
    p.payement_value - COALESCE((
        SELECT SUM(payement_value)
        FROM payement
        WHERE id_reservation_in_payement = r.id_reservation
    ), 0) AS reste_a_payer
FROM
    reservation r
    INNER JOIN customer c ON c.id_customer = r.id_customer_in_reservation
    INNER JOIN payement p ON p.id_reservation_in_payement = r.id_reservation
WHERE
    r.id_reservation = 4;
    -----------------------------------------------------------------------------

--3 -Afficher la liste des 
--chambres libres sur une certaine période, en précisant leur hotel.

    SELECT
    h.hotel_city AS ville_hotel,
    h.hotel_adress AS adresse_hotel,
    r.room_number AS numero_chambre,
    rt.name_of_room_type AS type_chambre
FROM
    room r
    INNER JOIN room_type rt ON r.id_room_type_in_room = rt.id_room_type
    INNER JOIN hotel h ON r.id_hotel_in_room = h.id_hotel
WHERE
    r.id_room NOT IN (
        SELECT DISTINCT
            id_room_in_reservation
        FROM
            reservation
        WHERE
            start_date_of_stay <= '2023-06-12 11:10:00'
            AND end_date_of_stay >= '2023-04-12 11:10:00'
    );
---------------------------------------------------------------------------------


--4 Afficher le total de paiement encaisée au cours d'un mois 
--(y compris les frais perçus pour les annulations de réservations), par hotel

    SELECT
    h.hotel_city AS ville_hotel,
    h.hotel_adress AS adresse_hotel,
    SUM(p.payement_value) AS total_paiement
FROM
    payement p
    INNER JOIN reservation r ON p.id_reservation_in_payement = r.id_reservation
    INNER JOIN room ro ON r.id_room_in_reservation = ro.id_room
    INNER JOIN hotel h ON ro.id_hotel_in_room = h.id_hotel
WHERE
    EXTRACT(MONTH FROM r.reservation_date) = 1
    AND EXTRACT(YEAR FROM r.reservation_date) = 2023
GROUP BY
    h.hotel_city, h.hotel_adress;
    ----------------------------------------------------------------------------

--5 Afficher le total de paiement
-- encaisée au cours d'une année, pour chaque hotel

SELECT
    h.hotel_city AS ville_hotel,
    h.hotel_adress AS adresse_hotel,
    SUM(p.payement_value) AS total_paiement
FROM
    payement p
    INNER JOIN reservation r ON p.id_reservation_in_payement = r.id_reservation
    INNER JOIN room ro ON r.id_room_in_reservation = ro.id_room
    INNER JOIN hotel h ON ro.id_hotel_in_room = h.id_hotel
WHERE
    EXTRACT(YEAR FROM r.reservation_date) = 2023
GROUP BY
    h.hotel_city, h.hotel_adress;

