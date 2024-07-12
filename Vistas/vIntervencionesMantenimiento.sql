USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vIntervencionesMantenimiento
GO

CREATE VIEW dbo.vIntervencionesMantenimiento
AS
SELECT 
	im.Id
	--2724,IdComponente
	--2724,co.Identificador as nombreComponente
	,co.NombreFamilia
	--2724,im.IdSegmento
	,im.IdCampania
	--2724,c.Identificador
	--2724,im.Linea
	--2724,im.PosicionEnLinea
	,CAST(Fecha AS DATE) Fecha
	,Observaciones
FROM 
	[dbo].[tbCampaniaIntervencionesMantenimiento] im
	LEFT JOIN [dbo].[vCampania] c
		ON im.IdCampania = c.Id
	LEFT JOIN [dbo].[vComponente] co
		ON im.IdComponente = co.Id
WHERE c.Id is not null



