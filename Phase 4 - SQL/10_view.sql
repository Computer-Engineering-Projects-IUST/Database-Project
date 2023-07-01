USE [Stock Market]
GO
--1) نمایش حجم و ارزش معامالت روزانه همه شرکت ها
create view daily_companies_status as
select IdSherkatBoorsi,
    HajmMoamele,
    ArzeshHarSahm
from Moamele
where Tarikh = CAST(GETDATE() as date) 
GO
--2) نمایش وضعیت روزانه بورس
    create view Boors_Daily as
select *
from Boors
where Tarikh = cast(GETDATE() as date)