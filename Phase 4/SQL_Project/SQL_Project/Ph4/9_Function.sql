--1) نمایش تمام معاملات در یک زیر گروه خاص

Create FUNCTION Fun_all_transactions_of_subGroup(@group nvarchar(30))  
RETURNS table  
as
return(
	select m.ArzeshHarSahm, m.CodeBoorsiForoshande, m.CodeBoorsiSarmayeGozar,
		   m.CodeKargozari, m.HajmMoamele, m.IdSherkatBoorsi,
		   m.ShomareMoamele, m.Tarikh
			from Moamele m
			join SherkatBoorsi s
			on m.IdSherkatBoorsi = s.Sherkat_id
			where s.grouh = @group
)


--2) نمایش کد بورسی سرمایه گذارانی که در یک زیر گروه خاص سهام فروخته اند

Create FUNCTION Fun_all_users_sold_in_subGroup(@group nvarchar(30))  
RETURNS table  
as
return(
	select s.CodeBoorsi
	from SarmayeGozar s
	where s.CodeBoorsi in (
		select m.CodeBoorsiForoshande
		from Moamele m
		where m.IdSherkatBoorsi in (
			select sh.Sherkat_id
			from SherkatBoorsi sh
			where sh.grouh = @group
		)
	)
)