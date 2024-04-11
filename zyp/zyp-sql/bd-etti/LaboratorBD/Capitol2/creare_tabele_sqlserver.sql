
-- Fisier script de creare a tabelelor 
-- ANGAJATI si SECTII in SQL Server

DROP TABLE ANGAJATI
GO

CREATE TABLE ANGAJATI (
	IdAngajat	int PRIMARY KEY IDENTITY,
	Nume 		varchar(20)	NOT NULL,
	Prenume  	varchar(20)	NOT NULL,
	DataNasterii 	datetime,
	Adresa   	varchar(50),
	Salariu  	decimal DEFAULT 2800,
	IdSectie	int
)
GO

DROP TABLE SECTII
GO
CREATE TABLE SECTII (
	IdSectie	int PRIMARY KEY IDENTITY,
	Nume 		varchar(50)	NOT NULL,
	Buget 		decimal
)
GO
ALTER TABLE ANGAJATI 
	ADD CONSTRAINT FK_ANGAJATI FOREIGN KEY (IdSectie) REFERENCES SECTII(IdSectie);

GO
