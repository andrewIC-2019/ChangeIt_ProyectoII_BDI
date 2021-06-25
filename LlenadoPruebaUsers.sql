Use prueba
INSERT INTO dbo.Social_Medias ([name], [url], support, iconUrl, [enabled])
VALUES
('Facebook', 'www.facebook.com/login', 'www.facebook.com/support', 'www.img.com/facelogo', 1),
('Instagram', 'www.instagram.com/login', 'www.instagram.com/support', 'www.img.com/instalogo', 1),
('Twitter', 'www.twitter.com/login', 'www.twitter.com/support', 'www.img.com/twitlogo', 1),
('TikTok', 'www.tikTok.com/login', 'www.tikTok.com/support', 'www.img.com/tiklogo', 1),
('LinkedIn', 'www.linkedIn.com/login', 'www.linkedIn.com/support', 'www.img.com/linklogo', 1)

INSERT INTO dbo.Genders ([name])
VALUES
('Male'), ('Female'), ('Other')
select * from Genders

INSERT INTO dbo.Countries ([name], approxPopulation) 
VALUES
('US', 328200000)

INSERT INTO dbo.Cities ([name], countryId)
VALUES
('CA', 1)

INSERT INTO dbo.Zones ([name], cityId)
VALUES
('Los Angeles',2)

SELECT * FROM dbo.Countries
SELECT * FROM dbo.Cities
SELECT * FROM dbo.Zones

INSERT INTO dbo.Address (countryId, cityId, zoneId) VALUES
(1, 2, 2)

SELECT * FROM dbo.Address