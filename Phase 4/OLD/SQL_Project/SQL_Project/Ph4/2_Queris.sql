--1) نمایش خرید و فروش های یک کاربر مشخص در یک بازه زمانی مشخص

select *
from Moamele
where (CodeBoorsiSarmayeGozar = id or
	  CodeBoorsiForoshande = id) and
	  ( Tarikh <= Datecieling and Tarikh >= DateFloor)


--2) نمایش حجم و ارزش معامالت یک شرکت در بازه های دلخواه

select HajmMoamele, ArzeshHarSahm
from Moamele
where (IdSherkatBoorsi = id) and
	  ( Tarikh <= Datecieling and Tarikh >= DateFloor)


--3) نمایش اعضای هیئت مدیره یک شرکت حقوقی 

select *
from OzvSherkatHoghoghi
where CodeBoorsiSherkatHoghoghi = id


--4) رتبه بندی کارگزاری ها بر اساس میزان درآمد

select t1.CodeKargozari, t1.KolHajm, t2.Adress, 
	   t2.NerkhKarmozd, t2.Phone, t2.Website
from
	(select SUM(HajmMoamele) as KolHajm, CodeKargozari
	from Moamele
	group by CodeKargozari) as t1
join Kargozari t2 on t1.CodeKargozari = t2.CodeKargozari
order by KolHajm * NerkhKarmozd DESC


--5) رتبه بندی شرکت های بورسی بر اساس ارزش سهام

select *
from SherkatBoorsi
order by ArzeshSaham DESC


--6) اعمال تغییرات بر روی دیتا های شرکت های بورسی

update SherkatBoorsi
set ArzeshSaham = newArzesh
where Sherkat_id = id


--7) ایجاد کاربر های حقیقی

insert into SarmayeGozar
values (CodeBoorsi, CodeDaftarPishkhan);  -- CodeBoorsi in both should be equal

insert into KarbarHaghighi
values (CodeBoorsi, ShomareTelePhoneHamrah, Shahr, codeKargozari,
		ShomareShenasname, NamePedar, NameShobeBank,
		CodeSajam, ShomareHesab, Email, ShomareShaba,
		CodeMelli, TarikhTavalod, NameKhanevadegi,
		Tabeeiat, CodeShobeBank, ShenaseMelliBank,
		TelephoneSabet);



--8) ایجاد کاربر حقوقی

insert into SarmayeGozar
values (CodeBoorsi, CodeDaftarPishkhan);  -- CodeBoorsi in both should be equal

insert into KarbarHoghoghi 
values (CodeBoorsi, CodeMeliNamayandeSherkat, ShenaseMeli,
	name, CodeEghtesadi, ShomareSabt,
	TelephoneSabet, NameShakhsiatHoghoughi, NameBank,
	ShomareShaba, ShomareHesab, NameShobeBank,
	CodeSobeBank, Ostan, Shahr,
	Keshvar, CodePosti, CodeBoorsiNamayande)




--9) به دست آوردن دارایی های فعلی هر کاربر

select SUM(MeghdarSahm)
from (select MeghdarSahm 
	from Daraee
	where CodeBoorsiSarmayeGozar = KarbarId) as t1


--10)  مشاهده لیست دفتر پیشخوان ها بر اساس بیشترین میزان مراجعه برای ثبت نام در بورس

select CodeDaftarPishkhan, COUNT(CodeDaftarPishkhan) as [Tedade Morajein]
from 
	(select s.CodeDaftarPishkhan
	from SarmayeGozar S join DaftarPishkhan D
	on S.CodeDaftarPishkhan = D.CodeDaftar) as t1
group by CodeDaftarPishkhan


--11) نمایش کارگزاری ها بر اساس شرکت آن ها در پر حجم ترین معاملات

select K.CodeKargozari, K.NerkhKarmozd, K.website, K.Phone, K.Adress
from Moamele M
join Kargozari K
on M.CodeKargozari = K.CodeKargozari
order by M.HajmMoamele Desc


--12) نمایش وضعیت بورس در روز حاضر

select *
from Boors
where Tarikh = cast( GETDATE() as date )


--13) دفتر پیش خوان هایی که مدیر آن ها در بورس ثبت نام نکرده

select *
from DaftarPishkhan
where CodeMelliMasool not in
	(
		select CodeMelli
		from KarbarHaghighi
	)


--14) نمایش شرکت های بورسی بر اساس بیشترین میزان تفاوت بین ارزش سهام اولین خرید و آخرین خرید روز در تاریخ دلخواه

select s.Sherkat_id, s.name, s.ArzeshSaham, s.grouh,
	   s.HajmMabna, s.TedadSahamArzeShode
from TarikhchemoamelatSherketBoorsi t
join SherkatBoorsi s
on t.SherkatBoorsi_Id = s.Sherkat_id
where t.Tarikh = some_date
order by ArzeshSahamAvalinKharidRoz - ArzeshSahamAkharinKharidRoz


--15)   زیر گروهی که مجموع میزان ضرب تعداد سهام عرضه شده آن در ارزش هر سهم آن بیشترین مقدار را دارد
-- به عبارت دیگر به دست اوردن پرارزش ترین زیر گروه شرکت های بورسی

select top 1 grouh
from SherkatBoorsi
group by grouh
order by sum( cast(ArzeshSaham as bigint) * cast(TedadSahamArzeShode as bigint) ) desc


--16) نمایش میزان سود و زیان کاربری دلخواه، از هر دارایی

select d.IdDaraee, d.IdSherkat, d.CodeBoorsiSarmayeGozar, d.MeghdarSahm
		, ((s.ArzeshSaham - d.GheymatHarSahmDarZamanKharid) / 100) as [mizan Sood] 
from Daraee d
join SherkatBoorsi s
on d.IdSherkat = s.Sherkat_id
where d.CodeBoorsiSarmayeGozar = 1


--17) نمایش کد بورسی سرمایه گذارانی که در زیر گروه خودرو، سهام فروخته اند

select s.CodeBoorsi
from SarmayeGozar s
where s.CodeBoorsi in (
	select m.CodeBoorsiForoshande
	from Moamele m
	where m.IdSherkatBoorsi in (
		select sh.Sherkat_id
		from SherkatBoorsi sh
		where sh.grouh = 'khodro'
	)
)


--18) نمایش اعضای شرکت های حقوقی که به صورت مستقل از شرکت، در بورس دارایی دارند و یا معامله انجام داده اند

select *
from OzvSherkatHoghoghi o
where o.CodeBoorsi in 
	(
		select d.CodeBoorsiSarmayeGozar
		from Daraee d
	)
	or o.CodeBoorsi in
	(
		select m.CodeBoorsiForoshande
		from Moamele m
	)
	or o.CodeBoorsi in
	(
		select m.CodeBoorsiSarmayeGozar
		from Moamele m
	)


--19) نمایش تمام معاملات در یک زیر گروه خاص. مثل مسکن

select m.ArzeshHarSahm, m.CodeBoorsiForoshande, m.CodeBoorsiSarmayeGozar,
	   m.CodeKargozari, m.HajmMoamele, m.IdSherkatBoorsi,
	   m.ShomareMoamele, m.Tarikh
from Moamele m
join SherkatBoorsi s
on m.IdSherkatBoorsi = s.Sherkat_id
where s.grouh = 'maskan'


--20) پر معامله ترین زیر گروه

select top 1 s.grouh
from SherkatBoorsi s
join Moamele m
on s.Sherkat_id = m.IdSherkatBoorsi
group by s.grouh
order by COUNT(*) DESC
