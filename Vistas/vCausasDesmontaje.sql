USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vCausasDesmontaje
GO

CREATE VIEW dbo.vCausasDesmontaje
AS
SELECT 
	cd.Id
	,cd.IdCampania
	,ec.Descripcion
	,cd.Observaciones
FROM
	[dbo].[tbCampaniaCausasDesmontajeSegmento] cd
	LEFT JOIN [dbo].[tbTipoEventoCausa] ec
		ON cd.IdTipoEventoCausa = ec.Id
GO
