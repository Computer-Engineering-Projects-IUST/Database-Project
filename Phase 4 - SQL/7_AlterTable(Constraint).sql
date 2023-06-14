-- add constraint
alter table Kargozari
add constraint check_all_digit
check ( Phone NOT LIKE '%[^0-9]%')

alter table DaftarPishkhan
add constraint check_all_digit_1
check ( Phone NOT LIKE '%[^0-9]%')

alter table KarbarHaghighi
add constraint check_all_digit_2
check ( ShomareTelePhoneHamrah NOT LIKE '%[^0-9]%' and
        TelephoneSabet NOT LIKE '%[^0-9]%')

alter table KarbarHoghoghi
add constraint check_all_digit_3
check ( TelephoneSabet NOT LIKE '%[^0-9]%')

alter table Daraee
add constraint not_negative
check (MeghdarSahm >= 0
	and GheymatHarSahmDarZamanKharid > 0)

alter table TarikhchemoamelatSherketBoorsi
add constraint not_negative_1
check (ArzeshSahamAvalinKharidRoz >= 0 and
	ArzeshSahamAkharinKharidRoz >= 0 and
	TedadKharid >= 0 and
	TedadForosh >= 0 and 
	HajmMoamelat >= 0)

alter table DaftarPishKhan
add constraint not_negative_2
check( codePosti >= 0 )

-- update constraint ( its not possible. so first we should drop the constraint, then add the constraint by making changes )
ALTER TABLE SherkatBoorsi
DROP CONSTRAINT dummy_cons;

ALTER TABLE SherkatBoorsi
ADD CONSTRAINT dummy_cons 
check (grouh != 'SanayeDasti');

ALTER TABLE DaftarPishkhan
DROP CONSTRAINT dummy_cons_1;

ALTER TABLE DaftarPishkhan
ADD CONSTRAINT dummy_cons_1 check (CodePosti > -1000);

-- drop constraint
ALTER TABLE SherkatBoorsi
DROP CONSTRAINT dummy_cons;

ALTER TABLE DaftarPishkhan
DROP CONSTRAINT dummy_cons_1;