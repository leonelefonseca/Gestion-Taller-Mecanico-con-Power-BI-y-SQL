USE [Mantenimientos]
GO

DROP VIEW IF EXISTS dbo.vSeguimientoPropuestasDeMejora
GO

CREATE VIEW dbo.vSeguimientoPropuestasDeMejora
AS
SELECT
	sp.Id
	,sp.IdPropuesta
	,CAST(sp.Fecha AS DATE) Fecha
	,e.Estado
	,sp.Observaciones
FROM
	[dbo].[tbSeguimientoPropuestasDeMejora] sp
	LEFT JOIN [dbo].[tbEstadoPropuestaMejora] e
		ON sp.Estado = e.Id
GO