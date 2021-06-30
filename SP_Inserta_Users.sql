-- ===========================================
-- ===========================================
use ChangeIt
DROP PROCEDURE IF EXISTS dbo.Insert_Users

CREATE PROCEDURE dbo.Insert_Users
	@amount INT
AS
	-- preparativos antes de entrar al transaction (si fuera el caso)
	DECLARE @theNatId INT
	DECLARE @allNames TABLE (pGender tinyint , oneName nvarchar(60))
	DECLARE @theName AS NVARCHAR(60)
	DECLARE @allLastname TABLE (oneLastname nvarchar(60))
	DECLARE @lastName AS NVARCHAR(60)
	DECLARE @lastName2 AS VARCHAR(60)
	DECLARE @theBirthday AS DATE
	DECLARE @theGender AS TINYINT
	DECLARE @theMail AS NVARCHAR(128)
	DECLARE @theAddress AS BIGINT

	INSERT INTO @allNames VALUES (1,'Peter'),(2,'Jimena'),(1,'Randall'),(1,'Tommy'),(2,'Mariana'),(2,'Olga'),
	(2,'Danna'), (1,'Ali'), (2,'Su'), (2,'Traicy'), (1,'Sergio'), (2,'Kate'), (1,'Yoshiro'), (1, 'Luca'),
	(2, 'Bonnye'), (1,'Pierre'), (1, 'Jesus'), (2, 'Yassar'), (2,'Anna'), (1,'Xiao'), (2, 'Nathalie'), (1,'Yuri'), 
	(2, 'Suki'), (1,'Albert')

	INSERT INTO @allLastname (oneLastname) VALUES 
	('Fonseca'), ('Green'), ('Chang'), ('Lee'), ('Valvoa'), ('Honda'), ('Markov'), ('Diaz'),
	('Antolli'), ('Uribe'), ('Lenin'), ('Muller'), ('Yasan'), ('Carter'), ('Hernandez'), ('Oporta'),
	('Duran'), ('Chacon'), ('Liang'), ('Fuentes'), ('Guerreiro'), ('Lu'), ('Gibb'), ('Modrick'),
	('McCurt'), ('Coronado'), ('Federeck'), ('Wilson'), ('Brown'), ('Gomez')

	BEGIN TRANSACTION

		WHILE @amount>0 BEGIN
			SET @theNatId = FLOOR(RAND()*1000000000)

			SET @theName = (SELECT TOP 1 oneName FROM @allNames
			ORDER BY NEWID())

			SET @lastName = (SELECT TOP 1 oneLastname FROM @allLastname
			ORDER BY NEWID())

			SET @lastName2 = (SELECT TOP 1 oneLastname FROM @allLastname
			ORDER BY NEWID())

			SET @theBirthday = (SELECT DATEADD(DAY, (RAND()*23725), '1941-01-01'))

			SELECT @theGender = pGender FROM @allNames WHERE oneName = @theName

			SET @theMail = (SELECT CONCAT('mail',CONVERT(varchar(11), @theNatId),'@mail.com'))

			SELECT TOP 1 @theAddress = addressId FROM dbo.[Address] ORDER BY NEWID()

			INSERT INTO dbo.Users (nationalId, [name], lastname, secondLastname, birthday, genderId,
			mail, addressId, [enabled])
			VALUES
			(@theNatId, @theName, @lastName, @lastName2, @theBirthday, @theGender, @theMail, @theAddress, 1)

			SET @amount = @amount-1
		END

	COMMIT

GO

EXEC dbo.Insert_Users 100000

-- SELECT * FROM dbo.Users WHERE CONCAT(name,' ',lastname,' ',secondLastname) = 'Anna Fuentes Coronado' ;
-- SELECT count(userId) theNumUsers FROM dbo.Users GROUP BY addressId ORDER BY theNumUsers
-- SELECT * FROM Users