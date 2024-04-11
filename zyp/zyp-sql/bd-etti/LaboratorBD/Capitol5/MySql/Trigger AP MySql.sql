-- Trigger DDL Statements
DELIMITER $$

USE `lab5`$$

CREATE
DEFINER=`root`@`localhost`
TRIGGER `lab5`.`tg_AP`
AFTER INSERT ON `lab5`.`AP`
FOR EACH ROW
BEGIN
DECLARE v_angajat int;
DECLARE v_nume varchar(20);
DECLARE v_prenume varchar(20);
DECLARE v_adresa varchar(20);
DECLARE n_angajat int;
DECLARE n_proiect varchar(20) ;
DECLARE n_nume varchar(20);
DECLARE n_prenume varchar(20);
DECLARE n_adresa varchar(20);
DECLARE mesaj varchar(20);
DECLARE no_more_rows BOOLEAN;

-- Crearea unui cursor
DECLARE cursor_AP CURSOR
FOR
SELECT AP.IdAngajat,AP.Nume,AP.Prenume,AP.Adresa FROM AP;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

-- Memorarea valorilor atributelor liniei nou inserate
SET n_angajat = new.IdAngajat, n_proiect = new.IdProiect,
	n_nume = new.Nume, n_prenume = new.Prenume,n_adresa = new.Adresa;

-- Deschiderea cursorului
OPEN cursor_AP;

-- Parcurgerea liniilor tabelului AP folosind cursorul	
the_loop: LOOP
	FETCH cursor_AP INTO v_angajat, v_nume, v_prenume, v_adresa;
	IF n_angajat = v_angajat AND(n_nume != v_nume OR n_prenume != v_prenume 
			OR n_adresa != v_adresa) THEN
			set mesaj = "Eroare DF";
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mesaj;
		ELSE
			IF no_more_rows THEN
				LEAVE the_loop;
			END IF;
		END IF;
END LOOP the_loop;

CLOSE cursor_AP;
END$$


