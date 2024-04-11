-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_rezervare`(
	IN TIdPasager INT, 
	IN TNume varchar(20),
	IN TPrenume varchar(20), 
	IN TAdresa varchar(20),
	IN TCard varchar(20), 
	IN TPlecare varchar(20),
	IN TSosire varchar(20),
	IN TData varchar(20),
	IN TPret INT, 
	OUT TREZULTAT varchar(20)
)
BEGIN

DECLARE TIdCursa int;
DECLARE TNrLocuri INT;
DECLARE mesaj varchar(10);

START TRANSACTION;
 
INSERT INTO PASAGERI VALUES (TIdPasager,TNume, TPrenume, TAdresa, TCard);
SELECT NrLocuriLibere , IdCursa into TNrLocuri, TIdCursa FROM CURSE WHERE AeroportPlecare = TPlecare AND AeroportSosire = TSosire AND DataC = TData;
IF TNrLocuri>0 THEN
	INSERT INTO REZERVARI(IdPasager, IdCursa) VALUES(TIdPasager,TIdCursa);
    UPDATE CURSE SET NrLocuriLibere = TNrLocuri-1 WHERE IdCursa = TIdCursa;
    INSERT INTO FACTURI(IdPasager, DataFacturarii, Pret) VALUES(TIdPasager,CURDATE(),TPret);
	COMMIT;  
	SET TREZULTAT = 'Tranzactie validata';
ELSE 
      ROLLBACK;
      SET TREZULTAT = 'Tranzactie anulata';
END IF;
END
