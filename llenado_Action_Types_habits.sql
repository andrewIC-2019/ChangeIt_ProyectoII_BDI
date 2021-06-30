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
use ChangeIt
DROP PROCEDURE IF EXISTS dbo.Insert_Actions_Types

CREATE PROCEDURE dbo.Insert_Actions_Types
	-- Add the parameters for the stored procedure here
	@amount INT
AS

	DECLARE @Action_types TABLE (actiontypes varchar(50))
	DECLARE @Types AS VARCHAR(50)

	
	INSERT INTO @Action_types (actiontypes) VALUES 
	('Ahorro'), ('Descuento'), ('Me sumo'), ('Apoyo'),
	('Tortuga')
	
	BEGIN TRANSACTION

		WHILE @amount>0 BEGIN
	
			SET @Types = (SELECT TOP 1 actiontypes FROM @Action_types ORDER BY NEWID())

			insert into dbo.Habits_Actions_Types([name])
			values
			(@Types+CONVERT(nvarchar,FLOOR(RAND()*30)))

			SET @amount = @amount - 1

		END

	COMMIT

GO

EXEC dbo.Insert_Actions_Types 30