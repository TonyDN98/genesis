-- Trigger DDL Statements
DELIMITER $$

USE `lab5`$$

CREATE
DEFINER=`root`@`localhost`
TRIGGER `lab5`.`tg_EDP`
AFTER INSERT ON `lab5`.`EDP`
FOR EACH ROW
BEGIN
DECLARE n_disciplina char(10);
DECLARE n_profesor char(10);
DECLARE v_disciplina char(10);
DECLARE v_profesor char(10);
DECLARE mesaj varchar(20);
DECLARE no_more_rows BOOLEAN;

-- Creare si deschidere cursor
DECLARE cursor_EDP CURSOR 
FOR
SELECT IdDisciplina, IdProfesor FROM EDP;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows = TRUE;

SET n_disciplina = new.IdDisciplina, n_profesor = new.IdProfesor;

OPEN cursor_EDP;

-- Parcurgerea liniilor tabelului AP folosind cursorul	
the_loop: LOOP
	FETCH cursor_EDP INTO v_disciplina, v_profesor;
	IF n_profesor=v_profesor AND n_disciplina!= v_disciplina THEN
			set mesaj = "Eroare DF";
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = mesaj;
		ELSE
			IF no_more_rows THEN
				LEAVE the_loop;
			END IF;
		END IF;
END LOOP the_loop;

CLOSE cursor_EDP;
END$$
