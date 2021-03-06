-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Josue>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
DROP PROCEDURE IF EXISTS dbo.Insert_habits

CREATE PROCEDURE dbo.Insert_habits
	-- Add the parameters for the stored procedure here
	@amount INT
AS

	DECLARE @habtis TABLE (namehabit varchar(100))
	DECLARE @url TABLE (URLDirection nvarchar(128))
	DECLARE @habitname AS VARCHAR(100)
	DECLARE @iconurl AS VARCHAR(128)
	DECLARE @ActionType as SMALLINT
	DECLARE @UserId as BIGINT
	DECLARE @SHA as VARBINARY(300)
	DECLARE @HABITID as BIGINT

	
	INSERT INTO @habtis (namehabit) VALUES 
	('Tapas de desechables'), ('No uso de bolsas de plastico'), ('No usar estereofon'), ('No usar pajillas'),
	('Campa?a de desechos electronicos'), ('Campa?a reciclaje'), ('Carga/alquiler de autos electricos'), ('Cambio de vehiculos a electricos'),
	('No gaseosas'), ('Refill publico de agua pura')

	INSERT INTO @url (URLDirection) VALUES 
	('http:/datas.usa.go'), ('http:/reciclaje.org'), ('http:/crecimineto.go'), ('http:/gases.usa.go'),
	('http:/vehiculos.org'), ('http:/tortuga.org')
	
	BEGIN TRANSACTION

		WHILE @amount>0 BEGIN
	
			SET @habitname = (SELECT TOP 1 namehabit FROM @habtis ORDER BY NEWID())
			SET @iconurl = (SELECT TOP 1 URLDirection FROM @url ORDER BY NEWID())
			SET @ActionType = FLOOR(RAND()*38)
			SET @UserId = FLOOR(72050+RAND()*100000)
			
			insert into dbo.Habits([name],[description],iconURL,habitActionTypeid,releasedDate,userId,[checksum])
			values
			(@habitname,'Datos de habitos nuevos',@iconurl,@ActionType,DATEADD(month,5,'2020/08/25'),@UserId,HASHBYTES('SHA2_256',CONCAT(@habitname,'Datos de habitos nuevos',@iconurl,@ActionType,DATEADD(month,5,'2020/08/25'),@UserId)))
			
			SET @HABITID = (select top 1 habitId from (SELECT habitId from dbo.habits ) ultimo order by habitId desc)

			insert into dbo.Rules_Per_Habit(habitId,ruleId,quantity)
			values
			(@HABITID,CEILING(RAND()*33),1)
			
			SET @amount = @amount - 1

		END

	COMMIT

GO

EXEC dbo.Insert_habits 30