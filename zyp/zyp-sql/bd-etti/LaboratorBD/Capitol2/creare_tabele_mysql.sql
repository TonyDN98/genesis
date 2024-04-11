
-- Fisier script de creare a tabelelor 
-- ANGAJATI si SECTII  in MYSQL

DROP TABLE ANGAJATI;

CREATE TABLE ANGAJATI (
	IdAngajat	int PRIMARY KEY AUTO_INCREMENT,
	Nume 		varchar(20)	NOT NULL,
	Prenume  	varchar(20)	NOT NULL,
	DataNasterii 	date,
	Adresa   	varchar(50),
	Salariu  	decimal DEFAULT 2800,
	IdSectie	int
);

DROP TABLE SECTII;
CREATE TABLE SECTII (
	IdSectie	int PRIMARY KEY AUTO_INCREMENT,
	Nume 		varchar(50)	NOT NULL,
	Buget 		decimal
);

ALTER TABLE ANGAJATI 
	ADD CONSTRAINT FOREIGN KEY (IdSectie) REFERENCES SECTII(IdSectie);
	
