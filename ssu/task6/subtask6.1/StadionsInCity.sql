CREATE VIEW StadionsInCity AS
  SELECT Stadions.name AS Stadion, Cityes.name AS City FROM
    Stadions INNER JOIN Cityes ON Stadions.city = Cityes.id
