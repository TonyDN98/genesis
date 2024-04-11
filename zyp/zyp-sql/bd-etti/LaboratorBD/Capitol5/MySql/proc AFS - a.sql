-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `afs`(IN n_angajat INT, IN n_nume varchar(20), IN n_prenume varchar(20), IN n_functie varchar(20), IN n_salariu decimal, OUT raspuns INT)
BEGIN
DECLARE v_functie varchar(20);
DECLARE v_salariu decimal;
DECLARE mesaj varchar(20);
DECLARE no_more_rows BOOLEAN;

-- Crearea unui cursor 
DECLARE cursor_AFS CURSOR
FOR
SELECT Functie, Salariu FROM AFS;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

SET raspuns = 1;

OPEN Cursor_AFS;

-- Parcurgerea liniilor tabelului AP folosind cursorul	
the_loop: LOOP
	FETCH cursor_AFS INTO v_functie, v_salariu;
	IF n_functie = v_functie AND n_salariu != v_salariu THEN
			set raspuns = 0;
			LEAVE the_loop;
		ELSE
			IF no_more_rows THEN
				LEAVE the_loop;
			END IF;
		END IF;
END LOOP the_loop;

CLOSE cursor_AFS;

select raspuns;
IF raspuns = 1 THEN
	INSERT INTO AFS(IdAngajat, Nume, Prenume, DataNasterii, Adresa, Functie, Salariu) VALUES(n_angajat, n_nume, n_prenume, '2010-01-01', 'Bucuresti', n_functie, n_salariu);
END IF;
END
