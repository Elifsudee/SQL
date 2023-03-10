CREATE TABLE musteriler 
(
id int UNIQUE,
isim varchar(50) NOT NULL,
maas int
);



INSERT INTO musteriler (id, isim, maas) VALUES (1001, 'Ali', 100000);  
INSERT INTO musteriler (id, isim, maas) VALUES (1002, 'Ayse', 57500);  
INSERT INTO musteriler (id, isim, maas) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, maas) VALUES (1004, 'Fatma', 42000);  
INSERT INTO musteriler (id, isim, maas) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler (id, isim, maas) VALUES (1006, 'ahmet', 82000);

--SORU1: isim'i 'A' harfi ile baslayan musterilerin tum bilgilerini listeleyiniz

--SORU2: isim'i 'a' harfi ile baslayan musterilerin tum bilgilerini listeleyiniz
--SORU3: isim'i buyuk harf kucuk harf gözetmeksizin 'A' ile baslayan tum bilgileri listeleyiniz

--SORU4: isim'i 'e' harfi ile biten tum bilgileri listeleyiniz


--SORU5: isim'i icerisinde 'er' olan tum bilgileri listeleyiniz.


--SORU6: isim'i 5 harfli olup son 4 harfi 'atma' olan tum bilgileri listeleyiniz.

--SORU7: isim'in 2. harfi 'a' olan tum bilgileri listeleyiniz.

--SORU9: isim'in 3. harfi 's' olup 4 harfli tum bilgileri listeleyiniz.

--SORU10: isim'in ilk harfi 'F' olup en az 4 harfli tum bilgileri listeleyiniz.

--SORU11: isim'in ikinci harfi 'a' olup, 4.harfi 'm' olan en az 4 harfli tum bilgilerini listeleyiniz.

--SORU12: isim'i icerisinde 'i' olmayan tum bilgileri listeleyiniz.


create table exercises
(
id int UNIQUE,
kelime varchar(50) NOT NULL, 
harf_sayisi int
);


INSERT INTO exercises VALUES (1001, 'hot', 3);  
INSERT INTO exercises VALUES (1002, 'hat', 3);  
INSERT INTO exercises VALUES (1003, 'hit', 3);  
INSERT INTO exercises VALUES (1004, 'hbt', 3);  
INSERT INTO exercises VALUES (1008, 'hct', 3);  
INSERT INTO exercises VALUES (1005, 'adem', 4);  
INSERT INTO exercises VALUES (1006, 'selim', 5);  
INSERT INTO exercises VALUES (1007, 'yusuf', 5);
INSERT INTO exercises VALUES (1009, 'hAt', 3); 
 

SELECT * FROM exercises;

-- SORU1 : ilk harfi 'h', son harfi 't' olup, 2. harfi 'a' veya 'i' olan 3 harfli kelimelerin tum bilgilerini listeleyiniz.

-- SORU2 : ilk harfi 'h', son harfi 't' olup, 2. harfi 'a' veya 'i' olan 3 harfli kelimeleri
--buyuk harf kucuk harf gözetmeksizin tum bilgilerini listeleyiniz.

-- SORU3 : ilk harfi 'h', son harfi 't' olup, 2.harfi 'a' ile 'k' arasinda olan 3 harfli kelimelerin  tum bilgilerini listeleyiniz


-- SORU4 : ilk harfi 'a' veya 's' ile baslayan kelimelerin tum bilgilerini listeleyiniz

-- SORU5 : son harfi 'm' veya 'f' ile biten kelimelerin tum bilgilerini listeleyiniz.


-- SORU6 : son harfi 'm' veya 'f' ile bitmeyen kelimelerin tum bilgilerini listeleyiniz.




create table ornek(
 isim varchar(25),
 soyisim varchar(25)
);

insert into ornek values('Hasan','Yan');
insert into ornek values('Veli','Turk');
insert into ornek values('Ramiz','Kara');
insert into ornek values('Elif','Gul');
insert into ornek values('Hasan','Vural');

select * from ornek;

--soru1=isim stununu buyuk harflerle listeleyiniz


--soru2=isim stununu kucuk harflerle listeleyiniz

--soru 3=soyisim sutununu ilk harf buyuk diger harfler kucuk listeleyiniz

--soru4=isim sutununu buyuk harflerle, sooyisim sutununu kucuk harflerle listeleyiniz

--soru 5=isim sutnunu tekrarsiz listeleyiniz

create table deneme(

	id char(9),
	isim varchar(50),
	adres varchar(50)
);

insert into deneme values(123456789,'Ali','Istanbul');
insert into deneme values(123056789,'Vli','Ankara');
insert into deneme values(193456789,'Mine','Izmir');
insert into deneme values(123458789,null,'Ankara');

select * from deneme;

--soru 1=isim sutununda null olan veriryi listeleyiniz



--2isim sutununda null olmayan veriryi listeleyiniz









