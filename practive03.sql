CREATE TABLE bolumler (
      bolum_id   int PRIMARY KEY,
      bolum_isim VARCHAR(20),
      konum      VARCHAR(30)
    );
    
    INSERT INTO bolumler VALUES (10,'MUHASEBE','IST');
    INSERT INTO bolumler VALUES (20,'MUDURLUK','ANKARA');
    INSERT INTO bolumler VALUES (30,'SATIS','IZMIR');
    INSERT INTO bolumler VALUES (40,'ISLETME','BURSA');
    INSERT INTO bolumler VALUES (50,'DEPO', 'YOZGAT');
	
	
    CREATE TABLE personel (
      personel_id   int PRIMARY KEY,
      personel_isim VARCHAR(20),
      meslek        VARCHAR(15),
      mudur_id      int,
      maas          int,
      bolum_id      int
    );
    
  
    INSERT INTO personel VALUES (7369,'AHMET','KATIP',1111,800,20);
    INSERT INTO personel VALUES (7499,'BAHATTIN','SATIS',1222,1600,30);
    INSERT INTO personel VALUES (7521,'NESE','SATIS',1222,1250,30);
    INSERT INTO personel VALUES (1111,'MUZAFFER','MUDUR',7839,2975,20);
    INSERT INTO personel VALUES (7654,'MUHAMMET','SATIS',1222,1250,30);
    INSERT INTO personel VALUES (1222,'EMINE','MUDUR',7839,2850,30);
    INSERT INTO personel VALUES (1333,'HARUN','MUDUR',7839, 2450,10);
    INSERT INTO personel VALUES (7788,'MESUT','ANALIST',1111,3000,20);
    INSERT INTO personel VALUES (7839,'SEHER','BASKAN',NULL,5000,10);
    INSERT INTO personel VALUES (7844,'DUYGU','SATIS',1222,1500,30);
    INSERT INTO personel VALUES (7876,'ALI','KATIP',1111,1100,20);
    INSERT INTO personel VALUES (7900,'MERVE','KATIP',1222,950,30);
    INSERT INTO personel VALUES (7902,'NAZLI','ANALIST',1111,3000,20);
    INSERT INTO personel VALUES (7934,'EBRU','KATIP',1333,1300,10);
    INSERT INTO personel VALUES (7956,'SIBEL','MIMAR',1333,3300,60);
    INSERT INTO personel VALUES (7933,'ZEKI','MUHENDIS',1333,4300,60);
    
	select * from personel;
	
--Personel tablosundaki meslekleri listeleyiniz

select meslek from personel
group by meslek;


--Personel tablosundaki meslek sayısını listeleyiniz
select count(distinct meslek) as melek_sayisi from personel;--once sutunu saydirdik distinc ile tekrarsiz yaptik
 
--Personel tablosundaki ortalama maaşı listeleyiniz

select round(avg(maas),2) as ortalama_maas from personel;


--Personel tablosunda maaşı ortalamanın altında olan isim ve maaslari listeleyiniz
select personel_isim, round(avg(maas)) as ortalama_maas from personel
group by personel_isim
having avg(maas)<(select avg(maas) from personel);

--2 yol
Select personel_isim,maas as isim_maas from personel where maas<(Select round(avg(maas)) from personel);

--Personel tablosundan bolum_isim  "satıs " olanların isim ve maaslarını listeleyiniz
select personel_isim,maas from personel
where bolum_id =(select bolum_id from bolumler where bolum_isim='SATIS');
--2 yol
select personel_isim,maas from personel
where bolum_id in(select bolum_id from bolumler where bolum_isim='SATIS');

--Personel tablosundan bölümleri olmayan personelin isim ve mesleklerini listeleyiniz
select personel_isim,meslek from personel
where not exists (select bolum_id from bolumler where personel.bolum_id=bolumler.bolum_id);

--Personel tablosundan maası 3000 den fazla olanlar varsa true yoksa false yazdıran bir sorgu yazınız
SELECT EXISTS(SELECT * FROM personel WHERE maas>3000);

--Personel tablosundan maası 4000 den fazla olan personelin personel_id si ve ismi ile bolumler tablosunda bolum_id ve
--bolum isimlerini aynı sütunda yazdırınız.(7839 id -> personel SEHER) şeklinde yazdırın
select personel_id|| ' id -->personel '||personel_isim as id_isim from personel where maas>4000
union
select bolum_id||' id -->bolum ' ||bolum_isim from bolumler;

/* -----------------------------------------------------------------------------
  ORNEK1: SATIS ve MUHASEBE bolumlerinde calisan personelin isimlerini ve 
  bolumlerini, once bolum_isim sonra personel_isim sıralı olarak listeleyiniz
------------------------------------------------------------------------------*/ 
 select  personel.personel_isim,bolumler.bolum_isim
 from personel inner join bolumler 
 on personel.bolum_id=bolumler.bolum_id
 where bolum_isim in('SATIS','MUHASEBE')
 order by bolum_isim,personel_isim;

/* -----------------------------------------------------------------------------
  ORNEK2: SATIS,ISLETME ve DEPO bolumlerinde calisan personelin isimlerini,  
  bolumlerini  isim sıralı olarak listeleyiniz. 
  NOT: calisani olmasa bile bolum ismi gosterilmelidir.
------------------------------------------------------------------------------*/  

select personel.personel_isim,bolumler.bolum_isim
from personel right join bolumler
 on personel.bolum_id=bolumler.bolum_id
where bolum_isim in ('SATIS','ISLETME','DEPO')
order by personel_isim


/* -----------------------------------------------------------------------------
  ORNEK3: Tüm bolumlerde calisan personelin isimlerini, bolum isimlerini ve 
  maaslarini bolum_ismi ters ve maas sirali listeleyiniz. 
  NOT: calisani olmasa bile bolum ismi gosterilmelidir.
------------------------------------------------------------------------------*/  

select personel.personel_isim,bolumler.bolum_isim,personel.maas 
from personel right join bolumler
on personel.bolum_id=bolumler.bolum_id
order by bolum_isim desc, maas asc;

/* -----------------------------------------------------------------------------
  ORNEK4: SATIS ve MUDURLUK bolumlerinde calisan personelin maaslari 2000'den 
  buyuk olanlarinin isim,bolum ve maas bilgilerini bolume ve isme gore
  siralayarak listeleyiniz.
------------------------------------------------------------------------------*/   
select personel.personel_isim,bolumler.bolum_isim,personel.maas
from personel full join bolumler
on personel.bolum_id=bolumler.bolum_id
where bolum_isim in('SATIS','MUDURLUK') and maas>2000
order by bolum_isim,personel_isim;



/* -----------------------------------------------------------------------------
  ORNEK5: MUDUR'u Harun veya Emine olan personelin bolumlerini,isimlerini,  
  maaslarini ve ayrica MUDUR isimlerini 
  (emine kimin müdürüyse onun satirinda yazsin) 
------------------------------------------------------------------------------*/ 

select bolumler,bolum_isim,p1.personel_isim,p2.personel_isim as mudur_isim, p1.maas as personel_maas,p2.maas as mudur_maas
from personel p1 inner join personel p2
on p1.mudur_id=p2.personel_id
full join bolumler
on p1.bolum_id=bolumler.bolum_id
where p2.personel_isim in ('HARUN','EMINE');
-- Yukaridaki kod gibi bir sutundan iki farkli sutun olusturacaksak
-- SELF JOIN syntax'i kullanilir.
-- Syntax =
		-- SELECT p1.isim, p2.isim
		-- FROM personel p1
		-- INNER JOIN personel p2
		-- ON p1.id=p2.id;

--Bolumu satıs olan personelin ismine onemli kelimesi ekleyiniz
update personel 
set personel_isim =concat(personel_isim,' onemli')
where bolum_id=(select bolum_id from bolumler where bolum_isim='SATIS');

--view kullnimi
create view isim_bolum as
select personel.personel_isim,bolumler.bolum_isim
from personel right join bolumler
 on personel.bolum_id=bolumler.bolum_id
where bolum_isim in ('SATIS','ISLETME','DEPO')
order by personel_isim

select * from isim_bolum;

