DROP DATABASE IF EXISTS Hoteles;
CREATE DATABASE Hoteles;
USE Hoteles;

CREATE TABLE CLIENTE (
    NUM_CLIENTE INT PRIMARY KEY,
    NOMBRE VARCHAR(50),
    NIF VARCHAR(9),
    DOMICILIO VARCHAR(50),
    LOCALIDAD VARCHAR(50),
    PROVINCIA VARCHAR(50),
    COD_POSTAL VARCHAR(5)
);

CREATE TABLE HOTEL (
    NUM_HOTEL INT PRIMARY KEY,
    NOMBRE VARCHAR(50),
    CATEGORIA VARCHAR(50),
    DOMICILIO VARCHAR(50),
    LOCALIDAD VARCHAR(50),
    PROVINCIA VARCHAR(50),
    COD_POSTAL VARCHAR(5),
    TELEFONO VARCHAR(9)
);

CREATE TABLE TIPO_HABITACION (
    NUM_TIPOHAB INT PRIMARY KEY,
    NUM_HOTEL INT,
    NOMBRE VARCHAR(20),
    DESCRIPCION VARCHAR(50),
    CANTIDAD INT,
    MAX_OCUPANTES INT,
    PRECIO FLOAT,
    FOREIGN KEY (NUM_HOTEL) REFERENCES HOTEL(NUM_HOTEL)
);

CREATE TABLE RESERVA (
    NUM_RESERVA INT PRIMARY KEY,
    NUM_CLIENTE INT,
    NUM_TIPOHAB INT,
    CANTIDAD INT,
    FECHA_INI DATE,
    FECHA_FIN DATE,
    FOREIGN KEY (NUM_CLIENTE) REFERENCES CLIENTE(NUM_CLIENTE),
    FOREIGN KEY (NUM_TIPOHAB) REFERENCES TIPO_HABITACION(NUM_TIPOHAB)
);

INSERT INTO HOTEL (NUM_HOTEL, NOMBRE, CATEGORIA, DOMICILIO, LOCALIDAD, PROVINCIA, COD_POSTAL, TELEFONO) VALUES
(1, 'Hotel A1', 'A', 'Dirección 1', 'Localidad 1', 'Provincia 1', '12345', '123456789'),
(2, 'Hotel A2', 'A', 'Dirección 2', 'Localidad 2', 'Provincia 2', '23456', '234567890'),
(3, 'Hotel B1', 'B', 'Dirección 3', 'Localidad 3', 'Provincia 3', '34567', '345678901'),
(4, 'Hotel B2', 'B', 'Dirección 4', 'Localidad 4', 'Provincia 4', '45678', '456789012'),
(5, 'Hotel B3', 'B', 'Dirección 5', 'Localidad 5', 'Provincia 5', '56789', '567890123'),
(6, 'Hotel C1', 'C', 'Dirección 6', 'Localidad 6', 'Provincia 6', '67890', '678901234'),
(7, 'Hotel C2', 'C', 'Dirección 7', 'Localidad 7', 'Provincia 7', '78901', '789012345');

INSERT INTO TIPO_HABITACION (NUM_TIPOHAB, NUM_HOTEL, NOMBRE, DESCRIPCION, CANTIDAD, MAX_OCUPANTES, PRECIO) VALUES
(1, 1, 'Triple', 'Habitación triple', 20, 3, 150.0),
(2, 1, 'Simple', 'Habitación simple', 20, 1, 80.0),
(3, 1, 'Doble', 'Habitación doble', 30, 2, 120.0),

(4, 2, 'Triple', 'Habitación triple', 20, 3, 150.0),
(5, 2, 'Simple', 'Habitación simple', 20, 1, 80.0),
(6, 2, 'Doble', 'Habitación doble', 30, 2, 120.0),

(7, 3, 'Triple', 'Habitación triple', 20, 3, 150.0),
(8, 3, 'Simple', 'Habitación simple', 20, 1, 80.0),
(9, 3, 'Doble', 'Habitación doble', 30, 2, 120.0),

(10, 4, 'Triple', 'Habitación triple', 20, 3, 150.0),
(11, 4, 'Simple', 'Habitación simple', 20, 1, 80.0),
(12, 4, 'Doble', 'Habitación doble', 30, 2, 120.0),

(13, 5, 'Triple', 'Habitación triple', 20, 3, 150.0),
(14, 5, 'Simple', 'Habitación simple', 20, 1, 80.0),
(15, 5, 'Doble', 'Habitación doble', 30, 2, 120.0),

(16, 6, 'Triple', 'Habitación triple', 20, 3, 150.0),
(17, 6, 'Simple', 'Habitación simple', 20, 1, 80.0),
(18, 6, 'Doble', 'Habitación doble', 30, 2, 120.0),

(19, 7, 'Triple', 'Habitación triple', 20, 3, 150.0),
(20, 7, 'Simple', 'Habitación simple', 20, 1, 80.0),
(21, 7, 'Doble', 'Habitación doble', 30, 2, 120.0);

INSERT INTO CLIENTE (NUM_CLIENTE, NOMBRE, NIF, DOMICILIO, LOCALIDAD, PROVINCIA, COD_POSTAL) VALUES
(1, 'Juan', '12345678A', 'Calle A', 'Localidad A', 'Provincia A', '322'),
(2, 'Pedro', '23456789B', 'Calle B', 'Localidad B', 'Provincia B', '325'),
(3, 'Alex', '34567890C', 'Calle C', 'Localidad C', 'Provincia C', '324'),
(4, 'Moises', '45678901D', 'Calle D', 'Localidad D', 'Provincia D', '456'),
(5, 'Dante', '55678901E', 'Calle E', 'Localidad E', 'Provincia E', '568'),
(6, 'Vinicio', '65678901F', 'Calle F', 'Localidad F', 'Provincia F', '478'),
(7, 'Carlos', '75678901G', 'Calle G', 'Localidad G', 'Provincia G', '458'),
(8, 'Salvador', '85678901H', 'Calle H', 'Localidad H', 'Provincia H', '125'),
(9, 'Evan', '95678901I', 'Calle I', 'Localidad I', 'Provincia I', '156'),
(10, 'Paula', '10678901J', 'Calle J', 'Localidad J', 'Provincia J', '954'),
(11, 'Katherin', '11678901K', 'Calle K', 'Localidad K', 'Provincia K', '489'),
(12, 'Valentina', '12678901L', 'Calle L', 'Localidad L', 'Provincia L', '486'),
(13, 'Sofia', '13789012M', 'Calle M', 'Localidad M', 'Provincia M', '268'),
(14, 'Carla', '14890123N', 'Calle N', 'Localidad N', 'Provincia N', '384');

INSERT INTO RESERVA (NUM_RESERVA, NUM_CLIENTE, NUM_TIPOHAB, CANTIDAD, FECHA_INI, FECHA_FIN) VALUES
(1, 1, 1, 1, '2024-11-01', '2024-11-05'),
(2, 2, 2, 1, '2024-11-02', '2024-11-06'),
(3, 3, 4, 1, '2024-11-01', '2024-11-05'),
(4, 4, 6, 1, '2024-11-04', '2024-11-06'),
(5, 5, 7, 1, '2024-11-01', '2024-11-05'),
(6, 6, 9, 1, '2024-11-04', '2024-11-06'),
(7, 7, 10, 1, '2024-11-01', '2024-11-08'),
(8, 8, 11, 1, '2024-11-02', '2024-11-06'),
(9, 9, 13, 1, '2024-11-04', '2024-11-10'),
(10, 10, 14, 1, '2024-11-02', '2024-11-06'),
(11, 11, 16, 1, '2024-11-04', '2024-11-10'),
(12, 12, 18, 1, '2024-11-04', '2024-11-06'),
(13, 13, 19, 1, '2024-11-03', '2024-11-10'),
(14, 14, 21, 1, '2024-11-04', '2024-11-08');

SELECT H.CATEGORIA, H.NOMBRE AS Hotel, C.NOMBRE AS Huesped
FROM HOTEL H
JOIN TIPO_HABITACION TH ON H.NUM_HOTEL = TH.NUM_HOTEL
JOIN RESERVA R ON TH.NUM_TIPOHAB = R.NUM_TIPOHAB
JOIN CLIENTE C ON R.NUM_CLIENTE = C.NUM_CLIENTE
ORDER BY H.CATEGORIA, H.NOMBRE, C.NOMBRE;


SELECT H.CATEGORIA, H.NOMBRE AS Hotel, COUNT(DISTINCT R.NUM_CLIENTE) AS Total_Huespedes
FROM HOTEL H
JOIN TIPO_HABITACION TH ON H.NUM_HOTEL = TH.NUM_HOTEL
JOIN RESERVA R ON TH.NUM_TIPOHAB = R.NUM_TIPOHAB
JOIN CLIENTE C ON R.NUM_CLIENTE = C.NUM_CLIENTE
GROUP BY H.CATEGORIA, H.NOMBRE
ORDER BY H.CATEGORIA, H.NOMBRE;