DROP DATABASE IF EXISTS BANCOS;
CREATE DATABASE BANCOS;
USE BANCOS;


-- CREACIoN DE TABLAS
CREATE TABLE CLIENTES(
     cedula VARCHAR (15)  NOT NULL ,
     nombre VARCHAR (30)  NOT NULL ,
     ciudad VARCHAR (30)  NOT NULL ,
     telefono VARCHAR (15)  NOT NULL
) ;

ALTER TABLE CLIENTES 
    ADD CONSTRAINT CLIENTE_PK PRIMARY KEY ( cedula ) ;

CREATE TABLE CLI_CUENTAS (
     ced_cliente VARCHAR (15)  NOT NULL ,
     nro_cuenta INTEGER  NOT NULL 
) ;



ALTER TABLE CLI_CUENTAS 
    ADD CONSTRAINT CLI_CUENTA_PK PRIMARY KEY ( nro_cuenta, ced_cliente ) ;

CREATE TABLE CLI_PRESTAMOS (
     ced_cliente VARCHAR (15)  NOT NULL ,
     nro_prestamo INTEGER  NOT NULL 
);



ALTER TABLE CLI_PRESTAMOS 
    ADD CONSTRAINT CLI_PRES_PK PRIMARY KEY ( ced_cliente, nro_prestamo ) ;

CREATE TABLE CUENTAS 
    ( 
     nro_cuenta INTEGER  NOT NULL , 
     saldo REAL  NOT NULL , 
     cod_suc INTEGER  NOT NULL 
    ) 
;



ALTER TABLE CUENTAS 
    ADD CONSTRAINT CUENTA_PK PRIMARY KEY ( nro_cuenta ) ;

CREATE TABLE PRESTAMOS 
    ( 
     nro_prestamo INTEGER  NOT NULL , 
     valor REAL  NOT NULL , 
     saldo REAL  NOT NULL , 
     cod_suc INTEGER  NOT NULL 
    ) 
;


ALTER TABLE PRESTAMOS 
    ADD CONSTRAINT PRESTAMO_PK PRIMARY KEY ( nro_prestamo ) ;

CREATE TABLE SUCURSALES 
    ( 
     codigo INTEGER  NOT NULL , 
     nombre VARCHAR (30)  NOT NULL ,
     ciudad VARCHAR (30)  NOT NULL ,
     activo REAL  NOT NULL 
    ) 
;



ALTER TABLE SUCURSALES 
    ADD CONSTRAINT SUCURSAL_PK PRIMARY KEY ( codigo ) ;



ALTER TABLE CLI_CUENTAS 
    ADD CONSTRAINT CLI_CUENTA_CLIENTE_FK FOREIGN KEY 
    ( 
     ced_cliente
    ) 
    REFERENCES CLIENTES 
    ( 
     cedula
    ) 
;

ALTER TABLE CLI_CUENTAS 
    ADD CONSTRAINT CLI_CUENTA_CUENTA_FK FOREIGN KEY 
    ( 
     nro_cuenta
    ) 
    REFERENCES CUENTAS 
    ( 
     nro_cuenta
    ) 
;


ALTER TABLE CLI_PRESTAMOS 
    ADD CONSTRAINT CLI_PRES_CLIENTE_FK FOREIGN KEY 
    ( 
     ced_cliente
    ) 
    REFERENCES CLIENTES 
    ( 
     cedula
    ) 
;


ALTER TABLE CLI_PRESTAMOS 
    ADD CONSTRAINT CLI_PRES_PRESTAMO_FK FOREIGN KEY 
    ( 
     nro_prestamo
    ) 
    REFERENCES PRESTAMOS 
    ( 
     nro_prestamo
    ) 
;


ALTER TABLE CUENTAS 
    ADD CONSTRAINT CUENTA_SUCURSAL_FK FOREIGN KEY 
    ( 
     cod_suc
    ) 
    REFERENCES SUCURSALES 
    ( 
     codigo
    ) 
;


ALTER TABLE PRESTAMOS 
    ADD CONSTRAINT PRESTAMO_SUCURSAL_FK FOREIGN KEY 
    ( 
     cod_suc
    ) 
    REFERENCES SUCURSALES 
    ( 
     codigo
    ) 
;