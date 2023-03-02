
--qa8 team tablosu olusturuyoruz
create table QA8( 
    ogrenci_id char(4),
                 ogrenci_adi varchar(20), 
    ogrenci_soyadi varchar(20), 
    ogrenci_yasi smallint, 
    dogum_tarihi date, 
    maasi real,
    yasadigi_sehir varchar(20) 
);
--tabloya veri girisi yapacagiz
INSERT INTO QA8 values(0001,'Mehmet','Karaca','36','1986-10-20',10000.00,'Samsun');
insert into QA8 values(0002,'Rahmi','Yetim',33,'1990-01-01',10000.01,'Trabzon');
insert into QA8 values(0003,'Ahmet Oguzhan','Kaya',31,'1992-12-14',10000.02,'Istanbul');
insert into QA8 values(0004,'Ibrahim','Nalbant',43,'1980-02-12',10000.03,'Ankara');
insert into QA8 values(0005,'Elif sude','Sutcu',36,'1987-09-11', 10000.04,'Kayseri');
insert into QA8 values(0006,'Omer Faruk','Osmanoglu',33,null, 10000.05,'Kirikkale');
insert into QA8 values(0007,'Kubra','Aydogdu',30,'1993-01-01', 10000.06,'Istanbul');
insert into QA8 values(0008,'Tuba','Koyuncuoglu',null,null, 10000.07,'Gaziantep');
insert into QA8 values(0009,'Sumeyye','Palanci',38,'1984-09-01', 10000.08,'Istanbul');
insert into QA8 values(0010,'Umit','Celik',41,'1981-11-20', 10000.09,'Kocaeli');
insert into QA8 values(0011,'Omer','Guldalli',38,'1985-02-19', 10000.10,'Istanbul');
insert into QA8 values(0012,'Kadir','Balban',34,'1989-07-01', 10000.11,'Balikesir');
insert into QA8 values(0013,'Gokhan','Erbil',25,'1998-06-28', 10000.12,'Manisa');
insert into QA8 values(0014,'Samet','Akbulut',30,'1992-06-09', 10000.13,'Antalya');
insert into QA8 values(0015,'Omer','Dogan',null,null, 10000.14,'Mus');
select*from QA8;
SELECT ogrenci_adi,ogrenci_soyadi from QA8 where ogrenci_id='10';
--yasadigi sehir istanbul olmayanlari yazdiriniz
select * from QA8 where yasadigi_sehir='Istanbul';
select * from QA8 where yasadigi_sehir!='Istanbul';
select * from QA8 where yasadigi_sehir<>'Istanbul';
select * from QA8 where ogrenci_adi  not in('Mehmet');
select * from QA8 where maasi not in('10000.04');
select ogrenci_adi,ogrenci_soyadi from QA8 where ogrenci_yasi<45;
select *from QA8 where dogum_tarihi is not null;
select*from QA8 where dogum_tarihi is null;
--is null bir terimdir.Birlikte kullanilir 
--null i kendi basina string bir ifade 
--ya da integer bir ifade olarak degerlendiremeyiz.
select ogrenci_adi,ogrenci_soyadi from QA8 where ogrenci_adi like 'M%';
select ogrenci_adi,ogrenci_soyadi from QA8 where ogrenci_adi like '%i';
select ogrenci_adi,ogrenci_soyadi from QA8 where ogrenci_adi like '%ra%';
select ogrenci_adi,ogrenci_soyadi from QA8 where ogrenci_adi like '__t%';
select ogrenci_adi,ogrenci_soyadi from QA8 where ogrenci_adi like 'O%';
select ogrenci_adi,ogrenci_soyadi from QA8 where ogrenci_adi like '____h%';
select ogrenci_adi,ogrenci_soyadi from QA8 where ogrenci_adi like '_u__';
select ogrenci_adi,ogrenci_soyadi from QA8 where ogrenci_adi like 'O%';
select ogrenci_adi,ogrenci_soyadi from QA8 where ogrenci_adi like '%o%';
select ogrenci_adi,ogrenci_soyadi from QA8 where ogrenci_adi like '%k';
drop TABLE QA8;
CREATE TABLE CALISMA(
OGRENCI_ID CHAR(20),
    BOY REAL,
    CINSIYET CHAR(1),
    KILO INT,
    GOZ_RENGI VARCHAR(20),
    AYAKKABI_NO int
);
INSERT INTO CALISMA VALUES('1',1.70,'E',68,'Kahverengi',42);
INSERT INTO CALISMA VALUES('2',1.79,'E',90,'Yesil',44);
INSERT INTO CALISMA VALUES('3',1.80,'E',82,'Kahverengi',42);
INSERT INTO CALISMA VALUES('4',1.70,'E',70,'KoyuKahverengi',40);
INSERT INTO CALISMA VALUES('5',null,'K',null,null,null);
INSERT INTO CALISMA VALUES('6',null,'E',null,null,null);
INSERT INTO CALISMA VALUES('7',null,'K',null,null,null);
INSERT INTO CALISMA VALUES('8',null,'K',null,null,null);
INSERT INTO CALISMA VALUES('9',null,'K',null,null,null);
INSERT INTO CALISMA VALUES('10',null,'E',null,null,null);
INSERT INTO CALISMA VALUES('11',1.80,'E',92,'Kahverengi',42.5);
INSERT INTO CALISMA VALUES('12',null,'E',null,null,null);
INSERT INTO CALISMA VALUES('13',1.80,'E',75,'Kahverengi',43.5);
INSERT INTO CALISMA VALUES('14',1.70,'E',68,null,42);
INSERT INTO CALISMA VALUES('15',null,'E',null,null,42);
select ogrenci_id from calisma where cinsiyet='K';
select boy from calisma where goz_rengi like 'K%';
drop table qa8;