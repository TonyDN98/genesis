
-- Introducere linii in tabelul SECTII

INSERT INTO SECTII (Nume, Buget) VALUES ('Productie', 400000);

-- Introducere linii in tabelul ANGAJATI

INSERT INTO ANGAJATI (Nume, Prenume, IdSectie) VALUES ('Ionescu', 'Ion',1);
INSERT INTO ANGAJATI (Nume, Prenume, IdSectie) VALUES ('Popescu', 'Petre', 1);
INSERT INTO ANGAJATI (IdAngajat, Nume, Prenume) VALUES (8, 'NumeA', 'PrenumeA');
INSERT INTO ANGAJATI (Nume, Prenume) VALUES('NumeB', 'PrenumeB');
INSERT INTO ANGAJATI (Nume, Prenume,IdSectie) VALUES ('Vasilescu', 'Ana',2);

SELECT * FROM SECTII;
SELECT * FROM ANGAJATI;