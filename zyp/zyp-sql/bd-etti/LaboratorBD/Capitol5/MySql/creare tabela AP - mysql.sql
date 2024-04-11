
-- Fisier script de creare a tabelului AP in MySql

use lab5;

CREATE TABLE AP (
	IdAngajat	INT,
	Nume 		varchar(20)	NOT NULL,
	Prenume  	varchar(20)	NOT NULL,
	Adresa   	varchar(20),
	IdProiect	varchar(20),
	Ore  		decimal,
	CONSTRAINT PK_AP PRIMARY KEY(IdAngajat,IdProiect));

INSERT INTO AP (IdAngajat, Nume, Prenume, Adresa, IdProiect, Ore) VALUES (1,'Nume1', 'Prenume1', 'Adresa1', 'P1', 100);
INSERT INTO AP (IdAngajat, Nume, Prenume, Adresa, IdProiect, Ore) VALUES (1,'Nume1', 'Prenume1', 'Adresa1', 'P2', 200);
INSERT INTO AP (IdAngajat, Nume, Prenume, Adresa, IdProiect, Ore) VALUES (2,'Nume2', 'Prenume2', 'Adresa2', 'P1', 300);
INSERT INTO AP (IdAngajat, Nume, Prenume, Adresa, IdProiect, Ore) VALUES (2,'Nume2', 'Prenume2', 'Adresa2', 'P2', 400);


