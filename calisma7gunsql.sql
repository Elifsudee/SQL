--INTERSECT: Iki sorgu ifadesinin kesisim degerlerini verir

--EXCEPT: Ilk sorguda olup ikinci sorguda olmayan degerleri verir.

CREATE TABLE isciler 
(
	isim VARCHAR(20), 
	sehir VARCHAR(20), 
	maas int, 
	sirket VARCHAR(20)
);
   
INSERT INTO isciler VALUES('Ahmet Yorgun', 'Istanbul', 6500, 'Honda');
INSERT INTO isciler VALUES('Vural Solgun', 'Istanbul', 5500, 'Toyota');
INSERT INTO isciler VALUES('Murat Oz', 'Ankara', 4500, 'Honda'); 
INSERT INTO isciler VALUES('Murat Oz', 'Istanbul', 4500, 'Honda'); 
INSERT INTO isciler VALUES('Murat Oz', 'Izmir', 7000, 'Ford');
INSERT INTO isciler VALUES('Vural Solgun', 'Ankara', 5500, 'Ford');
INSERT INTO isciler VALUES('Harun Sarsılmaz','Bursa', 5200, 'Honda');

 -- SORU1: isim'i 'Murat Oz' olanlarin isim'lerini, sehir'lerini ve
 -- sehir'i 'Istanbul' olmayanların isim'lerini sehir'lerini bulup  
 -- iki sorgunun kesisimini listeleyiniz 
 
 
 
  -- SORU2: isim'i 'Murat Oz' olanlarin isim'lerini, sehir'lerini ve
 -- sehir'i 'Istanbul' olmayanların isim'lerini sehir'lerini bulup  
 -- ilk sorguda olup ikinci sorguda olmayan degerleri listeleyiniz 
 
 
 
 
 /*=====================================EXISTS============================================================

Subquery'lerde kullanılır. Mevcut ise getir anlamında kullanılır.

EXISTS veya NOT EXISTS ifadeleri alt sorgudan getirilen degerlerin içerisinde bir degerin
olması veya olmaması durumunda işlem yapılmasını saglar

========================================================================================================*/




CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');


CREATE TABLE nisan 
(   
urun_id int ,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');

select * from mart;

-- SORU1:  MART ve NİSAN aylarında aynı urun_id ile satılan ürünlerin urun_id'lerini
-- ve aynı zamanda bu ürünleri MART ayında alan musteri_isim 'lerini listeleyiniz 
--(mart tablosundaki urun id nisan tablosunda da mevcutsa lislele)


/*ÖDEV:

--MART ve NİSAN aylarında aynı urun_id ile satılmayan ürünlerin urun_id'lerini
  ve aynı zamanda bu ürünleri MART ayında alan musteri_isim 'lerini listeleyiniz 
*/



-- SORU2: MART ve NİSAN aylarında aynı urun_isim'i ile satılan ürünlerin urun_isim'lerini                  
-- ve aynı zamanda bu ürünleri NİSAN ayında alan musteri_isim'lerini listeleyiniz


/*========================================= JOIN İSLEMLERİ ===================================================
 
    Join islemleri: iki tabloyu birlestirmek için kullanılır.

    3 Cesit Join islemi kullanilabilmektedir.
    
    1) INNER JOIN: Tablolardaki ortak olan verileri listeler.
    2) LEFT JOIN:  ilk tabloda olan tum verileri listeler.
    3) RIGHT JOIN: ikinci tabloda olan tum verileri listeler.

       FULL JOIN: her iki tablodaki verilerin tamamını listeler (Left Join + Union + Right Join)

 	Syntax
    -----------
    SELECT sutun1,sutun2... FROM tablo1_adi    
           
    ....JOIN tablo2_adi 
        
    ON tablo1_adi.ortak_sutun = tablo2_adi.ortak_sutun;

===================================================================================================================*/ 




create table qa_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);

insert into qa_dersler values (101, 'Core Java', 40);
insert into qa_dersler values (102, 'Selenium', 30);
insert into qa_dersler values (103, 'API', 15);
insert into qa_dersler values (104, 'SQL', 10);
insert into qa_dersler values (105, 'SDLC', 10);
insert into qa_dersler values (106, 'LAMDA', 12);




create table developer_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);

insert into developer_dersler values (101, 'Core Java', 40);
insert into developer_dersler values (103, 'API', 15);
insert into developer_dersler values (104, 'SQL', 10);
insert into developer_dersler values (105, 'SDLC', 10);
insert into developer_dersler values (106, 'LAMDA', 12);
insert into developer_dersler values (107, 'Spring Framework', 20);
insert into developer_dersler values (108, 'Micro Services', 12);


select * from qa_dersler;



--SORU1: join kullanarak qa_dersler'ini listeleyeniz


--SORU2: join kullanarak ortak dersleri listeleyiniz 



--SORU3: join kullanarak qa_dersleri ve developer_dersleri tablosundaki verilerin tamamını listeleyiniz



create table filmler
(film_id int,
film_name varchar(30),
category varchar(30)
);

insert into filmler values (100, 'Eyvah Eyvah', 'Komedi');
insert into filmler values (200, 'Kurtlar Vadisi', 'Aksiyon');
insert into filmler values (300, 'Eltilerin Savasi', 'Komedi');
insert into filmler values (400, 'Aile Arasinda', 'Komedi');
insert into filmler values (500, 'GORA', 'Bilim Kurgu');
insert into filmler values (600, 'Organize Isler', 'Komedi');
insert into filmler values (700, 'Babam ve Oglum', 'Dram');


create table aktorler
(id int,
actor_name varchar(30),
film_id int
);

insert into aktorler values (1, 'Ata Demirer', 100);
insert into aktorler values (2, 'Necati Sasmaz', 200);
insert into aktorler values (3, 'Gupse Ozay', 300);
insert into aktorler values (4, 'Engin Gunaydin', 400);
insert into aktorler values (5, 'Cem Yilmaz', 500);

select * from filmler;



-- SORU1: Tüm film_name'leri, tüm category'lerini ve filmlerde oynayan actor_name'leri listeleyiniz.
--filmler tablosu esas tablomuz tum dedigi icin



-- SORU2: Tüm actor_name'leri ve film_name'lerini listeleyiniz.

