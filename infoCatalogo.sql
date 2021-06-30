-- ===================================
-- Informacion Catalogo
-- ===================================

-- -----------------------------------
-- social medias
-- -----------------------------------

INSERT INTO dbo.Social_Medias ([name], [url], support, iconUrl, [enabled])
VALUES
('Facebook', 'www.facebook.com/login', 'www.facebook.com/support', 'www.img.com/facelogo', 1),
('Instagram', 'www.instagram.com/login', 'www.instagram.com/support', 'www.img.com/instalogo', 1),
('Twitter', 'www.twitter.com/login', 'www.twitter.com/support', 'www.img.com/twitlogo', 1),
('TikTok', 'www.tikTok.com/login', 'www.tikTok.com/support', 'www.img.com/tiklogo', 1),
('LinkedIn', 'www.linkedIn.com/login', 'www.linkedIn.com/support', 'www.img.com/linklogo', 1)

-- -----------------------------------
-- genders
-- -----------------------------------

INSERT INTO dbo.Genders ([name])
VALUES
('Male'), ('Female'), ('Other')

-- -----------------------------------
-- payment Attempts
-- -----------------------------------

INSERT INTO dbo.Payment_Status ([name]) VALUES
('Completed'), ('Pending'), ('Canceled'), ('Denied'), ('Failed'), ('Refunded')

-- En este caso, el merchant es paypal
INSERT INTO dbo.Merchants ([name], [url], [enabled], iconUrl) VALUES
('PayPal', 'www.paypal.com/connectivity', 1, 'www.img.com/paypallogo')

INSERT INTO dbo.Category_to_Pay ([name])
VALUES
('habit sponsor'), ('ad pay'), ('ad conversion')

-- -----------------------------------
-- Transactions
-- -----------------------------------

INSERT INTO dbo.Trans_Types ([name]) VALUES
('Sponsor'), ('Ad_pay'), ('Ad_conversion'), ('Renewal'), ('Subscription'), ('Other')

INSERT INTO dbo.Trans_SubType ([name]) VALUES
('Commerce_sponsor'), ('User_sponsor'), ('Ad_extra_conversion'), ('Other')

-- ----------------------------------
-- Sponsorships
-- ----------------------------------

INSERT INTO dbo.Sponsor_Types ([name]) VALUES
('User'), ('Commerce')

-- -----------------------------------
-- Logs
-- -----------------------------------

INSERT INTO dbo.Log_Entity_Types ([name])
VALUES
('user'), ('invoice'), ('sponsor'), ('renumeration'), ('commerce'), ('post')

INSERT INTO dbo.Severity ([name])
VALUES
('info'), ('error'), ('warning'), ('high-risk')

INSERT INTO dbo.App_Sources ([name])
VALUES
('customer_service'), ('checkIn'), ('social'), ('billing'), ('ad')

INSERT INTO dbo.Log_Types ([name])
VALUES
('login'), ('logout'), ('login_failed'), ('connection_failed'), ('error'),
('view_reports'), ('permission_remove'), ('size_change'), ('alter_sensitive_info')

-- -----------------------------------
-- Translations
-- -----------------------------------

INSERT INTO dbo.Contexts ([name]) 
VALUES
('users'), ('reviews'), ('descriptions'),
('titles'), ('systemMessages'), ('transactions')

INSERT INTO dbo.Languages ([name], culture)
VALUES
('english', 'en-us'), ('spanish', 'es-cr'), ('german',  'de-dt'),
('russian', 'ru-ru'), ('japanese', 'ja-jp'), ('chinese', 'zh-chi')


-- ------------------------------
-- Ads
-- ------------------------------

INSERT INTO dbo.Ads_Objetives ([name], [description])
VALUES
('Traffic','Improve the traffic in the app'),
('Interaction','Know the amount of views, visit, etc'),
('Customer Generation','Increase the users of web/app')

INSERT INTO dbo.Ads_Qualities ([name])
VALUES
('High'),
('Medium'),
('Low')

-- -----------------------------
-- Campaigns
-- -----------------------------

INSERT INTO dbo.Types_Money_Movement ([name])
VALUES
('Ad_invested'), ('Ad_earnings')


-- ----------------------------
-- Reaction & Tags
-- ----------------------------

INSERT INTO dbo.Reaction_Types ([name])
VALUES
('Share'),('View'),('Link'),('Like'),('Dislike'),
('Love'), ('Haha'), ('Wow'), ('Sad'), ('Angry')

INSERT INTO dbo.Entity_Types ([name])
VALUES
('Ad'),('Habit'),('Post'),('Other')

-- ----------------------------
-- Campaigns
-- ----------------------------

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('I join1','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('I join1','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('I join2','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('I join2','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('I join3','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('I join3','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('Save the turtle1','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('Save the turtle1','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('Save the turtle2','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('Save the turtle2','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('Save the turtle3','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('Save the turtle3','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('Mi nuevo auto1','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('Mi nuevo auto1','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('Mi nuevo auto2','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('Mi nuevo auto2','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('Mi nuevo auto3','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('Mi nuevo auto3','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('No mas sacarosa1','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('No mas sacarosa1','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('No mas sacarosa2','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('No mas sacarosa2','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('No mas sacarosa3','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('No mas sacarosa3','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('!Energias Renovables!1','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('!Energias Renovables!1','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('!Energias Renovables!2','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('!Energias Renovables!2','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('!Energias Renovables!3','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('!Energias Renovables!3','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('!Otra tortuga!1','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('!Otra tortuga!1','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('!Otra tortuga!2','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('!Otra tortuga!2','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('!Otra tortuga!3','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('!Otra tortuga!3','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('Bolsas de tela !Jei!1','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('Bolsas de tela !Jei!1','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('Bolsas de tela !Jei!2','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('Bolsas de tela !Jei!2','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('Bolsas de tela !Jei!3','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('Bolsas de tela !Jei!3','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))
--
INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('support greenfarms1','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('support greenfarms1','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('support greenfarms2','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('support greenfarms2','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('support greenfarms3','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('support greenfarms3','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('ecofriendly livestock1','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('ecofriendly livestock1','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('ecofriendly livestock2','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('ecofriendly livestock2','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('ecofriendly livestock3','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('ecofriendly livestock3','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('no saturated fat in rivers1','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('no saturated fat in rivers1','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('no saturated fat in rivers2','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('no saturated fat in rivers2','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

INSERT INTO dbo.Campaigns ([name],[description],conversionValue,lastUpdate,computername,ipAddress,[checksum])
VALUES
('no saturated fat in rivers3','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810,HASHBYTES('SHA2_256',CONCAT('no saturated fat in rivers3','Evento creado para una campaña que salvara el mundo',FLOOR(RAND()*500),GETDATE(),HOST_NAME(),19216810)))

select * from dbo.Campaigns