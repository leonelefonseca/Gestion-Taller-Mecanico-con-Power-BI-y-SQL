USE [Mantenimientos]
GO

DROP VIEW IF EXISTS vCausasReparacionesEnTaller
GO

CREATE VIEW dbo.vCausasReparacionesEnTaller
AS
SELECT 
	ct.IdReparacionTaller
	,ec.Descripcion
	,ct.Observaciones
FROM
	[dbo].[tbCampaniaCausasReparacionEnTaller] ct
	LEFT JOIN [dbo].[tbTipoEventoCausa] ec
		ON ct.IdTipoEventoCausa = ec.Id
GO
