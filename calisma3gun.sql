
create table kursiyerler
(
id int,
isim varchar(20),
adres varchar(15),
sinav_notu int
);


insert into kursiyerler values(10, 'Arif Can', 'Burdur', 75);
insert into kursiyerler values(11, 'Vural Tur', 'Trabzon', 95);
insert into kursiyerler values(12, 'Aylin Tan', 'Bursa', 90);
insert into kursiyerler values(13, 'Derya Soylu', 'Istanbul', 80);
insert into kursiyerler values(14, 'Yavuz Bal', 'Ankara', 85);
insert into kursiyerler values(15, 'Eren Tan', 'Hatay', 90);
insert into kursiyerler values(16, 'Harun Reşit', 'Isparta', 100);
insert into kursiyerler values(17, 'Behlül Dana', 'Afyon', 100);

select * from kursiyerler;

--SORU1: kursiyerler tablosundaki sinav_notu 75 olan satırı siliniz
;

--SORU2: kursiyerler tablosundaki adres'i 'Trabzon' olan satırı siliniz

--SORU3: kursiyerler tablosundaki isim'i 'Derya Soylu' veya 'Yavuz Bal' olan satırları siliniz

--SORU4: kursiyerler tablosundaki sinav_notu 100 den küçük olan satırları siliniz




--SORU5: kursiyerler tablosundaki tüm verileri siliniz


--SORU6: kursiyerler tablosunu siliniz



create table film
(
film_no int,
film_ismi varchar(30),
film_turu varchar(30)
);

insert into film values (100, 'Eyvah Eyvah', 'Komedi');
insert into film values (200, 'Kurtlar Vadisi', 'Aksiyon');
insert into film values (300, 'Eltilerin Savasi', 'Komedi');
insert into film values (400, 'Aile Arasinda', 'Komedi');
insert into film values (500, 'GORA', 'Bilim Kurgu');
insert into film values (600, 'Organize Isler', 'Komedi');
insert into film values (700, 'Babam ve Oglum', 'Dram');

select * from film;

-- SORU1: film_no'su 300 olan film'in
--film_ismi'ni 'Recep İvedik' olarak güncelleyeniz.



--  SORU2: film tablosundaki tüm film_turu'nu 'Aksiyon' olarak güncelleyeniz.



-- SORU3: film_no'su 100 olan film'in 
--film_ismi'ni 'Cakallarla Dans' , film_turu'nu 'Komedi' olarak güncelleyiniz.

-- SORU4: film_ismi 'Babam ve Oglum' olan film'in
--film_turu'nu 'Dram' olarak güncelleyiniz.


-- SORU5: film tablosundaki 'GORA' olan değeri,
-- 'AROG' olarak güncelleyiniz.

-- SORU6: film tablosundaki film_no değeri 300'den büyük olanların,
 --film_no'sunu 1 artırarak güncelleyiniz.

 
 
 create table arabalar
(
id int,
marka varchar(20),
model varchar(20),
vites varchar(20),
fiyat int
);


insert into arabalar values(1,'Mercedes','C180','Otomatik',900000);
insert into arabalar values(2,'Toyota','Corolla','Otomatik',400000);
insert into arabalar values(3,'Honda','Civic','Otomatik',500000);
insert into arabalar values(4,'Citroen','C3','Manuel',450000);


select * from arabalar;


--SORU1: arabalar tablosuna kilometre varchar(10) seklinde yeni sutun ekleyiniz

--SORU2: arabalar tablosuna  yas int seklinde yeni sutun ekleyiniz


--SORU3: arabalar tablosuna airbag varchar(10) seklinde yeni sutun ekleyiniz default degeri 'mevcut' olsun

;

--SORU4: arabalar tablosundan vites sutununu siliniz


--SORU5: arabalar tablosundaki fiyat sutununun ismini bedel olarak güncelleyiniz


--SORU6: arabalar tablosunun ismini galeri olarak güncelleyiniz


--SORU7: galeri tablosunun ismini arabalar olarak güncelleyiniz


















