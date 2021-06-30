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
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
DROP PROCEDURE IF EXISTS dbo.Insert_Rules

select * from dbo.Rules

CREATE PROCEDURE dbo.Insert_Rules
	-- Add the parameters for the stored procedure here
	@amount INT
AS
	
	DECLARE @rules TABLE (descriptionrules nvarchar(200))
	DECLARE @unit VARCHAR(20) 
	DECLARE @rule nvarchar(200)

	INSERT INTO @rules (descriptionrules) VALUES 
	('Ahorro de agua'), ('Reduccion de plastico'), ('Vida animal resguardada'), ('Salud Personal'),
	('Ahorro de petrolio')

BEGIN TRANSACTION

		WHILE @amount>0 BEGIN
	
			SET @rule = (SELECT TOP 1 descriptionrules FROM @rules ORDER BY NEWID())
			SET @unit = 1


			insert into dbo.Rules([description],unit)
			values
			(@rule+CONVERT(nvarchar,FLOOR(RAND()*30)),@unit)

			SET @amount = @amount - 1

		END

	COMMIT
GO
EXEC dbo.Insert_Rules 30