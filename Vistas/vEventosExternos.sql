USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vEventosExternos
GO

CREATE VIEW dbo.vEventosExternos
AS
SELECT
	e.Id
	,CAST(e.Fecha AS DATE) FechaEvento
	,ec.Descripcion
	,e.IdCampania AS IdCampania
FROM
	[dbo].[tbEventosExternos] e
	LEFT JOIN [dbo].[tbTipoEventoCausa] ec
		ON e.IdTipoEvento = ec.Id
	LEFT JOIN [dbo].[tbCampania] c
		ON e.IdCampania = c.Id
WHERE c.Id IS NOT NULL
GO