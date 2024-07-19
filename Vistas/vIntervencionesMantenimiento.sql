USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vIntervencionesMantenimiento
GO

CREATE VIEW dbo.vIntervencionesMantenimiento
AS
SELECT 
	im.Id
	,f.Nombre AS NombreFamilia
	,im.IdCampania
	,CAST(Fecha AS DATE) Fecha
FROM 
	[dbo].[tbCampaniaIntervencionesMantenimiento] im
	LEFT JOIN [dbo].[tbCampania] c
		ON im.IdCampania = c.Id
	LEFT JOIN [dbo].[tbComponente] co
		ON im.IdComponente = co.Id
	LEFT JOIN [dbo].[tbFamilia] f
		ON f.Id = co.IdFamilia
WHERE c.Id is not null and im.IdComponente <> 0



