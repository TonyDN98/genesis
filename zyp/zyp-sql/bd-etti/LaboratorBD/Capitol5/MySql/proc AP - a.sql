-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_normalizare`(IN n_angajat INT, IN n_nume varchar(20), IN n_prenume varchar(20), 
	IN n_adresa varchar(20), IN n_proiect varchar(10), IN n_ore int,
	OUT raspuns INT)
BEGIN
DECLARE v_angajat int;
DECLARE v_nume varchar(20);
DECLARE v_prenume varchar(20);
DECLARE v_adresa varchar(20);
DECLARE mesaj varchar(20);
DECLARE no_more_rows BOOLEAN;

-- Crearea unui cursor
DECLARE cursor_AP CURSOR
FOR
SELECT AP.IdAngajat,AP.Nume,AP.Prenume,AP.Adresa FROM AP;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

SET raspuns = 1;

-- Deschiderea cursorului
OPEN cursor_AP;

-- Parcurgerea liniilor tabelului AP folosind cursorul	
the_loop: LOOP
	FETCH cursor_AP INTO v_angajat, v_nume, v_prenume, v_adresa;
	IF n_angajat = v_angajat AND(n_nume != v_nume OR n_prenume != v_prenume 
			OR n_adresa != v_adresa) THEN
			set raspuns = 0;
			LEAVE the_loop;
		ELSE
			IF no_more_rows THEN
				LEAVE the_loop;
			END IF;
		END IF;
END LOOP the_loop;

CLOSE cursor_AP;

select raspuns;
IF raspuns = 1 THEN
	INSERT INTO AP VALUES(n_angajat, n_nume, n_prenume, n_adresa,n_proiect,n_ore);
END IF;

END
