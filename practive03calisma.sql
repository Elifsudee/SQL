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

--Personel tablosundaki meslek sayısını listeleyiniz

--Personel tablosundaki ortalama maaşı listeleyiniz
--Personel tablosunda maaşı ortalamanın altında olan isim ve maaslari listeleyiniz
--Personel tablosundan bolum_isim  "satıs " olanların isim ve maaslarını listeleyiniz

--Personel tablosundan bölümleri olmayan personelin isim ve mesleklerini listeleyiniz

--Personel tablosundan maası 3000 den fazla olanlar varsa true yoksa false yazdıran bir sorgu yazınız

--Personel tablosundan maası 4000 den fazla olan personelin personel_id si ve ismi ile bolumler tablosunda bolum_id ve
--bolum isimlerini aynı sütunda yazdırınız.(7839 id -> personel SEHER) şeklinde yazdırın


/* -----------------------------------------------------------------------------
  ORNEK1: SATIS ve MUHASEBE bolumlerinde calisan personelin isimlerini ve 
  bolumlerini, once bolum_isim sonra personel_isim sıralı olarak listeleyiniz
------------------------------------------------------------------------------*/ 



/* -----------------------------------------------------------------------------
  ORNEK2: SATIS,ISLETME ve DEPO bolumlerinde calisan personelin isimlerini,  
  bolumlerini  isim sıralı olarak listeleyiniz. 
  NOT: calisani olmasa bile bolum ismi gosterilmelidir.
------------------------------------------------------------------------------*/  


/* -----------------------------------------------------------------------------
  ORNEK3: Tüm bolumlerde calisan personelin isimlerini, bolum isimlerini ve 
  maaslarini bolum_ismi ters ve maas sirali listeleyiniz. 
  NOT: calisani olmasa bile bolum ismi gosterilmelidir.
------------------------------------------------------------------------------*/  



/* -----------------------------------------------------------------------------
  ORNEK4: SATIS ve MUDURLUK bolumlerinde calisan personelin maaslari 2000'den 
  buyuk olanlarinin isim,bolum ve maas bilgilerini bolume ve isme gore
  siralayarak listeleyiniz.
------------------------------------------------------------------------------*/   



/* -----------------------------------------------------------------------------
  ORNEK5: MUDUR'u Harun veya Emine olan personelin bolumlerini,isimlerini,  
  maaslarini ve ayrica MUDUR isimlerini 
  (emine kimin müdürüyse onun satirinda yazsin) 
------------------------------------------------------------------------------*/ 



--Bolumu satıs olan personelin ismine onemli kelimesi ekleyiniz























	
	