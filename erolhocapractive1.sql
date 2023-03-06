--SQL : Database'deki(Veritabanı) verileri yönetmek, sorgulamak ve tasarlamak için kullanılan bir sorgu dilidir
--Database(Veritabanı):Birbiriyle ilgili dataların toplandığı yerin adı
--Faydaları:
--1-Yüksek miktarda veri depolanabilir
--2-CRUD operasyonlarının kolaylığı(create,resad,update,delete)
--3-Data(veriye)ya ulaşımın kontrollü ve kolay olması
--4-Güvenli olması
--DBMS(VTYS):Database Managemant System
--VTYS:veri tabanını yönetmek için kullanılan yazılımlardı(postgreSQL,MySQL,Oracle,MSSQL)
--SQL KOMUTLARI 4 ANA GRUBA AYRILIR
--1-DDL->DATA DEFINITION LANG.
--CREATE -> Database ve tablo oluştumak için kullanılan komuttur
--ALTER -> Tablo ve database'i güncellemek için
--DROP -> Tablo ve database'i silmek için

create table calisanlar(

	id char(4),
	isim varchar(15),
	soyisim varchar(30),
	tel varchar(15),
	email varchar(50),
	adres varchar(50),
	maas int
);

--DQL--Data Query lang.(veri sorgu dili)-tablodaki verileri listelemek icin

select * from calisanlar;

select id, from calisanlar;--bir veya birden fazla sutunu secmek icin

--olusturmus oldugumuz bir tablodan yeni bir tablo olusturmak icin

create table maas
AS select id,maas from calisanlar;--as gibi yani calisanlardan maas ve id al yeni bir tablo ollustur


select * from maas;

--SQL tablolar datalari iliskili tablolarda depolar
--consrraint(kisitlama)
--Primary Key
--Foreign Key
--Unique
--Check
--not null

--1-Primary Key:İlişkili tablolarda mutlaka primary key olmalıdır.
--Bir tabloda her satır için tanımlayıcı görevi görür.
--3 yolla primary key oluşturabiliriz

create table calisanlar1(

	id char(4) primary key,--1 yol
	isim varchar(15),
	soyisim varchar(30),
	tel varchar(15)

);

create table calisanlar2(

	id char(4),
	isim varchar(15),
	soyisim varchar(30),
	tel varchar(15),
    primary key(id),--2 yol
	unique(isim)
);

create table calisanlar3(

	id char(4) primary key,
	isim varchar(15),
	soyisim varchar(30),
	tel varchar(15),
constraint pk primary key(id)--3 yol
);


--FOREIGN KEY 
--Primary Key olan tablo ile ilişki oluşturmak için kullanılır

create table ucret(

	id char(4),
	maas real,
	foreign key(id) references calisanlar1(id)
)
--Check:Bir alana girilecek değerleri sınırlamak için kullanırız
--Unique:Bir sutundaki verilerin tekrarsız yani tek olmasını sağlar
--Not null: Bir sutunun NULL içermemesini yani boş olmamasını sağlar


create table calisanlar4(

	id char(4) primary key,
	isim varchar(15) unique,
	soyisim varchar(30),
	tel varchar(15),
	email varchar(50),
	adres varchar(50),
	maas int not null
	check(maas>1000),
	unique(maas,tel)
);

--ALTER TABLE : tabloları güncellemek için kullanırız

select * from calisanlar

alter table calisanlar
add primary key(id);
--id sutununa primary key atamasi yaptik

--Mevcut primary key'i değiştirmek için önce tablodaki primary key'i kaldırmak gerekir
--sonra yeniden atama yapabiliriz
--DROP

alter table calisanlar drop constraint calisanlar_pkey,
add primary key(id);

/*
Not: Primary key, genellikle bir tablonun oluşum aşamasında belirlenir ve 
daha sonra değiştirilmez.
Bu nedenle, primary key değişiklikleri özenle yapılmalıdır ve değişiklikler 
öncesi veriler yedeklenmelidir.
*/

alter table calisanlar add unique(email);

alter table calisanlar add constraint check_maas check(maas>1000);

--soyisim sutununa x veya w ile baslayan veri girilmesin

alter table calisanlar
add constraint check_soyisim check(not (soyisim like 'x%' or soyisim like 'w%'));

--tabloya yeni bir veya birden fazla sutun ekleme
alter table calisanlar add ulke varchar(20);

alter table calisanlar add sehir varchar(20), add posta_kodu char(5);

--tablodan sutun silme
alter table calisanlar drop ulke;--my sql de colmun yazmaksak hata verir

--tablodaki bir sutunun adini degistirmek istersek

alter table calisanlar rename sehir to il;--my sql de colmun yazmaksak hata verir

--tablonun ismini degistirmek istersek

alter table calisanlar rename to personel;

alter table personel rename to calisanlar;
select * from calisanlar;

--MODIFY --postgreSQL ->TYPE/SET olarak kullaniliyor
--sutunlarin ozellilerini degistirme

alter table calisanlar alter column tel type char(11);--charin alacagi karakter saysini degistirdik

--tabloyu silmekicin drop komutu kullanilir
--DDL-drop table
drop table calisanlar4;

select * from calisanlar;

--DML ->Data Manipulation lang.
--DML->DATA MANUPULATION LANG.
--INSERT->Tabloya veri eklemek için kullanılır
--UPDATE->Tablodaki verileri güncellemek için kullanılır
--DELETE->Tablodaki verileri silmek için kullanılır


create table calisanlar4(

	id char(4) primary key,
	isim varchar(15) unique,
	soyisim varchar(30),
	tel varchar(15),
	email varchar(50),
	adres varchar(50),
	maas int not null
	check(maas>1000),
	unique(maas,tel)
);
select * from calisanlar4;

--tum sutunlara ekleme yapmak icin 
insert into calisanlar4 values('1234','Elif','Sutcu','234567899','sutsu@gmail.com','Kayseri',1000);
--bu eklemeyi kabul etmez cunku maas 100 den fazla olamli check kisitlamasi

insert into calisanlar4 values('1234','Elif','Sutcu','234567899','sutsu@gmail.com','Kayseri',1500);


INSERT INTO calisanlar VALUES('1234','Erol','xEvren','05654545454','erol@gmail.com','Ankara',1500);
--Bu eklemeyi kabul etmez. Çünkü soyisim x veya w ile başlayamaz. Soyisim sutununda CHECK constraint mevcut

insert into calisanlar4 values('1834','Elifsu','Sut','2345678997','sutsu@gmail.com','Kayseri',1600);

--istedigimiz sutunlara ekleme yapmak icin
insert into calisanlar4(isim,soyisim,tel) values('Emre','Kaya','0506789345');
-- id sutunu primary key oldugu icin veri girmemiz zorunlu

insert into calisanlar4(id,isim,soyisim,tel,maas) values('1236','Emre','Kaya','0506789345',1700);

insert into calisanlar4(isim,soyisim,tel,maas,id) values(1800,'Hasn','Kayacan','0506789345',1237);


--DML->UPDATE->Tablodaki verileri güncellemek için kullanırız
--SYNTAX
UPDATE tablo_adi
SET sütun_adi

update calisanlar4 set adres='Yozgat';

select * from calisanlar4;

--elif isimli verinin adresini kayseri olarak guncelleyiiz

update calisanlar4 set adres='Kayseri' where isim='Elif';

--emre isimli verinin maasini 2000 olarak guncelleyiniz
update calisanlar4 set maas=2000 where isim='Emre';


create table calisan(
id char(4),
isim varchar(50),
maas int,
constraint id_pk primary key(id)
);
insert into calisan values('1001', 'Ahmet Aslan', 7000);
insert into calisan values('1002', 'Mehmet Yılmaz' ,12000);
insert into calisan values('1003', 'Meryem ', 7215);
insert into calisan values('1004', 'Veli Han', 5000);


create table aileler (
id char(4),
cocuk_sayisi int,
ek_gelir int,
constraint id_fk foreign key(id)references calisanlar(id)
);
insert into aileler values('1001', 4, 2000);
insert into aileler values('1002', 2, 1500);
insert into aileler values('1003', 1, 2200);
insert into aileler values('1004', 3, 2400);

--Tablo oluştururken Create table ile başlayıp insert komutlarıyla birlikte seçip çalıştırabiliriz
select * from calisan;
select * from aileler;

--Veli Hanin maasina %20 zam yapiniz
update calisan set maas=maas*1.2 where isim='Veli Han';


CREATE TABLE hastaneler
(
id char(5) primary key, 
isim char(30),
sehir char(15),
ozel char(1)
); 
insert into hastaneler values('H101', 'Aci Madem Hastanesi', 'Istanbul', 'Y');
insert into hastaneler values('H102', 'HasZeki Hastanesi', 'Istanbul', 'N');
insert into hastaneler values('H103', 'Medikol Hastanesi', 'Izmir', 'Y');
insert into hastaneler values('H104', 'Memoryil Hastanesi', 'Ankara', 'Y');
select * from hastaneler;
 CREATE TABLE hastalar(
  kimlik_no CHAR(11) PRIMARY Key,
  isim CHAR(50) ,
  teshis  CHAR(20)
  );
  insert INTO hastalar values('12345678901','Ali Can','Gizli Seker');
    insert INTO hastalar values('45678901121','Ayse Yilmaz','Hipertansiyon');
    insert INTO hastalar values('78901123451','Steve Jobs','Pankreatit');
    insert INTO hastalar values('12344321251','Tom Hanks','COVID 19');
    
     
create table bolumler(
bolum_id char(5),
bolum_adi char(20)
);
insert into bolumler values('DHL','Dahiliye');
insert into bolumler values('KBB','Kulak Burun Bogaz');
insert into bolumler values('NRJ','Noroloji');
insert into bolumler values('GAST','Gastoroloji');
insert into bolumler values('KARD','Kardioloji');
insert into bolumler values('PSK','Psikiyatri');
insert into bolumler values('GOZ','Goz Hastaliklari');
create table hasta_kayitlar(
kimlik_no char(11) Primary key,
hasta_ismi char(20),
hastane_adi char(50),
bolum_adi char(20),
teshis char(20)
);
insert into hasta_kayitlar values('1111','NO NAME','','','');
insert into hasta_kayitlar values('2222','NO NAME','','','');
insert into hasta_kayitlar values('3333','NO NAME','','','');
insert into hasta_kayitlar values('4444','NO NAME','','','');
insert into hasta_kayitlar values('5555','NO NAME','','','');

select * from hastaneler;
select * from hastalar;
select * from bolumler;
select * from hasta_kayitlar;

/*
hasta_kayıtlar tablosundaki ‘3333’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz.
hasta_isim : ‘Salvadore Dali’ ismi ile
hastane_adi: ‘John Hopins’
bolum_adi: ‘Noroloji’
teshis: ‘Parkinson’
kimlik_no: ‘99991111222’
*/

update hasta_kayitlar
set hasta_ismi='Salvador Dali',
   hastane_adi='John Hopisn',
   bolum_adi='Noroloji',
   teshis='Parkinson',
   kimlik_no='99991111222'
   where kimlik_no='3333';
   
select * from hasta_kayitlar;

/*
hasta_kayıtlar tablosundaki ‘1111’ kimlik nolu kaydı aşağıdaki gibi güncelleyiniz.
hasta_isim : hastalar tablosundaki kimlik nosu ‘12345678901’ olan kişinin ismi ile
hastane_adi: hastaneler tablosundaki 'H104' bolum_id kodlu hastanenin ismi ile
bolum_adi: bolumler tablosundaki 'DHL' bolum_id kodlu bolum_adi ile
teshis: hastalar tablosundaki 'Ali Can' isimli hastanın teshis bilgisi ile
kimlik_no: hastalar tablosundaki 'Ali Can' isimli hastanın kimlik_no kodu ile
*/
update hasta_kayitlar 
set hasta_ismi=(select isim from hastalar where kimlik_no='12345678901'),
     hastane_adi=(select isim from hastaneler where id='H104'),
	 bolum_adi=(select bolum_adi from bolumler where bolum_id='DHL'),
	 teshis=(select teshis from hastalar where isim='Ali Can'),
	 kimlik_no=(select kimlik_no from hastalar where isim='Ali Can')
	 
	 where kimlik_no='1111';
	 

--DML->DELETE: Tablodaki verileri silmek için kullanılır

select * from calisanlar4;


SYNTAX;
DELETE FROM tablo_adi;
DELETE FROM calisanlar4; --Tüm verileri sildi
DELETE FROM calisanlar4 WHERE id='1236';
select * from calisanlar;
select * from aileler;
/*
    İlişkili tablolarda parent tablo'dan direk veri silemeyiz ve tabloyu silemeyiz
Eğer ilişkili tablolardan parent tablodan veri silme ihtimalimiz varsa,
tabloyu oluştururken FOREİGN KEY ataması yaptığımız child tabloya "ON DELETE CASCADE"
komutunu yazmamız gerekir.
    on delete cascade komutu kullanmaz isek önce child tabloyu silmemiz gerekir. Sonrada
parent tabloyu silebiliriz 
    on delete cascade komutu kullandığımız zaman parent table'dan bir veri silersek chile table'dan da silinir
*/

create table calisan(
id char(4),
isim varchar(50),
maas int,
primary key(id)
);
insert into calisan values('1001', 'Ahmet Aslan', 7000);
insert into calisan values('1002', 'Mehmet Yılmaz' ,12000);
insert into calisan values('1003', 'Meryem ', 7215);
insert into calisan values('1004', 'Veli Han', 5000);
create table aileler1 (
id char(4),
cocuk_sayisi int,
ek_gelir int,
foreign key(id)references calisan(id)
on delete cascade    
    
);
insert into aileler1 values('1001', 4, 2000);
insert into aileler1 values('1002', 2, 1500);
insert into aileler1 values('1003', 1, 2200);
insert into aileler1 values('1004', 3, 2400);
select * from calisan -- Bu tabloyu tamamen sildik
select * from aileler1
delete from calisan where id = '1001';
drop table calisan cascade -- Parent tabloyu tamamen databaseden kaldırmak istersek bu şekilde yazarız





