use [Stock Market]
--1) نمایش خرید و فروش های هر کاربر در یک بازه زمانی مشخص
GO
CREATE PROCEDURE proc_show_buys_and_sell @id int, @Datecieling date, @DateFloor date
as
begin
	select *
	from Moamele
	where (CodeBoorsiSarmayeGozar = @id or
		  CodeBoorsiForoshande = @id) and
		  ( Tarikh <= @Datecieling and Tarikh >= @DateFloor)
end;

GO

--2) نمایش شرکت های بورسی بر اساس بیشترین میزان تفاوت بین ارزش سهام اولین خرید و آخرین خرید روز در تاریخ دلخواه
CREATE PROCEDURE proc_most_difference @date date
as
begin
	select s.Sherkat_id, s.name, s.ArzeshSaham, s.grouh,
		s.HajmMabna, s.TedadSahamArzeShode
		from TarikhchemoamelatSherketBoorsi t
		join SherkatBoorsi s
		on t.SherkatBoorsi_Id = s.Sherkat_id
		where t.Tarikh = @date
		order by ArzeshSahamAvalinKharidRoz - ArzeshSahamAkharinKharidRoz
end;