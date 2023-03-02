--students isimli bir table olusturunuz

create table students(
 
	id smallint,
	isim varchar(50),
	adres varchar(100),
	sinav_notu smallint		
);

--insert :veri tabanina yeni veri ekler

insert into students values(120,'Ali Can','Ankara',70);
insert into students values('121','Veli Han','Trabzon',75);

--integer sutunlara yalin yada tek tirnak icinde deger girileblir

insert into students values(122,'Ayse Tan','Bursa',85);
insert into students values(123,'Mary Star','Istanbut',95);

--varchar sutunlara tek tirnak icinde veri girilir

insert into students values(124,'Terry Star','Ankara',95);
insert into students values(125,'Herry Star','Hatay',95);
insert into students values(126,'Sally Otar','Izmir',100);


--Soru 1: students tablosundaki id ve isim sütunlarını çağırınız.

select id,isim from students;

--Soru 2: Notu 85 üzeri olan öğrenci bilgilerinin tamamını çağırınız.

select * from students where sinav_notu>85;

--Soru 3: Adresi Ankara olan öğrencilerin isimlerini çağırınız

select isim from students where adres='Ankara';

--Soru 4: Notu 85 üzeri ve adresi Ankara olan öğrenci isimlerini çağırınız.

select isim from students where sinav_notu>85 and adres='Ankara';

--Soru 5: sinav_notu 95 veya 70 olan üğrencilerin tüm bilgilerini çağırınız.

select * from students where sinav_notu=70 or sinav_notu=95;

--2yol
select * from students where sinav_notu in(70,95);

--Soru 6: sinav_notu 75 ve 95 arasında olan öğrencilerin isimlerini çağırınız.
select isim from students where sinav_notu>=75 and sinav_notu<=95;--sinirlar dahil olamsi icin = konmali

--2 yol

select isim from students where sinav_notu between 75 and 95;--sinirlar dahil

--Soru 7: id'si 122 ve 125 arasında olmayan öğrencilerin adreslerini yazdırınız.

select adres from students where id<122 or id>125;

--2 yol
select adres from students where id not between 122 and 125;-- sinirlar haric

--3yol not in
select adres from students where id not in(122,123,124,125);


--Soru 8: adres'i 'Hatay' olan satırı siliniz

delete from students where adres='Hatay';

--Soru 9: isim'i 'Ali Can' ve 'Veli Han' olan satırları(record/row) siliniz.

delete from students where isim='Ali Can' or isim='Veli Han';

--2 yol
delete from students where isim in('Ali Can','Veli Han');

--tum satirlari sil

delete from students;--tum satirlari siler ama table kalir

--soru 10=id si 123 den buyuk olan satirlari siliniz

delete from students where id>123;

truncate students;--verileri tum satirlari geri getirilmeyecek sekilde siler where ile kullanilamaz

--students tablenini siliniz

drop table students;


select * from students;






















