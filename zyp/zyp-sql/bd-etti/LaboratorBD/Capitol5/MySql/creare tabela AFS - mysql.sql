use lab5;

-- Fisier script de creare a tabelului AFS in MySQL

CREATE TABLE AFS (
	IdAngajat	INT PRIMARY KEY,
	Nume 		varchar(20)	NOT NULL,
	Prenume  	varchar(20)	NOT NULL,
	DataNasterii 	datetime,
	Adresa   	varchar(50),
	Functie		varchar(50),
	Salariu  	decimal DEFAULT 2800);

INSERT INTO AFS (IdAngajat, Nume, Prenume, Functie, Salariu) VALUES (1,'Nume1', 'Prenume1', 'Inginer', 3000);
INSERT INTO AFS (IdAngajat, Nume, Prenume, Functie, Salariu) VALUES (2,'Nume2', 'Prenume2', 'Inginer', 3000);
INSERT INTO AFS (IdAngajat, Nume, Prenume, Functie, Salariu) VALUES (3,'Nume3', 'Prenume3', 'Tehnician', 2000);
INSERT INTO AFS (IdAngajat, Nume, Prenume, Functie, Salariu) VALUES (4,'Nume4', 'Prenume4', 'Tehnician', 2000);
INSERT INTO AFS (IdAngajat, Nume, Prenume, Functie, Salariu) VALUES (5,'Nume5', 'Prenume5', 'Secretara', 1500);


