/*CREATE TRIGGER update_sarmayegozar_daraee
ON Moamele
AFTER INSERT
AS
BEGIN
  UPDATE Daraee
  SET MeghdarSahm = MeghdarSahm + INSERTED.HajmMoamele,
  GheymatHarSahmDarZamanKharid = INSERTED.ArzeshHarSahm
  FROM Daraee
  INNER JOIN INSERTED ON Daraee.IdSherkat = INSERTED.IdSherkatBoorsi AND Daraee.CodeBoorsiSarmayeGozar = INSERTED.CodeBoorsiSarmayeGozar;
END;
*/
GO

CREATE TRIGGER update_boors
ON Moamele
AFTER INSERT
AS
BEGIN
  UPDATE Boors
  SET ArzeshMoamelat = ArzeshMoamelat + INSERTED.ArzeshHarSahm*INSERTED.HajmMoamele,
      TedadMoamelat = TedadMoamelat + 1,
      HajmMoamelat = HajmMoamelat + INSERTED.HajmMoamele
  FROM Boors
  INNER JOIN INSERTED ON Boors.Tarikh = INSERTED.Tarikh AND Boors.CodeBoorsiSarmayeGozar = INSERTED.CodeBoorsiSarmayeGozar;
END;

GO

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

