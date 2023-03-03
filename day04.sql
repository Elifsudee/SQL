/*
SORU1: memurlar isminde bir tablo oluşturunuz. 
id, isim, maas, mezuniyet sutunları olsun.
id sutununun data tipi int olsun. PRİMARY KEY kısıtlaması olsun.
isim sutununun data tipi varchar(30) olsun. UNIQUE kısıtlaması olsun.
maas sutununun data tipi int olsun. maas 5000 buyuk olsun.
mezuniyet sutununun data tipi varchar(25) olsun. NOT NULL kısıtlaması olsun.    
*/



create table memurlar(

	id int PRIMARY KEY,
	isim varchar(30) UNIQUE,
	maas int CHECK(maas>5000),
	mezuniyet varchar(25) NOT NULL
);


insert into memurlar values(1,'Ali',10000,'Lisans');
insert into memurlar values(2,'Ahmet',15000,'Yuksek Lisans');
insert into memurlar values(3,'Altug',20000,'Lisans');
insert into memurlar values(4,'Elif',18000,'Lisans');


insert into memurlar values(1,'Zulal',20000,'Lise');--primary key sebiyle eror vedi

insert into memurlar values(5,'Altug',25000,'Yuksek Lisans');--unige sebibiyle eror verir

insert into memurlar values(6,'Hayri',4000,'Lisans');--check sebiyle eror verir

insert into memurlar values(1,'Burak',30000,null);--not null sebiyle eror verir

/*
SORU2: insanlar isminde bir tablo oluşturunuz. 
isim, soyisim sutunları olsun.
isim sutununun data tipi varchar(20) olsun.
soyisim sutununun data tipi varchar(30) olsun. 


isim sutununda PRİMARY KEY kısıtlaması olsun. Kısıtlamanın isimi pr_ks olsun.
soyisim sutununda UNIQUE kısıtlaması olsun. Kısıtlamanın ismi uni_ks olsun.


*/

create table insanlar(

	isim varchar(20), 
	soyisim varchar(30),
	
	CONSTRAINT pr_ks PRIMARY KEY(isim),--kendimz isim veriyoruz kisitlamanin icine de sutun ismini yaziyoruz
	CONSTRAINT uni_ks UNIQUE(soyisim)
	
);

insert into insanlar values('Harun','Tan');
insert into insanlar values('Azra','Can');

insert into insanlar values('Harun','Kan');--kabul etmez primary key den dolayi eror verir
insert into insanlar values('null','Er');-- primary key sebiyle eror verdi
insert into insanlar values('Kudret','Can');--unigue sebiyle eror verdi

/*
SORU3: hayvanlar isminde bir tablo oluşturunuz. 
isim, cins sutunları olsun.
isim sutununun data tipi varchar(20) olsun.
cins sutununun data tipi varchar(25) olsun.

isim ve cins sutunları birlesiminden bir PRIMARY KEY kısıtlaması olsun.(Composite Primary Key)

*/

create table hayvanlar(

	isim varchar(20),
	cins varchar(25),
	
	CONSTRAINT comp_pr_ks PRIMARY KEY(isim,cins)--isim ve cins sutunlarinin birlesiminden constarint olusturduk
);

--primary key bir tabloda bir defa yazabiliriz

insert into hayvanlar values('Findik','Sus Kopegi');

insert into hayvanlar values('Findik','Coban Kopegi');

insert into hayvanlar values('Duman','Sus Kopegi');

insert into hayvanlar values('Findik','Sus Kopegi');-- kabul etmez kompozite primary key nedeniyle

select * from hayvanlar;


/*
not:CONSTRAINT`leri sutun isimlerinin altinda belirtmeninbize sagladigi kolaylik;
1=CONSTRAINT` ismini kendimiz belirliyoruz
2=COMMPOSITE PRIMARY KEY yapmamiiza izin veriyor(iki sutunun birlesmesinden bir primary key olusturulmasi)
*/


create table emekciler
(
id char(5) PRIMARY KEY,   ---> UNIQUE + NOT NULL
isim varchar(50) UNIQUE,
maas int NOT NULL
);


insert into emekciler values(10002, 'Mehmet Yılmaz', 12000);
insert into emekciler values(10008, null, 5000);
insert into emekciler values(10010, null,5000);
insert into emekciler values(10020, null, 5000);
insert into emekciler values(10004, 'Veli Han', 5000);
insert into emekciler values(10005, 'Mustafa Ali', 5000);
insert into emekciler values(10006, 'Canan Yaş', null);  --maas null olamaz not null
insert into emekciler values(10003, 'CAN', 5000);
insert into emekciler values(10007, 'CAN', 5000); -- -unige degil
insert into emekciler values(10009, 'Cem', ''); --hiclik girilmez int hiclik girilmez 
insert into emekciler values('', 'osman', 2000);--id sutununa bir defa hiclik kabul eder varchardan dolayi
insert into emekciler values('', 'osman can', 2000);  --kabul etmez hiclik girisi yapilmisti primary key bir tane hiclik kabul eder	
insert into emekciler values('', 'veli can', 6000);   --kabul etmez primary key
insert into emekciler values(10002, 'ayse Yılmaz', 12000);  --kabul etmez primary key
insert into emekciler values(null, 'filiz', 12000);  --primay key kabul etmez

/*----------------------------FOREGIN KEY---------------------------------------------------

	FOREGIN KEY --> Başka bir tablodaki PRİMARY KEY'i referans göstermek için kullanılır. 
	Böylelikle, tablolar arasında parent child ilişkisi oluşur.
	
	FOREIGN KEY'in bulundugu tablo Child tablodur.
	PRIMARY KEY'in bulundugu tablo ise Parent tablodur.

	FOREIGN KEY KISITLAMASI SAYESİNDE:
	---------------------------------
	
	1-) parent tabloda olmayan primary key ile child tabloya veri girişi yapılamaz
	(child tablo null deger kabul eder)

	2-) child tablodaki veri silinmeden parent tablodaki veri silinemez

	3-) child tablo silinmeden parent tablo silinemez
----------------------------------------------------------------------------------------------*/

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





























