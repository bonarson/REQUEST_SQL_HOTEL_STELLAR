INSERT INTO
    payement (
        payement_mode,
        payement_value,
        id_reservation_in_payement
    )
VALUES
    (
        'Mobile Money',
        (
            select
                (
                    select
                        price_of_night
                    from
                        reservation
                        inner join room on room.id_room = reservation.id_room_in_reservation
                        inner join room_type on room_type.id_room_type = room.id_room_type_in_room
                    where
                        id_reservation = 3
                ) * EXTRACT(
                    DAY
                    FROM
                        (end_date_of_stay - start_date_if_stay)
                )
            FROM
                reservation
            where
                id_reservation = 3
        ),
        3
    );

INSERT INTO
    payement (
        payement_mode,
        payement_value,
        id_reservation_in_payement
    )
VALUES
    (
        'Mobile Money',
        (
            select
                (
                    select
                        price_of_night
                    from
                        reservation
                        inner join room on room.id_room = reservation.id_room_in_reservation
                        inner join room_type on room_type.id_room_type = room.id_room_type_in_room
                    where
                        id_reservation = 1
                ) * EXTRACT(
                    DAY
                    FROM
                        (end_date_of_stay - start_date_if_stay)
                )
            FROM
                reservation
            where
                id_reservation = 1
        ),
        1
    );

INSERT INTO
    payement (
        payement_mode,
        payement_value,
        id_reservation_in_payement
    )
VALUES
    (
        'Mobile Money',
        (
            select
                (
                    select
                        price_of_night
                    from
                        reservation
                        inner join room on room.id_room = reservation.id_room_in_reservation
                        inner join room_type on room_type.id_room_type = room.id_room_type_in_room
                    where
                        id_reservation = 8
                ) * EXTRACT(
                    DAY
                    FROM
                        (end_date_of_stay - start_date_if_stay)
                )
            FROM
                reservation
            where
                id_reservation = 8
        ),
        8
    );

INSERT INTO
    payement (
        payement_mode,
        payement_value,
        id_reservation_in_payement
    )
VALUES
    (
        'Mobile Money',
        (
            select
                (
                    select
                        price_of_night
                    from
                        reservation
                        inner join room on room.id_room = reservation.id_room_in_reservation
                        inner join room_type on room_type.id_room_type = room.id_room_type_in_room
                    where
                        id_reservation = 2
                ) * EXTRACT(
                    DAY
                    FROM
                        (end_date_of_stay - start_date_if_stay)
                )
            FROM
                reservation
            where
                id_reservation = 2
        ),
        2
    );

INSERT INTO
    payement (
        payement_mode,
        payement_value,
        id_reservation_in_payement
    )
VALUES
    (
        'Mobile Money',
        (
            select
                (
                    select
                        price_of_night
                    from
                        reservation
                        inner join room on room.id_room = reservation.id_room_in_reservation
                        inner join room_type on room_type.id_room_type = room.id_room_type_in_room
                    where
                        id_reservation = 4
                ) * EXTRACT(
                    DAY
                    FROM
                        (end_date_of_stay - start_date_if_stay)
                )
            FROM
                reservation
            where
                id_reservation = 4
        ),
        4
    );

INSERT INTO
    payement (
        payement_mode,
        payement_value,
        id_reservation_in_payement
    )
VALUES
    (
        'Mobile Money',
        (
            select
                (
                    select
                        price_of_night
                    from
                        reservation
                        inner join room on room.id_room = reservation.id_room_in_reservation
                        inner join room_type on room_type.id_room_type = room.id_room_type_in_room
                    where
                        id_reservation = 5
                ) * EXTRACT(
                    DAY
                    FROM
                        (end_date_of_stay - start_date_if_stay)
                )
            FROM
                reservation
            where
                id_reservation = 5
        ),
        5
    );