-- Trigger DDL Statements
DELIMITER $$

USE `lab5`$$

CREATE
DEFINER=`root`@`localhost`
TRIGGER `lab5`.`tg_AFS`
AFTER INSERT ON `lab5`.`AFS`
FOR EACH ROW
BEGIN
DECLARE v_functia varchar(20);
DECLARE v_salariu decimal;
DECLARE n_functia varchar(20);
DECLARE n_salariu decimal;
DECLARE mesaj varchar(20);
DECLARE no_more_rows BOOLEAN;

-- Crearea unui cursor 
DECLARE cursor_AFS CURSOR
FOR
SELECT Functie, Salariu FROM AFS;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

SET n_functia = new.Functie, n_salariu = new.Salariu;

OPEN Cursor_AFS;

-- Parcurgerea liniilor tabelului AP folosind cursorul	
the_loop: LOOP
	FETCH cursor_AFS INTO v_functia, v_salariu;
	IF n_functia = v_functia AND n_salariu != v_salariu THEN
			set mesaj = "Eroare DF";
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mesaj;
		ELSE
			IF no_more_rows THEN
				LEAVE the_loop;
			END IF;
		END IF;
END LOOP the_loop;

CLOSE cursor_AFS;
END$$
