/* 
*	Program Transact-SQL de creare
*	a tabelelor CURSE, PASAGERI, FACTURI, REZERVARI
*	Script generat de MySql
*/
use zboruri;


CREATE TABLE CURSE (
	IdCursa int AUTO_INCREMENT NOT NULL ,
	AeroportPlecare varchar(50),
	 AeroportSosire   varchar(50),
	 DataC   datetime,
	 NrLocuriLibere   int  NULL,
	 PRIMARY KEY(IdCursa)
); 
CREATE TABLE FACTURI (
	 IdFactura   int  AUTO_INCREMENT NOT NULL ,
	 IdPasager   int  NULL ,
	 DataFacturarii   datetime  NULL ,
	 Pret   int  NULL,
	 PRIMARY KEY(IdFactura)
);
CREATE TABLE PASAGERI (
	 IdPasager   int  NOT NULL ,
	 Nume   varchar(50) ,
	 Prenume   varchar(50) ,
	 Adresa   varchar(50) ,
	 NrCreditCard   varchar(50),
	 PRIMARY KEY(IdPasager)
);
CREATE TABLE REZERVARI (
	 IdRezervare   int  AUTO_INCREMENT NOT NULL ,
	 IdPasager   int  NULL ,
	 IdCursa   int  NULL,
	 PRIMARY KEY(IdRezervare) 
);


