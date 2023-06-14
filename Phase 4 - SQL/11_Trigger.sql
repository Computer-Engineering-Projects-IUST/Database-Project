CREATE TRIGGER update_sarmayegozar_daraee
AFTER INSERT ON Moamele
FOR EACH ROW
BEGIN
  UPDATE Daraee
  SET MeghdarSahm = MeghdarSahm + NEW.HajmMoamele ,
  GheymatHarSahmDarZamanKharid=NEW.ArzeshHarSahm
  WHERE Daraee.IdSherkat = NEW.IdSherkatBoorsi AND Daraee.CodeBoorsiSarmayeGozar = NEW.CodeBoorsiSarmayeGozar;
END;


CREATE TRIGGER update_boors
AFTER INSERT ON Moamele
FOR EACH ROW
BEGIN
  UPDATE Boors
  SET ArzeshMoamelat = ArzeshMoamelat + NEW.ArzeshHarSahm*NEW.HajmMoamele ,
  ---arzesh bazar??
  --shakhes kol?
  --shakhes kol hamvazn?
      TedadMoamelat = TedadMoamelat + 1,
	  HajmMoamelat=HajmMoamelat + NEW.HajmMoamele
	WHERE Boors.Tarikh = NEW.Tarikh AND Daraee.CodeBoorsiSarmayeGozar = NEW.CodeBoorsiSarmayeGozar;
END;

CREATE TRIGGER update_tarikhcheMoamelat
AFTER INSERT ON Moamele
FOR EACH ROW
BEGIN
  UPDATE TarikhchemoamelatSherketBoorsi
  SET ArzeshSahamAkharinKharidRoz = NEW.ArzeshHarSahm ,
  TedadForosh= TedadForosh + NEW.HajmMoamele,
  HajmMoamelat = HajmMoamelat + NEW.HajmMoamele ,
  DarsadTaghiratSaham = 100* (ArzeshSahamAkharinKharidRoz - ArzeshSahamAvalinKharidRoz ) / ArzeshSahamAvalinKharidRoz 
  WHERE Boors.Tarikh = NEW.Tarikh AND Daraee.CodeBoorsiSarmayeGozar = NEW.CodeBoorsiSarmayeGozar;
END;

