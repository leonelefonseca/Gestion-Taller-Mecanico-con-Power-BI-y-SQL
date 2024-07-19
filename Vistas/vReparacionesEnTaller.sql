USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vReparacionesEnTaller
GO

CREATE VIEW dbo.vReparacionesEnTaller
AS
SELECT 
	r.Id
	,r.IdComponente
	,r.IdCampania
	,r.PosicionEnSegmento
	,r.Accion
	,r.IdComponenteNuevo
FROM
	[dbo].[tbCampaniaReparacionesEnTaller] r
	LEFT JOIN [dbo].[vCampania] c
		ON c.Id = r.IdCampania
WHERE c.Id IS NOT NULL
GO

