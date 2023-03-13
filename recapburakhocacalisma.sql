create table memurlar
(
id int,
isim varchar(20),
soyisim varchar(25),
maas int,
sicil_notu int
);


insert into memurlar values(1,'Ali','Ozturk',50000,100);
insert into memurlar values(2,'Adem','Tan',40000,90);
insert into memurlar values(3,'Halit','Ozyıldızlı',35000,85);
insert into memurlar values(4,'Hasan','Oz',45000,95);
insert into memurlar values(5,'Recep','Cicek',30000,80);
insert into memurlar values(6,'Harun','Sever',20000,70);
insert into memurlar values(7,'Hatice','Tarkan',25000,75);
insert into memurlar values(8,'Poyraz','Yuzbası',10000,60);
insert into memurlar values(9,'Ayse','Karlı',15000,65);
insert into memurlar values(10,'Adem','Akmaz',9000,55);

select * from memurlar;

-- SORU1: memurlar tablosunda id'si 5'den buyuk olan,
-- ilk 2 veriyi listeleyiniz


-- SORU2: memurlar tablosunda sicil_notu'i en yuksek 3 kisinin bilgilerini listeleyiniz

--SORU3: memurlar tablosunda maas'i en dusuk 2 kisinin bilgilerini listeleyiniz

-- SORU4: memurlar tablosunda sicil_notu en yuksek 3.4.5. kişilerin bilgilerini listeleyiniz

-- SORU5: memurlar tablosunda soyisim'i en uzun ilk 2 kisinin bilgilerini listeleyiniz


CREATE TABLE calisanlar 
(
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);
INSERT INTO calisanlar VALUES('Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar VALUES('Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar VALUES('Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar VALUES('Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar VALUES('Nisa Can', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar VALUES('Fatma Yasa', 'Bursa', 2500, 'Vakko');


CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);
INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

select * from calisanlar;

--SORU1 : Çalisan sayisi 15.000’den cok olan 'isyeri' lerini,
--calisanlarin 'isim' lerini ve 'maas' larini listeleyin.

--SORU2 : marka id'si 101'den buyuk olan 'isyeri' lerini,
--calisanlarin 'isim' lerini, 'maas' larini ve 'sehir' lerini listeleyiniz

--SORU3: markalar tablosundaki marka_isim'ini, calisan_sayisi'ni 
-- ve o markalara ait toplam maas'ı listeleyiniz

-- SORU4: markalar tablosundaki marka_isim'ini, calisan_sayisi'ni 
-- ve o markalara ait max ve min maas'ı listeleyiniz 


create table kitaplar
(
kitap_id int,
kitap_isim varchar(30)
);

insert into kitaplar values (100, 'intibah');
insert into kitaplar values (200, 'Araba Sevdası');
insert into kitaplar values (300, 'Mai ve Siyah');
insert into kitaplar values (400, 'Eylül');
insert into kitaplar values (500, 'Mürebbiye');
insert into kitaplar values (600, 'Handan');



create table yazarlar
(
yazar_isim varchar(30),
kitap_id int
);

insert into yazarlar values ('Namık Kemal', 100);
insert into yazarlar values ('Recaizade Mahmut Ekrem', 200);
insert into yazarlar values ('Halit Ziya', 300);
insert into yazarlar values ('Mehmet Rauf', 400);
insert into yazarlar values ('Hüseyin Rahmi Gürpınar', 500);
insert into yazarlar values ('Yakup Kadri Karaosmanoğlu', 700);

select * from kitaplar;

-- SORU1: Tüm kitap_isim'lerini ve bu kitapları yazan yazar_isim'lerini listeleyiniz.


-- SORU2: Tüm yazar_isim'lerini ve yazarların kitap_isim'lerini listeleyiniz.


--SORU3: Her iki tabloda kitap_id'si ortak olan verilerin kitap_isim ve yazar_isim'lerini listeleyiniz




















