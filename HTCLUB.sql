-- Elimina la base de datos HTCLUB si existe, para evitar conflictos
DROP DATABASE IF EXISTS HTCLUB;

-- Crea la base de datos HTCLUB
CREATE DATABASE HTCLUB;

-- Selecciona la base de datos HTCLUB para usar en las próximas operaciones
USE HTCLUB;

-- Crea la tabla 'Clubes' para almacenar información sobre los clubes
CREATE TABLE Clubes(
    codClub INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- Clave primaria única y autoincremental
    club VARCHAR(50), -- Nombre del club
    direccion VARCHAR(50), -- Dirección del club
    poblacion INT, -- Código de población
    provincia VARCHAR(50), -- Provincia del club
    codPostal INT, -- Código postal
    telefono INT, -- Número de teléfono
    colores VARCHAR(50), -- Colores representativos del club
    himno VARCHAR(250), -- Himno del club
    fax VARCHAR(200), -- Número de fax
    anioFundacion DATE, -- Año de fundación del club
    presupuesto INT, -- Presupuesto del club
    presidente VARCHAR(20), -- Nombre del presidente
    vicepresidente VARCHAR(20) -- Nombre del vicepresidente
);

-- Crea la tabla 'Campeonato' para registrar los campeonatos o trofeos
CREATE TABLE Campeonato(
    codTrofeo INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- Clave primaria única y autoincremental
    nombreTrofeo VARCHAR(50) -- Nombre del trofeo o campeonato
);

-- Crea la tabla 'Demarcacion' para almacenar las posiciones de los jugadores
CREATE TABLE Demarcacion(
    codDem INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- Clave primaria única y autoincremental
    demarcacion VARCHAR(50) -- Nombre de la demarcación o posición
);

-- Crea la tabla 'Paises' para almacenar los países de origen de los jugadores
CREATE TABLE Paises(
    codPais INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- Clave primaria única y autoincremental
    nombrePais VARCHAR(50), -- Nombre del país
    comunitario VARCHAR(50) -- Si el país es comunitario o no
);

-- Crea la tabla 'Entrenadores' para registrar información de los entrenadores
CREATE TABLE Entrenadores(
    codEntren INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- Clave primaria única y autoincremental
    entrenador VARCHAR(50), -- Nombre del entrenador
    fechaNac DATE, -- Fecha de nacimiento del entrenador
    poblacion INT, -- Población donde reside
    provincia VARCHAR(50) -- Provincia donde reside
);

-- Crea la tabla 'Estadios' para almacenar información sobre los estadios de los clubes
CREATE TABLE Estadios(
    codEstadio INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- Clave primaria única y autoincremental
    estadio VARCHAR(50), -- Nombre del estadio
    direccion VARCHAR(50), -- Dirección del estadio
    codPostal VARCHAR(50), -- Código postal
    poblacion INT, -- Población del estadio
    provincia VARCHAR(50), -- Provincia del estadio
    capacidad INT, -- Capacidad del estadio
    inaugaracion DATE, -- Fecha de inauguración del estadio
    dimensiones DECIMAL(10,2), -- Dimensiones del estadio
    codClub INT NOT NULL, -- Clave foránea que se relaciona con el club propietario
    CONSTRAINT FK_codClub FOREIGN KEY (codClub) REFERENCES Clubes(codClub) -- Relación con la tabla Clubes
);

-- Crea la tabla 'Socios' para almacenar los datos de los socios de los clubes
CREATE TABLE Socios(
    codSocios INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- Clave primaria única y autoincremental
    codClub INT NOT NULL, -- Clave foránea para el club al que pertenece el socio
    codPostal VARCHAR(50), -- Código postal del socio
    nombre VARCHAR(50), -- Nombre del socio
    apellidos VARCHAR(50), -- Apellidos del socio
    direccion VARCHAR(50), -- Dirección del socio
    provincia VARCHAR(50), -- Provincia del socio
    fechaAlta DATE, -- Fecha de alta del socio
    cuotaActual DECIMAL(10,2), -- Cuota actual del socio
    CONSTRAINT FK_codClubSocios FOREIGN KEY (codClub) REFERENCES Clubes(codClub) -- Relación con la tabla Clubes
);

-- Crea la tabla 'Jugadores' para almacenar datos de los jugadores
CREATE TABLE Jugadores(
    codJugador INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- Clave primaria única y autoincremental
    club VARCHAR(50), -- Nombre del club al que pertenece el jugador
    jugador VARCHAR(50), -- Nombre del jugador
    dorsal INT, -- Número de dorsal
    codPais INT NOT NULL, -- Clave foránea para el país del jugador
    codDem INT NOT NULL, -- Clave foránea para la demarcación o posición del jugador
    CONSTRAINT FK_codPais FOREIGN KEY (codPais) REFERENCES Paises(codPais), -- Relación con la tabla Paises
    CONSTRAINT FK_codDem FOREIGN KEY (codDem) REFERENCES Demarcacion(codDem) -- Relación con la tabla Demarcacion
);

-- Crea la tabla 'Club_Jugador' para relacionar jugadores con sus clubes
CREATE TABLE Club_Jugador(
    codClubJug INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- Clave primaria única y autoincremental
    codClub INT NOT NULL, -- Clave foránea para el club
    codJugador INT NOT NULL, -- Clave foránea para el jugador
    liga VARCHAR(50), -- Liga en la que juega el club
    CONSTRAINT FK_codClubJugador FOREIGN KEY (codClub) REFERENCES Clubes(codClub), -- Relación con la tabla Clubes
    CONSTRAINT FK_codJugador FOREIGN KEY (codJugador) REFERENCES Jugadores(codJugador) -- Relación con la tabla Jugadores
);

-- Crea la tabla 'Equipacion' para almacenar la información de la equipación de cada club
CREATE TABLE Equipacion(
    codEquip INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- Clave primaria única y autoincremental
    encasa VARCHAR(50), -- Equipación cuando el club juega en casa
    codClub INT NOT NULL, -- Clave foránea para el club correspondiente
    CONSTRAINT FK_codClubEquip FOREIGN KEY (codClub) REFERENCES Clubes(codClub) -- Relación con la tabla Clubes
);

-- Crea la tabla 'Palmares' para almacenar el historial de trofeos de cada club
CREATE TABLE Palmares(
    codPalmares INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- Clave primaria única y autoincremental
    anio DATE, -- Año en el que el club ganó el trofeo
    codClub INT NOT NULL, -- Clave foránea para el club
    codTrofeo INT NOT NULL, -- Clave foránea para el trofeo o campeonato
    CONSTRAINT FK_codClubPalmares FOREIGN KEY (codClub) REFERENCES Clubes(codClub), -- Relación con la tabla Clubes
    CONSTRAINT FK_codTrofeo FOREIGN KEY (codTrofeo) REFERENCES Campeonato(codTrofeo) -- Relación con la tabla Campeonato
);

-- Crea la tabla 'Sponsor' para almacenar los patrocinadores de los clubes
CREATE TABLE Sponsor(
    codSponsor INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- Clave primaria única y autoincremental
    sponsor VARCHAR(50), -- Nombre del patrocinador
    codClub INT NOT NULL, -- Clave foránea para el club patrocinado
    CONSTRAINT FK_codClubSponsor FOREIGN KEY (codClub) REFERENCES Clubes(codClub) -- Relación con la tabla Clubes
);

-- Crea la tabla 'Entren_Clubes' para relacionar entrenadores con clubes
CREATE TABLE Entren_Clubes(
    codEntrenClub INT PRIMARY KEY AUTO_INCREMENT NOT NULL, -- Clave primaria única y autoincremental
    codClub INT NOT NULL, -- Clave foránea para el club
    codEntren INT NOT NULL, -- Clave foránea para el entrenador
    CONSTRAINT FK_codClubEntren FOREIGN KEY (codClub) REFERENCES Clubes(codClub), -- Relación con la tabla Clubes
    CONSTRAINT FK_codEntren FOREIGN KEY (codEntren) REFERENCES Entrenadores(codEntren) -- Relación con la tabla Entrenadores
);
