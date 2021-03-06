DROP PROCEDURE IF EXISTS dbo.Insert_Address

CREATE PROCEDURE dbo.Insert_Address
AS
	-- variables utilizadas
	DECLARE @addressCountry smallint
	DECLARE @addressCity bigint
	DECLARE @addressZone bigint

	DECLARE createAddress CURSOR 
		FOR 
		SELECT cityId, zoneId FROM  dbo.Zones			-- consulta a cargar en el cursor
	OPEN createAddress

	FETCH createAddress into @addressCity, @addressZone

	WHILE(@@fetch_status=0)			-- se hace un primer fecth antes del while
	BEGIN
		SELECT TOP 1 @addressCountry = countryId FROM dbo.Cities WHERE cityId= @addressCity
		INSERT INTO dbo.[Address] (countryId, cityId, zoneId)
		VALUES
		(@addressCountry, @addressCity, @addressZone)

		FETCH createAddress into @addressCity, @addressZone
	END
	CLOSE createAddress

GO

EXEC Insert_Address

-- SELECT * FROM dbo.Address


-- seleccion random de un address (para asignarle al usuario)
-- SELECT TOP 1 addressId FROM dbo.[Address] ORDER BY NEWID()