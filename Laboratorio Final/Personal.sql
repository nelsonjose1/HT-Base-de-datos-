DROP DATABASE IF EXISTS Personal;
CREATE DATABASE Personal;
USE Personal;

-- DDL

CREATE TABLE Departamento
(
    clave_Depto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre      VARCHAR(30)                    NOT NULL,
    presupuesto INT                            NOT NULL
);


CREATE TABLE Empleado
(
    clave_Empleado VARCHAR(8) PRIMARY KEY NOT NULL,
    nombre         VARCHAR(30)            NOT NULL,
    apellidos      VARCHAR(30)            NOT NULL,
    clave_Depto    INT                    NOT NULL,
    CONSTRAINT FK_clave_Depto FOREIGN KEY (clave_Depto) REFERENCES Departamento (clave_Depto)
);

-- DML

INSERT INTO Departamento (nombre, presupuesto)
VALUES ('Personal', 80000),
       ('Almacén', 70000),
       ('Contabilidad', 60000),
       ('Manufactura', 50000),
       ('Empaque', 30000);

INSERT INTO Empleado (clave_Empleado, nombre, apellidos, clave_Depto)
VALUES ('EMP01', 'Armando', 'López', 2),
       ('EMP02', 'Tatiana', 'Vargas', 1),
       ('EMP03', 'Laura', 'Iturria', 3),
       ('EMP04', 'Juan', 'Pérez', 4),
       ('EMP05', 'Iván', 'López', 4),
       ('EMP06', 'Margarita', 'Hernández', 1),
       ('EMP07', 'Jesús', 'Pérez', 3),
       ('EMP08', 'Tonatiuh', 'Flores', 2),
       ('EMP09', 'Juan', 'López', 4),
       ('EMP10', 'José', 'Hernández', 5);

-- CONSULTAS

-- Nombre y apellidos de los empleados

SELECT nombre,apellidos FROM Empleado;

-- Apellidos de los empleados sin repeticiones

SELECT DISTINCT apellidos FROM Empleado;

-- Datos de los empleados con apellido 'Lopez'

SELECT * FROM Empleado WHERE apellidos = 'López';

-- Datos de nombre y clave del empleados que trabajan en el departamento 4

SELECT nombre, clave_Depto FROM Empleado WHERE clave_Depto = 4;

-- Datos de los empleados que trabajan en el departamento 1 o 3 ordenados alfabeticamente por nombre

SELECT * FROM Empleado WHERE clave_Depto = 1 OR clave_Depto = 3 ORDER BY nombre ASC;

-- Nombre y apellido de los empleados cuyo apellido comienza con H

-- Departamentos cuyo presupuesto esta entre $50000 y $70000
SELECT * FROM Departamento WHERE presupuesto BETWEEN 50000 AND 70000;

SELECT nombre, apellidos FROM Empleado WHERE apellidos LIKE 'H%';

-- Clave de empleado, nombre y apellidos de los empleados que trabajen en el departamento de contabilidad

SELECT * FROM Empleado where clave_Depto = 3;

-- Nombre, apellidos y nombre del departamento donde trabaja cada empleado

SELECT Empleado.nombre ,Empleado.apellidos, D.nombre FROM Empleado INNER JOIN Departamento D on Empleado.clave_Depto = D.clave_Depto

-- Vistas

-- Vista personal

CREATE VIEW vistaPersonal AS
    SELECT * FROM Empleado;

SELECT * FROM vistaPersonal;

-- Vista apellido Perez

CREATE VIEW vistaPersonalPerez AS
    SELECT * FROM Empleado WHERE apellidos = 'Pérez'

SELECT * FROM vistaPersonalPerez;

-- Vista grandes presupuestos

CREATE VIEW vistaGrandesPresupuestos AS
    SELECT * FROM Departamento WHERE presupuesto >= 50000;

SELECT * FROM vistaGrandesPresupuestos;