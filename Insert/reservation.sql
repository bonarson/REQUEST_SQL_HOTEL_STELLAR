----------------- Client 1 avec plusieur reservation ------------- 


insert into
    reservation (
        id_reservation,
        reservation_date,
        start_date_if_stay,
        end_date_of_stay,
        id_customer_in_reservation,
        id_user_in_reservation,
        id_room_in_reservation
    )
values
    (
        8,
        '2023-07-01 11:20:00',
        '2023-07-08 06:25:00',
        '2023-08-08 08:00:30',
        21,
        11,
        9
    );

------------------------ * ----------------------------------
------Reservation avec  room---------
insert into
    reservation (
        id_reservation,
        reservation_date,
        start_date_if_stay,
        end_date_of_stay,
        id_customer_in_reservation,
        id_user_in_reservation,
        id_room_in_reservation
    )
values
    (
        2,
        '2023-01-01 18:20:00',
        '2023-02-01 10:20:00',
        '2023-03-04 07:20:55',
        48,
        10,
        47
    );

insert into
    reservation (
        id_reservation,
        reservation_date,
        start_date_if_stay,
        end_date_of_stay,
        id_customer_in_reservation,
        id_user_in_reservation,
        id_room_in_reservation
    )
values
    (
        3,
        '2023-02-01 08:20:00',
        '2023-02-08 08:20:00',
        '2023-03-12 06:20:40',
        44,
        12,
        32
    );

insert into
    reservation (
        id_reservation,
        reservation_date,
        start_date_if_stay,
        end_date_of_stay,
        id_customer_in_reservation,
        id_user_in_reservation,
        id_room_in_reservation
    )
values
    (
        4,
        '2023-04-01 08:20:00',
        '2023-04-12 11:10:00',
        '2023-06-11 08:20:10',
        36,
        20,
        31
    );

insert into
    reservation (
        id_reservation,
        reservation_date,
        start_date_if_stay,
        end_date_of_stay,
        id_customer_in_reservation,
        id_user_in_reservation,
        id_room_in_reservation,
        is_canceled
    )
values
    (
        5,
        '2023-03-24 11:20:00',
        '2023-04-03 12:20:00',
        '2023-06-01 06:20:20',
        62,
        8,
        66,
        'true'
    );

------  Reservation avec conference room---------
insert into
    reservation (
        id_reservation,
        reservation_date,
        start_date_if_stay,
        end_date_of_stay,
        id_customer_in_reservation,
        id_user_in_reservation,
        id_conference_room_in_reservation,
        is_canceled
    )
values
    (
        6,
        '2023-04-11 09:10:00',
        '2023-04-18 06:20:00',
        '2023-05-01 11:20:11',
        27,
        10,
        12,
        'true'
    );

insert into
    reservation (
        id_reservation,
        reservation_date,
        start_date_if_stay,
        end_date_of_stay,
        id_customer_in_reservation,
        id_user_in_reservation,
        id_conference_room_in_reservation
    )
values
    (
        7,
        '2023-06-01 08:20:00',
        '2023-06-10 11:20:00',
        '2023-08-01 13:20:00',
        55,
        31,
        13
    );

----- un curtomer qui a effectuer plusieur reservation de coference room ------
insert into
    reservation (
        id_reservation,
        reservation_date,
        start_date_if_stay,
        end_date_of_stay,
        id_customer_in_reservation,
        id_user_in_reservation,
        id_conference_room_in_reservation
    )
values
    (
        10,
        '2023-09-11 08:20:40',
        '2023-09-17 10:20:50',
        '2023-09-19 13:20:00',
        69,
        31,
        13
    );

insert into
    reservation (
        id_reservation,
        reservation_date,
        start_date_if_stay,
        end_date_of_stay,
        id_customer_in_reservation,
        id_user_in_reservation,
        id_conference_room_in_reservation
    )
values
    (
        11,
        '2023-12-17 08:20:40',
        '2023-12-24 13:20:50',
        '2023-12-28 11:20:00',
        69,
        31,
        13
    );