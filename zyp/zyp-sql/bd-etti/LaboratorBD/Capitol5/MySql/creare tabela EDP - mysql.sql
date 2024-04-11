-- Fisier script de creare a tabelelor EDP, EP, PD in MySql

use lab5;

CREATE TABLE EDP (
	IdElev	char(10),
	IdDisciplina char(10),
	IdProfesor char(10),
	CONSTRAINT PK_EDP PRIMARY KEY(IdElev,IdDisciplina));

INSERT INTO EDP  VALUES ('E1','D1','P1');
INSERT INTO EDP  VALUES ('E1','D2','P2');
INSERT INTO EDP  VALUES ('E2','D1','P1');
INSERT INTO EDP  VALUES ('E2','D2','P2');

CREATE TABLE EP (
	IdElev	char(10),
	IdProfesor char(10),
	CONSTRAINT PK_EP PRIMARY KEY(IdElev,IdProfesor));

INSERT INTO EP  VALUES ('E1','P1');
INSERT INTO EP  VALUES ('E2','P1');
INSERT INTO EP  VALUES ('E2','P2');

CREATE TABLE PD (
	IdProfesor char(10),
	IdDisciplina char(10),
	CONSTRAINT PK_PD PRIMARY KEY(IdProfesor,IdDisciplina));

INSERT INTO PD  VALUES ('P1','D1');
INSERT INTO PD  VALUES ('P2','D2');

SELECT * FROM EDP;
SELECT * FROM EP;
SELECT * FROM PD;

