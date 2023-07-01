Create table SherkatBoorsi(
	Sherkat_id int not null,
	name varchar(50) not null,
	CodeSabti int not null UNIQUE,
	TedadSahamArzeShode int,
	ArzeshSaham int,
	HajmMabna int,
	grouh varchar (50) not null,
	PRIMARY KEY (Sherkat_id),
	CONSTRAINT dummy_cons CHECK (grouh != 'kladfla')
);

Create table Kargozari(
	CodeKargozari int not null Primary key,
	NerkhKarmozd int not null check (
		NerkhKarmozd >= 0
		and NerkhKarmozd <= 100
	),
	Website varchar(50),
	Phone char(11),
	Adress varchar(200)
) 

Create table DaftarPishkhan(
	CodeDaftar int not null Primary Key,
	name varchar (50) not null,
	Ostan varchar(30) not null,
	Shahr varchar(30) not null,
	CodePosti int not null DEFAULT -1,
	Phone char(11),
	CodeMelliMasool char(10) not null ,
	CONSTRAINT dummy_cons_1 CHECK (codePosti > -100)
)
/*Create table DaftarPishkhan(
	CodeDaftar int not null Primary Key,
	name varchar (50) not null,
	Ostan varchar(30) not null,
	Shahr varchar(30) not null,
	CodePosti int not null DEFAULT -1,
	Phone char(11),
	CodeMelliMasool char(10) not null check (CodeMelliMasool NOT LIKE '%[^0-9]%'),
	CONSTRAINT dummy_cons_1 CHECK (codePosti > -100)
)*/
create table SarmayeGozar(
	CodeBoorsi int not null Primary Key,
	CodeDaftarPishkhan int,
	Foreign Key (CodeDaftarPishkhan) references DaftarPishkhan(CodeDaftar) on delete
	set null on update cascade
) 
Create table Daraee (
	IdDaraee int not null Primary Key,
	IdSherkat int not null,
	CodeBoorsiSarmayeGozar int not null,
	MeghdarSahm int,
	GheymatHarSahmDarZamanKharid int,
	Foreign Key (IdSherkat) References SherkatBoorsi(Sherkat_id) on delete cascade on update cascade,
	Foreign Key (CodeBoorsiSarmayeGozar) References SarmayeGozar(CodeBoorsi) on delete CASCADE on update CASCADE
) 
Create table KarbarHaghighi(
	CodeBoorsi int not null Primary Key,
	ShomareTelePhoneHamrah char(11) not null,
	Shahr varchar (30) not null,
	codeKargozari int,
	ShomareShenasname int not null,
	NamePedar varchar(50) not null,
	NameShobeBank varchar(30) not null,
	CodeSajam int not null unique,
	ShomareHesab varchar(18) not null check (ShomareHesab NOT LIKE '%[^0-9]%'),
	ShomareShaba char(24) not null check (ShomareShaba NOT LIKE '%[^0-9]%'),
	CodeMelli char(10) unique not null check (CodeMelli NOT LIKE '%[^0-9]%'),
	TarikhTavalod Date not null,
	NameKhanevadegi varchar(50) not null,
	Tabeeiat varchar(20) not null,
	CodeShobeBank int not null,
	ShenaseMelliBank int not null,
	TelephoneSabet char(11) not null,
	Name varchar(50) not null,
	Foreign Key (CodeBoorsi) references SarmayeGozar(CodeBoorsi),
	Foreign Key (CodeKargozari) references Kargozari(CodeKargozari)
) 
Create table KarbarHoghoghi(
	CodeBoorsi int not null Primary Key,
	CodeMeliNamayandeSherkat char(10) not null check (CodeMeliNamayandeSherkat NOT LIKE '%[^0-9]%'),
	ShenaseMeli int,
	name varchar(30) not null,
	CodeEghtesadi char(12) not null check (CodeEghtesadi NOT LIKE '%[^0-9]%'),
	ShomareSabt int not null,
	TelephoneSabet char(11) not null,
	NameShakhsiatHoghoughi varchar(50) not null,
	NameBank varchar(30) not null,
	ShomareShaba char(24) not null check (ShomareShaba NOT LIKE '%[^0-9]%'),
	ShomareHesab char(18) not null check (ShomareHesab NOT LIKE '%[^0-9]%'),
	NameShobeBank varchar(30),
	CodeSobeBank int not null,
	Ostan varchar(30) not null,
	Shahr varchar(30) not null,
	Keshvar varchar(30) not null,
	CodePosti char(10) check (CodePosti NOT LIKE '%[^0-9]%'),
	CodeBoorsiNamayande int not null DEFAULT -1,
	Foreign Key (CodeBoorsi) references SarmayeGozar(CodeBoorsi) on delete cascade on update cascade,
	Foreign Key (CodeBoorsiNamayande) references KarbarHaghighi(CodeBoorsi) on delete
	set DEFAULT on update CASCADE
) 
create table OzvSherkatHoghoghi (
	DarsadSahamDari int not null check (
		DarsadSahamDari > 0
		and DarsadSahamDari <= 100
	),
	Semat varchar(30) not null,
	CodeBoorsi int not null Primary Key,
	CodeBoorsiSherkatHoghoghi int not null,
	Foreign Key (CodeBoorsi) references KarbarHaghighi(CodeBoorsi) on delete no action,
	Foreign Key (CodeBoorsiSherkatHoghoghi) references KarbarHoghoghi(CodeBoorsi) on delete no action
)
Create table Moamele(
	ShomareMoamele int not null Primary Key,
	CodeBoorsiSarmayeGozar int,
	CodeKargozari int,
	IdSherkatBoorsi int,
	Tarikh date not null,
	ArzeshHarSahm int not null,
	CodeBoorsiForoshande int not null,
	HajmMoamele int not null,
	Foreign Key (CodeBoorsiSarmayeGozar) references SarmayeGozar(CodeBoorsi) on delete no action,
	Foreign Key (CodeKargozari) references Kargozari(CodeKargozari) on delete no action,
	Foreign Key (IdSherkatBoorsi) references SherkatBoorsi(Sherkat_Id) on delete no action,
	Foreign Key(CodeBoorsiForoshande) references SarmayeGozar(CodeBoorsi) on delete no action
) 
Create table SarmayeGozar_Kargozari(
	CodeKargozari int not null,
	CodeBoorsiSarmayeGozar int not null,
	Primary Key (CodeKargozari, CodeBoorsiSarmayeGozar),
	Foreign Key (CodeKargozari) references Kargozari(CodeKargozari) on delete CASCADE on update cascade,
	Foreign Key (CodeBoorsiSarmayeGozar) references SarmayeGozar(CodeBoorsi) on delete CASCADE on update cascade
) 
Create table Boors(
	Tarikh date Primary Key not null,
	ArzeshMoamelat int not null,
	ArzeshBazar int not null,
	ShakhesKol int not null,
	ShakhesKolHamVazn int not null,
	TedadMoamelat int not null,
	HajmMoamelat int not null
) 
create table TarikhchemoamelatSherketBoorsi(
	SherkatBoorsi_Id int not null,
	Tarikh date not null,
	ArzeshSahamAvalinKharidRoz int,
	ArzeshSahamAkharinKharidRoz int,
	TedadKharid int,
	TedadForosh int,
	DarsadTaghiratSaham int,
	HajmMoamelat int,
	Primary Key(Tarikh, SherkatBoorsi_Id),
	Foreign key (SherkatBoorsi_Id) references SherkatBoorsi(Sherkat_id) on delete CASCADE on update cascade
)