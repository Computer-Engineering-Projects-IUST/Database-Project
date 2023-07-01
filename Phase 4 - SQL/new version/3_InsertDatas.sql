insert into Boors values (now(), 15000, 12000, 65, 66, 1500, 700);
insert into Boors values ('2023-06-02', 15000, 12000, 60, 66, 1500, 700);
insert into Boors values ('2023-06-03', 15000, 12000, 65, 66, 1500, 700);

	select * from boors;


insert into DaftarPishkhan values (1, 'sadat abad', 'tehran', 'tehran', 123, '02145678214', '2150654598'),
(2, 'basirat', 'tehran', 'tehran', 154, '02145878415', '0126743921'),
(3, 'bina', 'tehran', 'tehran', 254, '02145478914', '0228743941');

	select * from daftarpishkhan;
	
	
insert into SarmayeGozar
values (1, 1),(2, 1),(3, 2),(4, 3),(5, 1),(6, 1),(7, 2),(8, 1),(9, 1),(10, 3),(11, 2),(12, 3),(13, 3);
	
	select * from SarmayeGozar;
	
	
insert into kargozari values (1, 3, 'www.mofid.ir', '02146217354', 'tehran-meydan Argentina'),
(2, 4, 'www.sauleh.ir', '02166217354', 'tehran-meydan Emam'),
(3, 2, 'www.omid.ir', '02146217354', 'tehran-mrydan Ali'),
(4, 6, 'www.sina.ir', '02146217314', 'tehran-mrydan Emam Hossein');

	select * from kargozari;


INSERT INTO KarbarHaghighi VALUES 
(1, '09109530191', 'tehran', 1, 125, 'Ali', 'sepah', 45, '456123384',
'753126489521469874123654', '2510654598', '2000-11-11', 'Hosseini', 'iran', 12, 21, '02154628741', 'Ali'),
(2, '09109534191', 'tehran', 1, 165, 'Alinaghi', 'melli', 65, '456123384',
'753126489571369874123654', '2510654599', '2000-11-11', 'Hosseinizade', 'iran', 32, 23, '02154668741', 'Amir'),
(6, '09119530191', 'tehran', 1, 5, 'Ali', 'sepah', 40, '656423384',
'053126489521469874123654', '0510654598', '2000-11-11', 'Hosseini', 'iran', 1, 99, '02104628741', 'Hamid'),
(7, '09209430591', 'tehran', 2, 465, 'Ali', 'sepah', 12, '856123384',
'153126489521469874123654', '1510654598', '2000-11-11', 'Amiri', 'iran', 2, 98, '02114628741', 'Amir'),
(8, '09116262820', 'tehran', 3, 781, 'moeen', 'melli', 16, '956423184',
'253126489521469874123654', '3010454568', '2000-11-11', 'Amirzade', 'iran', 3, 97, '02124628741', 'Esi'),
(9, '09113546404', 'tehran', 1, 911, 'aghasi', 'Maskan', 79, '459123684',
'353126489521469874123654', '3510654598', '2000-11-11', 'Miri', 'iran', 4, 96, '02134628741', 'Ensie'),
(10, '09301984341', 'tehran', 2, 933, 'sandi', 'Maskan', 85, '156133382',
'453126489521469874123654', '4510654598', '2000-11-11', 'Attarian', 'iran', 5, 95, '02144628741', 'AliMardan'),
(11, '09336302261', 'tehran', 3, 147, 'Andi', 'Maskan', 62, '256173981',
'553126489521469874123654', '5510654598', '2000-11-11', 'Ghazavi', 'iran', 6, 94, '02155628741', 'Ashkan'),
(12, '09305301330', 'tehran', 4, 136, 'shir', 'Melli', 61, '346153284',
'653126489521469874123654', '6510654598', '2000-11-11', 'Farhadi', 'iran', 7, 93, '02156628741', 'Hozhabr'),
(13, '09118540151', 'tehran', 1, 210, 'MehrAli', 'Keshavarzi', 67, '096823386',
'214126489444469874123654', '0126743921', '2000-11-11', 'Hosseini Nezhad', 'iran', 312, 201, '02178699700', 'Mitra');

	select * from karbarhaghighi;
	
	
INSERT INTO KarbarHoghoghi VALUES (3,'2150654598',23,'IranKhodro','134679452146',78,'02199463127','Ali Alizade','Melli','164897521463214589742365','000001113146874521','reza',69,'tehran','tehran','iran','0001347625',2)
,(4,'2150656598',28,'Bank Refah','134979752156',28,'02199463148','Ali Mahdizade','Melli','164897521463214589742365','000001113146874521','reza',69,'tehran','tehran','iran','0001347625',2)
,(5,'2157656598',18,'Cd sazi','237949652156',43,'02139453100','Amir Ahmadi','Melli','464897521463234589745365','000001013146474521','ali',46,'tehran','tehran','iran','5001347625',2);

	select * from karbarHoghoghi;

	
insert into OzvSherkatHoghoghi
values (20, 'ModirAmel', 1, 5),
	(55, 'Malek', 2, 5),
	(25, 'Anformatik', 6, 5),
	(60, 'Malek', 7, 3),
	(30, 'ModieAmel', 8, 3),
	(10, 'Vakil', 9, 3),
	(55, 'malek', 10, 4),
	(45, 'ModriAmel', 11, 4);
	
	select * from ozvsherkathoghoghi;
	
	
insert into SherkatBoorsi
values (1,'Iran Khodro',12,5000,12000000,789,'Khodro'),
	(2, 'Saipa', 5, 4500, 10000000, 650, 'Khodro'),
	(3, 'Iran Daru', 19, 1100, 1000000, 450, 'Daru'),
	(4,'Dasti Sazan',8,700,4500000,126,'Sanaye Dasti'),
	(5, 'Tala Sazan', 63, 6000, 6400000, 654, 'Arz'),
	(6, 'Citroen', 81, 4200, 10500000, 71, 'Khodro'),
	(7, 'Daru Sazan', 92, 2000, 11000000, 164, 'Daru'),
	(8, 'Doctor stop', 32, 4000, 1200000, 521, 'Daru');
	
	select * from sherkatboorsi;
	
	
insert into Daraee
values (1, 1, 1, 400000, 350000),
	(2, 1, 2, 1000000, 1100000),
	(3, 2, 3, 4600000, 3500000),
	(4, 3, 1, 500000, 450000);
	
	select * from daraee;
	
	
INSERT INTO Moamele 
VALUES 
	(1, 1, 1, 1, '2022-06-25', 400000, 2, 15),
	(2, 3, 2, 2, '2022-05-20', 1000000, 4, 10),
	(3, 3, 1, 1, '2022-05-20', 4000000, 4, 13),
	(4, 1, 2, 1, '2021-05-20', 1400000, 4, 6),
	(5, 2, 3, 4, '2020-04-10', 2000000, 5, 2),
	(6, 1, 4, 6, '2022-05-20', 1200000, 3, 7),
	(7, 2, 1, 7, '2021-06-14', 6300000, 3, 10),
	(8, 2, 3, 4, CAST(now() as date), 2000000, 5, 2),
	(9, 1, 4, 6, CAST(now() as date), 1200000, 3, 7),
	(10, 2, 1, 7, CAST(now() as date), 6300000, 3, 10);
	
		select * from moamele;

	
insert into TarikhchemoamelatSherketBoorsi
values (
		1,
		'2022-06-12',
		450000,
		1000000,
		1200,
		562,
		12,
		1762
	),
	(
		2,
		'2022-06-12',
		410000,
		1900000,
		2200,
		562,
		11,
		2762
	),
	(
		3,
		'2022-06-12',
		510000,
		100000,
		4200,
		562,
		46,
		4762
	),
	(
		4,
		'2022-06-12',
		2000000,
		1500000,
		1400,
		7416,
		45,
		8816
	);
		select * from TarikhchemoamelatSherketBoorsi;

