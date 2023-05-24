
do $$
<<outer_block>>  --baslik veriyoruz
declare --tepedeki blok,outher block o,latak gecer
 
  counter integer :=0;

begin
    counter :=counter+1;
	raise notice 'Outher Block icin counter degeri: %',counter;
	
	
declare -- icerdeki block inner block olarak gecer
	counter integer :=0;
begin 
	counter :=10;
	raise notice 'Inner Block icin counter degeri :%',counter;
	raise notice 'outher block icin counter degeri :%',outer_block.counter; --dis blockun ismi ile ic block da onun degerini cagirabiliyorum
	
	end;

    raise notice 'Inner Block icin counter degeri :%',counter;
	
end $$;

-- *************Constant/Sabit ***********final keywordu ile ayni mantikta calisyor

do $$
declare

 -- selling_price numeric(4,2):= net_price *0.1; --4 rakam olabilir virgulden sonra iki rakam olabilir
    kdv constant numeric :=0.1; --kdv yi constant ile belitiyoruz
	net_price numeric := 20.5; --net ucret

begin
  raise notice 'satis fiyati :%',net_price*(1+kdv);
  
 end $$; 
	
--******IF satatement*******

--syntax
/*
    IF condtion THEN
        statement;
   
       END IF;

*/

-- Task 1:1 id li filmi bulalim,eger bulunamazsa ekrana 'Bulunamadi :% ',istenen_id yazisni print edelim

do $$
declare
	istenen_film film%rowtype;
	istenen_id film.id%type := 10;
begin
	SELECT * FROM film
	WHERE id = istenen_id
	INTO istenen_film;
	
	if not found then
		raise notice 'Bulunamadı: %',istenen_id;
	end if;
end $$;



-- ******** IF ELSE ********
--syntax:
/*
		IF condition THEN
			statement;
		ELSE
			alternative statement;
		END IF;
*/

-- Task:  1 id'li filmi bulalım, eğer bulunamazsa ekrana 'Bulunamadı: %',istenen_id yazısını print edelim.
do $$
declare
	istenen_film film%rowtype;
	istenen_id film.id%type := 1;
begin
	SELECT * FROM film
	WHERE id = istenen_id
	INTO istenen_film;
	
	if not found then
		raise notice 'Bulunamadı: %',istenen_id;
	else
		raise notice 'Film: %', istenen_film.tittle;
	end if;
end $$;

-- ******** IF ELSE-IF ELSE ********
-- syntax:
/*
		IF condition THEN
			statement;
		ELSEIF condition2 THEN
			statement;
		ELSEIF condition3 THEN
			statemnt;
		ELSE
			statement;
		END IF;
*/

/*
 	Task : 1 id li film varsa: 
			Süresi 50 dakikanın altında ise Short, 
			50<length<120 ise Medium, 
			length>120 ise Long yazdıralım.
*/


do $$
declare
	istenen_film film%rowtype;
	istenen_id film.id%type := 1;
	
begin

	SELECT * FROM film WHERE id=istenen_id INTO istenen_film;
	
	if not found then
		raise notice 'Film bulunamadı.';
	else
		if istenen_film.length > 0 and istenen_film.length<50 then
			raise notice 'Short, id: %', istenen_id;
		elseif istenen_film.length > 50 and istenen_film.length < 120 then
			raise notice 'Medium, id: %', istenen_id;
		elseif istenen_film.length > 120 then
			raise notice 'Long, id: %', istenen_id;
		else
			raise notice 'Tanımlanamıyor.';
		end if;
	end if;

end $$;


-- 2. YOL
do $$
declare
	istenen_film film%rowtype;
	istenen_id film.id%type := 1; 
	description text;
begin

	SELECT * FROM film WHERE id=istenen_id INTO istenen_film;
	
	-- found / not found
	
	if not found then
		raise notice 'Film bulunamadı.';
	else -- found
		if istenen_film.length > 0 and istenen_film.length<50 then
			--raise notice 'Short, id: %', istenen_id;
			description := 'Short';
		elseif istenen_film.length > 50 and istenen_film.length < 120 then
			--raise notice 'Medium, id: %', istenen_id;
			description := 'Medium';
		elseif istenen_film.length > 120 then
			--raise notice 'Long, id: %', istenen_id;
			description := 'Long';
		else
			--raise notice 'Tanımlanamıyor.';
			description := 'Tanımlanamıyor.';
		end if;
		raise notice '% filminin süresi: %', istenen_film.tittle, description;
	end if;


end $$;


-- ******** Case Statements ********
--syntax:
/*
		CASE expression
			WHEN condition1 THEN
				...
			...
			
			ELSE
				...
		END CASE;
*/


-- Task: Filmin türüne göre çocuklara uygunluğunu yazdıralım

do $$
declare
	uyari varchar(50);
	tur film.type%type;
begin
	SELECT type FROM film WHERE id=4 INTO tur;
	
	if found then
		case tur
			when 'Korku' then uyari := 'Çocuklar için uygun değildir.';
			when 'Macera' then uyari := 'Çocuklar için uygundur.';
			when 'Animasyion' then uyari := 'Çocuklar için tavsiye edilir.';
			else
				uyari := 'Tanımlanamadı';
		end case;
		
		raise notice '%', uyari;
	end if;
end $$;


-- Task: Film tablosundaki film sayısı, 10dan az ise "Film sayısı az.",
--			10dan çok ise "Film sayısı yeterli" yazdırın.

do $$
declare
	sayi integer := 0;
begin
	SELECT count(*) FROM film INTO sayi; -- 4
	
	if sayi<10 then
		raise notice 'Film sayısı az.';
	else
		raise notice 'Film sayısı yeterli.';
	end if;
end $$;


-- ******** WHILE LOOP ********
--syntax:
/*
		WHILE condition LOOP
			statement;
		END LOOP;
*/

-- Task: 1 den 4 e kadar counter değerini ekrana yazdıralım

do $$
declare
	counter integer := 0;
begin
	while counter<4 loop
		counter := counter+1;
		raise notice 'Counter: %', counter;
	end loop;
end $$


-- ******* FOR LOOP ********
--syntax:
/*
		for loop_counter in [reverse] from..to loop
			işlemler
		end loop;
*/

do $$
begin
	for counter in 1..6 loop -- +1
		raise notice '%', counter;
	end loop;
end $$;

-- Reversed
do $$
begin
	for counter in reverse 6..1 loop -- -1
		raise notice '%', counter;
	end loop;
end $$;

-- by
do $$
begin
	for counter in 0..6 by 2 loop -- +2 ilerliyor
		raise notice '%', counter;
	end loop;
end $$;
-- Reversed by
do $$
begin
	for counter in reverse 6..0 by 2 loop -- -2
		raise notice '%', counter;
	end loop;
end $$;


-- Task: 10 dan 20 ye kadar sayıları 2şer 2şer yazdıralım

do $$
begin
	for counter in 10..20 by 2 loop -- +2
		raise notice '%', counter;
	end loop;
end $$;

-- LOOP / EXIT KEYWORD
do $$
declare
	counter integer := 0;
begin
	loop
		raise notice '%', counter;
		counter := counter + 1;
		EXIT WHEN counter=6;
	end loop;
end $$;

-- Array: Array elemanlarını gösterelim
do $$
declare
	array_int int[] := array[11,22,33,44,55,66,77,88,99];
	var int[];
begin
	for var in select array_int loop
		raise notice '%', var;
	end loop;
end $$;


-- ******** CONTINUE ********
--syntax:
-- continue [loop_label] when_condition
do $$
declare
	counter integer := 0;
begin
	loop
		counter := counter+1;
		exit when counter>10;
		
		continue when mod(counter, 2)=0;--cift sayi iki ile bolumunden kalan
		
		raise notice '%', counter;
	end loop;
end $$;


-- ******** FUNCTION ********

--syntax:
/*
		create [or replace] function function_name(param_list)
			returns return_type -- dönen data type belirtiliyor
			language plpgsql -- yazılan dili belirtiyoruz
			as
			
			$$
			declare
			begin
			
				return ...;
			
			end $$;
*/


-- Film tablomuzdaki belirli süre aralığındaki filmlerin sayisini getiren bir fonksiyon yazalım

create or replace function get_film_count(min_len integer, max_len integer)
returns integer
language plpgsql
as

	$$
	declare
		film_count integer;
	begin
		SELECT count(*)
		FROM film
		WHERE length between min_len and max_len
		INTO film_count;
		
		return film_count;
	end $$;
	
	
-- 1. YOL
select get_film_count(30, 100);

-- 2. YOL
select get_film_count(
	min_len := 30,
	max_len := 100
);


-- HAZIR METHOD LAR
select min(length) from film;
select max(length) from film;
select avg(length) from film;




























