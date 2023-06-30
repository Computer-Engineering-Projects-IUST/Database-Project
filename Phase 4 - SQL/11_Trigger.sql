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

/*CREATE TRIGGER update_boors
ON Moamele
AFTER INSERT
AS
BEGIN
  UPDATE Boors
  SET ArzeshMoamelat = ArzeshMoamelat + INSERTED.ArzeshHarSahm*INSERTED.HajmMoamele,
      TedadMoamelat = TedadMoamelat + 1,
      HajmMoamelat = HajmMoamelat + INSERTED.HajmMoamele
  FROM Boors
  INNER JOIN INSERTED ON Boors.Tarikh = INSERTED.Tarikh;
END;*/

GO

CREATE TRIGGER update_tarikhcheMoamelat
ON Moamele
AFTER INSERT
AS
BEGIN
  UPDATE TarikhchemoamelatSherketBoorsi
  SET ArzeshSahamAkharinKharidRoz = INSERTED.ArzeshHarSahm,
      TedadForosh = TedadForosh + INSERTED.HajmMoamele,
      HajmMoamelat = HajmMoamelat + INSERTED.HajmMoamele,
      DarsadTaghiratSaham = 100 * (ArzeshSahamAkharinKharidRoz - ArzeshSahamAvalinKharidRoz) / ArzeshSahamAvalinKharidRoz
  FROM TarikhchemoamelatSherketBoorsi
  INNER JOIN INSERTED ON TarikhchemoamelatSherketBoorsi.Tarikh = INSERTED.Tarikh;
END;

