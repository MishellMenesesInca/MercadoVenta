-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-01-22 20:37:50.322
drop database mercadoventas
create database mercadoventas
-- tables
-- Table: PERSONA
CREATE TABLE PERSONA (
                         IDPER int  NOT NULL,
                         NOMPER varchar(30)  NOT NULL,
                         APEPAEMP varchar(30)  NOT NULL,
                         APEMAEMP varchar(30)  NOT NULL,
                         CELPER Char(9)  NOT NULL,
                         DNIPER Char(8)  NOT NULL,
                         EMAPER varchar(30)  NOT NULL,
                         DIRPER varchar(30)  NOT NULL,
                         TIPPER char(1)  NOT NULL,
                         CODUBI Char(6)  NOT NULL,
                         CONSTRAINT PERSONA_pk PRIMARY KEY (IDPER)
);

-- Table: PRENDA
CREATE TABLE PRENDA (
                        IDPRE int  NOT NULL,
                        TIPPRE varchar(50)  NOT NULL,
                        NOMPRE varchar(50)  NOT NULL,
                        DESPRE varchar(80)  NOT NULL,
                        IMGPRE varchar(600)  NOT NULL,
                        GENPRE varchar(20)  NOT NULL,
                        PREPRE decimal(8,2)  NOT NULL,
                        TALPRE CHAR(5)  NOT NULL,
                        COLPRE varchar(25)  NOT NULL,
                        MARPRE varchar(50)  NOT NULL,
                        ESTPRE CHAR(1)  NOT NULL,
                        STOCKPRE int  NOT NULL,
                        CONSTRAINT PRENDA_pk PRIMARY KEY (IDPRE)
);

-- Table: UBIGEO
CREATE TABLE UBIGEO (
                        CODUBI CHAR(6)  NOT NULL,
                        DEPUBI varchar(40)  NOT NULL,
                        PROUBI varchar(40)  NOT NULL,
                        DISUBI varchar(40)  NOT NULL,
                        CONSTRAINT UBIGEO_pk PRIMARY KEY (CODUBI)
);

-- Table: USUARIO
CREATE TABLE USUARIO (
                         IDUSU int  NOT NULL,
                         NOMUSU varchar(50)  NOT NULL,
                         APEPAUSU varchar(50)  NOT NULL,
                         APEMAUSU varchar(50)  NOT NULL,
                         EMAUSU varchar(50)  NOT NULL,
                         ESTUSU Char(1)  NOT NULL,
                         CONUSU varchar(50)  NOT NULL,
                         NIVUSU Char(1)  NOT NULL,
                         CONSTRAINT USUARIO_pk PRIMARY KEY (IDUSU)
);

-- Table: VENTA
CREATE TABLE VENTA (
                       IDVEN int  NOT NULL,
                       FECVEN DATE  NOT NULL,
                       METPAGVEN varchar(50)  NOT NULL,
                       PRETOTVEN numeric(10,2)  NOT NULL,
                       ESTVEN CHAR(1)  NOT NULL,
                       IDPERVEN int  NOT NULL,
                       CONSTRAINT VENTA_pk PRIMARY KEY (IDVEN)
);

-- Table: VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
                               IDVENDET int  NOT NULL,
                               CANPRE int  NOT NULL,
                               SUBTOTVEN numeric(10,2)  NOT NULL,
                               IDVEN int  NOT NULL,
                               IDPRE int  NOT NULL,
                               USUVENDET int  NOT NULL,
                               CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY (IDVENDET)
);

-- foreign keys
-- Reference: USUARIO_UBICACION (table: PERSONA)
ALTER TABLE PERSONA ADD CONSTRAINT USUARIO_UBICACION
    FOREIGN KEY (CODUBI)
        REFERENCES UBIGEO (CODUBI)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: VENTA_DETALLE_PRENDA (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_PRENDA
    FOREIGN KEY (IDPRE)
        REFERENCES PRENDA (IDPRE)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: VENTA_DETALLE_USUARIO (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_USUARIO
    FOREIGN KEY (USUVENDET)
        REFERENCES USUARIO (IDUSU)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: VENTA_DETALLE_VENTA (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_VENTA
    FOREIGN KEY (IDVEN)
        REFERENCES VENTA (IDVEN)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- Reference: VENTA_USUARIO (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_USUARIO
    FOREIGN KEY (IDPERVEN)
        REFERENCES PERSONA (IDPER)
        NOT DEFERRABLE
            INITIALLY IMMEDIATE
;

-- End of file.
