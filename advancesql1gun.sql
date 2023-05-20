
--yorum
/*
$$---ozel karakterleri cift yazmaktan kurtariyor ''''
yorum satiri
*/

-- ****************DEGISKEN TANUMLAMA**************
do $$  --do:Anonymus Block Dolar :Ozel karakterler oncesinde tirnak icin

declare
    counter integer :=1; ---conter adinda bir degisken olusturldu default deger olarak 1 atandi
      isim varchar(50) :='Emre';
	  soyisim varchar(50) :='Gul';
      payment numeric(4,2) := 20.5; --4 karakter olacak vigulden sonra 2 karakter olacak
begin
    raise notice 'Ad 1: % ,Soyad 2: %',  isim, soyisim;-- cikti almak icin once % yazilir print komutu

end $$;--dolar ile baslayip dolar ile bitiyor

--Gerekli degiskenleri olusturark "Ahmet ve Mehmet Beyler 120 tl bilet aldilar."cumlesini ekrana yazdiriniz

do $$
declare
   isim1 varchar(50) :='Ahmet';
   isim2 varchar(50) :='Mehmet';
   
   tl integer :=120;
   
begin
    raise notice ' % ve % beyler  tl % bilet aldilar',isim1,isim2,tl;
	
end $$;	
	
	--***************BEKLETME KOMUTU****************
	
do $$
declare
   creted_at time := now();---time data type ,now() -->olusturldugu zaman
   
begin
   raise notice '%',creted_at;
   perform pg_sleep(5);--2 saniye bekle
    raise notice '%',creted_at;
 end $$;
	
	
	-- TABLODAN DATA TIPINI KOPYALAMA********
	
	do $$
	declare
	   f_tittle film.tittle%type;--film tblosuna git title tipini getir
	   f_sure film.length%type;---filmin suresini getir
	   
	   begin
	   -- 1 ID li filmin ismini getirin
	   select tittle
	   from film 
	   into f_tittle
	   where id=1;
	   
     raise notice 'Film Basligi % ',f_tittle;
	   
 end $$;
	
	
	---*****ROW TYPE*****
	--ID 1 olan aktorun tum bilgilerini alalim
	
	do $$
	declare
	selected_actor actor %rowtype;--tum rowun tum bilgilerini alabiliyorum
	
	begin
	select *
	from actor
	where id=1
	into selected_actor;
	
	raise notice '% % ',selected_actor.first_name,selected_actor.last_name;
	
	end $$;
	
	
	--RECORD TYPE****
	
	--film tablosundan id 2 olan datanin yalnizca id title ve type bilgisinialamim
	
	do $$
	declare
	rec record;
	begin
	select tittle, type
	from film
	where id=2
	into rec;
	
	raise notice 'Baslik : % , Tur : %',rec.tittle,rec.type;
	
	end $$;
	
	
	
	
   
	

   
	  