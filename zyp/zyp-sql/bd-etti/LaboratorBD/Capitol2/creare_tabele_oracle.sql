
-- Fisier script de creare a tabelelor 
-- ANGAJATI si SECTII  in Oracle

DROP TABLE ANGAJATI;
DROP TABLE SECTII;
DROP SEQUENCE PK_ANGAJATI;
DROP SEQUENCE PK_SECTII;

CREATE TABLE ANGAJATI (
	IdAngajat	NUMBER PRIMARY KEY,
	Nume 		varchar(20)	NOT NULL,
	Prenume  	varchar(20)	NOT NULL,
	DataNasterii 	date,
	Adresa   	varchar(50),
	Salariu  	decimal DEFAULT 2800,
	IdSectie NUMBER
);

CREATE TABLE SECTII (
	IdSectie	NUMBER PRIMARY KEY,
	Nume 		varchar(50)	NOT NULL,
	Buget 		decimal
);


CREATE SEQUENCE PK_SECTII;
CREATE SEQUENCE PK_ANGAJATI;

ALTER TABLE ANGAJATI ADD FOREIGN KEY (IdSectie) REFERENCES SECTII(IdSectie);
	