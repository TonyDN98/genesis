CREATE TABLE opera(
	cod_opera NUMBER,
    tip VARCHAR2(15),
    titlu VARCHAR2(100),
    cod_artist NUMBER,
    data_crearii DATE,
    data_achizitiei DATE,
    valoare NUMBER,
    cod_galerie NUMBER,
    cod_sala NUMBER,
    material VARCHAR2(2000),
    stil VARCHAR2(100),
    dim1 NUMBER,
    dim2 NUMBER,
    stare VARCHAR2(50));
   
CREATE TABLE artist (
	cod_artist NUMBER,
	nume VARCHAR2(30),
	prenume VARCHAR2(30),
	pseudonim VARCHAR2(30),
	anul_nastere VARCHAR2(4),
	anul_mortii VARCHAR2(4),
	national VARCHAR2(40),
	sum_val NUMBER,
	observatii VARCHAR2(2000));

CREATE TABLE politaasig  (
	cod_polita VARCHAR2(30),
	descriere VARCHAR2(200),
	firma VARCHAR2(50),
	valoare NUMBER,
	data_contract DATE);

CREATE TABLE specialist (
	cod_specialist NUMBER,
	nume VARCHAR2(30),
	prenume VARCHAR2(40),
	autorizatie VARCHAR2(5),
	cod_adresa NUMBER);

CREATE TABLE studiaza (
	cod_specialist NUMBER,
	cod_opera NUMBER,
	data_start DATE,
	data_end DATE,);
