/*student_info adında bir table oluşturunuz.
student_id(PRIMARY KEY), student_name(UNIQUE), student_age(NOT NULL) ve student_dob adında sütunlar oluşturunuz.
Sütunlara uygun data tipleri ve belirtilen constraint'leri atayınız.
student_age sütunu 0-20 arası dışında değer alamaz.
student_name sütunu küçük harf karakter alamaz.*/

create table student_info(

	student_id smallint PRIMARY KEY,--NOT NULL +UNIQUE
	student_name varchar(20) UNIQUE,
	student_age smallint NOT NULL,
	student_dob date, 

	CONSTRAINT student_age_check CHECK(student_age BETWEEN 15 AND 20),
	CONSTRAINT student_name_upper_case CHECK(student_name= UPPER(student_name))
);

select * from student_info;

--Tüm sütunlara veri girerek 2 record oluşturunuz:
insert into student_info values(101,'ALI CAN',15,'12.09.2007');
insert into student_info values('102','VELI HAN',16,'2007.1.3');
insert into student_info values('103','AYSE TAN',17,'2006.Sep.03');

INSERT INTO student_info VALUES(104, 'KEMAL KUZU', 15, null);
INSERT INTO student_info VALUES('105', 'TOM HANKS', 20, '12-Sep-2003');
INSERT INTO student_info VALUES('106', 'ANGELINA JULIE', 15, '12-Sep-2013');
INSERT INTO student_info VALUES('107', 'BRAD PITT', 16, '10-Aug-2021');

select * from student_info;

--Spesifik iki sütuna veri giriniz:
INSERT INTO student_info(student_id,student_age) values(108,17);
INSERT INTO student_info(student_id) values(108);--age not null oldugu icin kabul etmex
INSERT INTO student_info(student_id,student_age,student_name) values(109,19,'JOHN DOE');


--student_id değeri 108 olan satırın student_name değerini 'LEO OCEAN' olarak güncelleyin.

--John Doe isminin  student_dob sütununu 11-Dec-1997 değeriyle değiştiriniz.

--105 id'li dob hücresini 11-Apr-1997 değerine ve name hücresini MARK TWAIN değerine güncelle.

--id'si 106'dan küçük tüm student_dob değerlerini 01-Aug-2021'e güncelle.

--Tüm student_age değerlerini en yüksek student_age değerine güncelleyin.

--Tüm student_dob değerlerini en düşük student_dob değerine güncelleyin.

CREATE TABLE workers
(
worker_id SMALLINT,
worker_name VARCHAR(50),
worker_salary SMALLINT,
CONSTRAINT worker_id_pk PRIMARY KEY(worker_id)
);
INSERT INTO workers VALUES(101, 'Ali Can', 12000);
INSERT INTO workers VALUES(102, 'Veli Han', 2000);
INSERT INTO workers VALUES(103, 'Ayse Kan', 7000);
INSERT INTO workers VALUES(104, 'Angie Ocean', 8500);

--Veli Han'ın salary değerini en yüksek salary değerinin %20 düşüğüne yükseltin.

--Ali Can'ın salary değerini en düşük salary değerinin %30 fazlasına düşürün.

--Ortalama salary değerinden düşük olan salary değerlerini 1000 artırın.


--Ortalama salary değerinden düşük salary değerlerine ortalama salary değeri atayın.


select * from workers;

CREATE TABLE people
(
ssn INT,
name VARCHAR(50),
address VARCHAR(80)
);

INSERT INTO people VALUES(123456789, 'Mark Star', 'Florida');
INSERT INTO people VALUES(234567890, 'Angie Way', 'Virginia');
INSERT INTO people VALUES(345678901, 'Maryy Tien', 'New Jersey');
INSERT INTO people(ssn, address) VALUES(456789012, 'Michigan');
INSERT INTO people(ssn, address) VALUES(567890123, 'California');
INSERT INTO people(ssn, name) VALUES(567890123, 'California');

--null name değerlerini "To be inserted later" değerine güncelleyin.

--null address değerlerini "To be inserted later" değerine güncelleyin.

--İsimsiz recordları silin.

--ssn değeri 123456789'dan büyük ve 345678901'den küçük olan recordları sil.


--adres değeri NULL olmayan tüm recordları silin.

--address değeri Michigan olmayan recordları siliniz. 


CREATE TABLE workers
(
    id SMALLINT,
    name VARCHAR(50),
    salary SMALLINT,
    CONSTRAINT id4_pk PRIMARY KEY(id)
);
INSERT INTO workers VALUES(10001, 'Ali Can', 12000);
INSERT INTO workers VALUES(10002, 'Veli Han', 2000);
INSERT INTO workers VALUES(10003, 'Mary Star', 7000);
INSERT INTO workers VALUES(10004, 'Angie Ocean', 8500);
INSERT INTO workers VALUES(10005, 'Jonh Doe', null);

select * from workers;

--En düşük ve en büyük salary değerlerine sahip recordları çağırın.

--En düşük salary değerini bulun.(ALIASES kullanin)

--Record sayısını(adetini) bulun.--saydigimiz deger null olursa saymaz

--Interview Question: En yüksek ikinci salary değerini çağırın.


CREATE TABLE employees
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);
INSERT INTO employees VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO employees VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO employees VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO employees VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO employees VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO employees VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO employees VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
SELECT * FROM employees;

CREATE TABLE companies
(
  company_id CHAR(9),
  company VARCHAR(20),
  number_of_employees SMALLINT
);
INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);

SELECT * FROM companies;

--number_of_employees değeri 15000'den büyük olan name ve company değerlerini çağırın.













