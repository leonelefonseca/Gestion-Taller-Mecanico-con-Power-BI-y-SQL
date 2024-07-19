USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vPropuestasDeMejora
GO

CREATE VIEW dbo.vPropuestasDeMejora
AS
SELECT
	p.Id
	,c.IdSegmento
	,CAST(p.Fecha AS DATE) FechaDePropuesta
	,p.PropuestaDeMejora
FROM
	[dbo].[tbPropuestasDeMejora] p
	LEFT JOIN [dbo].[tbCampaniaReparacionesEnTaller] r
		ON p.IdReparacion = r.Id
	LEFT JOIN [dbo].[tbCampania] c
		ON r.IdCampania = c.Id
GO
