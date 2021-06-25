use ChangeIt
-- ===========================================
-- ===========================================

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

	INSERT INTO @allNames VALUES (7,'Peter'),(8,'Jimena'),(7,'Randall'),(7,'Tommy'),(8,'Mariana'),(8,'Olga'),
	(8,'Danna'), (7,'Ali'), (8,'Su'), (8,'Traicy'), (7,'Sergio'), (7,'Kate'), (7,'Yoshiro'), (7, 'Luca'),
	(8, 'Bonnye'), (7,'Pierre'), (7, 'Jesus'), (8, 'Yassar'), (8,'Anna'), (7,'Xiao'), (8, 'Nathalie'), (7,'Yuri'), 
	(8, 'Suki'), (7,'Albert')

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

			INSERT INTO dbo.Users (nationalId, [name], lastname, secondLastname, birthday, genderId,
			mail, addressId, [enabled])
			VALUES
			(@theNatId, @theName, @lastName, @lastName2, @theBirthday, @theGender, @theMail, 4, 1)

			SET @amount = @amount-1
		END

	COMMIT

GO


EXEC dbo.Insert_Users 15
select * from dbo.Users
SELECT * FROM dbo.Users WHERE CONCAT(name,' ',lastname,' ',secondLastname) = 'Anna Fuentes Coronado' ;