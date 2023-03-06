create table hastaneler
(
hastane_adi varchar(30) PRIMARY KEY,
adres varchar(30),
alan_kodu int
);
insert into hastaneler values('Meddem', 'Isparta', '0246');
insert into hastaneler values('Sifa', 'Ankara', '0236');
insert into hastaneler values('Davraz', 'Istanbul', '0216');
insert into hastaneler values('Deva', 'Antalya', '0242');


create table doktorlar
(
gorev_yeri varchar(30),
doktor_adi varchar(30),
diploma_no int,
brans_adı varchar(30),

CONSTRAINT fk FOREIGN KEY(gorev_yeri)	REFERENCES hastaneler(hastane_adi)
);	
insert into doktorlar values('Meddem', 'Hasan Bal', '123456', 'psikiyatri');
insert into doktorlar values('Sifa', 'Vedat Sen', '123865', 'pediatri');
insert into doktorlar values('Davraz', 'Huseyin Oz', '123568', 'noroloji');
insert into doktorlar values('Deva', 'Ahmet Kar', '123852', 'dahiliye');
insert into doktorlar values('Meddem', 'Hakan Kar', '123369', 'dermatoloji');
insert into doktorlar values('Sifa', 'Ramiz Kara', '123147', 'anestezi');
insert into doktorlar values('Davraz', 'Okan Pul', '123147', 'ortopedi');

select * from doktorlar;



--soru 1=doktorlar tablosuna gorev_yeri 'Medem' olan veri girisi yapiniz

--soru 2=doktor tablosuna gorev_yeri 'ok meydani' olan veri girisi yapiniz

--soru 3=doktorlar tablosuna gorev_yeri null olan veri girisi yapiniz

--soru 4=hastaneler tablosundaki hastane_adi 'Meddem' olaan veriyi siliniz

--soru 5= doktorlar tablosundaki gorev_yeri 'Meddem' olan veryi siliniz

--soru 6=hastaneler tablosundaki hastane adi 'Meddem' olan veriyi siliniz

--Soru 7=hastaneler tablosunu siliniz
--soru 8=doktorlar tablosunu siliniz
--soru 9=hastaneler tablosunu siliniz


